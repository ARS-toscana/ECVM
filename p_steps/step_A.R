library(data.table)

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

D3_doses <- dcast(D3_doses, person_id + sex + date_of_birth + date_of_death + study_entry_date + start_follow_up +
        study_exit_date ~ vx_dose, value.var = c("date", "vx_manufacturer"))

setnames(D3_doses, c("date_1", "date_2", "vx_manufacturer_1", "vx_manufacturer_2"),
         c("date_vax1", "date_vax2", "type_vax_1", "type_vax_2"))

D3_doses <- D3_doses[!is.na(date_vax1) & study_exit_date > date_vax1, c("study_entry_date_vax1", "study_exit_date_vax1") := list(date_vax1, fifelse(is.na(date_vax2) | study_exit_date < date_vax2, study_exit_date, date_vax2 - 1))]
D3_doses <- D3_doses[!is.na(date_vax2) & study_exit_date > date_vax2, c("study_entry_date_vax2", "study_exit_date_vax2") := list(date_vax2, study_exit_date)]

D3_doses <- D3_doses[, age_at_study_entry := floor(time_length(difftime(study_entry_date, date_of_birth), "years"))]
D3_doses <- D3_doses[, age_at_date_vax_1 := floor(time_length(difftime(date_vax1, date_of_birth), "years"))]
D3_doses <- D3_doses[, fup_days := difftime(study_exit_date, study_entry_date)]
D3_doses <- D3_doses[, fup_no_vax := fifelse(is.na(study_entry_date_vax1), fup_days, difftime(study_entry_date_vax1, study_entry_date))]

D3_doses <- D3_doses[!is.na(study_entry_date_vax1), fup_vax1 := fifelse(is.na(study_entry_date_vax2), difftime(study_exit_date_vax1, study_entry_date_vax1), difftime(study_entry_date_vax2, study_entry_date_vax1))]

D3_doses <- D3_doses[!is.na(study_entry_date_vax2), fup_vax2 := difftime(study_exit_date_vax2, study_entry_date_vax2)]

D3_study_population <- D3_doses[, .(person_id, sex, date_of_birth, start_follow_up, study_entry_date, study_exit_date,
                                    date_vax1, date_vax2, age_at_study_entry, age_at_date_vax_1, type_vax_1, type_vax_2,
                                    study_entry_date_vax1, study_exit_date_vax1, study_entry_date_vax2, study_exit_date_vax2,
                                    fup_days, fup_no_vax, fup_vax1, fup_vax2)]

save(D3_study_population, file = paste0(dirtemp, "D3_study_population.RData"))

D3_study_population <- D3_study_population[!is.na(date_vax1), ][, age_at_date_vax_2 := floor(time_length(difftime(date_vax2, date_of_birth), "years"))]
D3_vaccin_cohort <- D3_study_population[, .(person_id, sex, date_of_birth, study_entry_date,
                                               study_exit_date, date_vax1, date_vax2,
                                               age_at_date_vax_1, age_at_date_vax_2,
                                               type_vax_1, type_vax_2, study_entry_date_vax1,
                                               study_exit_date_vax1, study_entry_date_vax2,
                                               study_exit_date_vax2, fup_days, fup_vax1, fup_vax2)]

save(D3_vaccin_cohort, file = paste0(dirtemp, "D3_vaccin_cohort.RData"))

