load(paste0(dirtemp, "D3_vaxweeks.RData"))


all_mondays <- seq.Date(as.Date("19000101","%Y%m%d"), Sys.Date(), by = "week")

monday_week <- seq.Date(from = find_last_monday(study_start, all_mondays), to = find_last_monday(study_end, all_mondays),
                        by = "week")
double_weeks <- data.table(weeks_to_join = monday_week, monday_week = monday_week)
all_days_df <- data.table(all_days = seq.Date(from = find_last_monday(study_start, monday_week), to = study_end, by = "days"))
all_days_df <- merge(all_days_df, double_weeks, by.x = "all_days", by.y = "weeks_to_join", all.x = T)
all_days_df <- all_days_df[, monday_week := nafill(monday_week, type="locf")]
all_days_df <- all_days_df[all_days >= study_start,]




vax_to_doses_weeks <- D3_vaxweeks[, Datasource := thisdatasource][, .(person_id, start_date_of_period, Dose, Datasource, year)]

vaxweeks_to_dos_bir_cor <- merge(vaxweeks_to_dos_bir_cor, all_days_df, by.x = "start_date_of_period", by.y = "all_days")
















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