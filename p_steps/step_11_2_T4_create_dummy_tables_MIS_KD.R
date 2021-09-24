`%not in%` <- negate(`%in%`)

# Table1 ----------------------------------------------------------------------------------------------------------
create_empty_table_1a <- function() {
  n6 <- numeric(6)
  row_names_1 <- c("Start population", "A_sex_or_birth_date_missing", "C_no_observation_period",
                   "D_death_before_study_entry", "E_no_observation_period_including_study_start", "end population")
  if (length(intersect(names(flow_source_1a), c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP"))) == 1) {
    ext = data.table(a = row_names_1, datasource = n6)
    setnames(ext, "datasource", vect_recode_manufacturer[thisdatasource])
    return(ext)
  }
  return(data.table(a = row_names_1, Italy_ARS = n6, NL_PHARMO = n6, UK_CPRD = n6, ES_BIFAP = n6))
}

create_empty_table_1b <- function() {
  n4 <- numeric(4)
  row_names_2 <- c("Source population present at January 1st 2020", "Subjects without valid birth date",
                   "Subjects without one year of look back at 1/1/2020", "Study population")
  if (length(intersect(names(flow_source_1a), c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP"))) == 1) {
    ext = data.table(a = row_names_2, datasource = n4)
    setnames(ext, "datasource", vect_recode_manufacturer[thisdatasource])
    return(ext)
  }
  return(data.table(a = row_names_2, Italy_ARS = n4, NL_PHARMO = n4, UK_CPRD = n4, ES_BIFAP = n4))
}

flow_source <- fread(paste0(direxp, "Flowchart_basic_exclusion_criteria.csv"))
flow_study <- fread(paste0(direxp, "Flowchart_exclusion_criteria.csv"))

vect_recode_manufacturer <- c(TEST = "Italy_ARS", ARS = "Italy_ARS", PHARMO = "NL_PHARMO",
                              CPRD = "UK_CPRD", BIFAP = "ES_BIFAP")

if ("datasource" %not in% names(flow_source)) {
  flow_source <- flow_source[ , Datasource := thisdatasource]
  flow_study <- flow_study[ , Datasource := thisdatasource]
} else {
  setnames(flow_source, "datasource", "Datasource")
  setnames(flow_source, "datasource", "Datasource")
}

flow_source <- flow_source[ , Datasource := vect_recode_manufacturer[Datasource]]
flow_study <- flow_study[ , Datasource := vect_recode_manufacturer[Datasource]]

flow_source_totals <- unique(data.table::copy(flow_source)[, TOTAL := sum(N), by = "Datasource"][, .(Datasource, TOTAL)])
flow_source_totals <- flow_source_totals[, a := "Start population"]
flow_source_totals <- data.table::dcast(flow_source_totals, a ~ Datasource, value.var = c("TOTAL"))

flow_source <- flow_source[, row_id := rowid(Datasource)]
flow_source <- data.table::melt(flow_source, id.vars = c("row_id", "Datasource", "N"),
                                measure.vars = c("A_sex_or_birth_date_missing", "B_birth_date_absurd",
                                                 "C_no_observation_period", "D_death_before_study_entry",
                                                 "E_no_observation_period_including_study_start"), variable.name = "a")

flow_source <- flow_source[, .SD[which.min(value)], by = c("row_id", "Datasource", "N")][value == 0, ][, .(Datasource, N, a)]
flow_source <- data.table::dcast(flow_source, a ~ Datasource, value.var = c("N"))
flow_source_1a <- flow_source[a != "B_birth_date_absurd", ]
flow_source_1a <- rbind(flow_source_1a, flow_source_totals)
empty_table_1 <- create_empty_table_1a()
flow_source_1a <- rbind(empty_table_1, flow_source_1a, fill = T)
flow_source_1a <- flow_source_1a[, lapply(.SD, max, na.rm = T), by = a]

max_col <- length(names(empty_table_1))
correct_col_names <- names(empty_table_1)[2:max_col]
correct_row_names <- empty_table_1$a[2:5]
table_1a <- flow_source_1a[a == "end population",
                           (correct_col_names) := flow_source_1a[a == "Start population", 2:max_col] -
                             colSums(flow_source_1a[a %in% correct_row_names, 2:max_col])]


flow_source_1b <- flow_source[a == "B_birth_date_absurd", ]
flow_source_1b <- flow_source_1b[a == "B_birth_date_absurd", a := "Subjects without valid birth date"]
flow_source_1b <- rbind(flow_source_1b, table_1a[a == "end population", ][, a := "Source population present at January 1st 2020"])
flow_study <- flow_study[, row_id := rowid(Datasource)]
flow_study <- data.table::melt(flow_study, id.vars = c("row_id", "Datasource", "N"),
                               measure.vars = c("A_insufficient_run_in"), variable.name = "a")
flow_study <- flow_study[value == 0, a := "Subjects without one year of look back at 1/1/2020"]
flow_study <- flow_study[value == 1, a := "Study population"][, .(Datasource, N, a)]
flow_study <- data.table::dcast(flow_study, a ~ Datasource, value.var = c("N"))
flow_source_1b <- rbind(flow_source_1b, flow_study)
empty_table_2 <- create_empty_table_1b()
flow_source_1b <- rbind(empty_table_2, flow_source_1b, fill = T)
table_1b <- flow_source_1b[, lapply(.SD, max, na.rm = T), by = a]

setnames(table_1a, "a", " ")
setnames(table_1b, "a", " ")

fwrite(table_1b, file = paste0(dummytables_MIS, "Attrition diagram.csv"))




# Table2 ----------------------------------------------------------------------------------------------------------


ageband_studystart <- fread(paste0(dirD4tables, "D4_descriptive_dataset_ageband_studystart_MIS.csv"))

ageband_studystart[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                     BIFAP = "ES_BIFAP")[Datasource]]

ageband_studystart[, TOTAL := sum(AgeCat_011, AgeCat_1217, AgeCat_1819, AgeCat_2029, AgeCat_3039, AgeCat_4049,
                                  AgeCat_5059, AgeCat_6069, AgeCat_7079, get("AgeCat_80+")), by = Datasource]

total_pop <- ageband_studystart[, a := "Study population"][, Parameters := "N"][, .(a, Parameters, Datasource, TOTAL)]
total_pop <- dcast(total_pop, a + Parameters ~ Datasource, value.var = 'TOTAL')
col_to_keep <- intersect(c("a", "Parameters", "Italy_ARS", "NL_PHARMO",
                           "UK_CPRD", "ES_BIFAP", "Test"), names(total_pop))
total_pop <- total_pop[, ..col_to_keep]


age_studystart <- fread(paste0(dirD4tables, "D4_descriptive_dataset_age_studystart_MIS.csv"))

age_studystart[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                 BIFAP = "ES_BIFAP")[Datasource]]

pt_total <- age_studystart[, a := "Person years of follow-up"][, Parameters := "PY"][, .(a, Parameters, Datasource, Followup)]
pt_total <- dcast(pt_total, a + Parameters ~ Datasource, value.var = 'Followup')
pt_total <- pt_total[, ..col_to_keep]

age_start <- copy(age_studystart)[, a := "Age in years"][, Followup := NULL]
age_start <- melt(age_start, id.vars = c("a", "Datasource"),
                  measure.vars = c("Age_min", "Age_P25", "Age_P50", "Age_mean", "Age_p75", "Age_max"),
                  variable.name = "Parameters")
age_start <- dcast(age_start, a + Parameters  ~ Datasource, value.var = 'value')
age_start[, Parameters := c(Age_min = "Min", Age_P25 = "P25", Age_P50 = "P50", Age_mean = "Mean", Age_p75 = "P75",
                            Age_max = "Max")[Parameters]]
age_start <- age_start[, ..col_to_keep]


ageband_start <- ageband_studystart[, a := "Age in categories"][, TOTAL := NULL]
ageband_start <- melt(ageband_start, id.vars = c("a", "Datasource"),
                      measure.vars = c("AgeCat_011", "AgeCat_1217", "AgeCat_1819", "AgeCat_2029", "AgeCat_3039",
                                       "AgeCat_4049", "AgeCat_5059", "AgeCat_6069", "AgeCat_7079", "AgeCat_80+"),
                      variable.name = "Parameters")
ageband_start <- dcast(ageband_start, a + Parameters  ~ Datasource, value.var = 'value')
ageband_start[, Parameters := c(AgeCat_011 = "0-11", AgeCat_1217 = "12-17", AgeCat_0119 = "18-19", AgeCat_2029 = "20-29",
                                AgeCat_3039 = "30-39", AgeCat_4049 = "40-49", AgeCat_5059 = "50-59", AgeCat_6069 = "60-69",
                                AgeCat_7079 = "70-79", "Agecat_80+" = ">=80")[Parameters]]


followup_studystart <- fread(paste0(dirD4tables, "D4_followup_fromstudystart_MIS.csv"))
followup_studystart[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                      BIFAP = "ES_BIFAP")[Datasource]]
followup_studystart <- followup_studystart[, a := "Person years across age categories"]
followup_start <- followup_studystart[, .(a, Datasource, Followup_011, Followup_1217, Followup_1819, Followup_2029, Followup_3039, Followup_4049,
                                          Followup_5059, Followup_6069, Followup_7079, Followup_80)]

followup_start <- melt(followup_start, id.vars = c("a", "Datasource"),
                       measure.vars = c("Followup_011", "Followup_1217", "Followup_1819", "Followup_2029",
                                        "Followup_3039", "Followup_4049", "Followup_5059",
                                        "Followup_6069", "Followup_7079", "Followup_80"),
                       variable.name = "Parameters")
followup_start <- dcast(followup_start, a + Parameters  ~ Datasource, value.var = 'value')
followup_start[, Parameters := c(Followup_011 = "0-11", Followup_1217 = "12-17", Followup_1819 = "18-19",
                                 Followup_2029 = "20-29", Followup_3039 = "30-39", Followup_4049 = "40-49",
                                 Followup_5059 = "50-59", Followup_6069 = "60-69", Followup_7079 = "70-79",
                                 Followup_80 = ">=80")[Parameters]]


sex_studystart <- fread(paste0(dirD4tables, "D4_descriptive_dataset_sex_studystart.csv"))
sex_studystart[, Datasource := c(TEST = "Test", ARS = "Italy_ARS",
                                 PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                 BIFAP = "ES_BIFAP")[Datasource]]
sex_start <- sex_studystart[, a := "Person years across sex"]
sex_start <- melt(sex_start, id.vars = c("a", "Datasource"),
                  measure.vars = c("Sex_female", "Sex_male"),
                  variable.name = "Parameters")
sex_start <- dcast(sex_start, a + Parameters  ~ Datasource, value.var = 'value')
sex_start[, Parameters := c(Sex_male = "Male", Sex_female = "Female")[Parameters]]


risk_factors_studystart <- fread(paste0(dirD4tables, "D4_descriptive_dataset_covariate_studystart.csv"))
risk_factors_studystart[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                          BIFAP = "ES_BIFAP")[Datasource]]
risk_factors_start <- risk_factors_studystart[, a := "At risk population at January 1-2020"]
risk_factors_start <- melt(risk_factors_start, id.vars = c("a", "Datasource"),
                           measure.vars = c("CV", "Cancer", "CLD", "HIV", "CKD", "Diabetes",
                                            "Obesity", "Sicklecell", "immunosuppressants"),
                           variable.name = "Parameters")
risk_factors_start <- dcast(risk_factors_start, a + Parameters  ~ Datasource, value.var = 'value')
risk_factors_start[, Parameters := c(CV = "Cardiovascular disease", Cancer = "Cancer", CLD = "Chronic lung disease",
                                     HIV = "HIV", CKD = "Chronic kidney disease", Diabetes = "Diabetes",
                                     Obesity = "Severe obesity", Sicklecell = "Sickle cell disease",
                                     immunosuppressants = "Use of immunosuppressants")[Parameters]]

table2 <- rbind(total_pop, pt_total, age_start, ageband_start, followup_start, sex_start, risk_factors_start)
daps <- intersect(c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP", "Test"), names(table2))
daps_perc <- paste("perc", daps, sep="_")
col_order <- c(rbind(daps, daps_perc))
table2 <- table2[, (daps_perc) := character(nrow(table2))]
total_pop <- total_pop[, ..daps]
pt_total <- pt_total[, ..daps]
table2 <- table2[a %in% c("Age in categories", "Person years across sex", "At risk population at January 1-2020"),
                 (daps_perc) := round(.SD / as.numeric(total_pop) * 100, 3), .SDcols = daps]

table2 <- table2[a == "Person years across age categories",
                 (daps_perc) := round(.SD / as.numeric(pt_total) * 100, 3), .SDcols = daps]

table2 <- table2[a %in% c("Age in categories", "Person years across sex", "At risk population at January 1-2020", 
                          "Person years across age categories"), (daps_perc) := lapply(.SD, paste0, "%"), .SDcols = daps_perc]

empty_df <- table2[0,]
empty_df <- rbindlist(list(empty_df, list("", "", "N", "%")))

table2 <- rbindlist(list(empty_df, table2))

setcolorder(table2, c("a", "Parameters", col_order))

setnames(table2, "a", " ")

fwrite(table2, file = paste0(dummytables_MIS, "Cohort characteristics at start of study (1-1-2020).csv"))



# table5 ------------------------------------------------------------------


ageband_studystart_c <- fread(paste0(dirD4tables, "D4_descriptive_dataset_ageband_studystart_c_MIS.csv"))

ageband_studystart_c[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                       BIFAP = "ES_BIFAP")[Datasource]]

'%!in%' <- function(x,y)!('%in%'(x,y))

if ("AgeCat_011" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_011:=0]
if ("AgeCat_1217" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_1217:=0]
if ("AgeCat_1819" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_1819:=0]
if ("AgeCat_2029" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_2029:=0]
if ("AgeCat_3039" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_3039:=0]
if ("AgeCat_4049" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_4049:=0]
if ("AgeCat_5059" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_5059:=0]
if ("AgeCat_6069" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_6069:=0]
if ("AgeCat_7079" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_7079:=0]

ageband_studystart_c[, TOTAL := sum(AgeCat_011, AgeCat_1217, AgeCat_1819, AgeCat_2029, AgeCat_3039, AgeCat_4049,
                                    AgeCat_5059, AgeCat_6069, AgeCat_7079, get("AgeCat_80+")), by = Datasource]

total_pop_c <- ageband_studystart_c[, a := "Study population"][, Parameters := "N"][, .(a, Parameters, Datasource, TOTAL)]
total_pop_c <- dcast(total_pop_c, a + Parameters ~ Datasource, value.var = 'TOTAL')
col_to_keep <- intersect(c("a", "Parameters", "Italy_ARS", "NL_PHARMO",
                           "UK_CPRD", "ES_BIFAP", "Test"), names(total_pop_c))
total_pop_c <- total_pop_c[, ..col_to_keep]


age_studystart_c <- fread(paste0(dirD4tables, "D4_descriptive_dataset_age_studystart_c_MIS.csv"))

age_studystart_c[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                   BIFAP = "ES_BIFAP")[Datasource]]

pt_total_c <- age_studystart_c[, a := "Person years of follow-up"][, Parameters := "PY"][, .(a, Parameters, Datasource, Followup)]
pt_total_c <- dcast(pt_total_c, a + Parameters ~ Datasource, value.var = 'Followup')
pt_total_c <- pt_total_c[, ..col_to_keep]

age_start_c <- copy(age_studystart_c)[, a := "Age in years"][, Followup := NULL]
age_start_c <- melt(age_start_c, id.vars = c("a", "Datasource"),
                    measure.vars = c("Age_min", "Age_P25", "Age_P50", "Age_mean", "Age_p75", "Age_max"),
                    variable.name = "Parameters")
age_start_c <- dcast(age_start_c, a + Parameters  ~ Datasource, value.var = 'value')
age_start_c[, Parameters := c(Age_min = "Min", Age_P25 = "P25", Age_P50 = "P50", Age_mean = "Mean", Age_p75 = "P75",
                              Age_max = "Max")[Parameters]]
age_start_c <- age_start_c[, ..col_to_keep]


ageband_start_c <- ageband_studystart_c[, a := "Age in categories"][, TOTAL := NULL]
ageband_start_c <- melt(ageband_start_c, id.vars = c("a", "Datasource"),
                        measure.vars = c("AgeCat_011", "AgeCat_1217", "AgeCat_1819", "AgeCat_2029", "AgeCat_3039",
                                         "AgeCat_4049", "AgeCat_5059", "AgeCat_6069", "AgeCat_7079", "AgeCat_80+"),
                        variable.name = "Parameters")
ageband_start_c <- dcast(ageband_start_c, a + Parameters  ~ Datasource, value.var = 'value')
ageband_start_c[, Parameters := c(AgeCat_011 = "0-11", AgeCat_1217 = "12-17", AgeCat_0119 = "18-19", AgeCat_2029 = "20-29",
                                  AgeCat_3039 = "30-39", AgeCat_4049 = "40-49", AgeCat_5059 = "50-59", AgeCat_6069 = "60-69",
                                  AgeCat_7079 = "70-79", "Agecat_80+" = ">=80")[Parameters]]



D4_descriptive_dataset_covid_studystart_c_MIS <- fread(paste0(dirD4tables, "D4_descriptive_dataset_covid_studystart_c_MIS.csv"))
D4_descriptive_dataset_covid_studystart_c_MIS[, Datasource := c(TEST = "Test", ARS = "Italy_ARS",
                                                                PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                                                BIFAP = "ES_BIFAP")[Datasource]]


covid_month <- D4_descriptive_dataset_covid_studystart_c_MIS[, a := "Month of first diagnosis"]
x<-colnames(covid_month)
cols_covid<-x[grepl("-", x)]

covid_month <- melt(covid_month, id.vars = c("a", "Datasource"),
                    measure.vars = cols_covid,
                    variable.name = "Parameters")
covid_month <- dcast(covid_month, a + Parameters  ~ Datasource, value.var = 'value')
#covid_month[, Parameters := c(Sex_male = "Male", Sex_female = "Female")[Parameters]]


risk_factors_studystart_c <- fread(paste0(dirD4tables, "D4_descriptive_dataset_covariate_studystart_c_MIS.csv"))
risk_factors_studystart_c[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                            BIFAP = "ES_BIFAP")[Datasource]]
risk_factors_start_c <- risk_factors_studystart_c[, a := "At risk population at January 1-2020"]
risk_factors_start_c <- melt(risk_factors_start_c, id.vars = c("a", "Datasource"),
                             measure.vars = c("CV", "Cancer", "CLD", "HIV", "CKD", "Diabetes",
                                              "Obesity", "Sicklecell", "immunosuppressants"),
                             variable.name = "Parameters")
risk_factors_start_c <- dcast(risk_factors_start_c, a + Parameters  ~ Datasource, value.var = 'value')
risk_factors_start_c[, Parameters := c(CV = "Cardiovascular disease", Cancer = "Cancer", CLD = "Chronic lung disease",
                                       HIV = "HIV", CKD = "Chronic kidney disease", Diabetes = "Diabetes",
                                       Obesity = "Severe obesity", Sicklecell = "Sickle cell disease",
                                       immunosuppressants = "Use of immunosuppressants")[Parameters]]

table5 <- rbind(total_pop_c, pt_total_c,covid_month, age_start_c, ageband_start_c,  risk_factors_start_c)
daps <- intersect(c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP", "Test"), names(table5))
daps_perc <- paste("perc", daps, sep="_")
col_order <- c(rbind(daps, daps_perc))
table5 <- table5[, (daps_perc) := character(nrow(table5))]
total_pop_c <- total_pop_c[, ..daps]
pt_total_c <- pt_total_c[, ..daps]
table5 <- table5[a %in% c("Age in categories", "Month of first diagnosis", "At risk population at January 1-2020"),
                 (daps_perc) := round(.SD / as.numeric(total_pop_c) * 100, 3), .SDcols = daps]

table5 <- table5[a == "Person years across age categories",
                 (daps_perc) := round(.SD / as.numeric(pt_total_c) * 100, 3), .SDcols = daps]

table5 <- table5[a %in% c("Age in categories", "Person years across sex", "At risk population at January 1-2020", 
                          "Person years across age categories"), (daps_perc) := lapply(.SD, paste0, "%"), .SDcols = daps_perc]

empty_df <- table5[0,]
empty_df <- rbindlist(list(empty_df, list("", "", "N", "%")))

table5 <- rbindlist(list(empty_df, table5))

setcolorder(table5, c("a", "Parameters", col_order))

setnames(table5, "a", " ")

fwrite(table5, file = paste0(dummytables_MIS, "Cohort characteristics at first occurrence of COVID-19 prior to vaccination (cohort c).csv"))


<<<<<<< HEAD
=======
# load(file =paste0(dirtemp, "D3_selection_criteria_c.RData"))
# load(file = paste0(dirtemp, "D4_population_c.RData"))
# 
# D4_population_c_all<-merge(D3_selection_criteria_c,D4_population_c,by="person_id",all=F)





# Table7 ----------------------------------------------------------------------------------------------------------

load(paste0(dirtemp,"list_outcomes_observed.RData"))

list_outcomes_observed <- intersect(list_outcomes_observed, list_outcomes_MIS)
list_outcomes_observed <- list_outcomes_observed[list_outcomes_observed %in% c("KD_narrow", "MIS_narrow")]

table_7 <- data.table::data.table(meaning_of_first_event = character(), coding_system_of_code_first_event = character(),
                                  code_first_event = character(), count_n = character(), Event = character())

for (outcome in list_outcomes_observed) {
  for (year in c(2020, 2021)) {
    temp_df <- data.table::fread(paste0(direxp, "QC_code_counts_in_study_population", outcome, "_", year, ".csv"))
    event <- strsplit(outcome, "_")[[1]][1]
    temp_df <- temp_df[, Event := event]
    table_7 <- data.table::rbindlist(list(table_7, temp_df))
  }
}

setnames(table_7, c("meaning_of_first_event", "coding_system_of_code_first_event", "code_first_event"),
         c("meaning_of_event", "Coding_system", "code"))

table_7 <- table_7[, count_n := as.integer(count_n)]
table_7 <- table_7[, .(sum = sum(count_n)), by = c("Event", "Coding_system", "code", "meaning_of_event")]

table_7 <- table_7[, Code := code]
table_7 <- table_7[, .(DAP = thisdatasource, Event, Coding_system, Code, meaning_of_event, sum)]

fwrite(table_7, file = paste0(dummytables_MIS, "Code counts for narrow definitions (for each event) separately.csv"))
>>>>>>> 235c9a5bb946ed748eaa50257cdfb5aabae01629
