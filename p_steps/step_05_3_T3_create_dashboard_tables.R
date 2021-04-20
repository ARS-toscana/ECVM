load(paste0(dirtemp, "D3_vaxweeks.RData"))

cohort_to_doses_weeks <- D3_Vaccin_cohort[, .(person_id, sex, type_vax_1, type_vax_2, date_of_birth)]

all_mondays <- seq.Date(as.Date("19000101","%Y%m%d"), Sys.Date(), by = "week")

monday_week <- seq.Date(from = find_last_monday(study_start, all_mondays), to = find_last_monday(study_end, all_mondays),
                        by = "week")
double_weeks <- data.table(weeks_to_join = monday_week, monday_week = monday_week)
all_days_df <- data.table(all_days = seq.Date(from = find_last_monday(study_start, monday_week), to = study_end, by = "days"))





vaxweeks_to_dos_bir_cor <- D3_vaxweeks[week == 0]

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
vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor[, Datasource := thisdatasource]

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

DescribeThisDataset(D3_vaxweeks,
                    Individual=T,
                    ColumnN=NULL,
                    HeadOfDataset=FALSE,
                    StructureOfDataset=FALSE,
                    NameOutputFile="D3_vaxweeks",
                    Cols=list("start_date_of_period", "end_date_of_period",  "Dose", "week", "month"),
                    ColsFormat=list("date", "date",  "categorical",  "categorical",  "categorical"),
                    DateFormat_ymd=FALSE,
                    DetailInformation=TRUE,
                    PathOutputFolder=paste0(thisdir,"/g_describeHTML"))

DescribeThisDataset(D3_Vaccin_cohort,
                    Individual=T,
                    ColumnN=NULL,
                    HeadOfDataset=FALSE,
                    StructureOfDataset=FALSE,
                    NameOutputFile="D3_Vaccin_cohort",
                    
                    Cols=list("sex", "date_of_birth",  "study_entry_date", "study_exit_date", 
                              "date_vax1", "date_vax1", "date_vax2", "date_vax2", "age_at_date_vax_1", "age_at_date_vax_2",
                              "type_vax_1", "type_vax_2", "study_entry_date_vax1", "study_exit_date_vax1",
                              "study_entry_date_vax2", "study_exit_date_vax2", "fup_vax1", "fup_vax2"),
                    
                    ColsFormat=list("binary", "date",  "date",  "date",
                                    "date","categorical", "date", "categorical",  "continuous",  "continuous",
                                    "categorical", "categorical",  "date",  "date",
                                    "date", "date",  "categorical",  "categorical"),
                    DateFormat_ymd=FALSE,
                    DetailInformation=TRUE,
                    PathOutputFolder=paste0(thisdir,"/g_describeHTML"))