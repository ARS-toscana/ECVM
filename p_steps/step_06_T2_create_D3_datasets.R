load(paste0(diroutput, "D4_study_population.RData"))
load(paste0(dirtemp, "selected_doses.RData"))
load(paste0(diroutput, "D3_study_population_cov_ALL.RData"))

D4_study_population <- D4_study_population[, .(person_id, sex, date_of_birth, date_of_death, study_entry_date, start_follow_up, study_exit_date)]

D3_doses <- merge(D4_study_population, selected_doses, all.x = T, by="person_id")[, .(person_id, sex, date_of_birth, date_of_death,
                                                                                      study_entry_date, start_follow_up, study_exit_date,
                                                                                      date, vx_dose, vx_manufacturer)]

D3_doses <- D3_doses[, vx_dose := as.character(vx_dose)]

D3_doses <- data.table::dcast(D3_doses, person_id + sex + date_of_birth + date_of_death + study_entry_date + start_follow_up +
                                study_exit_date ~ vx_dose, value.var = c("date", "vx_manufacturer"))

setnames(D3_doses, c("date_1", "date_2", "vx_manufacturer_1", "vx_manufacturer_2"),
         c("date_vax1", "date_vax2", "type_vax_1", "type_vax_2"))

D3_doses <- D3_doses[study_exit_date < date_vax1, c("date_vax1", "type_vax_1") := NA]
D3_doses <- D3_doses[study_exit_date < date_vax2, c("date_vax2", "type_vax_2") := NA]
D3_doses <- D3_doses[!is.na(date_vax1), c("study_entry_date_vax1", "study_exit_date_vax1") := list(date_vax1, fifelse(is.na(date_vax2) | study_exit_date < date_vax2, study_exit_date, date_vax2 - 1))]
D3_doses <- D3_doses[!is.na(date_vax2), c("study_entry_date_vax2", "study_exit_date_vax2") := list(date_vax2, study_exit_date)]

D3_doses <- D3_doses[, age_at_study_entry := floor(lubridate::time_length(correct_difftime(study_entry_date, date_of_birth), "years"))]
D3_doses <- D3_doses[, age_at_date_vax_1 := floor(lubridate::time_length(correct_difftime(date_vax1, date_of_birth), "years"))]
D3_doses <- D3_doses[, fup_days := correct_difftime(study_exit_date, study_entry_date)]
D3_doses <- D3_doses[, fup_no_vax := fifelse(is.na(study_entry_date_vax1), fup_days, correct_difftime(study_entry_date_vax1, study_entry_date) - 1)]

D3_doses <- D3_doses[!is.na(study_entry_date_vax1), fup_vax1 := correct_difftime(study_exit_date_vax1, study_entry_date_vax1)]

D3_doses <- D3_doses[!is.na(study_entry_date_vax2), fup_vax2 := correct_difftime(study_exit_date_vax2, study_entry_date_vax2)]

setnames(D3_study_population_cov_ALL,
         c("CV_either_DX_or_DP", "COVCANCER_either_DX_or_DP", "COVCOPD_either_DX_or_DP", "COVHIV_either_DX_or_DP",
           "COVCKD_either_DX_or_DP", "COVDIAB_either_DX_or_DP", "COVOBES_either_DX_or_DP", "COVSICKLE_either_DX_or_DP",
           "IMMUNOSUPPR_at_study_entry", "all_covariates_non_CONTR"),
         c("CV_at_study_entry", "COVCANCER_at_study_entry", "COVCOPD_at_study_entry", "COVHIV_at_study_entry",
           "COVCKD_at_study_entry", "COVDIAB_at_study_entry", "COVOBES_at_study_entry", "COVSICKLE_at_study_entry",
           "immunosuppressants_at_study_entry", "at_risk_at_study_entry"))

D3_study_population_cov_ALL <- D3_study_population_cov_ALL[, .(person_id, CV_at_study_entry, COVCANCER_at_study_entry,
                                                               COVCOPD_at_study_entry, COVHIV_at_study_entry,
                                                               COVCKD_at_study_entry, COVDIAB_at_study_entry,
                                                               COVOBES_at_study_entry, COVSICKLE_at_study_entry,
                                                               immunosuppressants_at_study_entry, at_risk_at_study_entry)]

D3_doses <- merge(D3_doses, D3_study_population_cov_ALL, all.x = T, by="person_id")

setnames(D3_doses, "start_follow_up", "start_lookback")

D3_study_population <- D3_doses[, .(person_id, sex, date_of_birth, start_lookback, study_entry_date, study_exit_date,
                                    date_vax1, date_vax2, age_at_study_entry, CV_at_study_entry, COVCANCER_at_study_entry,
                                    COVCOPD_at_study_entry, COVHIV_at_study_entry, COVCKD_at_study_entry,
                                    COVDIAB_at_study_entry, COVOBES_at_study_entry, COVSICKLE_at_study_entry,
                                    immunosuppressants_at_study_entry, at_risk_at_study_entry, age_at_date_vax_1,
                                    type_vax_1, type_vax_2, study_entry_date_vax1, study_exit_date_vax1,
                                    study_entry_date_vax2, study_exit_date_vax2, fup_days, fup_no_vax, fup_vax1, fup_vax2)]

save(D3_study_population, file = paste0(dirtemp, "D3_study_population.RData"))

D3_Vaccin_cohort <- D3_study_population[!is.na(date_vax1) & (is.na(date_vax2) | date_vax1 < date_vax2), ][, age_at_date_vax_2 := floor(time_length(correct_difftime(date_vax2, date_of_birth), "years"))]
D3_Vaccin_cohort <- D3_Vaccin_cohort[, .(person_id, sex, date_of_birth, study_entry_date,
                                         study_exit_date, date_vax1, date_vax2,
                                         age_at_date_vax_1, age_at_date_vax_2,
                                         type_vax_1, type_vax_2, study_entry_date_vax1,
                                         study_exit_date_vax1, study_entry_date_vax2,
                                         study_exit_date_vax2, fup_vax1, fup_vax2)]

save(D3_Vaccin_cohort, file = paste0(dirtemp, "D3_Vaccin_cohort.RData"))

cohort_to_vaxweeks <- D3_study_population[, .(person_id, date_of_birth, sex, study_entry_date, study_exit_date,
                                              study_entry_date_vax1, study_exit_date_vax1, study_entry_date_vax2,
                                              study_exit_date_vax2, type_vax_1, type_vax_2, fup_no_vax, fup_vax1,
                                              fup_vax2, at_risk_at_study_entry)]

cohort_to_vaxweeks <- cohort_to_vaxweeks[, Birthcohort_persons := findInterval(year(date_of_birth), c(1940, 1950, 1960, 1970, 1980, 1990))]
cohort_to_vaxweeks$Birthcohort_persons <- as.character(cohort_to_vaxweeks$Birthcohort_persons)
cohort_to_vaxweeks <- cohort_to_vaxweeks[.(Birthcohort_persons = c("0", "1", "2", "3", "4", "5", "6"),
                                           to = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
                                                  "1980-1989", "1990+")),
                                         on = "Birthcohort_persons", Birthcohort_persons := i.to]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, date_of_birth := NULL]

cohort_to_vaxweeks <- cohort_to_vaxweeks[!is.na(study_entry_date_vax1), study_exit_date := study_entry_date_vax1 - 1]
cols <- c("fup_no_vax", "fup_vax1", "fup_vax2")
cohort_to_vaxweeks <- cohort_to_vaxweeks[, (cols) := lapply(.SD, calc_precise_week), .SDcols = cols]
colA = c(paste("study_entry_date_vax", 1:2, sep = ""), "study_entry_date")
colB = c(paste("study_exit_date_vax", 1:2, sep = ""), "study_exit_date")
colC = c(paste("fup_vax", 1:2, sep = ""), "fup_no_vax")
colD = paste("type_vax", 1:2, sep = "_")
cohort_to_vaxweeks <- data.table::melt(cohort_to_vaxweeks, measure = list(colA, colB, colC, colD), variable.name = "Dose",
                                       value.name = c("study_entry_date", "study_exit_date", "fup", "type_vax"), na.rm = F)
cohort_to_vaxweeks <- cohort_to_vaxweeks[!is.na(study_entry_date) & !is.na(study_exit_date) & !is.na(fup), ]
cohort_to_vaxweeks <- cohort_to_vaxweeks[, Dose := as.character(Dose)][Dose == "3", Dose := "0"]
D3_vaxweeks <- copy(cohort_to_vaxweeks)
D3_studyweeks <- copy(cohort_to_vaxweeks)
D3_vaxweeks <- D3_vaxweeks[, c("sex", "type_vax", "Birthcohort_persons") := NULL][Dose %in% c(1, 2), ]
setnames(D3_vaxweeks, c("study_entry_date", "study_exit_date", "fup"),
         c("study_entry_date_vax", "study_exit_date_vax", "fup_vax"))
D3_vaxweeks <- as.data.table(lapply(D3_vaxweeks, rep, D3_vaxweeks$fup_vax))
D3_vaxweeks[, week := rowid(person_id, Dose, study_entry_date_vax, study_exit_date_vax)]
D3_vaxweeks <- D3_vaxweeks[, week := week - 1][, fup_vax := fup_vax - 1]
D3_vaxweeks <- D3_vaxweeks[, start_date_of_period := study_entry_date_vax + 7 * week]
D3_vaxweeks <- D3_vaxweeks[, end_date_of_period := fifelse(week == fup_vax, study_exit_date_vax, start_date_of_period + 7)]
D3_vaxweeks <- D3_vaxweeks[, month := month(start_date_of_period)]
D3_vaxweeks <- D3_vaxweeks[, .(person_id, start_date_of_period, end_date_of_period, Dose, week, month)]

save(D3_studyweeks, file = paste0(dirtemp, "D3_studyweeks.RData"))
save(D3_vaxweeks, file = paste0(dirtemp, "D3_vaxweeks.RData"))

rm(selected_doses, D4_study_population, D3_doses, D3_study_population, D3_Vaccin_cohort,
   cohort_to_vaxweeks, colA, colB, colC, colD, D3_vaxweeks, D3_studyweeks)

