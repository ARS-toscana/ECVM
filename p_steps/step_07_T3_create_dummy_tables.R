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
flow_source <- rbind(flow_source, flow_source_totals)
flow_source <- rbind(empty_table_1, flow_source, fill = T)
flow_source <- flow_source[, lapply(.SD, max, na.rm = T), by = a]

correct_col_names <- names(empty_table_1)[2:length(names(empty_table_1))]
correct_row_names <- empty_table_1$a[2:5]
table_1a <- flow_source[a == "end population",
                        (correct_col_names) := flow_source[a == "Start population", 2:5] -
                          colSums(flow_source[a %in% correct_row_names, 2:5])]
setnames(table_1a, "a", " ")






empty_table_2 <- create_empty_table_1b()

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
ageband_studystart <- ageband_studystart[, TOTAL := sum(AgeCat_019, AgeCat_2029, AgeCat_3039, AgeCat_4049, AgeCat_5059,
                                                        AgeCat_6069, AgeCat_7079, get("Agecat_80+"))]
ageband_studystart <- ageband_studystart[.(Datasource = c("TEST", "PHARMO", "CPRD", "BIFAP"),
                             to = c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP")),
                           on = "Datasource", Datasource := i.to]
total_pop <- ageband_studystart[, a := "Study population"][, Parameters := "N"][, .(a, Parameters, Datasource, TOTAL)]
total_pop <- dcast(total_pop, a + Parameters ~ Datasource, value.var = 'TOTAL')
total_pop <- total_pop[, c("NL_PHARMO", "UK_CPRD", "ES_BIFAP") := 0]
total_pop <- total_pop[, c("a", "Parameters", "Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP")]


age_studystart <- fread(paste0(direxp, "D4_descriptive_dataset_age_studystart.csv"))
age_studystart <- age_studystart[.(Datasource = c("TEST", "PHARMO", "CPRD", "BIFAP"),
                                   to = c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP")),
                                 on = "Datasource", Datasource := i.to]
pt_total <- age_studystart[, a := "Person years of follow-up"][, Parameters := "PY"][, .(a, Parameters, Datasource, Followup)]
pt_total <- dcast(pt_total, a + Parameters ~ Datasource, value.var = 'Followup')
pt_total <- pt_total[, c("NL_PHARMO", "UK_CPRD", "ES_BIFAP") := 0]
pt_total <- pt_total[, c("a", "Parameters", "Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP")]


age_start <- age_studystart[, a := "Age in years"][, .(a, Datasource, Age_min, Age_P25, Age_P50, Age_mean,
                                                       Age_p75, Age_max)]
age_start <- rbind(age_start, age_start, age_start, age_start)
age_start[2, 2] <- "NL_PHARMO"
age_start[3, 2] <- "UK_CPRD"
age_start[4, 2] <- "ES_BIFAP"
age_start <- melt(age_start, id.vars = c("a", "Datasource"),
                  measure.vars = c("Age_min", "Age_P25", "Age_P50", "Age_mean", "Age_p75", "Age_max"),
                  variable.name = "Parameters")
age_start <- dcast(age_start, a + Parameters  ~ Datasource, value.var = 'value')
age_start <- age_start[.(Parameters = c("Age_min", "Age_P25", "Age_P50", "Age_mean", "Age_p75", "Age_max"),
                         to = c("Min", "P25", "P50", "Mean", "P75", "Max")),
                       on = "Parameters", Parameters := i.to]


ageband_start <- ageband_studystart[, a := "Age in categories"][, c("a", "Datasource", "AgeCat_019", "AgeCat_2029", "AgeCat_3039",
                                                                    "AgeCat_4049", "AgeCat_5059", "AgeCat_6069",
                                                                    "AgeCat_7079", "Agecat_80+")]

ageband_start <- rbind(ageband_start, ageband_start, ageband_start, ageband_start)
ageband_start[2, 2] <- "NL_PHARMO"
ageband_start[3, 2] <- "UK_CPRD"
ageband_start[4, 2] <- "ES_BIFAP"
ageband_start <- melt(ageband_start, id.vars = c("a", "Datasource"),
                      measure.vars = c("AgeCat_019", "AgeCat_2029", "AgeCat_3039", "AgeCat_4049", "AgeCat_5059",
                                       "AgeCat_6069", "AgeCat_7079", "Agecat_80+"),
                      variable.name = "Parameters")
ageband_start <- dcast(ageband_start, a + Parameters  ~ Datasource, value.var = 'value')
ageband_start <- ageband_start[.(Parameters = c("AgeCat_019", "AgeCat_2029", "AgeCat_3039", "AgeCat_4049", "AgeCat_5059",
                                                "AgeCat_6069", "AgeCat_7079", "Agecat_80+"),
                                 to = c("0-19", "20-29", "30-39", "40-49", "50-59", "60-69", "70-79", ">=80")),
                               on = "Parameters", Parameters := i.to]


followup_studystart <- fread(paste0(direxp, "D4_followup_fromstudystart.csv"))
followup_studystart <- followup_studystart[.(Datasource = c("TEST", "PHARMO", "CPRD", "BIFAP"),
                                             to = c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP")),
                                           on = "Datasource", Datasource := i.to]
followup_start <- followup_studystart[, a := "Person years across age categories"][, .(a, Datasource, Followup_0119,
                                                                                       Followup_2029, Followup_3039,
                                                                                       Followup_4049, Followup_5059,
                                                                                       Followup_6069, Followup_7079,
                                                                                       Followup_80)]
followup_start <- rbind(followup_start, followup_start, followup_start, followup_start)
followup_start[2, 2] <- "NL_PHARMO"
followup_start[3, 2] <- "UK_CPRD"
followup_start[4, 2] <- "ES_BIFAP"
followup_start <- melt(followup_start, id.vars = c("a", "Datasource"),
                  measure.vars = c("Followup_0119", "Followup_2029", "Followup_3039", "Followup_4049", "Followup_5059",
                                   "Followup_6069", "Followup_7079", "Followup_80"),
                  variable.name = "Parameters")
followup_start <- dcast(followup_start, a + Parameters  ~ Datasource, value.var = 'value')
followup_start <- followup_start[.(Parameters = c("Followup_0119", "Followup_2029", "Followup_3039", "Followup_4049",
                                                  "Followup_5059", "Followup_6069", "Followup_7079", "Followup_80"),
                                 to = c("0-19", "20-29", "30-39", "40-49", "50-59", "60-69", "70-79", ">=80")),
                               on = "Parameters", Parameters := i.to]


sex_studystart <- fread(paste0(direxp, "D4_descriptive_dataset_sex_studystart.csv"))
sex_studystart <- sex_studystart[.(Datasource = c("TEST", "PHARMO", "CPRD", "BIFAP"),
                                   to = c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP")),
                                 on = "Datasource", Datasource := i.to]
sex_start <- sex_studystart[, a := "Person years across sex"][, .(a, Datasource, Sex_female, Sex_male)]
sex_start <- rbind(sex_start, sex_start, sex_start, sex_start)
sex_start[2, 2] <- "NL_PHARMO"
sex_start[3, 2] <- "UK_CPRD"
sex_start[4, 2] <- "ES_BIFAP"
sex_start <- melt(sex_start, id.vars = c("a", "Datasource"),
                  measure.vars = c("Sex_female", "Sex_male"),
                  variable.name = "Parameters")
sex_start <- dcast(sex_start, a + Parameters  ~ Datasource, value.var = 'value')

sex_start <- sex_start[.(Parameters = c("Sex_male", "Sex_female"), to = c("Male", "Female")),
                       on = "Parameters", Parameters := i.to]

table2 <- rbind(total_pop, pt_total, age_start, ageband_start, followup_start, sex_start)
table2 <- table2[, c("Italy_ARS_perc", "NL_PHARMO_perc", "UK_CPRD_perc", "ES_BIFAP_perc") := character(nrow(table2))]
table2 <- table2[a %in% c("Age in categories", "Person years across sex"),
                 c("Italy_ARS_perc", "NL_PHARMO_perc",
                   "UK_CPRD_perc", "ES_BIFAP_perc") := list(as.character(round(Italy_ARS / as.numeric(table2[a == "Study population", .(Italy_ARS)]), 3)),
                                                            as.character(round(NL_PHARMO / as.numeric(table2[a == "Study population", .(NL_PHARMO)]), 3)),
                                                            as.character(round(UK_CPRD / as.numeric(table2[a == "Study population", .(UK_CPRD)]), 3)),
                                                            as.character(round(ES_BIFAP / as.numeric(table2[a == "Study population", .(ES_BIFAP)]), 3)))]
table2 <- table2[a == "Person years across age categories",
                 c("Italy_ARS_perc", "NL_PHARMO_perc",
                   "UK_CPRD_perc", "ES_BIFAP_perc") := list(as.character(round(Italy_ARS / as.numeric(table2[a == "Person years of follow-up", .(Italy_ARS)]), 3)),
                                                            as.character(round(NL_PHARMO / as.numeric(table2[a == "Person years of follow-up", .(NL_PHARMO)]), 3)),
                                                            as.character(round(UK_CPRD / as.numeric(table2[a == "Person years of follow-up", .(UK_CPRD)]), 3)),
                                                            as.character(round(ES_BIFAP / as.numeric(table2[a == "Person years of follow-up", .(ES_BIFAP)]), 3)))]
print(table2)
