load(paste0(diroutput,"D4_persontime_risk_month.RData"))

cols_to_sums = names(D4_persontime_risk_month)[4:length(D4_persontime_risk_month)]
setnames(D4_persontime_risk_month, "age_at_1_jan_2021", "Ageband")

D4_persontime_risk_month[, c("year", "month") := tstrsplit(month, "-")]
D4_persontime_risk_month[, month := month.name[as.integer(month)]]

all_sex <- copy(D4_persontime_risk_month)[, lapply(.SD, sum), by = c("Ageband", "month", "year"),
                                         .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]
D4_persontime_risk_month <- rbind(D4_persontime_risk_month, all_sex)

all_ages <- copy(D4_persontime_risk_month)[, lapply(.SD, sum), by = c("sex", "month", "year"),
                                             .SDcols = cols_to_sums]
all_ages <- unique(all_ages[, Ageband := "all_birth_cohorts"])
D4_persontime_risk_month <- rbind(D4_persontime_risk_month, all_ages)

older60 <- copy(D4_persontime_risk_month)[Ageband %in% c(">80", "70-79", "60-69"), lapply(.SD, sum),
                                            by = c("sex", "Ageband", "month", "year"), .SDcols = cols_to_sums]
older60 <- unique(older60[, Ageband := ">60"])
D4_persontime_risk_month_RFBC <- rbind(D4_persontime_risk_month, older60)

save(D4_persontime_risk_month_RFBC,file=paste0(diroutput,"D4_persontime_risk_month_RFBC.RData"))
rm(D4_persontime_risk_month, D4_persontime_risk_month_RFBC)