load(paste0(dirtemp, "D3_studyweeks.RData"))

all_mondays <- seq.Date(as.Date("19000101","%Y%m%d"), Sys.Date(), by = "week")

monday_week <- seq.Date(from = find_last_monday(study_start, all_mondays), to = find_last_monday(study_end, all_mondays),
                        by = "week")
double_weeks <- data.table(weeks_to_join = monday_week, monday_week = monday_week)
all_days_df <- data.table(all_days = seq.Date(from = find_last_monday(study_start, monday_week), to = study_end, by = "days"))
all_days_df <- merge(all_days_df, double_weeks, by.x = "all_days", by.y = "weeks_to_join", all.x = T)
all_days_df <- all_days_df[, monday_week := nafill(monday_week, type="locf")]
all_days_df <- all_days_df[all_days >= study_start,]

cohort_to_vaxweeks <- D3_studyweeks

cohort_to_vaxweeks <- join_and_replace(cohort_to_vaxweeks, all_days_df, c("study_entry_date", "all_days"), "monday_week")
cohort_to_vaxweeks <- join_and_replace(cohort_to_vaxweeks, all_days_df, c("study_exit_date", "all_days"), "monday_week")
cohort_to_vaxweeks <- cohort_to_vaxweeks[, fup := as.numeric(difftime(study_exit_date, study_entry_date, units = "weeks") +  1)]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, study_exit_date := NULL]
cohort_to_vaxweeks <- as.data.table(lapply(cohort_to_vaxweeks, rep, cohort_to_vaxweeks$fup))

cohort_to_vaxweeks[, week := rowid(person_id, Dose, study_entry_date)]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, week := week - 1][, fup := NULL]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, start_date_of_period := study_entry_date + 7 * week]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, c("study_entry_date", "week") := NULL]

tot_cohort <- copy(cohort_to_vaxweeks)
tot_cohort <- tot_cohort[, c("sex", "Dose", "type_vax", "Birthcohort_persons", "at_risk_at_study_entry") := NULL]
tot_cohort <- unique(tot_cohort)
tot_cohort <- tot_cohort[, Persons_in_week := .N, by = c("start_date_of_period")]
tot_cohort <- unique(tot_cohort[, person_id := NULL])

cohort_to_vaxweeks <- cohort_to_vaxweeks[, Doses_in_week := .N,
                                         by = c("sex", "Birthcohort_persons", "Dose",
                                                "type_vax", "start_date_of_period", "at_risk_at_study_entry")]
cohort_to_vaxweeks <- unique(cohort_to_vaxweeks[, person_id := NULL])
cohort_to_vaxweeks <- merge(cohort_to_vaxweeks, tot_cohort, by = "start_date_of_period")
cohort_to_vaxweeks <- cohort_to_vaxweeks[, Year := year(start_date_of_period)]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, Datasource := thisdatasource]

setnames(cohort_to_vaxweeks, c("start_date_of_period", "type_vax", "sex", "at_risk_at_study_entry"),
         c("Week_number", "Type_vax", "Sex", "At_Risk"))
cohort_to_vaxweeks <- cohort_to_vaxweeks[, sex := fifelse(sex == 1, "Male", "Female")]

D4_doses_weeks <- cohort_to_vaxweeks[, .(Datasource, Year, Week_number, Birthcohort_persons, Sex, At_Risk, Dose,
                                         Type_vax, Persons_in_week, Doses_in_week)]

save(D4_doses_weeks, file = paste0(diroutput, "D4_doses_weeks.RData"))

rm(D3_studyweeks, all_mondays, monday_week, double_weeks, all_days_df, cohort_to_vaxweeks, tot_cohort, D4_doses_weeks)