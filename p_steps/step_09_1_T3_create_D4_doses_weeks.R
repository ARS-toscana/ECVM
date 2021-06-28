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

pop_age_1940 <- cohort_to_vaxweeks[Birthcohort_persons == "<1940", ]
save(pop_age_1940, file = paste0(dirtemp, "pop_age_1940.RData"))
rm(pop_age_1940)
pop_age_1940_1949 <- cohort_to_vaxweeks[Birthcohort_persons == "1940-1949", ]
save(pop_age_1940_1949, file = paste0(dirtemp, "pop_age_1940_1949.RData"))
rm(pop_age_1940_1949)
pop_age_1950_1959 <- cohort_to_vaxweeks[Birthcohort_persons == "1950-1959", ]
save(pop_age_1950_1959, file = paste0(dirtemp, "pop_age_1950_1959.RData"))
rm(pop_age_1950_1959)
pop_age_1960_1969 <- cohort_to_vaxweeks[Birthcohort_persons == "1960-1969", ]
save(pop_age_1960_1969, file = paste0(dirtemp, "pop_age_1960_1969.RData"))
rm(pop_age_1960_1969)
pop_age_1970_1979 <- cohort_to_vaxweeks[Birthcohort_persons == "1970-1979", ]
save(pop_age_1970_1979, file = paste0(dirtemp, "pop_age_1970_1979.RData"))
rm(pop_age_1970_1979)
pop_age_1980_1989 <- cohort_to_vaxweeks[Birthcohort_persons == "1980-1989", ]
save(pop_age_1980_1989, file = paste0(dirtemp, "pop_age_1980_1989.RData"))
rm(pop_age_1980_1989)
pop_age_1990 <- cohort_to_vaxweeks[Birthcohort_persons == "1990+", ]
save(pop_age_1990, file = paste0(dirtemp, "pop_age_1990.RData"))
rm(cohort_to_vaxweeks, pop_age_1990)


vect_to_rbind <- c()
for (name_temp_df in c("pop_age_1940", "pop_age_1940_1949", "pop_age_1950_1959", "pop_age_1960_1969",
                       "pop_age_1970_1979", "pop_age_1980_1989", "pop_age_1990")) {
  
  print(paste("computing for", name_temp_df))
  
  temp_df <- get(load(paste0(dirtemp, name_temp_df, ".RData")))
  
  temp_df <- as.data.table(lapply(temp_df, rep, temp_df$fup))
  
  temp_df <- temp_df[, week := rowid(person_id, Dose, study_entry_date)]
  temp_df <- temp_df[, week := week - 1][, fup := NULL]
  temp_df <- temp_df[, start_date_of_period := study_entry_date + 7 * week]
  temp_df <- temp_df[, c("study_entry_date", "week") := NULL]
  
  tot_cohort <- copy(temp_df)
  tot_cohort <- tot_cohort[, c("sex", "Dose", "type_vax", "Birthcohort_persons", "at_risk_at_study_entry") := NULL]
  tot_cohort <- unique(tot_cohort)
  tot_cohort <- tot_cohort[, Persons_in_week := .N, by = c("start_date_of_period")]
  tot_cohort <- unique(tot_cohort[, person_id := NULL])
  
  temp_df <- temp_df[, Doses_in_week := .N,
                     by = c("sex", "Birthcohort_persons", "Dose",
                            "type_vax", "start_date_of_period", "at_risk_at_study_entry")]
  
  
  temp_df <- unique(temp_df[, person_id := NULL])
  temp_df <- merge(temp_df, tot_cohort, by = "start_date_of_period")
  
  save(temp_df, file = paste0(dirtemp, name_temp_df, ".RData"))

  rm(temp_df, name_temp_df, tot_cohort)
}

for (name_temp_df in c("pop_age_1940", "pop_age_1940_1949", "pop_age_1950_1959", "pop_age_1960_1969",
                       "pop_age_1970_1979", "pop_age_1980_1989", "pop_age_1990")) {
  load(paste0(dirtemp, name_temp_df, ".RData"))
  vect_to_rbind <- append(vect_to_rbind, list(temp_df))
}

cohort_to_vaxweeks <- rbindlist(vect_to_rbind)


setorder(cohort_to_vaxweeks, sex, Birthcohort_persons, Dose,
         type_vax, start_date_of_period, at_risk_at_study_entry)

cohort_to_vaxweeks <- cohort_to_vaxweeks[, Year := year(start_date_of_period)]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, Datasource := thisdatasource]

setnames(cohort_to_vaxweeks, c("start_date_of_period", "type_vax", "sex", "at_risk_at_study_entry"),
         c("Week_number", "Type_vax", "Sex", "At_Risk"))
cohort_to_vaxweeks <- cohort_to_vaxweeks[, sex := fifelse(Sex == 1, "Male", "Female")]

D4_doses_weeks <- cohort_to_vaxweeks[, .(Datasource, Year, Week_number, Birthcohort_persons, Sex, At_Risk, Dose,
                                         Type_vax, Persons_in_week, Doses_in_week)]

save(D4_doses_weeks, file = paste0(diroutput, "D4_doses_weeks.RData"))

rm(D3_studyweeks, all_mondays, monday_week, double_weeks, all_days_df, cohort_to_vaxweeks, D4_doses_weeks)