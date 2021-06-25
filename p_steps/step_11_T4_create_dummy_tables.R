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
  row_names_2 <- c("Start population", "B_birth_date_absurd", "A_insufficient_run_in", "end population")
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
                              CPRD = "UK_CPRD", AEMPS = "ES_BIFAP")



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
flow_source_1b <- rbind(flow_source_1b, table_1a[a == "end population", ][, a := "Start population"])
flow_study <- flow_study[, row_id := rowid(Datasource)]
flow_study <- data.table::melt(flow_study, id.vars = c("row_id", "Datasource", "N"),
                               measure.vars = c("A_insufficient_run_in"), variable.name = "a")
flow_study <- flow_study[value == 1, a := "end population"][, .(Datasource, N, a)]
flow_study <- data.table::dcast(flow_study, a ~ Datasource, value.var = c("N"))
flow_source_1b <- rbind(flow_source_1b, flow_study)
empty_table_2 <- create_empty_table_1b()
flow_source_1b <- rbind(empty_table_2, flow_source_1b, fill = T)
table_1b <- flow_source_1b[, lapply(.SD, max, na.rm = T), by = a]

setnames(table_1a, "a", " ")
setnames(table_1b, "a", " ")

fwrite(table_1a, file = paste0(dummytables, "Attrition diagram 1.csv"))
fwrite(table_1b, file = paste0(dummytables, "Attrition diagram 2.csv"))






# Table2 ----------------------------------------------------------------------------------------------------------


ageband_studystart <- fread(paste0(dirD4tables, "D4_descriptive_dataset_ageband_studystart.csv"))

ageband_studystart[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                     AEMPS = "ES_BIFAP")[Datasource]]

ageband_studystart[, TOTAL := sum(AgeCat_019, AgeCat_2029, AgeCat_3039, AgeCat_4049, AgeCat_5059, AgeCat_6069,
                                  AgeCat_7079, get("Agecat_80+")), by = Datasource]

total_pop <- ageband_studystart[, a := "Study population"][, Parameters := "N"][, .(a, Parameters, Datasource, TOTAL)]
total_pop <- dcast(total_pop, a + Parameters ~ Datasource, value.var = 'TOTAL')
col_to_keep <- intersect(c("a", "Parameters", "Italy_ARS", "NL_PHARMO",
                           "UK_CPRD", "ES_BIFAP", "Test"), names(total_pop))
total_pop <- total_pop[, ..col_to_keep]


age_studystart <- fread(paste0(dirD4tables, "D4_descriptive_dataset_age_studystart.csv"))

age_studystart[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                 AEMPS = "ES_BIFAP")[Datasource]]

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
                      measure.vars = c("AgeCat_019", "AgeCat_2029", "AgeCat_3039", "AgeCat_4049", "AgeCat_5059",
                                       "AgeCat_6069", "AgeCat_7079", "Agecat_80+"),
                      variable.name = "Parameters")
ageband_start <- dcast(ageband_start, a + Parameters  ~ Datasource, value.var = 'value')
ageband_start[, Parameters := c(AgeCat_019 = "0-19", AgeCat_2029 = "20-29", AgeCat_3039 = "30-39", AgeCat_4049 = "40-49",
                                AgeCat_5059 = "50-59", AgeCat_6069 = "60-69", AgeCat_7079 = "70-79",
                                Agecat_80 = ">=80")[Parameters]]


followup_studystart <- fread(paste0(dirD4tables, "D4_followup_fromstudystart.csv"))
followup_studystart[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                      AEMPS = "ES_BIFAP")[Datasource]]
followup_studystart <- followup_studystart[, a := "Person years across age categories"]
followup_start <- followup_studystart[, .(a, Datasource, Followup_0119, Followup_2029, Followup_3039, Followup_4049,
                                          Followup_5059, Followup_6069, Followup_7079, Followup_80)]

followup_start <- melt(followup_start, id.vars = c("a", "Datasource"),
                       measure.vars = c("Followup_0119", "Followup_2029", "Followup_3039", "Followup_4049", "Followup_5059",
                                        "Followup_6069", "Followup_7079", "Followup_80"),
                       variable.name = "Parameters")
followup_start <- dcast(followup_start, a + Parameters  ~ Datasource, value.var = 'value')
followup_start[, Parameters := c(Followup_0119 = "0-19", Followup_2029 = "20-29", Followup_3039 = "30-39",
                                 Followup_4049 = "40-49", Followup_5059 = "50-59", Followup_6069 = "60-69",
                                 Followup_7079 = "70-79", Followup_80 = ">=80")[Parameters]]


sex_studystart <- fread(paste0(dirD4tables, "D4_descriptive_dataset_sex_studystart.csv"))
sex_studystart[, Datasource := c(TEST = "Test", ARS = "Italy_ARS",
                                 PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                 AEMPS = "ES_BIFAP")[Datasource]]
sex_start <- sex_studystart[, a := "Person years across sex"]
sex_start <- melt(sex_start, id.vars = c("a", "Datasource"),
                  measure.vars = c("Sex_female", "Sex_male"),
                  variable.name = "Parameters")
sex_start <- dcast(sex_start, a + Parameters  ~ Datasource, value.var = 'value')
sex_start[, Parameters := c(Sex_male = "Male", Sex_female = "Female")[Parameters]]


risk_factors_studystart <- fread(paste0(dirD4tables, "D4_descriptive_dataset_covariate_studystart.csv"))
risk_factors_studystart[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                          AEMPS = "ES_BIFAP")[Datasource]]
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

fwrite(table2, file = paste0(dummytables, "Cohort characteristics at start of study (1-1-2020).csv"))





load(file = paste0(dirtemp, "D3_Vaccin_cohort.RData"))

N_fup_pop <- D3_Vaccin_cohort[, .(person_id, date_vax1, type_vax_1, fup_vax1, 
                                  age_at_date_vax_1)]
setnames(N_fup_pop, c("date_vax1", "type_vax_1", "fup_vax1","age_at_date_vax_1"),
         c("date_vax", "type_vax", "fup_vax","age_at_date_vax"))
# N_fup_pop <- melt(N_fup_pop, measure = list(c("date_vax1", "date_vax2"),
#                                             c("type_vax_1", "type_vax_2"),
#                                             c("fup_vax1", "fup_vax2"),
#                                             c("age_at_date_vax_1", "age_at_date_vax_2")),
#                   value.name = c("date_vax", "type_vax", "fup_vax", "age_at_date_vax"), na.rm = T)[, variable := NULL]
N_fup_pop[type_vax == "J&J", type_vax := "Janssen"]
N_fup_pop[, fup_vax := as.numeric(fup_vax) / 365.25]

vax_man <- unique(N_fup_pop[, type_vax])
vax_man_tot <- c("Pfizer", "Moderna", "AstraZeneca", "Janssen")
vax_man <- intersect(vax_man_tot, vax_man)
vax_man_perc <- paste("perc", vax_man, sep = "_")
col_order <- c(rbind(vax_man, vax_man_perc))
cols_to_keep = c("a", "Parameters", col_order)

N_pop <- N_fup_pop[, .N, by = "type_vax"]
total_pop <- N_pop[, sum(N)]
N_pop <- dcast(N_pop, . ~ type_vax, value.var = "N")[, . := NULL]
N_pop <- N_pop[, Parameters := "N"][, a := "Study population"]
setnafill(N_pop, cols = c(vax_man), fill = 0)
N_pop <- N_pop[, (vax_man_perc) := round(.SD / as.numeric(total_pop) * 100, 3), .SDcols = vax_man]
N_pop <- N_pop[, (vax_man_perc) := lapply(.SD, paste0, "%"), .SDcols = vax_man_perc]
N_pop <- N_pop[, ..cols_to_keep]

fup_pop <- N_fup_pop[, sum(fup_vax), by = "type_vax"][, V1 := round(V1, 0)]
pt_total <- fup_pop[, sum(V1)]
fup_pop <- dcast(fup_pop, . ~ type_vax, value.var = "V1")[, . := NULL]
fup_pop <- fup_pop[, Parameters := "PY"][, a := "Person-years of follow-up"]
setnafill(fup_pop, cols = c(vax_man), fill = 0)
fup_pop <- fup_pop[, (vax_man_perc) := round(.SD / as.numeric(pt_total) * 100, 3), .SDcols = vax_man]
fup_pop <- fup_pop[, (vax_man_perc) := lapply(.SD, paste0, "%"), .SDcols = vax_man_perc]
fup_pop <- fup_pop[, ..cols_to_keep]


min_month <- N_fup_pop[, min(date_vax), by = "type_vax"][, V1 := month(V1)]
min_month <- dcast(min_month, . ~ type_vax, value.var = "V1")[, . := NULL]
min_month <- min_month[, Parameters := ""][, a := "Month of first vaccination"]
min_month <- min_month[, (vax_man_perc) := character(nrow(min_month))]
min_month <- min_month[, ..cols_to_keep]

year_month_pop <- N_fup_pop[, c("year", "month") := list(lubridate::year(date_vax), lubridate::month(date_vax))]
year_month_pop <- year_month_pop[, .N, by = c("type_vax", "year", "month")]
year_month_pop <- dcast(year_month_pop, year + month ~ type_vax, value.var = "N")
setorder(year_month_pop, year, month)
year_month_pop <- year_month_pop[, Parameters := "N"][, a := paste(month.name[month], year)]
setnafill(year_month_pop, cols = c(vax_man), fill = 0)
round_sum <- function(x) {paste0(round(x / sum(x) * 100, 3), "%")}
year_month_pop <- year_month_pop[, (vax_man_perc) := lapply(.SD, round_sum), .SDcols = vax_man]
year_month_pop <- year_month_pop[, ..cols_to_keep]

age_pop <- copy(N_fup_pop)[, .(Age_P25 = round(quantile(age_at_date_vax, probs = 0.25)),
                               Age_P50 = round(quantile(age_at_date_vax, probs = 0.50)),
                               Age_p75 = round(quantile(age_at_date_vax, probs = 0.75)),
                               Age_mean = round(mean(age_at_date_vax)),
                               Age_min = min(age_at_date_vax),
                               Age_max = max(age_at_date_vax)),
                           by = "type_vax"]
age_pop <- melt(age_pop, id.vars = "type_vax",
                measure.vars = c("Age_min", "Age_P25", "Age_P50", "Age_mean", "Age_p75", "Age_max"),
                variable.name = "child", value.name = "dob")
age_pop <- dcast(age_pop, child ~ type_vax, value.var = "dob")
age_pop <- age_pop[, Parameters := c("Min", "P25", "P50", "Mean", "P75", "Max")][, a := "Age in years"]
age_pop <- age_pop[, (vax_man_perc) := character(nrow(age_pop))]
age_pop <- age_pop[, ..cols_to_keep]

age_cat <- N_fup_pop[, age_at_date_vax := as.character(findInterval(age_at_date_vax, c(19, 29, 39, 49, 59, 69, 79)))]
vect_age_cat <- c("0" = "0-19", "1" = "20-29", "2" = "30-39", "3" = "40-49",
                  "4" = "50-59", "5" = "60-69", "6" = "70-79", "7" = ">80")
age_cat[, age_at_date_vax := vect_age_cat[age_at_date_vax]]

N_age_cat <- age_cat[, .N, by = c("type_vax", "age_at_date_vax")]
N_age_cat <- dcast(N_age_cat, age_at_date_vax ~ type_vax, value.var = "N")
setnames(N_age_cat, "age_at_date_vax", "Parameters")
N_age_cat <- N_age_cat[, a := "Age in categories"]
setnafill(N_age_cat, cols = c(vax_man), fill = 0)
N_age_cat <- N_age_cat[, (vax_man_perc) := lapply(.SD, round_sum), .SDcols = vax_man]
N_age_cat <- N_age_cat[, ..cols_to_keep]

fup_age_cat <- age_cat[, sum(fup_vax), by = c("type_vax", "age_at_date_vax")][, V1 := round(V1, 0)]
fup_age_cat <- dcast(fup_age_cat, age_at_date_vax ~ type_vax, value.var = "V1")
setnames(fup_age_cat, "age_at_date_vax", "Parameters")
fup_age_cat <- fup_age_cat[, a := "Person years across age categories"]
setnafill(fup_age_cat, cols = c(vax_man), fill = 0)
fup_age_cat <- fup_age_cat[, (vax_man_perc) := lapply(.SD, round_sum), .SDcols = vax_man]
fup_age_cat <- fup_age_cat[, ..cols_to_keep]

D4_descriptive_dataset_sex_vaccination <- fread(paste0(dirD4tables, "D4_descriptive_dataset_sex_vaccination.csv"))
setnames(D4_descriptive_dataset_sex_vaccination, c("Sex_female", "Sex_male"), c("Female", "Male"))
sex_pop <- melt(D4_descriptive_dataset_sex_vaccination, id.vars = "type_vax_1",
                measure.vars = c("Female", "Male"),
                variable.name = "child", value.name = "dob")
sex_pop <- dcast(sex_pop, child ~ type_vax_1, value.var = "dob")
setnames(sex_pop, "child", "Parameters")
sex_pop <- sex_pop[, a := "Person years across sex"]
setnafill(sex_pop, cols = c(vax_man), fill = 0)
sex_pop <- sex_pop[, (vax_man_perc) := lapply(.SD, round_sum), .SDcols = vax_man]
sex_pop <- sex_pop[, ..cols_to_keep]

table3_4_5_6 <- rbind(N_pop, fup_pop, min_month, year_month_pop, age_pop, N_age_cat, fup_age_cat, sex_pop)
setnames(table3_4_5_6, "a", " ")

final_name_table3_4_5_6 <- c(TEST = "table 3", ARS = "table 3", PHARMO = "table 4",
                             UK_CPRD = "table 5", ES_BIFAP = "table 6")[[thisdatasource]]

vect_recode_manufacturer <- c(TEST = "Italy_ARS", ARS = "Italy_ARS", PHARMO = "Netherlands-PHARMO",
                              CPRD = "UK_CPRD", AEMPS = "ES_BIFAP")

empty_df <- table3_4_5_6[0,]
empty_df <- rbindlist(list(empty_df, as.list(c("", "", unlist(rep(c("N", "%"), length(vax_man)))))))

table3_4_5_6 <- rbindlist(list(empty_df, table3_4_5_6))

fwrite(table3_4_5_6, file = paste0(dummytables, final_name_table3_4_5_6,
                                   " Cohort characteristics at first COVID-19 vaccination ", 
                                   vect_recode_manufacturer[[thisdatasource]], ".csv"))
