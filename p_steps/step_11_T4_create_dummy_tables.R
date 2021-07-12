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
                                       "AgeCat_6069", "AgeCat_7079", "Agecat_80+", "Agecat_60+"),
                      variable.name = "Parameters")
ageband_start <- dcast(ageband_start, a + Parameters  ~ Datasource, value.var = 'value')
ageband_start[, Parameters := c(AgeCat_019 = "0-19", AgeCat_2029 = "20-29", AgeCat_3039 = "30-39", AgeCat_4049 = "40-49",
                                AgeCat_5059 = "50-59", AgeCat_6069 = "60-69", AgeCat_7079 = "70-79",
                                Agecat_80 = ">=80", Agecat_60 = ">=60")[Parameters]]


followup_studystart <- fread(paste0(dirD4tables, "D4_followup_fromstudystart.csv"))
followup_studystart[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                      AEMPS = "ES_BIFAP")[Datasource]]
followup_studystart <- followup_studystart[, a := "Person years across age categories"]
followup_start <- followup_studystart[, .(a, Datasource, Followup_0119, Followup_2029, Followup_3039, Followup_4049,
                                          Followup_5059, Followup_6069, Followup_7079, Followup_80, Followup_60)]

followup_start <- melt(followup_start, id.vars = c("a", "Datasource"),
                       measure.vars = c("Followup_0119", "Followup_2029", "Followup_3039", "Followup_4049", "Followup_5059",
                                        "Followup_6069", "Followup_7079", "Followup_80", "Followup_60"),
                       variable.name = "Parameters")
followup_start <- dcast(followup_start, a + Parameters  ~ Datasource, value.var = 'value')
followup_start[, Parameters := c(Followup_0119 = "0-19", Followup_2029 = "20-29", Followup_3039 = "30-39",
                                 Followup_4049 = "40-49", Followup_5059 = "50-59", Followup_6069 = "60-69",
                                 Followup_7079 = "70-79", Followup_80 = ">=80", Followup_60 = ">=60")[Parameters]]


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

vax_man_tot <- c("Pfizer", "Moderna", "AstraZeneca", "Janssen", "UKN")

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
round_sum <- function(x) {round(x / sum(x) * 100, 3)}
year_month_pop <- year_month_pop[, (vax_man_perc) := lapply(.SD, round_sum), .SDcols = vax_man]
year_month_pop <- year_month_pop[, (vax_man_perc) := lapply(.SD, paste0, "%"), .SDcols = vax_man_perc]
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
older60 <- copy(N_age_cat)[Parameters %in% c(">80", "70-79", "60-69"),
                           lapply(.SD, sum, na.rm=TRUE), by = "a",
                           .SDcols = c(vax_man, vax_man_perc)]
older60 <- unique(older60[, Parameters := ">60"])
N_age_cat <- rbind(N_age_cat, older60)
N_age_cat <- N_age_cat[, (vax_man_perc) := lapply(.SD, paste0, "%"), .SDcols = vax_man_perc]
N_age_cat <- N_age_cat[, ..cols_to_keep]

fup_age_cat <- age_cat[, sum(fup_vax), by = c("type_vax", "age_at_date_vax")][, V1 := round(V1, 0)]
fup_age_cat <- dcast(fup_age_cat, age_at_date_vax ~ type_vax, value.var = "V1")
setnames(fup_age_cat, "age_at_date_vax", "Parameters")
fup_age_cat <- fup_age_cat[, a := "Person years across age categories"]
setnafill(fup_age_cat, cols = c(vax_man), fill = 0)
fup_age_cat <- fup_age_cat[, (vax_man_perc) := lapply(.SD, round_sum), .SDcols = vax_man]
older60 <- copy(fup_age_cat)[Parameters %in% c(">80", "70-79", "60-69"),
                           lapply(.SD, sum, na.rm=TRUE), by = "a",
                           .SDcols = c(vax_man, vax_man_perc)]
older60 <- unique(older60[, Parameters := ">60"])
fup_age_cat <- rbind(fup_age_cat, older60)
fup_age_cat <- fup_age_cat[, (vax_man_perc) := lapply(.SD, paste0, "%"), .SDcols = vax_man_perc]
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
sex_pop <- sex_pop[, (vax_man_perc) := lapply(.SD, paste0, "%"), .SDcols = vax_man_perc]
sex_pop <- sex_pop[, ..cols_to_keep]

table3_4_5_6 <- rbind(N_pop, fup_pop, min_month, year_month_pop, age_pop, N_age_cat, fup_age_cat, sex_pop)
setnames(table3_4_5_6, "a", " ")

final_name_table3_4_5_6 <- c(TEST = "table 3", ARS = "table 3", PHARMO = "table 4",
                             CPRD = "table 5", AEMPS = "table 6")[[thisdatasource]]

vect_recode_manufacturer <- c(TEST = "Italy_ARS", ARS = "Italy_ARS", PHARMO = "Netherlands-PHARMO",
                              CPRD = "UK_CPRD", AEMPS = "ES_BIFAP")

empty_df <- table3_4_5_6[0,]
empty_df <- rbindlist(list(empty_df, as.list(c("", "", unlist(rep(c("N", "%"), length(vax_man)))))))

table3_4_5_6 <- rbindlist(list(empty_df, table3_4_5_6))

fwrite(table3_4_5_6, file = paste0(dummytables, final_name_table3_4_5_6,
                                   " Cohort characteristics at first COVID-19 vaccination ", 
                                   vect_recode_manufacturer[[thisdatasource]], ".csv"))





# Table7 ----------------------------------------------------------------------------------------------------------

empty_table_7 <- data.table(a = character(0), Parameters = character(0), N = numeric(0))

vaccinated_persons <- D3_Vaccin_cohort[, .(person_id, date_vax1, date_vax2, type_vax_1, type_vax_2)]
vaccinated_persons <-vaccinated_persons[type_vax_1 == "J&J", type_vax_1 := "Janssen"]

Totals_dose_1 <- vaccinated_persons[, .N, by = "type_vax_1"]
Totals_dose_1 <- Totals_dose_1[, index := 1]
names_vect <- c("Pfizer", "Moderna", "AstraZeneca", "Janssen", "UKN")
recode_rows <- paste(names_vect, "dose 1")
names(recode_rows) <- names_vect
Totals_dose_1 <- Totals_dose_1[, a := recode_rows[type_vax_1]][, Parameters := "Persons"]

Totals <- Totals_dose_1[, sum(N)]
Totals_df <- data.table::data.table(N = Totals, a = "Total population", Parameters = "Persons")
base_table_7 <- rbindlist(list(empty_table_7, Totals_df), use.names=TRUE)

df_with_second_doses  <- vaccinated_persons[!is.na(date_vax2), ]

dissimilar_doses <- df_with_second_doses[type_vax_1 != type_vax_2, ]
dissimilar_doses <- dissimilar_doses[, .N, by = "type_vax_1"]
dissimilar_doses <- dissimilar_doses[, a := "Other vaccine dose 2"][, Parameters := "Persons"][, index := 3]

distance_doses <- df_with_second_doses[type_vax_1 == type_vax_2, ]
Totals_dose_2 <- distance_doses[, .N, by = "type_vax_1"]
recode_rows <- paste(names_vect, "dose 2")
names(recode_rows) <- names_vect
Totals_dose_2 <- Totals_dose_2[, a := recode_rows[type_vax_1]][, Parameters := "Persons"][, index := 2]

distance_doses <- distance_doses[, distance := correct_difftime(date_vax2 - 1, date_vax1)]
distance_doses <- distance_doses[, .(Min = min(distance), P25 = quantile(distance, 0.25),
                                     P50 = quantile(distance, 0.50), P75 = quantile(distance, 0.75),
                                     Max = max(distance)), by = "type_vax_1"]
cols_difftime <- sapply(distance_doses, is.difftime)
cols_difftime <- names(cols_difftime)[cols_difftime]
distance_doses <- distance_doses[, (cols_difftime) := lapply(.SD, function(x) round(as.numeric(x))), .SDcols = cols_difftime]
vect_measures <- c("Min", "P25", "P50", "P75", "Max")
distance_doses <- data.table::melt(distance_doses, id.vars = "type_vax_1",
                                   measure.vars = vect_measures, variable.name = "Parameters",
                                   value.name = "N")
recode_rows <- paste("Amongst persons with", names_vect, "dose 2 distance")
names(recode_rows) <- names_vect
rows_to_index <- seq(4, 8)
names(rows_to_index) <- vect_measures
distance_doses <- distance_doses[, a := recode_rows[type_vax_1]][, index := rows_to_index[Parameters]]

part2_table_7 <- rbindlist(list(Totals_dose_1, Totals_dose_2, dissimilar_doses, distance_doses), use.names=TRUE)
data.table::setorder(part2_table_7, type_vax_1, index)

dose_1_to_join <- Totals_dose_1[, .(type_vax_1, tot_type_1 = N)]

table_7 <- rbindlist(list(base_table_7, part2_table_7), fill = TRUE)
table_7 <- table_7[index == 1, Perc := N / Totals]
table_7 <- merge(table_7, dose_1_to_join, by = "type_vax_1")
table_7 <- table_7[data.table::between(index, 2, 3), Perc := N / tot_type_1]
table_7 <- table_7[, Perc := paste0(round(Perc * 100, 3), "%")]
table_7 <- table_7[Perc == "NA%", Perc := ""]

vect_recode_manufacturer <- c(TEST = "IT-ARS", ARS = "IT-ARS", PHARMO = "NL-PHARMO",
                              CPRD = "UK_CPRD", AEMPS = "ES_BIFAP")
correct_datasource <- vect_recode_manufacturer[thisdatasource]
table_7 <- table_7[, .(a, Parameters, N, Perc)]

empty_df <- table_7[0,]
empty_df <- rbindlist(list(empty_df, list("", "", "N", "%")))
table_7 <- rbindlist(list(empty_df, table_7))

setnames(table_7, c("a", "N", "Perc"), c("", correct_datasource, correct_datasource))

fwrite(table_7, file = paste0(dummytables, "Doses of COVID-19 vaccines and distance betweenfirst and second dose.csv"))



# Table8 ----------------------------------------------------------------------------------------------------------

load(paste0(dirtemp,"D3_events_ALL_OUTCOMES.RData"))
D3_events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES[, .(name_event, year_event = year(date_event))][year_event > 2019, ]

list_outcomes <- c(OUTCOMES_conceptssets, CONTROL_events, SECCOMPONENTS, "DEATH")
list_outcomes <- sort(list_outcomes)
list_outcomes <- list_outcomes[list_outcomes %not in% c("COVID_narrow", "COVID_possible")]

vect_recode_type <- c(narrow = "Narrow", broad = "Broad")

table_8 <- data.table::data.table(year_event = character(), Narrow = character(), Broad = character())
table_8 <- data.table::rbindlist(list(table_8, list("", "Narrow", "Broad")))

events_table_8 <- data.table::data.table(year_event = character(), Broad = character(), Narrow = character())
event <- ""

for (outcome in list_outcomes) {
  
  splitted_outcome <- strsplit(outcome, "_")[[1]]
  if (event == splitted_outcome[1]) {next} else {event <- splitted_outcome[1]}
  
  empty_concept <- data.table::data.table(year_event = event, Broad = character(1), Narrow = character(1))
  df_event <- data.table::data.table(year_event = character(), N = character(), Type = character())
  
  if (is.na(splitted_outcome[2])) {
    df_temp <- copy(D3_events_ALL_OUTCOMES)[name_event == event, ]
    df_temp <- df_temp[, .N, by = "year_event"][, Type := "Narrow"]
    df_event <- data.table::rbindlist(list(df_event, df_temp))
  } else {
    for (type in c("narrow", "broad")) {
      concept <- paste0(event, "_", type)
      df_temp <- copy(D3_events_ALL_OUTCOMES)[name_event == concept, ]
      df_temp <- df_temp[, .N, by = "year_event"][, Type := vect_recode_type[[type]]]
      df_event <- data.table::rbindlist(list(df_event, df_temp))
    }
  }
  
  empty_df_event <- as.data.table(expand.grid(Type = c("Narrow", "Broad"), year_event = c("2020", "2021")))
  df_event <- merge(empty_df_event, df_event, by = c("Type", "year_event"), all.x = T)
  df_event <- df_event[is.na(N), N := 0]
  
  df_event <- data.table::dcast(df_event, year_event ~ Type, value.var = "N", fill = "")
  df_event <- data.table::rbindlist(list(empty_concept, df_event))
  events_table_8 <- data.table::rbindlist(list(events_table_8, df_event))
}

table_8 <- data.table::rbindlist(list(table_8, events_table_8), use.names=TRUE)
setnames(table_8, c("year_event", "Narrow", "Broad"), c("", correct_datasource, correct_datasource))

fwrite(table_8, file = paste0(dummytables, "Number of incident cases entire study period.csv"))





# table_9 ----------------------------------------------------------------------------------------------------------

load(paste0(dirtemp,"list_outcomes_observed.RData"))

list_outcomes_observed <- list_outcomes_observed[list_outcomes_observed %not in% c(CONTROL_events, "DEATH")]

table_9 <- data.table::data.table(meaning_of_first_event = character(), coding_system_of_code_first_event = character(),
                                 code_first_event = character(), count_n = character(), Event = character())

for (outcome in list_outcomes_observed) {
  for (year in c(2020, 2021)) {
    temp_df <- data.table::fread(paste0(direxp, "QC_code_counts_in_study_population", outcome, "_", year, ".csv"))
    event <- strsplit(outcome, "_")[[1]][1]
    temp_df <- temp_df[, Event := event]
    table_9 <- data.table::rbindlist(list(table_9, temp_df))
  }
}

setnames(table_9, c("meaning_of_first_event", "coding_system_of_code_first_event", "code_first_event"),
         c("meaning_of_event", "Coding_system", "code"))

table_9 <- table_9[, count_n := as.integer(count_n)]
table_9 <- table_9[, .(sum = sum(count_n)), by = c("Event", "Coding_system", "code", "meaning_of_event")]

table_9 <- table_9[, First_4_digits_of_code := stringr::str_extract(code, "^(.*?[0-9]){4}")]
table_9 <- table_9[is.na(First_4_digits_of_code), First_4_digits_of_code := code]
table_9 <- table_9[, .(DAP = thisdatasource, Event, Coding_system, First_4_digits_of_code, meaning_of_event, sum)]

fwrite(table_9, file = paste0(dummytables, "Code counts for narrow definitions (for each event) separately.csv"))





# table_10 ----------------------------------------------------------------------------------------------------------

load(paste0(direxp,"D4_persontime_ALL_OUTCOMES.RData"))

list_risk <- list_outcomes_observed
vect_recode_AESI <- list_outcomes_observed
names(vect_recode_AESI) <- c(as.character(seq_len(length(list_outcomes_observed))))

colA = paste0("Persontime_", list_risk)
colB = paste0("IR_", list_risk)
colC = paste0("lb_", list_risk)
colD = paste0("ub_", list_risk)

PT_monthly <- data.table::melt(D4_persontime_ALL_OUTCOMES, measure = list(colA, colB, colC, colD),
                               variable.name = "AESI", value.name = c("PT", "IR", "lb", "ub"), na.rm = F)

PT_monthly <- PT_monthly[, DAP := thisdatasource][ , AESI := vect_recode_AESI[AESI]]
PT_monthly <- PT_monthly[Ageband == ">80", Ageband := "80+"][Ageband == ">60", Ageband := "60+"]
PT_monthly <- PT_monthly[, .(DAP, sex, month, year, at_risk_at_study_entry, Ageband, AESI, PT, IR, lb, ub)]


table_10 <- PT_monthly[year == 2020 & sex == "both_sexes" & Ageband == "all_birth_cohorts" & month != "all_months"
                       & at_risk_at_study_entry == "total" & !stringr::str_detect(AESI, "broad"), ]
table_10 <- table_10[, c("year", "sex", "Ageband") := NULL]

setcolorder(table_10, c("DAP", "AESI", "month", "PT", "IR", "lb", "ub"))

setnames(table_10, c("month", "PT", "IR", "lb", "ub"),
         c("Month in 2020", "Person years", "IR narrow", "LL narrow", "UL narrow"))

fwrite(table_10, file = paste0(dummytables, "Incidence of AESI (narrow) per 100,000 PY by calendar month in 2020.csv"))




# table_11 ----------------------------------------------------------------------------------------------------------

table_11 <- PT_monthly[year == 2020 & sex == "both_sexes" & Ageband != "all_birth_cohorts" & month == "all_months"
                       & at_risk_at_study_entry == "total" & !stringr::str_detect(AESI, "broad"), ]
table_11 <- table_11[, c("year", "sex", "month") := NULL]

setcolorder(table_11, c("DAP", "AESI", "Ageband", "PT", "IR", "lb", "ub"))

setnames(table_11, c("Ageband", "PT", "IR", "lb", "ub"),
         c("Age in 2020", "Person years", "IR narrow", "LL narrow", "UL narrow"))

fwrite(table_11, file = paste0(dummytables, "Incidence of AESI (narrow) per 100,000 PY by age in 2020.csv"))




# table_12 ----------------------------------------------------------------------------------------------------------

table_12 <- PT_monthly[year == 2020 & sex != "both_sexes" & Ageband != "all_birth_cohorts" & month == "all_months"
                       & at_risk_at_study_entry == "total" & !stringr::str_detect(AESI, "broad"), ]
table_12 <- table_12[, c("year", "month") := NULL]

vect_recode_gender <- c("Male", "Female")
names(vect_recode_gender) <- c(1, 0)
table_12 <- table_12[ , sex := vect_recode_gender[sex]]

setcolorder(table_12, c("DAP", "AESI", "Ageband", "sex", "PT", "IR", "lb", "ub"))

setorder(table_12, DAP, AESI, Ageband, sex)

setnames(table_12, c("Ageband", "sex", "PT", "IR", "lb", "ub"),
         c("Age in 2020", "Sex", "Person years", "IR narrow", "LL narrow", "UL narrow"))

fwrite(table_12, file = paste0(dummytables, "Incidence of AESI (narrow) per 100,000 PY by age & sex in 2020.csv"))






# table_13 ----------------------------------------------------------------------------------------------------------

table_13 <- PT_monthly[year == 2020 & sex != "both_sexes" & Ageband != "all_birth_cohorts" & month == "all_months"
                       & at_risk_at_study_entry == "1" & !stringr::str_detect(AESI, "broad"), ]
table_13 <- table_13[, c("year", "month", "at_risk_at_study_entry") := NULL]

vect_recode_gender <- c("Male", "Female")
names(vect_recode_gender) <- c(1, 0)
table_13 <- table_13[ , sex := vect_recode_gender[sex]]

setcolorder(table_13, c("DAP", "AESI", "Ageband", "sex", "PT", "IR", "lb", "ub"))

setorder(table_13, DAP, AESI, Ageband, sex)

setnames(table_13, c("Ageband", "sex", "PT", "IR", "lb", "ub"),
         c("Age in 2020", "Sex", "Person years", "IR narrow", "LL narrow", "UL narrow"))

fwrite(table_13, file = paste0(dummytables, "Incidence of AESI (narrow) per 100,000 PY by age & sex in 2020.csv"))




# table_14 ----------------------------------------------------------------------------------------------------------

table_14 <- PT_monthly[year == 2021 & sex == "both_sexes" & Ageband == "all_birth_cohorts" & month != "all_months"
                       & at_risk_at_study_entry == "total" & !stringr::str_detect(AESI, "broad"), ]
table_14 <- table_14[, c("year", "sex", "Ageband") := NULL]

setcolorder(table_14, c("DAP", "AESI", "month", "PT", "IR", "lb", "ub"))

setnames(table_14, c("month", "PT", "IR", "lb", "ub"),
         c("Month in 2021", "Person years", "IR narrow", "LL narrow", "UL narrow"))

fwrite(table_14,file = paste0(dummytables,"Incidence of AESI (narrow) per 100,000 PY by month in 2021 (non-vaccinated).csv"))




# table_15 ----------------------------------------------------------------------------------------------------------

# load(paste0(diroutput, "D4_doses_weeks.RData"))
# 
# setorder(D4_doses_weeks, Week_number)
# table_15 <- D4_doses_weeks[Year < 2021, index := .GRP, by = "Week_number"]
# table_15 <- table_15[Year == 2021, index := .GRP, by = "Week_number"][, Week_number := NULL]
# 
# 
# table_15 <- unique(copy(table_15)[, lapply(.SD, sum, na.rm=TRUE),
#                                   by = c("Datasource", "Year", "index", "Type_vax", "Dose"),
#                                   .SDcols = c("Persons_in_week", "Doses_in_week")])
# 
# table_15 <- table_15[, cum_N := cumsum(N), by = c("Datasource", "Type_vax", "Year")]
# 
# table_15 <- table_15[Dose == 1, ][, c("Dose", "Week_number") := NULL]
# 
# setcolorder(table_15, c("Datasource", "Type_vax", "Year", "index", "Doses_in_week", "Persons_in_week"))
# 
# D4_persontime_risk_week <- rbind(D4_persontime_risk_week, all_ages)


# table_16 ----------------------------------------------------------------------------------------------------------

D4_IR_risk_fup <- fread(paste0(direxp,"D4_IR_risk_fup_BC.csv"))
table_16 <- D4_IR_risk_fup[Birthcohort_persons %in% c("<1960", ">1960"), ]
table_16 <- table_16[Birthcohort_persons %in% c("<1960", ">1960") & Dose > 0 & sex != "both_sexes", ]
vect_recode_age <- c("<1960" = "60+", ">1960" = "<60")
table_16 <- table_16[, Birthcohort_persons := vect_recode_age[Birthcohort_persons]]
table_16 <- table_16[, vax_man_dose := paste(type_vax, "dose", Dose)][, c("type_vax", "Dose", "Persontime") := NULL]

list_risk <- list_outcomes_observed

colA = paste0(list_risk, "_b")
colB = paste0("Persontime_", list_risk)
colC = paste0("IR_", list_risk)
colD = paste0("lb_", list_risk)
colE = paste0("ub_", list_risk)

table_16 <- correct_col_type(table_16)

table_16 <- data.table::melt(table_16, measure = list(colA, colB, colC, colD, colE), variable.name = "AESI",
                        value.name = c("Cases", "PT", "IR", "lb", "ub"), na.rm = F)
table_16 <- table_16[ , AESI := vect_recode_AESI[AESI]][ , sex := vect_recode_gender[sex]]
table_16 <- table_16[ , days_since_vax := paste((week_fup -1) * 7, (week_fup * 7 - 1), sep = "-")]
table_16 <- table_16[ , week_fup := NULL]
table_16 <- table_16[, DAP := thisdatasource]

setcolorder(table_16, c("DAP", "AESI", "vax_man_dose", "days_since_vax", "Birthcohort_persons",
                        "sex", "Cases", "PT", "IR", "lb", "ub"))

setnames(table_16, c("sex", "vax_man_dose", "days_since_vax", "Birthcohort_persons", "PT", "IR", "lb", "ub"),
         c("Sex", "Vaccine & dose", "Days since vaccination", "Age", "Person days", "IR narrow", "LL narrow", "UL narrow"))

fwrite(table_16, file = paste0(dummytables, "Incidence of AESI (narrow) per 100,000 PY by week since vaccination.csv"))
rm(table_16, D4_IR_risk_fup)