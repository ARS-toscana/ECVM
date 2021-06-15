load(paste0(diroutput,"D4_persontime_risk_week.RData"))

D4_persontime_risk_week <- D4_persontime_risk_week[, c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR",
                                                       "any_risk_factors") := NULL]

cols_to_sums = names(D4_persontime_risk_week)[6:length(D4_persontime_risk_week)]

all_sex <- copy(D4_persontime_risk_week)[, lapply(.SD, sum, na.rm=TRUE),
                                         by = c("Birthcohort_persons", "Dose", "type_vax", "week"),
                                        .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_risk_week <- rbind(D4_persontime_risk_week, all_sex)

all_ages <- copy(D4_persontime_risk_week)[, lapply(.SD, sum, na.rm=TRUE),
                                          by = c("sex", "Dose", "type_vax", "week"),
                                          .SDcols = cols_to_sums]
all_ages <- unique(all_ages[, Birthcohort_persons := "all_birth_cohorts"])

D4_persontime_risk_week_BC <- rbind(D4_persontime_risk_week, all_ages)

save(D4_persontime_risk_week_BC,file=paste0(diroutput,"D4_persontime_risk_week_BC.RData"))
rm(D4_persontime_risk_week, D4_persontime_risk_week_BC)



load(paste0(diroutput,"D4_persontime_benefit_week.RData"))

D4_persontime_benefit_week <- D4_persontime_benefit_week[, c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR",
                                                             "any_risk_factors") := NULL]

cols_to_sums = names(D4_persontime_benefit_week)[6:length(D4_persontime_benefit_week)]

all_sex <- copy(D4_persontime_benefit_week)[, lapply(.SD, sum, na.rm=TRUE),
                                         by = c("Birthcohort_persons", "Dose", "type_vax", "week"),
                                         .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_benefit_week <- rbind(D4_persontime_benefit_week, all_sex)

all_ages <- copy(D4_persontime_benefit_week)[, lapply(.SD, sum, na.rm=TRUE),
                                          by = c("sex", "Dose", "type_vax", "week"),
                                          .SDcols = cols_to_sums]
all_ages <- unique(all_ages[, Birthcohort_persons := "all_birth_cohorts"])

D4_persontime_benefit_week_BC <- rbind(D4_persontime_benefit_week, all_ages)

save(D4_persontime_benefit_week_BC,file=paste0(diroutput,"D4_persontime_benefit_week_BC.RData"))
rm(D4_persontime_benefit_week, D4_persontime_benefit_week_BC)



load(paste0(diroutput,"D4_persontime_risk_year.RData"))

D4_persontime_risk_year <- D4_persontime_risk_year[, c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR",
                                                       "any_risk_factors") := NULL]

D4_persontime_risk_year <- D4_persontime_risk_year[, year := NULL]
cols_to_sums = names(D4_persontime_risk_year)[6:length(D4_persontime_risk_year)]

all_sex <- copy(D4_persontime_risk_year)[, lapply(.SD, sum, na.rm=TRUE),
                                            by = c("Birthcohort_persons", "Dose", "type_vax", "week_fup"),
                                            .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_risk_year <- rbind(D4_persontime_risk_year, all_sex)

all_ages <- copy(D4_persontime_risk_year)[, lapply(.SD, sum, na.rm=TRUE),
                                             by = c("sex", "Dose", "type_vax", "week_fup"),
                                             .SDcols = cols_to_sums]
all_ages <- unique(all_ages[, Birthcohort_persons := "all_birth_cohorts"])

D4_persontime_risk_year_BC <- rbind(D4_persontime_risk_year, all_ages)

AESI <- c("Persontime", "Persontime_ACUASEARTHRITIS_broad", "Persontime_DM_broad", "Persontime_HF_narrow",            
          "Persontime_HF_broad", "Persontime_CAD_narrow", "Persontime_CAD_broad", "Persontime_GENCONV_narrow",
          "Persontime_GENCONV_broad", "Persontime_ANAPHYL_broad", "Persontime_Ischstroke_narrow",
          "Persontime_Ischstroke_broad", "Persontime_VTE_narrow", "Persontime_VTE_broad", "Persontime_CONTRDIVERTIC",
          "Persontime_CONTRHYPERT", "Persontime_DEATH", "Persontime_ArterialNoTP", "Persontime_VTENoTP",
          "Persontime_ArterialVTENoTP", "ACUASEARTHRITIS_broad_b", "DM_broad_b", "HF_narrow_b", "HF_broad_b",
          "CAD_narrow_b", "CAD_broad_b", "GENCONV_narrow_b","GENCONV_broad_b", "ANAPHYL_broad_b", "Ischstroke_narrow_b",
          "Ischstroke_broad_b", "VTE_narrow_b", "VTE_broad_b", "CONTRDIVERTIC_b", "CONTRHYPERT_b", "DEATH_b",
          "ArterialNoTP_b", "VTENoTP_b", "ArterialVTENoTP_b")

setorder(D4_persontime_risk_year_BC, "Birthcohort_persons")

vax_dose <- unique(copy(D4_persontime_risk_year_BC)[, c("Dose", "type_vax", "week_fup")])
vax_dose <- vax_dose[, .SD[which.max(week_fup)], by = c("Dose", "type_vax")]
vax_dose_0 <- vax_dose[week_fup == 0,]
week_vax_dose <- vax_dose[, lapply(.SD, rep, vax_dose[, week_fup])][, week_fup := unlist(
  lapply(vax_dose[, week_fup], seq_len))]
week_vax_dose <- rbind(week_vax_dose, vax_dose_0)

sex_vect <- rep(c("0", "1", "both_sexes"), each = nrow(week_vax_dose))
week_vax_dose <- week_vax_dose[, lapply(.SD, rep, 3)][, sex := sex_vect]
birthcohorts <- c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979", "1980-1989", "1990+")
birthcohort_vect <- rep(birthcohorts, each = nrow(week_vax_dose))
empty_risk_year <- week_vax_dose[, lapply(.SD, rep, length(birthcohorts))][, Birthcohort_persons := birthcohort_vect]

D4_persontime_risk_year_BC <- merge(empty_risk_year, D4_persontime_risk_year_BC, all.x = T,
                                    by = c("Dose", "type_vax", "week_fup", "sex", "Birthcohort_persons"))

for (i in names(D4_persontime_risk_year_BC)){
  D4_persontime_risk_year_BC[is.na(get(i)), (i) := 0]
}

D4_persontime_risk_year_BC <- D4_persontime_risk_year_BC[, (AESI) := lapply(.SD, cumsum),
                                                         by = c("Dose", "type_vax", "Birthcohort_persons", "sex"),
                                                         .SDcols = AESI]

save(D4_persontime_risk_year_BC,file=paste0(diroutput,"D4_persontime_risk_year_BC.RData"))
rm(D4_persontime_risk_year, D4_persontime_risk_year_BC)



load(paste0(diroutput,"D4_persontime_benefit_year.RData"))

D4_persontime_benefit_year <- D4_persontime_benefit_year[, c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR",
                                                             "any_risk_factors") := NULL]

D4_persontime_benefit_year <- D4_persontime_benefit_year[, year := NULL]
cols_to_sums = names(D4_persontime_benefit_year)[6:length(D4_persontime_benefit_year)]

all_sex <- copy(D4_persontime_benefit_year)[, lapply(.SD, sum, na.rm=TRUE),
                                         by = c("Birthcohort_persons", "Dose", "type_vax", "week_fup"),
                                         .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_benefit_year <- rbind(D4_persontime_benefit_year, all_sex)

all_ages <- copy(D4_persontime_benefit_year)[, lapply(.SD, sum, na.rm=TRUE),
                                          by = c("sex", "Dose", "type_vax", "week_fup"),
                                          .SDcols = cols_to_sums]
all_ages <- unique(all_ages[, Birthcohort_persons := "all_birth_cohorts"])

D4_persontime_benefit_year_BC <- rbind(D4_persontime_benefit_year, all_ages)

save(D4_persontime_benefit_year_BC,file=paste0(diroutput,"D4_persontime_benefit_year_BC.RData"))
rm(D4_persontime_benefit_year, D4_persontime_benefit_year_BC, all_ages, all_sex, cols_to_sums)