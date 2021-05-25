load(paste0(diroutput,"D4_persontime_risk_week.RData"))

cols_to_sums = names(D4_persontime_risk_week)[7:length(D4_persontime_risk_week)]

D4_persontime_risk_week <- copy(D4_persontime_risk_week)[, lapply(.SD, sum, na.rm=TRUE),
                                         by = c("sex", "riskfactor", "Dose", "type_vax", "week"),
                                         .SDcols = cols_to_sums]

all_sex <- copy(D4_persontime_risk_week)[, lapply(.SD, sum, na.rm=TRUE),
                                         by = c("riskfactor", "Dose", "type_vax", "week"),
                                         .SDcols = cols_to_sums]

all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_risk_week_totals <- rbind(D4_persontime_risk_week, all_sex)

save(D4_persontime_risk_week_totals,file=paste0(diroutput,"D4_persontime_risk_week_RF.RData"))
rm(D4_persontime_risk_week, D4_persontime_risk_week_totals)



load(paste0(diroutput,"D4_persontime_benefit_week.RData"))

cols_to_sums = names(D4_persontime_benefit_week)[7:length(D4_persontime_benefit_week)]

D4_persontime_benefit_week <- copy(D4_persontime_benefit_week)[, lapply(.SD, sum, na.rm=TRUE),
                                                               by = c("sex", "riskfactor", "Dose", "type_vax", "week"),
                                                               .SDcols = cols_to_sums]

all_sex <- copy(D4_persontime_benefit_week)[, lapply(.SD, sum, na.rm=TRUE),
                                            by = c("riskfactor", "Dose", "type_vax", "week"),
                                            .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_benefit_week_totals <- rbind(D4_persontime_benefit_week, all_sex)

save(D4_persontime_benefit_week_totals,file=paste0(diroutput,"D4_persontime_benefit_week_RF.RData"))
rm(D4_persontime_benefit_week, D4_persontime_benefit_week_totals)



load(paste0(diroutput,"D4_persontime_risk_year.RData"))

D4_persontime_risk_year <- D4_persontime_risk_year[, year := NULL]
cols_to_sums = names(D4_persontime_risk_year)[7:length(D4_persontime_risk_year)]

D4_persontime_risk_year <- copy(D4_persontime_risk_year)[, lapply(.SD, sum, na.rm=TRUE),
                                                         by = c("sex", "riskfactor", "Dose", "type_vax", "week_fup"),
                                                         .SDcols = cols_to_sums]

all_sex <- copy(D4_persontime_risk_year)[, lapply(.SD, sum, na.rm=TRUE),
                                         by = c("riskfactor", "Dose", "type_vax", "week_fup"),
                                         .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_risk_year_totals <- rbind(D4_persontime_risk_year, all_sex)

save(D4_persontime_risk_year_totals,file=paste0(diroutput,"D4_persontime_risk_year_RF.RData"))
rm(D4_persontime_risk_year, D4_persontime_risk_year_totals)



load(paste0(diroutput,"D4_persontime_benefit_year.RData"))

D4_persontime_benefit_year <- D4_persontime_benefit_year[, year := NULL]
cols_to_sums = names(D4_persontime_benefit_year)[7:length(D4_persontime_benefit_year)]

D4_persontime_benefit_year <- copy(D4_persontime_benefit_year)[, lapply(.SD, sum, na.rm=TRUE),
                                                            by = c("sex", "riskfactor", "Dose", "type_vax", "week_fup"),
                                                            .SDcols = cols_to_sums]

all_sex <- copy(D4_persontime_benefit_year)[, lapply(.SD, sum, na.rm=TRUE),
                                            by = c("riskfactor", "Dose", "type_vax", "week_fup"),
                                            .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_benefit_year_totals <- rbind(D4_persontime_benefit_year, all_sex)

save(D4_persontime_benefit_year_totals,file=paste0(diroutput,"D4_persontime_benefit_year_RF.RData"))
rm(D4_persontime_benefit_year, D4_persontime_benefit_year_totals, all_sex, cols_to_sums)