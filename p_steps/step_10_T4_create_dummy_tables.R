`%not in%` <- negate(`%in%`)

# Table1 ----------------------------------------------------------------------------------------------------------
create_empty_table_1a <- function() {
  n6 <- numeric(6)
  row_names_1 <- c("Start population", "A_sex_or_birth_date_missing", "C_no_observation_period",
                   "D_death_before_study_entry", "E_no_observation_period_including_study_start", "end population")
  return(data.table(a = row_names_1, Italy_ARS = n6, NL_PHARMO = n6, UK_CPRD = n6, ES_BIFAP = n6))
}

create_empty_table_1b <- function() {
  n4 <- numeric(4)
  row_names_2 <- c("Start population", "B_birth_date_absurd", "A_insufficient_run_in", "end population")
  return(data.table(a = row_names_2, Italy_ARS = n4, NL_PHARMO = n4, UK_CPRD = n4, ES_BIFAP = n4))
}

flow_source <- fread(paste0(direxp, "Flowchart_basic_exclusion_criteria.csv"))
flow_study <- fread(paste0(direxp, "Flowchart_exclusion_criteria.csv"))

if (length(unique(flow_source$"Datasource")) > 1) {
  print("all")
} else {
  flow_source <- rbind(flow_source[, Datasource := thisdatasource], copy(flow_source)[, Datasource := "PHARMO"])
  
  flow_study <- flow_study[, Datasource := thisdatasource]
}

empty_table_1 <- create_empty_table_1a()

vect_recode_manufacturer <- c(TEST = "Italy_ARS", ARS = "Italy_ARS", PHARMO = "NL_PHARMO",
                              CPRD = "UK_CPRD", BIFAP = "ES_BIFAP")
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

flow_source <- flow_source[, .SD[which.min(value)], by = c("row_id", "Datasource", "N")][value == 0, .(Datasource, N, a)]
flow_source <- data.table::dcast(flow_source, a ~ Datasource, value.var = c("N"))
flow_source_1a <- flow_source[a != "B_birth_date_absurd", ]
flow_source_1a <- rbind(flow_source_1a, flow_source_totals)
flow_source_1a <- rbind(empty_table_1, flow_source_1a, fill = T)
flow_source_1a <- flow_source_1a[, lapply(.SD, max, na.rm = T), by = a]

max_col <- length(names(empty_table_1))
correct_col_names <- names(empty_table_1)[2:max_col]
correct_row_names <- empty_table_1$a[2:5]
table_1a <- flow_source_1a[a == "end population",
                           (correct_col_names) := flow_source_1a[a == "Start population", 2:max_col] -
                             colSums(flow_source_1a[a %in% correct_row_names, 2:max_col])]




empty_table_2 <- create_empty_table_1b()

flow_source_1b <- flow_source[a == "B_birth_date_absurd", ]
flow_source_1b <- rbind(flow_source_1b, table_1a[a == "end population", a := "Start population"])




setnames(table_1a, "a", " ")



empty_table_2 <- empty_table_2[a == "Start population", (correct_col_names) := empty_table_1[1, 2:5] - colSums(empty_table_1[2:5, 2:5])]

for (row_id in seq_len(nrow(flow_source))) {
  for (col_name in names(flow_source)) {
    if (flow_source[row_id, ..col_name] == 0) {
      empty_table_2[a == col_name, flow_source[row_id, Datasource]] <- flow_source[row_id, N]
      next
    }
  }
}

for (row_id in seq_len(nrow(flow_study))) {
  for (col_name in names(flow_study)) {
    if (flow_study[row_id, ..col_name] == 0) {
      empty_table_2[a == col_name, flow_study[row_id, Datasource]] <- flow_study[row_id, N]
      next
    }
  }
}

correct_col_names <- names(empty_table_2)[2:length(names(empty_table_2))]
table_1b <- empty_table_2[a == "end population", (correct_col_names) := empty_table_2[1, 2:5] - colSums(empty_table_2[2:3, 2:5])]

table_1b <- table_1b[.(a = c("B_birth_date_absurd", "A_insufficient_run_in"),
                       to = c("Subjects without valid birth date", "Subjects without one year of look back at 1/1/2020")),
                     on = "a", a := i.to]

setnames(table_1b, "a", " ")







# Table2 ----------------------------------------------------------------------------------------------------------


ageband_studystart <- fread(paste0(direxp, "D4_descriptive_dataset_ageband_studystart.csv"))
ageband_studystart <- ageband_studystart[rep(1, 2), ]
ageband_studystart <- ageband_studystart[1, Datasource := "ARS"]
ageband_studystart <- ageband_studystart[2, Datasource := "PHARMO"]

ageband_studystart[, Datasource := c(TEST = "test", ARS = "Italy_ARS",
                                     PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                     BIFAP = "ES_BIFAP")[Datasource]]

ageband_studystart[, TOTAL := sum(AgeCat_019, AgeCat_2029, AgeCat_3039,
                                  AgeCat_4049, AgeCat_5059, AgeCat_6069,
                                  AgeCat_7079, get("Agecat_80+")),
                   by = Datasource]


total_pop <- ageband_studystart[, a := "Study population"][, Parameters := "N"][, .(a, Parameters, Datasource, TOTAL)]
total_pop <- dcast(total_pop, a + Parameters ~ Datasource, value.var = 'TOTAL')
col_to_keep <- intersect(c("a", "Parameters", "Italy_ARS", "NL_PHARMO",
                           "UK_CPRD", "ES_BIFAP"), names(total_pop))
total_pop <- total_pop[, ..col_to_keep]


age_studystart <- fread(paste0(direxp, "D4_descriptive_dataset_age_studystart.csv"))
age_studystart <- age_studystart[rep(1, 2), ]
age_studystart <- age_studystart[1, Datasource := "ARS"]
age_studystart <- age_studystart[2, Datasource := "PHARMO"]

age_studystart[, Datasource := c(TEST = "test", ARS = "Italy_ARS",
                                 PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                 BIFAP = "ES_BIFAP")[Datasource]]

pt_total <- age_studystart[, a := "Person years of follow-up"][, Parameters := "PY"][, .(a, Parameters, Datasource, Followup)]
pt_total <- dcast(pt_total, a + Parameters ~ Datasource, value.var = 'Followup')
pt_total <- pt_total[, ..col_to_keep]

age_start <- copy(age_studystart)[, a := "Age in years"][, Followup := NULL]
age_start <- melt(age_start, id.vars = c("a", "Datasource"),
                  measure.vars = c("Age_min", "Age_P25", "Age_P50",
                                   "Age_mean", "Age_p75", "Age_max"),
                  variable.name = "Parameters")
age_start <- dcast(age_start, a + Parameters  ~ Datasource, value.var = 'value')
age_start[, Parameters := c(Age_min = "Min", Age_P25 = "P25", Age_P50 = "P50",
                            Age_mean = "Mean", Age_p75 = "P75", Age_max = "Max")[Parameters]]
age_start <- age_start[, ..col_to_keep]


ageband_start <- ageband_studystart[, a := "Age in categories"][, TOTAL := NULL]
ageband_start <- ageband_start[rep(1, 2), ]
ageband_start <- ageband_start[1, Datasource := "ARS"]
ageband_start <- ageband_start[2, Datasource := "PHARMO"]
ageband_start[, Datasource := c(TEST = "test", ARS = "Italy_ARS",
                                 PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                 BIFAP = "ES_BIFAP")[Datasource]]

ageband_start <- melt(ageband_start, id.vars = c("a", "Datasource"),
                      measure.vars = c("AgeCat_019", "AgeCat_2029", "AgeCat_3039",
                                       "AgeCat_4049", "AgeCat_5059", "AgeCat_6069",
                                       "AgeCat_7079", "Agecat_80+"),
                      variable.name = "Parameters")
ageband_start <- dcast(ageband_start, a + Parameters  ~ Datasource, value.var = 'value')
ageband_start[, Parameters := c(AgeCat_019 = "0-19", AgeCat_2029 = "20-29", AgeCat_3039 = "30-39",
                                AgeCat_4049 = "40-49", AgeCat_5059 = "50-59", AgeCat_6069 = "60-69",
                                AgeCat_7079 = "70-79", Agecat_80 = ">=80")[Parameters]]


followup_studystart <- fread(paste0(direxp, "D4_followup_fromstudystart.csv"))
followup_studystart <- followup_studystart[rep(1, 2), ]
followup_studystart <- followup_studystart[1, Datasource := "ARS"]
followup_studystart <- followup_studystart[2, Datasource := "PHARMO"]
followup_studystart[, Datasource := c(TEST = "test", ARS = "Italy_ARS",
                                      PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                      BIFAP = "ES_BIFAP")[Datasource]]
followup_studystart <- followup_studystart[, a := "Person years across age categories"]
followup_start <- followup_studystart[, .(a, Datasource, Followup_0119, Followup_2029,
                                          Followup_3039, Followup_4049, Followup_5059,
                                          Followup_6069, Followup_7079, Followup_80)]

followup_start <- melt(followup_start, id.vars = c("a", "Datasource"),
                  measure.vars = c("Followup_0119", "Followup_2029", "Followup_3039",
                                   "Followup_4049", "Followup_5059", "Followup_6069",
                                   "Followup_7079", "Followup_80"),
                  variable.name = "Parameters")
followup_start <- dcast(followup_start, a + Parameters  ~ Datasource, value.var = 'value')
followup_start[, Parameters := c(Followup_0119 = "0-19", Followup_2029 = "20-29", Followup_3039 = "30-39",
                                 Followup_4049 = "40-49", Followup_5059 = "50-59", Followup_6069 = "60-69",
                                 Followup_7079 = "70-79", Followup_80 = ">=80")[Parameters]]


sex_studystart <- fread(paste0(direxp, "D4_descriptive_dataset_sex_studystart.csv"))
sex_studystart <- sex_studystart[rep(1, 2), ]
sex_studystart <- sex_studystart[1, Datasource := "ARS"]
sex_studystart <- sex_studystart[2, Datasource := "PHARMO"]
sex_studystart[, Datasource := c(TEST = "test", ARS = "Italy_ARS",
                                 PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                 BIFAP = "ES_BIFAP")[Datasource]]
sex_start <- sex_studystart[, a := "Person years across sex"]
sex_start <- melt(sex_start, id.vars = c("a", "Datasource"),
                  measure.vars = c("Sex_female", "Sex_male"),
                  variable.name = "Parameters")
sex_start <- dcast(sex_start, a + Parameters  ~ Datasource, value.var = 'value')
sex_start[, Parameters := c(Sex_male = "Male", Sex_female = "Female")[Parameters]]

table2 <- rbind(total_pop, pt_total, age_start, ageband_start, followup_start, sex_start)
daps <- intersect(c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP"), names(table2))
daps_perc <- paste("perc", daps, sep="_")
table2 <- table2[, (daps_perc) := character(nrow(table2))]
total_pop <- total_pop[, ..daps]
pt_total <- pt_total[, ..daps]
table2 <- table2[a %in% c("Age in categories", "Person years across sex"),
                 (daps_perc) := round(.SD / as.numeric(total_pop) * 100, 3), .SDcols = daps]

table2 <- table2[a == "Person years across age categories",
                 (daps_perc) := round(.SD / as.numeric(pt_total) * 100, 3), .SDcols = daps]
setnames(table2, "a", " ")
