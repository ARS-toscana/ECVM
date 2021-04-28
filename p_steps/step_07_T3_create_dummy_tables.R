flow_source <- fread(paste0(direxp, "Flowchart_basic_exclusion_criteria.csv"))
flow_study <- fread(paste0(direxp, "Flowchart_exclusion_criteria.csv"))

flow_source <- flow_source[, Datasource := "ARS"][, TOTAL := sum(N), by = "Datasource"]
flow_study <- flow_study[, Datasource := "ARS"]
names(flow_source)
names(flow_study)
n6 <- numeric(6)
n4 <- numeric(4)
row_names_1 <- c("Start population", "A_sex_or_birth_date_missing", "C_no_observation_period",
               "D_death_before_study_entry", "E_no_observation_period_including_study_start", "end population")
row_names_2 <- c("Start population", "B_birth_date_absurd", "A_insufficient_run_in", "end population")
empty_table_1 <- data.table(a = row_names_1, Italy_ARS = n6, NL_PHARMO = n6, UK_CPRD = n6, ES_BIFAP = n6)
empty_table_2 <- data.table(a = row_names_2, Italy_ARS = n4, NL_PHARMO = n4, UK_CPRD = n4, ES_BIFAP = n4)

fwrite(empty_table_1, paste0(direxp, "test.csv"))

flow_source <- flow_source[.(Datasource = c("ARS", "PHARMO", "CPRD", "BIFAP"),
                             to = c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP")),
                           on = "Datasource", Datasource := i.to]
flow_study <- flow_study[.(Datasource = c("ARS", "PHARMO", "CPRD", "BIFAP"),
                           to = c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP")),
                         on = "Datasource", Datasource := i.to]

for (row_id in seq_len(nrow(flow_source))) {
  if (sum(flow_source[row_id, 1:5]) == 5) {
    empty_table_1[a == "Start population", flow_source[row_id, Datasource]] <- flow_source[row_id, TOTAL]
  }
  for (col_name in names(flow_source)) {
    if (flow_source[row_id, ..col_name] == 0) {
      empty_table_1[a == col_name, flow_source[row_id, Datasource]] <- flow_source[row_id, N]
      next
    }
  }
}

correct_col_names <- names(empty_table_1)[2:length(names(empty_table_1))]
table_1a <- empty_table_1[a == "end population", (correct_col_names) := empty_table_1[1, 2:5] - colSums(empty_table_1[2:5, 2:5])]

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
