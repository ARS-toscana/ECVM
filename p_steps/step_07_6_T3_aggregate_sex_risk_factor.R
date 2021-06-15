load(paste0(diroutput,"D4_persontime_risk_week.RData"))

D4_persontime_risk_week <- D4_persontime_risk_week[any_risk_factors != 0]

cols_to_sums = names(D4_persontime_risk_week)[16:length(D4_persontime_risk_week)]

D4_persontime_risk_week <- D4_persontime_risk_week[, lapply(.SD, sum, na.rm=TRUE),
                                                   by = c("sex", "Dose", "type_vax", "week", "CV", "COVCANCER",
                                                          "COVCOPD", "COVHIV", "COVCKD", "COVDIAB", "COVOBES",
                                                          "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
                                                   .SDcols = cols_to_sums]

D4_persontime_risk_week <- melt(D4_persontime_risk_week,
                                    measure.vars = c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB",
                                                     "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
                                    variable.name = "riskfactor", value.name = "to_drop")

D4_persontime_risk_week <- D4_persontime_risk_week[to_drop == 1, ][, to_drop := NULL]

D4_persontime_risk_week <- D4_persontime_risk_week[, lapply(.SD, sum, na.rm=TRUE),
                                                   by = c("sex", "Dose", "type_vax", "week", "riskfactor"),
                                                   .SDcols = cols_to_sums]

all_sex <- copy(D4_persontime_risk_week)[, lapply(.SD, sum, na.rm=TRUE),
                                         by = c("Dose", "type_vax", "week", "riskfactor"),
                                         .SDcols = cols_to_sums]

all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_risk_week_RF <- rbind(D4_persontime_risk_week, all_sex)

save(D4_persontime_risk_week_RF,file=paste0(diroutput,"D4_persontime_risk_week_RF.RData"))
rm(D4_persontime_risk_week, D4_persontime_risk_week_RF)



load(paste0(diroutput,"D4_persontime_benefit_week.RData"))

D4_persontime_benefit_week <- D4_persontime_benefit_week[any_risk_factors != 0]

cols_to_sums = names(D4_persontime_benefit_week)[16:length(D4_persontime_benefit_week)]

D4_persontime_benefit_week <- D4_persontime_benefit_week[, lapply(.SD, sum, na.rm=TRUE),
                                                   by = c("sex", "Dose", "type_vax", "week", "CV", "COVCANCER",
                                                          "COVCOPD", "COVHIV", "COVCKD", "COVDIAB", "COVOBES",
                                                          "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
                                                   .SDcols = cols_to_sums]

D4_persontime_benefit_week <- melt(D4_persontime_benefit_week,
                                measure.vars = c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB",
                                                 "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
                                variable.name = "riskfactor", value.name = "to_drop")

D4_persontime_benefit_week <- D4_persontime_benefit_week[to_drop == 1, ][, to_drop := NULL]

D4_persontime_benefit_week <- D4_persontime_benefit_week[, lapply(.SD, sum, na.rm=TRUE),
                                                   by = c("sex", "Dose", "type_vax", "week", "riskfactor"),
                                                   .SDcols = cols_to_sums]

all_sex <- copy(D4_persontime_benefit_week)[, lapply(.SD, sum, na.rm=TRUE),
                                            by = c("Dose", "type_vax", "week", "riskfactor"),
                                            .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_benefit_week_RF <- rbind(D4_persontime_benefit_week, all_sex)

save(D4_persontime_benefit_week_RF,file=paste0(diroutput,"D4_persontime_benefit_week_RF.RData"))
rm(D4_persontime_benefit_week, D4_persontime_benefit_week_RF)



load(paste0(diroutput,"D4_persontime_risk_year.RData"))

D4_persontime_risk_year <- D4_persontime_risk_year[any_risk_factors != 0][, year := NULL]
cols_to_sums = names(D4_persontime_risk_year)[16:length(D4_persontime_risk_year)]

D4_persontime_risk_year <- D4_persontime_risk_year[, lapply(.SD, sum, na.rm=TRUE),
                                                   by = c("sex", "Dose", "type_vax", "week_fup", "CV", "COVCANCER",
                                                          "COVCOPD", "COVHIV", "COVCKD", "COVDIAB", "COVOBES",
                                                          "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
                                                   .SDcols = cols_to_sums]

D4_persontime_risk_year <- melt(D4_persontime_risk_year,
                                measure.vars = c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB",
                                                 "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
                                variable.name = "riskfactor", value.name = "to_drop")

D4_persontime_risk_year <- D4_persontime_risk_year[to_drop == 1, ][, to_drop := NULL]

D4_persontime_risk_year <- D4_persontime_risk_year[, lapply(.SD, sum, na.rm=TRUE),
                                                   by = c("sex", "Dose", "type_vax", "week_fup", "riskfactor"),
                                                   .SDcols = cols_to_sums]

all_sex <- copy(D4_persontime_risk_year)[, lapply(.SD, sum, na.rm=TRUE),
                                         by = c("Dose", "type_vax", "week_fup", "riskfactor"),
                                         .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_risk_year_RF <- rbind(D4_persontime_risk_year, all_sex)

AESI <- c("Persontime", "Persontime_ACUASEARTHRITIS_broad", "Persontime_DM_broad", "Persontime_HF_narrow",            
          "Persontime_HF_broad", "Persontime_CAD_narrow", "Persontime_CAD_broad", "Persontime_GENCONV_narrow",
          "Persontime_GENCONV_broad", "Persontime_ANAPHYL_broad", "Persontime_Ischstroke_narrow",
          "Persontime_Ischstroke_broad", "Persontime_VTE_narrow", "Persontime_VTE_broad", "Persontime_CONTRDIVERTIC",
          "Persontime_CONTRHYPERT", "Persontime_DEATH", "Persontime_ArterialNoTP", "Persontime_VTENoTP",
          "Persontime_ArterialVTENoTP", "ACUASEARTHRITIS_broad_b", "DM_broad_b", "HF_narrow_b", "HF_broad_b",
          "CAD_narrow_b", "CAD_broad_b", "GENCONV_narrow_b","GENCONV_broad_b", "ANAPHYL_broad_b", "Ischstroke_narrow_b",
          "Ischstroke_broad_b", "VTE_narrow_b", "VTE_broad_b", "CONTRDIVERTIC_b", "CONTRHYPERT_b", "DEATH_b",
          "ArterialNoTP_b", "VTENoTP_b", "ArterialVTENoTP_b")

setorder(D4_persontime_risk_year_RF, "week_fup")

vax_dose <- unique(copy(D4_persontime_risk_year_RF)[, c("Dose", "type_vax", "week_fup")])
vax_dose <- vax_dose[, .SD[max(week_fup)], by = c("Dose", "type_vax")]
week_vax_dose <- vax_dose[, lapply(.SD, rep, vax_dose[, week_fup])][, week_fup := unlist(
  lapply(vax_dose[, week_fup], seq_len))]

sex_vect <- rep(c("0", "1", "both_sexes"), each = nrow(week_vax_dose))
week_vax_dose <- week_vax_dose[, lapply(.SD, rep, 3)][, sex := sex_vect]
riskfactors <- c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR",
                 "any_risk_factors")
riskfactor_vect <- rep(riskfactors, each = nrow(week_vax_dose))
empty_risk_year <- week_vax_dose[, lapply(.SD, rep, length(riskfactors))][, riskfactor := riskfactor_vect]

D4_persontime_risk_year_RF <- merge(empty_risk_year, D4_persontime_risk_year_RF, all.x = T,
                                    by = c("Dose", "type_vax", "week_fup", "sex", "riskfactor"))

for (i in names(D4_persontime_risk_year_RF)){
  D4_persontime_risk_year_RF[is.na(get(i)), (i) := 0]
}

D4_persontime_risk_year_RF <- D4_persontime_risk_year_RF[, (AESI) := lapply(.SD, cumsum),
                                                         by = c("Dose", "type_vax", "riskfactor", "sex"),
                                                         .SDcols = AESI]

save(D4_persontime_risk_year_RF,file=paste0(diroutput,"D4_persontime_risk_year_RF.RData"))
rm(D4_persontime_risk_year, D4_persontime_risk_year_RF)



load(paste0(diroutput,"D4_persontime_benefit_year.RData"))

D4_persontime_benefit_year <- D4_persontime_benefit_year[any_risk_factors != 0][, year := NULL]
cols_to_sums = names(D4_persontime_benefit_year)[16:length(D4_persontime_benefit_year)]

D4_persontime_benefit_year <- D4_persontime_benefit_year[, lapply(.SD, sum, na.rm=TRUE),
                                                   by = c("sex", "Dose", "type_vax", "week_fup", "CV", "COVCANCER",
                                                          "COVCOPD", "COVHIV", "COVCKD", "COVDIAB", "COVOBES",
                                                          "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
                                                   .SDcols = cols_to_sums]

D4_persontime_benefit_year <- melt(D4_persontime_benefit_year,
                                measure.vars = c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB",
                                                 "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
                                variable.name = "riskfactor", value.name = "to_drop")

D4_persontime_benefit_year <- D4_persontime_benefit_year[to_drop == 1, ][, to_drop := NULL]

D4_persontime_benefit_year <- D4_persontime_benefit_year[, lapply(.SD, sum, na.rm=TRUE),
                                                   by = c("sex", "Dose", "type_vax", "week_fup", "riskfactor"),
                                                   .SDcols = cols_to_sums]

all_sex <- copy(D4_persontime_benefit_year)[, lapply(.SD, sum, na.rm=TRUE),
                                            by = c("Dose", "type_vax", "week_fup", "riskfactor"),
                                            .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_benefit_year_RF <- rbind(D4_persontime_benefit_year, all_sex)

save(D4_persontime_benefit_year_RF,file=paste0(diroutput,"D4_persontime_benefit_year_RF.RData"))
rm(D4_persontime_benefit_year, D4_persontime_benefit_year_RF, all_sex, cols_to_sums)