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


correct_difftime <- function(t1, t2, t_period = "years") {
  return(difftime(t1, t2, units = "days") + 1)
}

load(paste0(diroutput,"D4_study_population.RData"))

D4_study_population <- D4_study_population[, .(person_id, sex, date_of_birth, date_of_death, study_entry_date, start_follow_up, study_exit_date)]

concepts<-data.table()
for (concept in names(concept_set_domains)) {
  load(paste0(dirtemp, concept,".RData"))
  if (exists("concepts")) {
    concepts <- rbind(concepts, get(concept))
  } else {
    concepts <- get(concept)
  }
}

D3_doses <- merge(concepts, D4_study_population, by="person_id")[, .(person_id, sex, date_of_birth, date_of_death,
                                                                     study_entry_date, start_follow_up, study_exit_date,
                                                                     date, vx_dose, vx_manufacturer)]

if (thisdatasource == "ARS") {
  D3_doses <- D3_doses[.(vx_manufacturer = c("MODERNA BIOTECH SPAIN S.L.",
                                             "PFIZER Srl", "ASTRAZENECA SpA", "J&J"), to = c("Moderna", "Pfizer", "AstraZeneca", "J&J")),
                       on = "vx_manufacturer", vx_manufacturer := i.to]
}

D3_doses[1, 1] <- D3_doses[3, 1]
D3_doses <- D3_doses[, vx_dose := as.character(vx_dose)]
D3_doses_duplicate <- D3_doses[, if(.N >= 3) .SD, by=c("person_id")]
D3_doses <- D3_doses[, if(.N < 3) .SD, by=c("person_id")]
if (nrow(D3_doses_duplicate) != 0) {
  setorder(D3_doses_duplicate, vx_dose, date)
  D3_doses_duplicate <- unique(D3_doses_duplicate[, vx_dose := fifelse(!is.na(shift(vx_dose)) & vx_dose == shift(vx_dose), NA_character_, vx_dose), by=c("person_id")])
  D3_doses <- unique(rbind(D3_doses, D3_doses_duplicate))
}
# D3_doses <- D3_doses[, if(.N < 3) .SD, by=c("person_id")]
# D3_doses <- D3_doses[, vx_dose := seq_len(.N), by = c("person_id")]

D3_doses <- unique(D3_doses)

D3_doses <- dcast(D3_doses, person_id + sex + date_of_birth + date_of_death + study_entry_date + start_follow_up +
        study_exit_date ~ vx_dose, value.var = c("date", "vx_manufacturer"))

setnames(D3_doses, c("date_1", "date_2", "vx_manufacturer_1", "vx_manufacturer_2"),
         c("date_vax1", "date_vax2", "type_vax_1", "type_vax_2"))

D3_doses <- D3_doses[study_exit_date < date_vax1, date_vax1 := NA]
D3_doses <- D3_doses[study_exit_date < date_vax2, date_vax2 := NA]
D3_doses <- D3_doses[!is.na(date_vax1), c("study_entry_date_vax1", "study_exit_date_vax1") := list(date_vax1, fifelse(is.na(date_vax2) | study_exit_date < date_vax2, study_exit_date, date_vax2 - 1))]
D3_doses <- D3_doses[!is.na(date_vax2), c("study_entry_date_vax2", "study_exit_date_vax2") := list(date_vax2, study_exit_date)]

D3_doses <- D3_doses[, age_at_study_entry := floor(time_length(correct_difftime(study_entry_date, date_of_birth), "years"))]
D3_doses <- D3_doses[, age_at_date_vax_1 := floor(time_length(correct_difftime(date_vax1, date_of_birth), "years"))]
D3_doses <- D3_doses[, fup_days := correct_difftime(study_exit_date, study_entry_date)]
D3_doses <- D3_doses[, fup_no_vax := fifelse(is.na(study_entry_date_vax1), fup_days, correct_difftime(study_entry_date_vax1, study_entry_date))]

D3_doses <- D3_doses[!is.na(study_entry_date_vax1), fup_vax1 := fifelse(is.na(study_entry_date_vax2), correct_difftime(study_exit_date_vax1, study_entry_date_vax1), correct_difftime(study_entry_date_vax2, study_entry_date_vax1))]

D3_doses <- D3_doses[!is.na(study_entry_date_vax2), fup_vax2 := correct_difftime(study_exit_date_vax2, study_entry_date_vax2)]

D3_doses <- D3_doses[!is.na(date_vax1) & is.na(type_vax_1), type_vax_1 := "UNK"]
D3_doses <- D3_doses[!is.na(date_vax2) & is.na(type_vax_2), type_vax_2 := "UNK"]



D3_study_population <- D3_doses[, .(person_id, sex, date_of_birth, start_follow_up, study_entry_date, study_exit_date,
                                    date_vax1, date_vax2, age_at_study_entry, age_at_date_vax_1, type_vax_1, type_vax_2,
                                    study_entry_date_vax1, study_exit_date_vax1, study_entry_date_vax2, study_exit_date_vax2,
                                    fup_days, fup_no_vax, fup_vax1, fup_vax2)]

save(D3_study_population, file = paste0(dirtemp, "D3_study_population.RData"))

D3_study_population <- D3_study_population[!is.na(date_vax1), ][, age_at_date_vax_2 := floor(time_length(correct_difftime(date_vax2, date_of_birth), "years"))]
D3_Vaccin_cohort <- D3_study_population[, .(person_id, sex, date_of_birth, study_entry_date,
                                               study_exit_date, date_vax1, date_vax2,
                                               age_at_date_vax_1, age_at_date_vax_2,
                                               type_vax_1, type_vax_2, study_entry_date_vax1,
                                               study_exit_date_vax1, study_entry_date_vax2,
                                               study_exit_date_vax2, fup_vax1, fup_vax2)]

save(D3_Vaccin_cohort, file = paste0(dirtemp, "D3_Vaccin_cohort.RData"))

cohort_to_vaxweeks <- D3_Vaccin_cohort[, .(person_id, study_entry_date_vax1, study_exit_date_vax1, study_entry_date_vax2,
                             study_exit_date_vax2, fup_vax1, fup_vax2)]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, c("fup_vax1", "fup_vax2") := list(floor(time_length(fup_vax1, "week")) + 1, floor(time_length(fup_vax2, "week")) + 1)]
colA = paste("study_entry_date_vax", 1:2, sep = "")
colB = paste("study_exit_date_vax", 1:2, sep = "")
colC = paste("fup_vax", 1:2, sep = "")
cohort_to_vaxweeks <- melt(cohort_to_vaxweeks, measure = list(colA, colB, colC), variable.name = "Dose", value.name = c("study_entry_date_vax", "study_exit_date_vax", "fup_vax"))
cohort_to_vaxweeks <- cohort_to_vaxweeks[!is.na(fup_vax), ]
cohort_to_vaxweeks <- as.data.table(lapply(cohort_to_vaxweeks, rep, cohort_to_vaxweeks$fup_vax))
cohort_to_vaxweeks <- cohort_to_vaxweeks[, week := seq_len(.N), by=c("person_id", "Dose", "study_entry_date_vax", "study_exit_date_vax")]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, week := week - 1]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, start_date_of_period := study_entry_date_vax + 7 * week]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, end_date_of_period := fifelse(week == fup_vax - 1, study_exit_date_vax, start_date_of_period + 7)]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, month := month(start_date_of_period)]
D3_vaxweeks <- cohort_to_vaxweeks[, .(person_id, start_date_of_period, end_date_of_period, Dose, week, month)]

save(D3_vaxweeks, file = paste0(dirtemp, "D3_vaxweeks.RData"))

vax_to_doses_weeks <- D3_vaxweeks[, Datasource := thisdatasource]
vax_to_doses_weeks <- vax_to_doses_weeks[, year := year(start_date_of_period)]

cohort_to_doses_weeks <- D3_Vaccin_cohort[, .(person_id, sex, type_vax_1, type_vax_2, date_of_birth)]

vax_to_doses_weeks <- merge(vax_to_doses_weeks, cohort_to_doses_weeks)
vax_to_doses_weeks <- vax_to_doses_weeks[, Birthcohort_persons := findInterval(year(date_of_birth), c(1940, 1950, 1960, 1970, 1980, 1990))]
vax_to_doses_weeks$Birthcohort_persons <- as.character(vax_to_doses_weeks$Birthcohort_persons)
vax_to_doses_weeks <- vax_to_doses_weeks[.(Birthcohort_persons = c("0", "1", "2", "3", "4", "5", "6"),
                                                 to = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
                                                        "1980-1989", "1990+")),
                                               on = "Birthcohort_persons", Birthcohort_persons := i.to]
vax_to_doses_weeks <- vax_to_doses_weeks[, .(person_id, Datasource, year, Birthcohort_persons, week, sex, Dose, type_vax_1, type_vax_2)]
vax_to_doses_weeks <- vax_to_doses_weeks[, sex := fifelse(sex == 1, "Male", "Female")]
D4_doses_weeks <- vax_to_doses_weeks[, .(Number_of_doses_in_week = .N), by = c("Datasource", "year", "Birthcohort_persons", "week", "sex", "Dose", "type_vax_1", "type_vax_2")]

save(D4_doses_weeks, file = paste0(diroutput, "D4_doses_weeks.RData"))

vaxweeks_to_dos_bir_cor <- D3_vaxweeks[week == 0]

monday_week <- seq.Date(from = find_last_monday(study_start), to = find_last_monday(study_end),
                        by = "week")
double_weeks <- data.table(weeks_to_join = monday_week, monday_week = monday_week)
all_days_df <- data.table(all_days = seq.Date(from = find_last_monday(study_start), to = study_end, by = "days"))
all_days_df <- merge(all_days_df, double_weeks, by.x = "all_days", by.y = "weeks_to_join", all.x = T)
all_days_df <- all_days_df[, monday_week := nafill(monday_week, type="locf")]
all_days_df <- all_days_df[all_days >= study_start,]

vaxweeks_to_dos_bir_cor <- merge(vaxweeks_to_dos_bir_cor, all_days_df, by.x = "start_date_of_period", by.y = "all_days")

vaxweeks_to_dos_bir_cor <- merge(vaxweeks_to_dos_bir_cor, cohort_to_doses_weeks, by = "person_id")
vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor[, Birthcohort_persons := findInterval(year(date_of_birth), c(1940, 1950, 1960, 1970, 1980, 1990))]
vaxweeks_to_dos_bir_cor$Birthcohort_persons <- as.character(vaxweeks_to_dos_bir_cor$Birthcohort_persons)
vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor[.(Birthcohort_persons = c("0", "1", "2", "3", "4", "5", "6"),
                                           to = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
                                                  "1980-1989", "1990+")),
                                         on = "Birthcohort_persons", Birthcohort_persons := i.to]
vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor[, vx_manufacturer := fifelse(Dose == 1, type_vax_1, type_vax_2)]

vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor[, .(Datasource, monday_week, vx_manufacturer, Dose, Birthcohort_persons)]
setnames(vaxweeks_to_dos_bir_cor, c("Datasource", "monday_week", "Dose", "Birthcohort_persons"), c("datasource", "week", "dose", "birth_cohort"))

vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor[, .(N = .N), by = c("datasource", "week", "vx_manufacturer", "dose", "birth_cohort")]

all_ages <- copy(vaxweeks_to_dos_bir_cor)[, N := sum(N), by = c("datasource", "week", "vx_manufacturer", "dose")]
all_ages <- unique(all_ages[, birth_cohort:="all_birth_cohorts"][, c("datasource", "week", "vx_manufacturer", "dose", "birth_cohort", "N")])

vaxweeks_to_dos_bir_cor <- rbind(vaxweeks_to_dos_bir_cor, all_ages)

complete_df <- expand.grid(datasource = "ARS", week = monday_week, vx_manufacturer = c("Moderna", "Pfizer", "AstraZeneca", "J&J", "UKN"),
                           dose = c("1", "2"), birth_cohort = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
                                                                "1980-1989", "1990+", "all_birth_cohorts"))

vaxweeks_to_dos_bir_cor <- merge(vaxweeks_to_dos_bir_cor, complete_df, all.y = T, by = c("datasource", "week", "vx_manufacturer", "dose", "birth_cohort"))
DOSES_BIRTHCOHORTS <- vaxweeks_to_dos_bir_cor[is.na(N), N := 0][, week := format(week, "%Y%m%d")]

save(DOSES_BIRTHCOHORTS, file = paste0(diroutput, "DOSES_BIRTHCOHORTS.RData"))

load(paste0(diroutput,"D4_study_source_population.RData"))
tot_pop_cohorts <- D4_study_source_population[, birth_cohort := findInterval(year(date_of_birth), c(1940, 1950, 1960, 1970, 1980, 1990))]
tot_pop_cohorts$birth_cohort <- as.character(tot_pop_cohorts$birth_cohort)
tot_pop_cohorts <- tot_pop_cohorts[.(birth_cohort = c("0", "1", "2", "3", "4", "5", "6"),
                                                     to = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
                                                            "1980-1989", "1990+")),
                                                   on = "birth_cohort", birth_cohort := i.to]
tot_pop_cohorts <- tot_pop_cohorts[, .(pop_cohorts = .N), by = c("birth_cohort")]
all_pop <- unique(copy(tot_pop_cohorts)[, pop_cohorts := sum(pop_cohorts)][, birth_cohort := "all_birth_cohorts"])
tot_pop_cohorts <- rbind(tot_pop_cohorts, all_pop)
COVERAGE_BIRTHCOHORTS <- merge(DOSES_BIRTHCOHORTS, tot_pop_cohorts, by = "birth_cohort", all.x = T)
setorder(COVERAGE_BIRTHCOHORTS, week)

COVERAGE_BIRTHCOHORTS <- COVERAGE_BIRTHCOHORTS[, cum_N := cumsum(N), by = c("datasource", "vx_manufacturer", "dose", "birth_cohort")]
COVERAGE_BIRTHCOHORTS <- COVERAGE_BIRTHCOHORTS[, percentage := round(cum_N / pop_cohorts, 3)][, c("datasource", "week", "vx_manufacturer", "dose", "birth_cohort", "percentage")]
COVERAGE_BIRTHCOHORTS <- COVERAGE_BIRTHCOHORTS[, .(datasource, week, vx_manufacturer, dose, birth_cohort, percentage)]

save(COVERAGE_BIRTHCOHORTS, file = paste0(diroutput, "COVERAGE_BIRTHCOHORTS.RData"))



### DescribeThisDatasets
source(paste0(dirmacro, "DescribeThisDataset.R"))

# DescribeThisDataset(D4_doses_weeks,
#                     Individual=T,
#                     ColumnN=NULL,
#                     HeadOfDataset=TRUE,
#                     StructureOfDataset=TRUE,
#                     NameOutputFile="D4_doses_weeks",
#                     Cols=list("datasource","year", "Birthcohort_persons", "week", "sex", "Dose", "type_vax_1", "type_vax_2", "Number_of_doses_in_week"),
#                     ColsFormat=list("categorical","categorical", "categorical", "categorical", "binary",  "categorical",  "categorical",  "categorical",  "categorical"),
#                     #DateFormat_ymd=TRUE,
#                     DetailInformation=TRUE,
#                     PathOutputFolder=paste0(thisdir,"/g_describeHTML"))

DescribeThisDataset(COVERAGE_BIRTHCOHORTS,
                    Individual=T,
                    ColumnN=NULL,
                    HeadOfDataset=TRUE,
                    StructureOfDataset=TRUE,
                    NameOutputFile="COVERAGE_BIRTHCOHORTS",
                    Cols=list("datasource", "week",  "vx_manufacturer", "dose", "birth_cohort", "percentage"),
                    ColsFormat=list("categorical", "date",  "categorical",  "categorical",  "categorical", "continuous"),
                    DateFormat_ymd=TRUE,
                    DetailInformation=TRUE,
                    PathOutputFolder=paste0(thisdir,"/g_describeHTML"))

DescribeThisDataset(DOSES_BIRTHCOHORTS,
                    Individual=T,
                    ColumnN=NULL,
                    HeadOfDataset=TRUE,
                    StructureOfDataset=TRUE,
                    NameOutputFile="DOSES_BIRTHCOHORTS",
                    Cols=list("datasource", "week",  "vx_manufacturer", "dose", "birth_cohort", "N"),
                    ColsFormat=list("categorical", "date",  "categorical",  "categorical",  "categorical", "continuous"),
                    DateFormat_ymd=TRUE,
                    DetailInformation=TRUE,
                    PathOutputFolder=paste0(thisdir,"/g_describeHTML"))