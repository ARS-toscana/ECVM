load(paste0(diroutput,"D4_persontime_risk_week.RData"))

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

D4_persontime_risk_week <- rbind(D4_persontime_risk_week, all_ages)

save(D4_persontime_risk_week,file=paste0(diroutput,"D4_persontime_risk_week.RData"))

rm(D4_persontime_risk_week)

load(paste0(diroutput,"D4_persontime_benefit_week.RData"))

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

D4_persontime_benefit_week <- rbind(D4_persontime_benefit_week, all_ages)

save(D4_persontime_benefit_week,file=paste0(diroutput,"D4_persontime_benefit_week.RData"))

rm(D4_persontime_benefit_week)

load(paste0(diroutput,"D4_persontime_risk_year.RData"))

D4_persontime_risk_year <- D4_persontime_risk_year[, year := NULL]
cols_to_sums = names(D4_persontime_risk_year)[6:length(D4_persontime_risk_year)]

all_sex <- copy(D4_persontime_risk_year)[, lapply(.SD, sum, na.rm=TRUE),
                                            by = c("Birthcohort_persons", "Dose", "type_vax", "fup"),
                                            .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_risk_year <- rbind(D4_persontime_risk_year, all_sex)

all_ages <- copy(D4_persontime_risk_year)[, lapply(.SD, sum, na.rm=TRUE),
                                             by = c("sex", "Dose", "type_vax", "fup"),
                                             .SDcols = cols_to_sums]
all_ages <- unique(all_ages[, Birthcohort_persons := "all_birth_cohorts"])

D4_persontime_risk_year <- rbind(D4_persontime_risk_year, all_ages)

save(D4_persontime_risk_year,file=paste0(diroutput,"D4_persontime_risk_year.RData"))

rm(D4_persontime_risk_year)

load(paste0(diroutput,"D4_persontime_benefit_year.RData"))

D4_persontime_benefit_year <- D4_persontime_benefit_year[, year := NULL]
cols_to_sums = names(D4_persontime_benefit_year)[6:length(D4_persontime_benefit_year)]

all_sex <- copy(D4_persontime_benefit_year)[, lapply(.SD, sum, na.rm=TRUE),
                                         by = c("Birthcohort_persons", "Dose", "type_vax", "fup"),
                                         .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]

D4_persontime_benefit_year <- rbind(D4_persontime_benefit_year, all_sex)

all_ages <- copy(D4_persontime_benefit_year)[, lapply(.SD, sum, na.rm=TRUE),
                                          by = c("sex", "Dose", "type_vax", "fup"),
                                          .SDcols = cols_to_sums]
all_ages <- unique(all_ages[, Birthcohort_persons := "all_birth_cohorts"])

D4_persontime_benefit_year <- rbind(D4_persontime_benefit_year, all_ages)

save(D4_persontime_benefit_year,file=paste0(diroutput,"D4_persontime_benefit_year.RData"))

rm(D4_persontime_benefit_year)