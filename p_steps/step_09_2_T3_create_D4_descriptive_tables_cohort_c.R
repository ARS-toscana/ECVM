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
load(paste0(diroutput, "D3_study_population_cov_ALL.RData"))

D4_descriptive_dataset_age_vax1 <- D3_Vaccin_cohort[, .(person_id, type_vax_1, date_vax1, fup_vax1, age_at_date_vax_1)]
D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[, Month_vax1 := month(date_vax1)]
setnames(D4_descriptive_dataset_age_vax1, "type_vax_1", "Vax_dose1")
D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[,c("Age_P25", "Age_P50", "Age_p75") :=
                                                                     as.list(round(quantile(age_at_date_vax_1, probs = c(0.25, 0.50, 0.75)), 0)), by = c("Vax_dose1", "Month_vax1")]
D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[, c("Age_mean", "Age_min", "Age_max") :=
                                                                     list(round(mean(age_at_date_vax_1), 0), min(age_at_date_vax_1), max(age_at_date_vax_1)), by = c("Vax_dose1", "Month_vax1")]

D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[, Followup_vax1 := sum(fup_vax1), by = c("Vax_dose1", "Month_vax1")][, Datasource := thisdatasource]
D4_descriptive_dataset_age_vax1 <- unique(D4_descriptive_dataset_age_vax1[, .(Datasource, Vax_dose1, Month_vax1, Followup_vax1,
                                                                              Age_P25, Age_P50, Age_p75, Age_mean, Age_min, Age_max)])

fwrite(D4_descriptive_dataset_age_vax1, file = paste0(dirD4tables, "D4_descriptive_dataset_age_vax1.csv"))


D4_descriptive_dataset_ageband_vax <- D3_Vaccin_cohort[, .(person_id, type_vax_1, age_at_date_vax_1)]
D4_descriptive_dataset_ageband_vax <- D4_descriptive_dataset_ageband_vax[, age_at_date_vax_1 := findInterval(age_at_date_vax_1, c(20, 30, 40, 50, 60, 70, 80))]
D4_descriptive_dataset_ageband_vax$age_at_date_vax_1 <- as.character(D4_descriptive_dataset_ageband_vax$age_at_date_vax_1)
D4_descriptive_dataset_ageband_vax <- D4_descriptive_dataset_ageband_vax[.(age_at_date_vax_1 = c("0", "1", "2", "3", "4", "5", "6", "7"),
                                                                           to = c("AgeCat_019", "AgeCat_2029", "AgeCat_3039", "AgeCat_4049", "AgeCat_5059",
                                                                                  "AgeCat_6069", "AgeCat_7079", "Agecat_80+")),
                                                                         on = "age_at_date_vax_1", age_at_date_vax_1 := i.to]

D4_descriptive_dataset_ageband_vax <- unique(D4_descriptive_dataset_ageband_vax[, N := .N, by = c("age_at_date_vax_1", "type_vax_1")][, person_id := NULL])

older60 <- copy(D4_descriptive_dataset_ageband_vax)[age_at_date_vax_1 %in% c("Agecat_80+", "AgeCat_7079", "AgeCat_6069"),
                                                    lapply(.SD, sum, na.rm=TRUE), by = c("type_vax_1"),
                                                    .SDcols = "N"]
older60 <- unique(older60[, age_at_date_vax_1 := "Agecat_60+"])
D4_descriptive_dataset_ageband_vax <- rbind(D4_descriptive_dataset_ageband_vax, older60)

D4_descriptive_dataset_ageband_vax <- D4_descriptive_dataset_ageband_vax[, Datasource := thisdatasource]
D4_descriptive_dataset_ageband_vax <- data.table::dcast(D4_descriptive_dataset_ageband_vax, Datasource + type_vax_1 ~ age_at_date_vax_1, value.var = "N")
# D4_descriptive_dataset_ageband_vax <- na_to_0(D4_descriptive_dataset_ageband_vax)

fwrite(D4_descriptive_dataset_ageband_vax, file = paste0(dirD4tables, "D4_descriptive_dataset_ageband_vax.csv"))

D4_descriptive_dataset_sex_vaccination <- D3_Vaccin_cohort[, .(person_id, sex, type_vax_1)]
D4_descriptive_dataset_sex_vaccination <- unique(D4_descriptive_dataset_sex_vaccination[, N := .N, by = c("sex", "type_vax_1")][, person_id := NULL])
D4_descriptive_dataset_sex_vaccination <- D4_descriptive_dataset_sex_vaccination[, Datasource := thisdatasource]
D4_descriptive_dataset_sex_vaccination <- D4_descriptive_dataset_sex_vaccination[, sex := fifelse(sex == 1, "Sex_male", "Sex_female")]
D4_descriptive_dataset_sex_vaccination <- data.table::dcast(D4_descriptive_dataset_sex_vaccination, Datasource + type_vax_1 ~ sex, value.var = "N")

fwrite(D4_descriptive_dataset_sex_vaccination, file = paste0(dirD4tables, "D4_descriptive_dataset_sex_vaccination.csv"))

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
followup_vax1_sex <- data.table::dcast(followup_vax1_sex, Datasource ~ sex, value.var = c("sex_value"))
followup_vax2_sex <- unique(followup_vax2[, .(Datasource, sex, sex_value)])
followup_vax2_sex <- data.table::dcast(followup_vax2_sex, Datasource ~ sex, value.var = c("sex_value"))

followup_vax1_cohort <- unique(followup_vax1[, .(Datasource, age_at_study_entry, cohort_value)])
empty_vax1_cohort <- data.table(Datasource = thisdatasource,
                                age_at_study_entry = c("Followup_0119_vax1", "Followup_2029_vax1", "Followup_3039_vax1",
                                                       "Followup_4049_vax1", "Followup_5059_vax1", "Followup_6069_vax1",
                                                       "Followup_7079_vax1", "Followup_80_vax1"))
followup_vax1_cohort <- merge(empty_vax1_cohort, followup_vax1_cohort, all.x = T)
older60_vax1 <- copy(followup_vax1_cohort)[age_at_study_entry %in% c("Followup_80_vax1", "Followup_7079_vax1",
                                                                     "Followup_6069_vax1"), sum(cohort_value, na.rm = T)]
older60_vax1 <- data.table::data.table(Datasource = thisdatasource, age_at_study_entry = "Followup_60_vax1",
                                       cohort_value = older60_vax1)
followup_vax1_cohort <- rbind(followup_vax1_cohort, older60_vax1)
followup_vax1_cohort <- data.table::dcast(followup_vax1_cohort, Datasource ~ age_at_study_entry, value.var = c("cohort_value"))
followup_vax2_cohort <- unique(followup_vax2[, .(Datasource, age_at_study_entry, cohort_value)])
empty_vax2_cohort <- data.table(Datasource = thisdatasource,
                                age_at_study_entry = c("Followup_0119_vax2", "Followup_2029_vax2", "Followup_3039_vax2",
                                                       "Followup_4049_vax2", "Followup_5059_vax2", "Followup_6069_vax2",
                                                       "Followup_7079_vax2", "Followup_80_vax2"))
followup_vax2_cohort <- merge(empty_vax2_cohort, followup_vax2_cohort, all.x = T)
older60_vax2 <- copy(followup_vax2_cohort)[age_at_study_entry %in% c("Followup_80_vax2", "Followup_7079_vax2",
                                                                     "Followup_6069_vax2"), sum(cohort_value, na.rm = T)]
older60_vax2 <- data.table::data.table(Datasource = thisdatasource, age_at_study_entry = "Followup_60_vax2",
                                       cohort_value = older60_vax2)
followup_vax2_cohort <- rbind(followup_vax2_cohort, older60_vax2)
followup_vax2_cohort <- data.table::dcast(followup_vax2_cohort, Datasource ~ age_at_study_entry, value.var = c("cohort_value"))

followup_vax1_complete <- unique(followup_vax1[, .(Datasource, Followup_total_vax1)])
followup_vax2_complete <- unique(followup_vax2[, .(Datasource, Followup_total_vax2)])

D4_followup_from_vax <- Reduce(merge, list(followup_vax1_sex, followup_vax2_sex, followup_vax1_cohort,
                                           followup_vax2_cohort, followup_vax1_complete, followup_vax2_complete))

vect_col_to_year <- c("Followup_males_vax1", "Followup_males_vax2", "Followup_females_vax1", "Followup_females_vax2",
                      "Followup_total_vax1", "Followup_total_vax2", "Followup_0119_vax1", "Followup_2029_vax1",
                      "Followup_3039_vax1", "Followup_4049_vax1", "Followup_5059_vax1", "Followup_6069_vax1",
                      "Followup_7079_vax1", "Followup_80_vax1", "Followup_60_vax1", "Followup_0119_vax2",
                      "Followup_2029_vax2", "Followup_3039_vax2", "Followup_4049_vax2", "Followup_5059_vax2",
                      "Followup_6069_vax2", "Followup_7079_vax2", "Followup_80_vax2", "Followup_60_vax2")

tot_col <- c("Datasource", vect_col_to_year)

D4_followup_from_vax <- D4_followup_from_vax[, lapply(.SD, as.numeric), .SDcols = vect_col_to_year]
D4_followup_from_vax <- D4_followup_from_vax[, (vect_col_to_year) := round(.SD / 365.25), .SDcols = vect_col_to_year]
D4_followup_from_vax <- D4_followup_from_vax[, Datasource := thisdatasource]

D4_followup_from_vax <- D4_followup_from_vax[, ..tot_col]

fwrite(D4_followup_from_vax, file = paste0(dirD4tables, "D4_followup_from_vax.csv"))

rm(D3_study_population, D3_Vaccin_cohort, D4_descriptive_dataset_age_studystart, D4_descriptive_dataset_ageband_studystart,
   D4_descriptive_dataset_sex_studystart, D4_followup_fromstudystart, dec31, jan1, D4_followup_sex, D4_followup_cohort,
   D4_followup_complete, D4_descriptive_dataset_age_vax1, D4_descriptive_dataset_ageband_vax,
   D4_descriptive_dataset_sex_vaccination, D4_followup_from_vax, followup_vax1, followup_vax2, followup_vax1_sex,
   followup_vax2_sex, followup_vax1_cohort, empty_vax1_cohort, followup_vax2_cohort, empty_vax2_cohort,
   followup_vax1_complete, followup_vax2_complete, D4_distance_doses, empty_distances, D3_study_population_cov_ALL,
   D4_descriptive_dataset_covariate_studystart, g)




