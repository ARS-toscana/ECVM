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