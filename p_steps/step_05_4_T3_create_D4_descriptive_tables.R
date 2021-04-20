correct_difftime <- function(t1, t2, t_period = "years") {
  return(difftime(t1, t2, units = "days") + 1)
}

na_to_0 = function(DT) {
  for (i in names(DT))
    DT[is.na(get(i)), (i):=0]
  return(DT)
}

load(file = paste0(dirtemp, "D3_study_population.RData"))
load(file = paste0(dirtemp, "D3_Vaccin_cohort.RData"))

D4_descriptive_dataset_age_studystart <- D3_study_population[, .(person_id, age_at_study_entry, fup_days)]
D4_descriptive_dataset_age_studystart <- D4_descriptive_dataset_age_studystart[,c("Age_P25", "Age_P50", "Age_p75") :=
                                                                                 as.list(round(quantile(age_at_study_entry, probs = c(0.25, 0.50, 0.75)), 0))]
D4_descriptive_dataset_age_studystart <- D4_descriptive_dataset_age_studystart[, c("Age_mean", "Age_min", "Age_max") :=
                                                                                 list(round(mean(age_at_study_entry), 0), min(age_at_study_entry), max(age_at_study_entry))]

D4_descriptive_dataset_age_studystart <- D4_descriptive_dataset_age_studystart[, Followup := sum(fup_days)][, Datasource := thisdatasource]
D4_descriptive_dataset_age_studystart <- unique(D4_descriptive_dataset_age_studystart[, .(Datasource, Followup, Age_P25, Age_P50, Age_p75, Age_mean, Age_min, Age_max)])

fwrite(D4_descriptive_dataset_age_studystart, file = paste0(direxp, "D4_descriptive_dataset_age_studystart.csv"))

D4_descriptive_dataset_ageband_studystart <- D3_study_population[, .(person_id, age_at_study_entry)]
D4_descriptive_dataset_ageband_studystart <- D4_descriptive_dataset_ageband_studystart[, age_at_study_entry := findInterval(age_at_study_entry, c(20, 30, 40, 50, 60, 70, 80))]
D4_descriptive_dataset_ageband_studystart$age_at_study_entry <- as.character(D4_descriptive_dataset_ageband_studystart$age_at_study_entry)
D4_descriptive_dataset_ageband_studystart <- D4_descriptive_dataset_ageband_studystart[.(age_at_study_entry = c("0", "1", "2", "3", "4", "5", "6", "7"),
                                           to = c("AgeCat_019", "AgeCat_2029", "AgeCat_3039", "AgeCat_4049", "AgeCat_5059",
                                                  "AgeCat_6069", "AgeCat_7079", "Agecat_80+")),
                                         on = "age_at_study_entry", age_at_study_entry := i.to]

D4_descriptive_dataset_ageband_studystart <- unique(D4_descriptive_dataset_ageband_studystart[, N := .N, by = "age_at_study_entry"][, person_id := NULL])
D4_descriptive_dataset_ageband_studystart <- D4_descriptive_dataset_ageband_studystart[, Datasource := thisdatasource]
D4_descriptive_dataset_ageband_studystart <- dcast(D4_descriptive_dataset_ageband_studystart, Datasource ~ age_at_study_entry, value.var = "N")

fwrite(D4_descriptive_dataset_ageband_studystart, file = paste0(direxp, "D4_descriptive_dataset_ageband_studystart.csv"))

D4_descriptive_dataset_sex_studystart <- D3_study_population[, .(person_id, sex)]
D4_descriptive_dataset_sex_studystart <- unique(D4_descriptive_dataset_sex_studystart[, N := .N, by = "sex"][, person_id := NULL])
D4_descriptive_dataset_sex_studystart <- D4_descriptive_dataset_sex_studystart[, Datasource := thisdatasource]
D4_descriptive_dataset_sex_studystart <- D4_descriptive_dataset_sex_studystart[, sex := fifelse(sex == 1, "Sex_male", "Sex_female")]
D4_descriptive_dataset_sex_studystart <- dcast(D4_descriptive_dataset_sex_studystart, Datasource ~ sex, value.var = "N")

fwrite(D4_descriptive_dataset_sex_studystart, file = paste0(direxp, "D4_descriptive_dataset_sex_studystart.csv"))

D4_followup_fromstudystart <- D3_study_population[, .(person_id, sex, age_at_study_entry, study_entry_date, study_exit_date, fup_days)]
dec31 = ymd(20201231)
jan1 = ymd(20210101)
D4_followup_fromstudystart <- D4_followup_fromstudystart[, Followup_2020 := fifelse(study_exit_date > dec31, correct_difftime(dec31, study_entry_date), fup_days)]
D4_followup_fromstudystart <- D4_followup_fromstudystart[study_exit_date > dec31, Followup_2021 := correct_difftime(study_exit_date, jan1)]
D4_followup_fromstudystart <- D4_followup_fromstudystart[, sex := fifelse(sex == 1, "Followup_males", "Followup_females")]
D4_followup_fromstudystart <- D4_followup_fromstudystart[, sex_value := sum(fup_days), by = "sex"]

D4_followup_fromstudystart <- D4_followup_fromstudystart[, age_at_study_entry := findInterval(age_at_study_entry, c(20, 30, 40, 50, 60, 70, 80))]
D4_followup_fromstudystart$age_at_study_entry <- as.character(D4_followup_fromstudystart$age_at_study_entry)
D4_followup_fromstudystart <- D4_followup_fromstudystart[.(age_at_study_entry = c("0", "1", "2", "3", "4", "5", "6", "7"),
                                                           to = c("Followup_0119", "Followup_2029", "Followup_3039", "Followup_4049", "Followup_5059",
                                                                  "Followup_6069", "Followup_7079", "Followup_80")),
                                                         on = "age_at_study_entry", age_at_study_entry := i.to]
D4_followup_fromstudystart <- D4_followup_fromstudystart[, cohort_value := sum(fup_days), by = "age_at_study_entry"]
D4_followup_fromstudystart <- D4_followup_fromstudystart[, Followup_total := sum(fup_days)]
D4_followup_fromstudystart <- D4_followup_fromstudystart[, c("Followup_2020", "Followup_2021") := list(sum(Followup_2020), sum(Followup_2021, na.rm = T))]
D4_followup_fromstudystart <- unique(D4_followup_fromstudystart[, c("person_id", "fup_days") := NULL][, Datasource := thisdatasource])

D4_followup_sex <- unique(D4_followup_fromstudystart[, .(Datasource, sex, sex_value)])
D4_followup_sex <- dcast(D4_followup_sex, Datasource ~ sex, value.var = c("sex_value"))

D4_followup_cohort <- unique(D4_followup_fromstudystart[, .(Datasource, age_at_study_entry, cohort_value)])
D4_followup_cohort <- dcast(D4_followup_cohort, Datasource ~ age_at_study_entry, value.var = c("cohort_value"))

D4_followup_complete <- unique(D4_followup_fromstudystart[, .(Datasource, Followup_total, Followup_2020, Followup_2021)])

D4_followup_fromstudystart <- Reduce(merge, list(D4_followup_sex, D4_followup_cohort, D4_followup_complete))
D4_followup_fromstudystart <- D4_followup_fromstudystart[, .(Datasource, Followup_males, Followup_females, Followup_total,
                                                             Followup_0119, Followup_2029, Followup_3039, Followup_4049,
                                                             Followup_5059, Followup_6069, Followup_7079, Followup_80,
                                                             Followup_2020, Followup_2021)]

fwrite(D4_followup_fromstudystart, file = paste0(direxp, "D4_followup_fromstudystart.csv"))

D4_descriptive_dataset_age_vax1 <- D3_Vaccin_cohort[, .(person_id, type_vax_1, date_vax1, fup_vax1, age_at_date_vax_1)]
D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[, Month_vax1 := month(date_vax1)]
setnames(D4_descriptive_dataset_age_vax1, "type_vax_1", "Vax_dose1")
D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[,c("Age_P25", "Age_P50", "Age_p75") :=
                                                                     as.list(round(quantile(age_at_date_vax_1, probs = c(0.25, 0.50, 0.75)), 0)), by = c("Vax_dose1", "Month_vax1")]
D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[, c("Age_mean", "Age_min", "Age_max") :=
                                                                     list(round(mean(age_at_date_vax_1), 0), min(age_at_date_vax_1), max(age_at_date_vax_1))]

D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[, Followup_vax1 := sum(fup_vax1)][, Datasource := thisdatasource]
D4_descriptive_dataset_age_vax1 <- unique(D4_descriptive_dataset_age_vax1[, .(Datasource, Vax_dose1, Month_vax1, Followup_vax1,
                                                                              Age_P25, Age_P50, Age_p75, Age_mean, Age_min, Age_max)])

fwrite(D4_descriptive_dataset_age_vax1, file = paste0(direxp, "D4_descriptive_dataset_age_vax1.csv"))


D4_descriptive_dataset_ageband_vax <- D3_Vaccin_cohort[, .(person_id, type_vax_1, age_at_date_vax_1)]
D4_descriptive_dataset_ageband_vax <- D4_descriptive_dataset_ageband_vax[, age_at_date_vax_1 := findInterval(age_at_date_vax_1, c(20, 30, 40, 50, 60, 70, 80))]
D4_descriptive_dataset_ageband_vax$age_at_date_vax_1 <- as.character(D4_descriptive_dataset_ageband_vax$age_at_date_vax_1)
D4_descriptive_dataset_ageband_vax <- D4_descriptive_dataset_ageband_vax[.(age_at_date_vax_1 = c("0", "1", "2", "3", "4", "5", "6", "7"),
                                                                                         to = c("AgeCat_019", "AgeCat_2029", "AgeCat_3039", "AgeCat_4049", "AgeCat_5059",
                                                                                                "AgeCat_6069", "AgeCat_7079", "Agecat_80+")),
                                                                                       on = "age_at_date_vax_1", age_at_date_vax_1 := i.to]

D4_descriptive_dataset_ageband_vax <- unique(D4_descriptive_dataset_ageband_vax[, N := .N, by = c("age_at_date_vax_1", "type_vax_1")][, person_id := NULL])
D4_descriptive_dataset_ageband_vax <- D4_descriptive_dataset_ageband_vax[, Datasource := thisdatasource]
D4_descriptive_dataset_ageband_vax <- dcast(D4_descriptive_dataset_ageband_vax, Datasource + type_vax_1 ~ age_at_date_vax_1, value.var = "N")
# D4_descriptive_dataset_ageband_vax <- na_to_0(D4_descriptive_dataset_ageband_vax)

fwrite(D4_descriptive_dataset_ageband_vax, file = paste0(direxp, "D4_descriptive_dataset_ageband_vax.csv"))

D4_descriptive_dataset_sex_vaccination <- D3_study_population[, .(person_id, sex, type_vax_1)]
D4_descriptive_dataset_sex_vaccination <- unique(D4_descriptive_dataset_sex_vaccination[, N := .N, by = c("sex", "type_vax_1")][, person_id := NULL])
D4_descriptive_dataset_sex_vaccination <- D4_descriptive_dataset_sex_vaccination[, Datasource := thisdatasource]
D4_descriptive_dataset_sex_vaccination <- D4_descriptive_dataset_sex_vaccination[, sex := fifelse(sex == 1, "Sex_male", "Sex_female")]
D4_descriptive_dataset_sex_vaccination <- dcast(D4_descriptive_dataset_sex_vaccination, Datasource + type_vax_1 ~ sex, value.var = "N")

fwrite(D4_descriptive_dataset_sex_vaccination, file = paste0(direxp, "D4_descriptive_dataset_sex_vaccination.csv"))


D4_followup_from_vax <- D3_study_population[, .(person_id, sex, age_at_study_entry, fup_vax1, fup_vax2)]
D4_followup_from_vax <- D4_followup_from_vax[, age_at_study_entry := findInterval(age_at_study_entry, c(20, 30, 40, 50, 60, 70, 80))]
D4_followup_from_vax$age_at_study_entry <- as.character(D4_followup_from_vax$age_at_study_entry)

followup_vax1 <- D4_followup_from_vax[!is.na(fup_vax1), ][, sex := fifelse(sex == 1, "Followup_males_vax1", "Followup_females_vax1")]
followup_vax2 <- D4_followup_from_vax[!is.na(fup_vax2), ][, sex := fifelse(sex == 1, "Followup_males_vax2", "Followup_females_vax2")]
followup_vax1 <- followup_vax1[, sex_value := sum(fup_vax1), by = "sex"]
followup_vax2 <- followup_vax2[, sex_value := sum(fup_vax2), by = "sex"]
followup_vax1 <- followup_vax1[.(age_at_study_entry = c("0", "1", "2", "3", "4", "5", "6", "7"),
                                               to = c("Followup_0119_vax1", "Followup_2029_vax1", "Followup_3039_vax1", "Followup_4049_vax1", "Followup_5059_vax1",
                                                      "Followup_6069_vax1", "Followup_7079_vax1", "Followup_80_vax1")),
                                             on = "age_at_study_entry", age_at_study_entry := i.to]
followup_vax2 <- followup_vax2[.(age_at_study_entry = c("0", "1", "2", "3", "4", "5", "6", "7"),
                                               to = c("Followup_0119_vax2", "Followup_2029_vax2", "Followup_3039_vax2", "Followup_4049_vax2", "Followup_5059_vax2",
                                                      "Followup_6069_vax2", "Followup_7079_vax2", "Followup_80_vax2")),
                                             on = "age_at_study_entry", age_at_study_entry := i.to]

followup_vax1 <- followup_vax1[, cohort_value := sum(fup_vax1), by = "age_at_study_entry"]
followup_vax2 <- followup_vax2[, cohort_value := sum(fup_vax2), by = "age_at_study_entry"]

followup_vax1 <- followup_vax1[, Followup_total_vax1 := sum(fup_vax1)]
followup_vax2 <- followup_vax2[, Followup_total_vax2 := sum(fup_vax2)]

followup_vax1 <- unique(followup_vax1[, c("person_id", "fup_vax1") := NULL][, Datasource := thisdatasource])
followup_vax2 <- unique(followup_vax2[, c("person_id", "fup_vax2") := NULL][, Datasource := thisdatasource])

followup_vax1_sex <- unique(followup_vax1[, .(Datasource, sex, sex_value)])
followup_vax1_sex <- dcast(followup_vax1_sex, Datasource ~ sex, value.var = c("sex_value"))
followup_vax2_sex <- unique(followup_vax2[, .(Datasource, sex, sex_value)])
followup_vax2_sex <- dcast(followup_vax2_sex, Datasource ~ sex, value.var = c("sex_value"))

followup_vax1_cohort <- unique(followup_vax1[, .(Datasource, age_at_study_entry, cohort_value)])
empty_vax1_cohort <- data.table(Datasource = thisdatasource,
                                age_at_study_entry = c("Followup_0119_vax1", "Followup_2029_vax1", "Followup_3039_vax1",
                                                       "Followup_4049_vax1", "Followup_5059_vax1", "Followup_6069_vax1",
                                                       "Followup_7079_vax1", "Followup_80_vax1"))
followup_vax1_cohort <- merge(empty_vax1_cohort, followup_vax1_cohort, all.x = T)
followup_vax1_cohort <- dcast(followup_vax1_cohort, Datasource ~ age_at_study_entry, value.var = c("cohort_value"))
followup_vax2_cohort <- unique(followup_vax2[, .(Datasource, age_at_study_entry, cohort_value)])
empty_vax2_cohort <- data.table(Datasource = thisdatasource,
                                age_at_study_entry = c("Followup_0119_vax2", "Followup_2029_vax2", "Followup_3039_vax2",
                                                       "Followup_4049_vax2", "Followup_5059_vax2", "Followup_6069_vax2",
                                                       "Followup_7079_vax2", "Followup_80_vax2"))
followup_vax2_cohort <- merge(empty_vax2_cohort, followup_vax2_cohort, all.x = T)
followup_vax2_cohort <- dcast(followup_vax2_cohort, Datasource ~ age_at_study_entry, value.var = c("cohort_value"))

followup_vax1_complete <- unique(followup_vax1[, .(Datasource, Followup_total_vax1)])
followup_vax2_complete <- unique(followup_vax2[, .(Datasource, Followup_total_vax2)])

D4_followup_from_vax <- Reduce(merge, list(followup_vax1_sex, followup_vax2_sex, followup_vax1_cohort,
                                           followup_vax2_cohort, followup_vax1_complete, followup_vax2_complete))
D4_followup_from_vax <- D4_followup_from_vax[, c("Datasource", "Followup_males_vax1", "Followup_males_vax2",
                                                 "Followup_females_vax1", "Followup_females_vax2", "Followup_total_vax1",
                                                 "Followup_total_vax2", "Followup_0119_vax1", "Followup_2029_vax1",
                                                 "Followup_3039_vax1", "Followup_4049_vax1", "Followup_5059_vax1",
                                                 "Followup_6069_vax1", "Followup_7079_vax1", "Followup_80_vax1",
                                                 "Followup_0119_vax2", "Followup_2029_vax2", "Followup_3039_vax2",
                                                 "Followup_4049_vax2", "Followup_5059_vax2", "Followup_6069_vax2",
                                                 "Followup_7079_vax2", "Followup_80_vax2")]

fwrite(D4_followup_from_vax, file = paste0(direxp, "D4_followup_from_vax.csv"))


D4_distance_doses <- D3_Vaccin_cohort[, .(person_id, date_vax1, date_vax2, type_vax_1, type_vax_2)]
D4_distance_doses <- D4_distance_doses[!is.na(date_vax2) & type_vax_1 == type_vax_2, ]
D4_distance_doses <- D4_distance_doses[, distance := correct_difftime(date_vax2, date_vax1)]
D4_distance_doses <- D4_distance_doses[,c("P25", "P50", "p75") :=
                                         as.list(round(quantile(distance, probs = c(0.25, 0.50, 0.75)), 0)), by = "type_vax_1"]

empty_distances <- data.table(Datasource = thisdatasource, type_vax_1 = c("Moderna", "Pfizer", "AstraZeneca"))

D4_distance_doses <- unique(D4_distance_doses[, .(type_vax_1, P25, P50, p75)][, Datasource := thisdatasource])
D4_distance_doses <- merge(empty_distances, D4_distance_doses, all.x = T)
D4_distance_doses <- dcast(D4_distance_doses, Datasource ~ type_vax_1, value.var = c("P25", "P50", "p75"))
setnames(D4_distance_doses,
         c("P25_AstraZeneca", "P25_Moderna", "P25_Pfizer", "P50_AstraZeneca", "P50_Moderna", "P50_Pfizer",
           "p75_AstraZeneca", "p75_Moderna", "p75_Pfizer"),
         c("Distance_P25_AZ_1_2", "Distance_P25_Moderna1_2", "Distance_P25_Pfizer1_2", "Distance_P50_AZ_1_2",
           "Distance_P50_Moderna1_2", "Distance_P50_Pfizer1_2", "Distance_P75_AZ_1_2", "Distance_P75_Moderna1_2",
           "Distance_P75_Pfizer1_2"))
D4_distance_doses <- D4_distance_doses[, c("Datasource", "Distance_P25_Pfizer1_2", "Distance_P50_Pfizer1_2", "Distance_P75_Pfizer1_2",
                                           "Distance_P25_Moderna1_2", "Distance_P50_Moderna1_2", "Distance_P75_Moderna1_2",
                                           "Distance_P25_AZ_1_2", "Distance_P50_AZ_1_2", "Distance_P75_AZ_1_2")]

fwrite(D4_distance_doses, file = paste0(direxp, "D4_distance_doses.csv"))


rm(D3_study_population, D3_Vaccin_cohort, D4_descriptive_dataset_age_studystart, D4_descriptive_dataset_ageband_studystart,
   D4_descriptive_dataset_sex_studystart, D4_followup_fromstudystart, dec31, jan1, D4_followup_sex, D4_followup_cohort,
   D4_followup_complete, D4_descriptive_dataset_age_vax1, D4_descriptive_dataset_ageband_vax,
   D4_descriptive_dataset_sex_vaccination, D4_followup_from_vax, followup_vax1, followup_vax2, followup_vax1_sex,
   followup_vax2_sex, followup_vax1_cohort, empty_vax1_cohort, followup_vax2_cohort, empty_vax2_cohort,
   followup_vax1_complete, followup_vax2_complete, D4_distance_doses, empty_distances)




