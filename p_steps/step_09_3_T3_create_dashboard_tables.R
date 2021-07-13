load(paste0(dirtemp, "D3_vaxweeks.RData"))
load(paste0(dirtemp, "D3_Vaccin_cohort.RData"))
load(paste0(dirtemp, "D3_study_population.RData"))
load(paste0(dirtemp,"list_outcomes_observed.RData"))
load(paste0(diroutput, "D4_doses_weeks.RData"))

# Birth Cohort ----------------------------------------------------------------------------------------------------

cohort_to_doses_weeks <- D3_Vaccin_cohort[, .(person_id, sex, type_vax_1, type_vax_2, date_of_birth)]

all_mondays <- seq.Date(as.Date("19000101","%Y%m%d"), study_end, by = "week")

monday_week <- seq.Date(from = find_last_monday(study_start, all_mondays), to = find_last_monday(study_end, all_mondays),
                        by = "week")
double_weeks <- data.table(weeks_to_join = monday_week, monday_week = monday_week)
all_days_df <- data.table(all_days = seq.Date(from = find_last_monday(study_start, monday_week), to = study_end, by = "days"))
all_days_df <- merge(all_days_df, double_weeks, by.x = "all_days", by.y = "weeks_to_join", all.x = T)
all_days_df <- all_days_df[, monday_week := nafill(monday_week, type="locf")]
all_days_df <- all_days_df[all_days >= study_start,]

D3_vaxweeks <- D3_vaxweeks[week == 0]
D3_vaxweeks <- merge(D3_vaxweeks, all_days_df, by.x = "start_date_of_period", by.y = "all_days", all.x = T)

vaxweeks_to_dos_bir_cor_base <- merge(D3_vaxweeks, cohort_to_doses_weeks, by = "person_id")
vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor_base[, Birthcohort_persons := findInterval(year(date_of_birth),
                                                                                              c(1940, 1950, 1960, 1970, 1980, 1990))]
vaxweeks_to_dos_bir_cor$Birthcohort_persons <- as.character(vaxweeks_to_dos_bir_cor$Birthcohort_persons)
vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor[.(Birthcohort_persons = c("0", "1", "2", "3", "4", "5", "6"),
                                                     to = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
                                                            "1980-1989", "1990+")),
                                                   on = "Birthcohort_persons", Birthcohort_persons := i.to]

vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor[, vx_manufacturer := fifelse(Dose == 1, type_vax_1, type_vax_2)]
vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor[, Datasource := thisdatasource]

vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor[, .(Datasource, monday_week, vx_manufacturer, Dose, Birthcohort_persons)]

setnames(vaxweeks_to_dos_bir_cor, c("Datasource", "monday_week", "Dose", "Birthcohort_persons"),
         c("datasource", "week", "dose", "birth_cohort"))

vaxweeks_to_dos_bir_cor <- vaxweeks_to_dos_bir_cor[, .(N = .N), by = c("datasource", "week", "vx_manufacturer", "dose", "birth_cohort")]

all_ages <- copy(vaxweeks_to_dos_bir_cor)[, N := sum(N), by = c("datasource", "week", "vx_manufacturer", "dose")]
all_ages <- unique(all_ages[, birth_cohort:="all_birth_cohorts"][, c("datasource", "week", "vx_manufacturer", "dose", "birth_cohort", "N")])

vaxweeks_to_dos_bir_cor <- rbind(vaxweeks_to_dos_bir_cor, all_ages)

older60 <- copy(vaxweeks_to_dos_bir_cor)[birth_cohort %in% c("<1940", "1940-1949", "1950-1959"),
                                         lapply(.SD, sum, na.rm=TRUE),
                                         by = c("datasource", "week", "vx_manufacturer", "dose"),
                                         .SDcols = "N"]
older60 <- unique(older60[, birth_cohort := "<1960"])
vaxweeks_to_dos_bir_cor <- rbind(vaxweeks_to_dos_bir_cor, older60)

complete_df <- expand.grid(datasource = thisdatasource, week = monday_week, vx_manufacturer = c("Moderna", "Pfizer", "AstraZeneca", "J&J", "UKN"),
                           dose = c("1", "2"), birth_cohort = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
                                                                "1980-1989", "1990+", "all_birth_cohorts", "<1960"))

vaxweeks_to_dos_bir_cor <- merge(vaxweeks_to_dos_bir_cor, complete_df, all.y = T, by = c("datasource", "week", "vx_manufacturer", "dose", "birth_cohort"))
DOSES_BIRTHCOHORTS <- vaxweeks_to_dos_bir_cor[is.na(N), N := 0][, week := format(week, "%Y%m%d")]

vect_recode_birthcohort <- c("<1940" = "80+", "1940-1949" = "70-79", "1950-1959" = "60-69", "1960-1969" = "50-59",
                             "1970-1979" = "40-49", "1980-1989" = "30-39", "1990+" = "<30",
                             "all_birth_cohorts" = "all_birth_cohorts", "<1960" = "60+")
DOSES_BIRTHCOHORTS <- DOSES_BIRTHCOHORTS[, ageband := vect_recode_birthcohort[birth_cohort]]

fwrite(DOSES_BIRTHCOHORTS, file = paste0(dirdashboard, "DOSES_BIRTHCOHORTS.csv"))
# 
# tot_pop_cohorts <- D3_study_population[, birth_cohort := findInterval(year(date_of_birth), c(1940, 1950, 1960, 1970, 1980, 1990))]
# tot_pop_cohorts$birth_cohort <- as.character(tot_pop_cohorts$birth_cohort)
# tot_pop_cohorts <- tot_pop_cohorts[.(birth_cohort = c("0", "1", "2", "3", "4", "5", "6"),
#                                      to = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
#                                             "1980-1989", "1990+")),
#                                    on = "birth_cohort", birth_cohort := i.to]
# tot_pop_cohorts <- tot_pop_cohorts[, .(pop_cohorts = .N), by = c("birth_cohort")]
# all_pop <- unique(copy(tot_pop_cohorts)[, pop_cohorts := sum(pop_cohorts)][, birth_cohort := "all_birth_cohorts"])
# tot_pop_cohorts <- rbind(tot_pop_cohorts, all_pop)
# older60 <- copy(tot_pop_cohorts)[birth_cohort %in% c("<1940", "1940-1949", "1950-1959"), sum(pop_cohorts)]
# older60 <- data.table::data.table(birth_cohort = "<1960", pop_cohorts = older60)
# tot_pop_cohorts <- rbind(tot_pop_cohorts, older60)


tot_pop_cohorts <- unique(D4_doses_weeks[, .(week = format(Week_number, "%Y%m%d"), birth_cohort = Birthcohort_persons,
                                             Persons_in_week)])
all_pop <- copy(tot_pop_cohorts)[birth_cohort %in% c("<1940", "1940-1949", "1950-1959", "1960-1969",
                                                     "1970-1979", "1980-1989", "1990+"),
                                 .(Persons_in_week = sum(Persons_in_week)), by = "week"][, birth_cohort := "all_birth_cohorts"]
tot_pop_cohorts <- rbind(tot_pop_cohorts, all_pop)


COVERAGE_BIRTHCOHORTS <- merge(DOSES_BIRTHCOHORTS, tot_pop_cohorts, by = c("week", "birth_cohort"), all.x = T)
setorder(COVERAGE_BIRTHCOHORTS, week)

COVERAGE_BIRTHCOHORTS <- COVERAGE_BIRTHCOHORTS[, cum_N := cumsum(N), by = c("datasource", "vx_manufacturer", "dose", "birth_cohort")]
COVERAGE_BIRTHCOHORTS <- COVERAGE_BIRTHCOHORTS[, percentage := round(cum_N / Persons_in_week  * 100, 3)]
COVERAGE_BIRTHCOHORTS <- COVERAGE_BIRTHCOHORTS[, .(datasource, week, vx_manufacturer, dose, birth_cohort, percentage)]

COVERAGE_BIRTHCOHORTS <- COVERAGE_BIRTHCOHORTS[, ageband := vect_recode_birthcohort[birth_cohort]]

fwrite(COVERAGE_BIRTHCOHORTS, file = paste0(dirdashboard, "COVERAGE_BIRTHCOHORTS.csv"))



# Risk Factors ----------------------------------------------------------------------------------------------------

load(paste0(diroutput, "D3_study_population_cov_ALL.RData"))

setnames(D3_study_population_cov_ALL,
         c("CV_either_DX_or_DP", "COVCANCER_either_DX_or_DP", "COVCOPD_either_DX_or_DP", "COVHIV_either_DX_or_DP",
           "COVCKD_either_DX_or_DP", "COVDIAB_either_DX_or_DP", "COVOBES_either_DX_or_DP", "COVSICKLE_either_DX_or_DP",
           "IMMUNOSUPPR_at_study_entry", "all_covariates_non_CONTR"),
         c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR",
           "any_risk_factors"))

D3_study_population_cov_ALL <- D3_study_population_cov_ALL[, .(person_id, CV, COVCANCER, COVCOPD, COVHIV, COVCKD,
                                                               COVDIAB, COVOBES, COVSICKLE, IMMUNOSUPPR, any_risk_factors)]

D3_study_population_cov_ALL <- melt(D3_study_population_cov_ALL,
                                    measure.vars = c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB",
                                                     "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
                                    variable.name = "riskfactor", value.name = "to_drop")

D3_study_population_cov_ALL <- D3_study_population_cov_ALL[to_drop == 1, ]
vaxweeks_to_dos_risk <- merge(vaxweeks_to_dos_bir_cor_base, D3_study_population_cov_ALL, by = "person_id")

vaxweeks_to_dos_risk <- vaxweeks_to_dos_risk[, vx_manufacturer := fifelse(Dose == 1, type_vax_1, type_vax_2)]
vaxweeks_to_dos_risk <- vaxweeks_to_dos_risk[, Datasource := thisdatasource]

vaxweeks_to_dos_risk <- vaxweeks_to_dos_risk[, .(Datasource, monday_week, vx_manufacturer, Dose, riskfactor)]

setnames(vaxweeks_to_dos_risk, c("Datasource", "monday_week", "Dose"), c("datasource", "week", "dose"))

vaxweeks_to_dos_risk <- vaxweeks_to_dos_risk[, .(N = .N), by = c("datasource", "week", "vx_manufacturer",
                                                                 "dose", "riskfactor")]

complete_df <- expand.grid(datasource = thisdatasource, week = monday_week, vx_manufacturer = c("Moderna", "Pfizer", "AstraZeneca", "J&J", "UKN"),
                           dose = c("1", "2"), riskfactor = c("CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD", "COVDIAB",
                                                              "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"))

vaxweeks_to_dos_risk <- merge(vaxweeks_to_dos_risk, complete_df, all.y = T, by = c("datasource", "week", "vx_manufacturer", "dose", "riskfactor"))
DOSES_RISKFACTORS <- vaxweeks_to_dos_risk[is.na(N), N := 0][, week := format(week, "%Y%m%d")]

fwrite(DOSES_RISKFACTORS, file = paste0(dirdashboard, "DOSES_RISKFACTORS.csv"))

tot_pop_cohorts <- D3_study_population_cov_ALL[, .(pop_cohorts = .N), by = c("riskfactor")]
COVERAGE_RISKFACTORS <- merge(DOSES_RISKFACTORS, tot_pop_cohorts, by = "riskfactor", all.x = T)
setorder(COVERAGE_RISKFACTORS, week)

COVERAGE_RISKFACTORS <- COVERAGE_RISKFACTORS[, cum_N := cumsum(N), by = c("datasource", "vx_manufacturer", "dose", "riskfactor")]
COVERAGE_RISKFACTORS <- COVERAGE_RISKFACTORS[, percentage := round(cum_N / pop_cohorts * 100, 3)]
COVERAGE_RISKFACTORS <- COVERAGE_RISKFACTORS[, .(datasource, week, vx_manufacturer, dose, riskfactor, percentage)]

fwrite(COVERAGE_RISKFACTORS, file = paste0(dirdashboard, "COVERAGE_RISKFACTORS.csv"))

rm(D3_vaxweeks, cohort_to_doses_weeks, all_mondays, monday_week, double_weeks, all_days_df, vaxweeks_to_dos_bir_cor,
   all_ages, complete_df, DOSES_BIRTHCOHORTS, D3_study_population, tot_pop_cohorts, all_pop, COVERAGE_BIRTHCOHORTS,
   D3_Vaccin_cohort, D3_study_population_cov_ALL, vaxweeks_to_dos_bir_cor_base, vaxweeks_to_dos_risk, DOSES_RISKFACTORS,
   COVERAGE_RISKFACTORS)



# Benefit ------------------------------------------------------------------------------------------------------------

D4_IR_benefit_week <- fread(paste0(direxp,"D4_IR_benefit_week_BC.csv"))
BBC <- D4_IR_benefit_week[, Dose := as.character(Dose)][Birthcohort_persons != ">1960", ]
BBC <- BBC[Dose == 0, c("Dose", "type_vax") := list("no_dose", "none")]
colA = paste("COVID_L", 1:5, "plus_b", sep = "")
colB = paste("IR_COVID_L", 1:5, "plus", sep = "")
colC = paste("lb_COVID_L", 1:5, "plus", sep = "")
colD = paste("ub_COVID_L", 1:5, "plus", sep = "")

BBC <- correct_col_type(BBC)

BBC <- data.table::melt(BBC, measure = list(colA, colB, colC, colD), variable.name = "COVID",
                        value.name = c("Numerator", "IR", "lb", "ub"), na.rm = F)

BBC <- BBC[is.na(ub), ub := 0]
setnames(BBC, c("Birthcohort_persons", "Dose", "type_vax"), c("birth_cohort", "dose", "vx_manufacturer"))
BBC <- BBC[, datasource := thisdatasource][sex == "both_sexes", ][, week := format(week, "%Y%m%d")]
BBC <- BBC[, .(datasource, week, vx_manufacturer, dose, birth_cohort, COVID, Numerator, IR, lb, ub)]
vect_recode_COVID <- c("1" = "L1", "2" = "L2", "3" = "L3", "4" = "L4", "5" = "L5")
BBC <- BBC[ , COVID := vect_recode_COVID[COVID]]
BBC <- BBC[, ageband := vect_recode_birthcohort[birth_cohort]]

fwrite(BBC, file = paste0(dirdashboard, "BENEFIT_BIRTHCOHORTS_CALENDARTIME.csv"))
rm(BBC, D4_IR_benefit_week)


D4_IR_benefit_fup <- fread(paste0(direxp,"D4_IR_benefit_fup_BC.csv"))
BBT <- D4_IR_benefit_fup[, Dose := as.character(Dose)][Birthcohort_persons != ">1960", ]
BBT <- BBT[Dose == 0, c("Dose", "type_vax") := list("no_dose", "none")]
colA = paste("COVID_L", 1:5, "plus_b", sep = "")
colB = paste("IR_COVID_L", 1:5, "plus", sep = "")
colC = paste("lb_COVID_L", 1:5, "plus", sep = "")
colD = paste("ub_COVID_L", 1:5, "plus", sep = "")

BBT <- correct_col_type(BBT)

BBT <- data.table::melt(BBT, measure = list(colA, colB, colC, colD), variable.name = "COVID",
                        value.name = c("Numerator", "IR", "lb", "ub"), na.rm = F)

BBT <- BBT[is.na(ub), ub := 0]
setnames(BBT, c("Birthcohort_persons", "Dose", "type_vax"), c("birth_cohort", "dose", "vx_manufacturer"))
BBT <- BBT[, datasource := thisdatasource][sex == "both_sexes", ]
BBT <- BBT[, .(datasource, week_fup, vx_manufacturer, dose, birth_cohort, COVID, Numerator, IR, lb, ub)]
setnames(BBT, c("week_fup"), c("week_since_vaccination"))
vect_recode_COVID <- c("1" = "L1", "2" = "L2", "3" = "L3", "4" = "L4", "5" = "L5")
BBT <- BBT[ , COVID := vect_recode_COVID[COVID]]
BBT <- BBT[, ageband := vect_recode_birthcohort[birth_cohort]]

fwrite(BBT, file = paste0(dirdashboard, "BENEFIT_BIRTHCOHORTS_TIMESINCEVACCINATION.csv"))
rm(BBT, D4_IR_benefit_fup)


D4_IR_benefit_week <- fread(paste0(direxp,"D4_IR_benefit_week_RF.csv"))
BRC <- D4_IR_benefit_week[, Dose := as.character(Dose)]
BRC <- BRC[Dose == 0, c("Dose", "type_vax") := list("no_dose", "none")]
colA = paste("COVID_L", 1:5, "plus_b", sep = "")
colB = paste("IR_COVID_L", 1:5, "plus", sep = "")
colC = paste("lb_COVID_L", 1:5, "plus", sep = "")
colD = paste("ub_COVID_L", 1:5, "plus", sep = "")

BRC <- correct_col_type(BRC)

BRC <- data.table::melt(BRC, measure = list(colA, colB, colC, colD), variable.name = "COVID",
                        value.name = c("Numerator", "IR", "lb", "ub"), na.rm = F)

BRC <- BRC[is.na(ub), ub := 0]
setnames(BRC, c("Dose", "type_vax"), c("dose", "vx_manufacturer"))
BRC <- BRC[, datasource := thisdatasource][sex == "both_sexes", ][, week := format(week, "%Y%m%d")]
BRC <- BRC[, .(datasource, week, vx_manufacturer, dose, riskfactor, COVID, Numerator, IR, lb, ub)]
vect_recode_COVID <- c("1" = "L1", "2" = "L2", "3" = "L3", "4" = "L4", "5" = "L5")
BRC <- BRC[ , COVID := vect_recode_COVID[COVID]]

fwrite(BRC, file = paste0(dirdashboard, "BENEFIT_RISKFACTORS_CALENDARTIME.csv"))
rm(BRC, D4_IR_benefit_week)


D4_IR_benefit_fup <- fread(paste0(direxp,"D4_IR_benefit_fup_RF.csv"))
BRT <- D4_IR_benefit_fup[, Dose := as.character(Dose)]
BRT <- BRT[Dose == 0, c("Dose", "type_vax") := list("no_dose", "none")]
colA = paste("COVID_L", 1:5, "plus_b", sep = "")
colB = paste("IR_COVID_L", 1:5, "plus", sep = "")
colC = paste("lb_COVID_L", 1:5, "plus", sep = "")
colD = paste("ub_COVID_L", 1:5, "plus", sep = "")

BRT <- correct_col_type(BRT)

BRT <- data.table::melt(BRT, measure = list(colA, colB, colC, colD), variable.name = "COVID",
                        value.name = c("Numerator", "IR", "lb", "ub"), na.rm = F)

BRT <- BRT[is.na(ub), ub := 0]
setnames(BRT, c("Dose", "type_vax"), c("dose", "vx_manufacturer"))
BRT <- BRT[, datasource := thisdatasource][sex == "both_sexes", ]
BRT <- BRT[, .(datasource, week_fup, vx_manufacturer, dose, riskfactor, COVID, Numerator, IR, lb, ub)]
setnames(BRT, c("week_fup"), c("week_since_vaccination"))
vect_recode_COVID <- c("1" = "L1", "2" = "L2", "3" = "L3", "4" = "L4", "5" = "L5")
BRT <- BRT[ , COVID := vect_recode_COVID[COVID]]

fwrite(BRT, file = paste0(dirdashboard, "BENEFIT_RISKFACTORS_TIMESINCEVACCINATION.csv"))
rm(BRT, vect_recode_COVID, D4_IR_benefit_fup)




# Risk ------------------------------------------------------------------------------------------------------------

D4_IR_risk_week <- fread(paste0(direxp,"D4_IR_risk_week_BC.csv"))
RBC <- D4_IR_risk_week[, Dose := as.character(Dose)]
RBC <- RBC[Dose == 0, c("Dose", "type_vax") := list("no_dose", "none")]
list_risk <- list_outcomes_observed
colA = paste0(list_risk, "_b")
colB = paste0("IR_", list_risk)
colC = paste0("lb_", list_risk)
colD = paste0("ub_", list_risk)

RBC <- correct_col_type(RBC)

RBC <- data.table::melt(RBC, measure = list(colA, colB, colC, colD), variable.name = "AESI",
                        value.name = c("Numerator", "IR", "lb", "ub"), na.rm = F)

setnames(RBC, c("Birthcohort_persons", "Dose", "type_vax"), c("birth_cohort", "dose", "vx_manufacturer"))
RBC <- RBC[, datasource := thisdatasource][sex == "both_sexes", ][, week := format(week, "%Y%m%d")]
RBC <- RBC[, .(datasource, week, vx_manufacturer, dose, birth_cohort, AESI, Numerator, IR, lb, ub)]
vect_recode_AESI <- list_risk
names(vect_recode_AESI) <- c(as.character(seq_len(length(list_risk))))
RBC <- RBC[ , AESI := vect_recode_AESI[AESI]]
RBC <- RBC[, ageband := vect_recode_birthcohort[birth_cohort]]

fwrite(RBC, file = paste0(dirdashboard, "RISK_BIRTHCOHORTS_CALENDARTIME.csv"))
rm(RBC, D4_IR_risk_week)


D4_IR_risk_fup <- fread(paste0(direxp,"D4_IR_risk_fup_BC.csv"))
RBT <- D4_IR_risk_fup[, Dose := as.character(Dose)]
RBT <- RBT[Dose == 0, c("Dose", "type_vax") := list("no_dose", "none")]
list_risk <- list_outcomes_observed

colA = paste0(list_risk, "_b")
colB = paste0("IR_", list_risk)
colC = paste0("lb_", list_risk)
colD = paste0("ub_", list_risk)

RBT <- correct_col_type(RBT)

RBT <- data.table::melt(RBT, measure = list(colA, colB, colC, colD), variable.name = "AESI",
                        value.name = c("Numerator", "IR", "lb", "ub"), na.rm = F)

RBT <- RBT[is.na(ub), ub := 0]
setnames(RBT, c("Birthcohort_persons", "Dose", "type_vax"), c("birth_cohort", "dose", "vx_manufacturer"))
RBT <- RBT[, datasource := thisdatasource][sex == "both_sexes", ]
RBT <- RBT[, .(datasource, week_fup, vx_manufacturer, dose, birth_cohort, AESI, Numerator, IR, lb, ub)]
setnames(RBT, c("week_fup"), c("week_since_vaccination"))
vect_recode_AESI <- list_risk
names(vect_recode_AESI) <- c(as.character(seq_len(length(list_risk))))
RBT <- RBT[ , AESI := vect_recode_AESI[AESI]]
RBT <- RBT[, ageband := vect_recode_birthcohort[birth_cohort]]

fwrite(RBT, file = paste0(dirdashboard, "RISK_BIRTHCOHORTS_TIMESINCEVACCINATION.csv"))
rm(RBT, D4_IR_risk_fup)


D4_IR_risk_week <- fread(paste0(direxp,"D4_IR_risk_week_RF.csv"))
RRC <- D4_IR_risk_week[, Dose := as.character(Dose)]
RRC <- RRC[Dose == 0, c("Dose", "type_vax") := list("no_dose", "none")]
list_risk <- list_outcomes_observed

colA = paste0(list_risk, "_b")
colB = paste0("IR_", list_risk)
colC = paste0("lb_", list_risk)
colD = paste0("ub_", list_risk)

RRC <- correct_col_type(RRC)

RRC <- data.table::melt(RRC, measure = list(colA, colB, colC, colD), variable.name = "AESI",
                        value.name = c("Numerator", "IR", "lb", "ub"), na.rm = F)

setnames(RRC, c("Dose", "type_vax"), c("dose", "vx_manufacturer"))
RRC <- RRC[, datasource := thisdatasource][sex == "both_sexes", ][, week := format(week, "%Y%m%d")]
RRC <- RRC[, .(datasource, week, vx_manufacturer, dose, riskfactor, AESI, Numerator, IR, lb, ub)]
vect_recode_AESI <- list_risk
names(vect_recode_AESI) <- c(as.character(seq_len(length(list_risk))))
RRC <- RRC[ , AESI := vect_recode_AESI[AESI]]

fwrite(RRC, file = paste0(dirdashboard, "RISK_RISKFACTORS_CALENDARTIME.csv"))
rm(RRC, D4_IR_risk_week)


D4_IR_risk_fup <- fread(paste0(direxp,"D4_IR_risk_fup_RF.csv"))
RRT <- D4_IR_risk_fup[, Dose := as.character(Dose)]
RRT <- RRT[Dose == 0, c("Dose", "type_vax") := list("no_dose", "none")]
list_risk <- list_outcomes_observed

colA = paste0(list_risk, "_b")
colB = paste0("IR_", list_risk)
colC = paste0("lb_", list_risk)
colD = paste0("ub_", list_risk)

RRT <- correct_col_type(RRT)

RRT <- data.table::melt(RRT, measure = list(colA, colB, colC, colD), variable.name = "AESI",
                        value.name = c("Numerator", "IR", "lb", "ub"), na.rm = F)

RRT <- RRT[is.na(ub), ub := 0]
setnames(RRT, c("Dose", "type_vax"), c("dose", "vx_manufacturer"))
RRT <- RRT[, datasource := thisdatasource][sex == "both_sexes", ]
RRT <- RRT[, .(datasource, week_fup, vx_manufacturer, dose, riskfactor, AESI, Numerator, IR, lb, ub)]
setnames(RRT, c("week_fup"), c("week_since_vaccination"))
vect_recode_AESI <- list_risk
names(vect_recode_AESI) <- c(as.character(seq_len(length(list_risk))))
RRT <- RRT[ , AESI := vect_recode_AESI[AESI]]

fwrite(RRT, file = paste0(dirdashboard, "RISK_RISKFACTORS_TIMESINCEVACCINATION.csv"))
rm(RRT, vect_recode_AESI, D4_IR_risk_fup)
