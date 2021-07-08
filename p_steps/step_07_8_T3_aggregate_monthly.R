load(paste0(diroutput,"D4_persontime_risk_month.RData"))

cols_to_sums = names(D4_persontime_risk_month)[5:length(D4_persontime_risk_month)]
setnames(D4_persontime_risk_month, "age_at_1_jan_2021", "Ageband")

D4_persontime_risk_month[, c("year", "month") := tstrsplit(month, "-")]
D4_persontime_risk_month[, month := month.name[as.integer(month)]]

all_sex <- copy(D4_persontime_risk_month)[, lapply(.SD, sum), by = c("Ageband", "month", "year", "at_risk_at_study_entry"),
                                         .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]
D4_persontime_risk_month <- rbind(D4_persontime_risk_month, all_sex)

all_risk <- copy(D4_persontime_risk_month)[, lapply(.SD, sum), by = c("sex", "Ageband", "month", "year"),
                                          .SDcols = cols_to_sums]
all_risk <- all_risk[, at_risk_at_study_entry := "total"]
D4_persontime_risk_month <- rbind(D4_persontime_risk_month, all_risk)

all_year <- copy(D4_persontime_risk_month)[, lapply(.SD, sum), by = c("sex", "Ageband", "year", "at_risk_at_study_entry"),
                                          .SDcols = cols_to_sums]
all_year <- all_year[, month := "all_months"]
D4_persontime_risk_month <- rbind(D4_persontime_risk_month, all_year)

all_ages <- copy(D4_persontime_risk_month)[, lapply(.SD, sum), by = c("sex", "month", "year", "at_risk_at_study_entry"),
                                             .SDcols = cols_to_sums]
all_ages <- unique(all_ages[, Ageband := "all_birth_cohorts"])
D4_persontime_risk_month <- rbind(D4_persontime_risk_month, all_ages)

older60 <- copy(D4_persontime_risk_month)[Ageband %in% c(">80", "70-79", "60-69"), lapply(.SD, sum),
                                          by = c("sex", "month", "year", "at_risk_at_study_entry"), .SDcols = cols_to_sums]
older60 <- unique(older60[, Ageband := ">60"])
D4_persontime_risk_month_RFBC <- rbind(D4_persontime_risk_month, older60)

save(D4_persontime_risk_month_RFBC,file=paste0(diroutput,"D4_persontime_risk_month_RFBC.RData"))
rm(D4_persontime_risk_month, D4_persontime_risk_month_RFBC)
