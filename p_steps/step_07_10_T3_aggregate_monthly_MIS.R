load(paste0(diroutput,"D4_persontime_monthly_b.RData"))

cols_to_sums = names(D4_persontime_monthly_b)[4:length(D4_persontime_monthly_b)]
setnames(D4_persontime_monthly_b, "agebands_at_1_jan_2021", "Ageband")

D4_persontime_monthly_b[, c("year", "month") := tstrsplit(month, "-")]
D4_persontime_monthly_b[, month := month.name[as.integer(month)]]

all_sex <- copy(D4_persontime_monthly_b)[, lapply(.SD, sum), by = c("Ageband", "month", "year"),
                                          .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]
D4_persontime_monthly_b <- rbind(D4_persontime_monthly_b, all_sex)

all_year <- copy(D4_persontime_monthly_b)[, lapply(.SD, sum), by = c("sex", "Ageband", "year"),
                                           .SDcols = cols_to_sums]
all_year <- all_year[, month := "all_months"]
D4_persontime_monthly_b <- rbind(D4_persontime_monthly_b, all_year)

all_ages <- copy(D4_persontime_monthly_b)[, lapply(.SD, sum), by = c("sex", "month", "year"),
                                           .SDcols = cols_to_sums]
all_ages <- unique(all_ages[, Ageband := "all_birth_cohorts"])
D4_persontime_monthly_b_BC <- rbind(D4_persontime_monthly_b, all_ages)

save(D4_persontime_monthly_b_BC,file=paste0(diroutput,"D4_persontime_monthly_b_BC.RData"))
rm(D4_persontime_monthly_b, D4_persontime_monthly_b_BC)




load(paste0(diroutput,"D4_persontime_monthly_c.RData"))

cols_to_sums = names(D4_persontime_monthly_c)[4:length(D4_persontime_monthly_c)]
setnames(D4_persontime_monthly_c, "agebands_at_1_jan_2021", "Ageband")

D4_persontime_monthly_c[, c("year", "month") := tstrsplit(month, "-")]
D4_persontime_monthly_c[, month := month.name[as.integer(month)]]

all_sex <- copy(D4_persontime_monthly_c)[, lapply(.SD, sum), by = c("Ageband", "month", "year"),
                                         .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]
D4_persontime_monthly_c <- rbind(D4_persontime_monthly_c, all_sex)

all_year <- copy(D4_persontime_monthly_c)[, lapply(.SD, sum), by = c("sex", "Ageband", "year"),
                                          .SDcols = cols_to_sums]
all_year <- all_year[, month := "all_months"]
D4_persontime_monthly_c <- rbind(D4_persontime_monthly_c, all_year)

all_ages <- copy(D4_persontime_monthly_c)[, lapply(.SD, sum), by = c("sex", "month", "year"),
                                          .SDcols = cols_to_sums]
all_ages <- unique(all_ages[, Ageband := "all_birth_cohorts"])
D4_persontime_monthly_c_BC <- rbind(D4_persontime_monthly_c, all_ages)

save(D4_persontime_monthly_c_BC,file=paste0(diroutput,"D4_persontime_monthly_c_BC.RData"))
rm(D4_persontime_monthly_c, D4_persontime_monthly_c_BC)




load(paste0(diroutput,"D4_persontime_monthly_d.RData"))

cols_to_sums = names(D4_persontime_monthly_d)[6:length(D4_persontime_monthly_d)]
setnames(D4_persontime_monthly_d, "agebands_at_1_jan_2021", "Ageband")

D4_persontime_monthly_d[, c("year", "month") := tstrsplit(month, "-")]
D4_persontime_monthly_d[, month := month.name[as.integer(month)]]

all_sex <- copy(D4_persontime_monthly_d)[, lapply(.SD, sum), by = c("Ageband", "month", "year", "type_vax_1", "history_covid"),
                                         .SDcols = cols_to_sums]
all_sex <- all_sex[, sex := "both_sexes"]
D4_persontime_monthly_d <- rbind(D4_persontime_monthly_d, all_sex)

all_year <- copy(D4_persontime_monthly_d)[, lapply(.SD, sum), by = c("sex", "Ageband", "year", "type_vax_1", "history_covid"),
                                          .SDcols = cols_to_sums]
all_year <- all_year[, month := "all_months"]
D4_persontime_monthly_d <- rbind(D4_persontime_monthly_d, all_year)

all_ages <- copy(D4_persontime_monthly_d)[, lapply(.SD, sum), by = c("sex", "month", "year", "type_vax_1", "history_covid"),
                                          .SDcols = cols_to_sums]
all_ages <- unique(all_ages[, Ageband := "all_birth_cohorts"])
D4_persontime_monthly_d_BC <- rbind(D4_persontime_monthly_d, all_ages)

save(D4_persontime_monthly_d_BC,file=paste0(diroutput,"D4_persontime_monthly_d_BC.RData"))
rm(D4_persontime_monthly_d, D4_persontime_monthly_d_BC)
