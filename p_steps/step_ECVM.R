library(data.table)

find_last_monday <- function(tmp_date) {
  tmp_date <- as.Date(lubridate::ymd(tmp_date))
  Sys_option <- c("LC_COLLATE", "LC_CTYPE", "LC_MONETARY", "LC_NUMERIC", "LC_TIME")
  str_option <- lapply(strsplit(Sys.getlocale(), ";"), strsplit, "=")[[1]]
  Sys.setlocale("LC_ALL","English_United States.1252")
  while (weekdays(tmp_date) != "Monday") {
    tmp_date <- tmp_date - 1
  }
  for (i in seq(length(Sys_option))) {
    Sys.setlocale(Sys_option[i], str_option[[i]][[2]])
  }
  return(tmp_date)
}


load(paste0(diroutput,"D4_study_population_doses.RData"))

concepts<-data.table()
for (concept in names(concept_set_domains)) {
  load(paste0(dirtemp, concept,".RData"))
  if (exists("concepts")) {
    concepts <- rbind(concepts, get(concept))
  } else {
    concepts <- get(concept)
  }
}

D3_doses <- merge(concepts, D4_study_population_doses, all.x = T, by="person_id")
D3_doses$dose <- as.character(D3_doses$vx_dose)
D3_doses <- D3_doses[,c("person_id", "vx_manufacturer", "date", "vx_dose", "dose",
                        "study_entry_date", "study_exit_date")]
# TODO add J&J to dictionary
D3_doses <- D3_doses[.(vx_manufacturer = c("MODERNA BIOTECH SPAIN S.L.",
"PFIZER Srl", "ASTRAZENECA SpA", "J&J"), to = c("Moderna", "Pfizer", "AstraZeneca", "J&J")),
                     on = "vx_manufacturer", vx_manufacturer := i.to]
D3_doses <- D3_doses[date < study_exit_date & date > study_entry_date,
                     dose := fifelse(dose != "1" & dose != "2", "UNK", dose)]

monday_week <- seq.Date(from = find_last_monday(study_start), to = find_last_monday(study_end),
                  by = "week")
double_weeks <- data.table(weeks_to_join = monday_week, monday_week = monday_week)
all_days_df <- data.table(all_days = seq.Date(from = find_last_monday(study_start), to = study_end, by = "days"))
all_days_df <- merge(all_days_df, double_weeks, by.x = "all_days", by.y = "weeks_to_join", all.x = T)
all_days_df <- all_days_df[, monday_week := nafill(monday_week, type="locf")]
all_days_df <- all_days_df[all_days >= study_start,]

D3_doses <- merge(D3_doses, all_days_df, by.x = "date", by.y = "all_days", all.x = T)[, vx_admin_date := date]
D3_doses <- D3_doses[, vx_admin_date := date]
D3_doses <- D3_doses[, week := monday_week]
# TODO ask about dose vs vx_dose and week vs vx_date
D3_doses <- D3_doses[,c("person_id", "vx_manufacturer", "vx_admin_date", "vx_dose", "dose", "week")]

save(D3_doses, file = paste0(dirtemp, "D3_doses.RData"))

#TODO it nneds also D4_study_population_doses
D4_doses_birthcohorts <- merge(D3_doses, D4_study_population_doses[, c("person_id", "date_of_birth")], by = "person_id", all.x = T)[, birth_year := year(date_of_birth)]
D4_doses_birthcohorts <- D4_doses_birthcohorts[!is.na(date_of_birth),]
# Test speed vs creation of df of years and then join
D4_doses_birthcohorts <- D4_doses_birthcohorts[, birth_cohort := findInterval(birth_year, c(1940, 1950, 1960, 1970, 1980, 1990))]
D4_doses_birthcohorts$birth_cohort <- as.character(D4_doses_birthcohorts$birth_cohort)
D4_doses_birthcohorts <- D4_doses_birthcohorts[.(birth_cohort = c("0", "1", "2", "3", "4", "5", "6"),
                                                 to = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
                                                        "1980-1989", "1990+")),
                                               on = "birth_cohort", birth_cohort := i.to]

D4_doses_birthcohorts <- D4_doses_birthcohorts[, .N, by = c("vx_manufacturer", "week", "dose", "birth_cohort")]

all_ages <- copy(D4_doses_birthcohorts)[, N := sum(N), by = c("vx_manufacturer", "week", "dose")]
all_ages <- unique(all_ages[,birth_cohort:="all_birth_cohorts"][, c("vx_manufacturer", "week", "dose", "birth_cohort", "N")])

D4_doses_birthcohorts <- rbind(D4_doses_birthcohorts, all_ages)[, week := format(week, "%Y%m%d")][, c("week", "vx_manufacturer", "dose", "birth_cohort", "N")]
setnames(D4_doses_birthcohorts, old = c("week"), new = c("week"))

fwrite(D4_doses_birthcohorts, paste0(diroutput,"D4_doses_birthcohorts.csv"))

tot_pop_cohorts <- D4_study_population_doses[!is.na(date_of_birth),]
tot_pop_cohorts <- tot_pop_cohorts[, birth_year := year(date_of_birth)]
tot_pop_cohorts <- tot_pop_cohorts[, birth_cohort := findInterval(birth_year, c(1940, 1950, 1960, 1970, 1980, 1990))]
tot_pop_cohorts$birth_cohort <- as.character(tot_pop_cohorts$birth_cohort)
tot_pop_cohorts <- tot_pop_cohorts[.(birth_cohort = c("0", "1", "2", "3", "4", "5", "6"),
                                     to = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
                                            "1980-1989", "1990+")),
                                   on = "birth_cohort", birth_cohort := i.to]
tot_pop_cohorts <- tot_pop_cohorts[, .(pop_cohorts = .N), by = c("birth_cohort")]
all_pop <- unique(copy(tot_pop_cohorts)[, pop_cohorts := sum(pop_cohorts)][, birth_cohort := "all_birth_cohorts"])
tot_pop_cohorts <- rbind(tot_pop_cohorts, all_pop)
D4_coverage_birthcohorts <- merge(D4_doses_birthcohorts, tot_pop_cohorts, by = "birth_cohort", all.x = T)
setorder(D4_coverage_birthcohorts, week)
D4_coverage_birthcohorts <- D4_coverage_birthcohorts[, cum_N := cumsum(N), by = c("vx_manufacturer", "dose", "birth_cohort", "pop_cohorts")]
D4_coverage_birthcohorts <- D4_coverage_birthcohorts[, percentage := round(cum_N / pop_cohorts, 3)][, c("week", "vx_manufacturer", "dose", "birth_cohort", "percentage")]

fwrite(D4_coverage_birthcohorts, paste0(diroutput,"D4_coverage_birthcohorts.csv"))
