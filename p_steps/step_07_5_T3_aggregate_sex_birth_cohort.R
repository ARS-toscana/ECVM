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