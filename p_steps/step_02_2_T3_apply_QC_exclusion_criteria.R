load(paste0(dirtemp, "D3_concepts_QC_criteria"))

selected_population <- CreateFlowChart(
  dataset = paste0("D3_concepts_QC_criteria"),
  listcriteria = c("qc_1_date", "qc_1_dose", "qc_dupl", "qc_2_date", "qc_2_dose", "qc_manufacturer",
                   "qc_mult_date_for_dose", "qc_3_date"),
  flowchartname = "Flowchart_qualitychecks_criteria")

suppressWarnings(
  if(!(file.exists(direxp))) {dir.create(file.path(direxp))}
)
suppressWarnings(
  if(!(file.exists(diroutput))) {dir.create(file.path(diroutput))}
)

fwrite(Flowchart_QC_criteria, paste0(direxp,"Flowchart_QC_criteria.csv"))

D3_concepts_QC <- unique(selected_population)[, .(person_id, date, vx_dose, vx_manufacturer)]
save(D3_concepts_QC.RData,file = paste0(diroutput, "D3_concepts_QC.RData"))

# rm(PERSONS, OBSERVATION_PERIODS)
rm(selected_population, D3_concepts_QC_criteria, Flowchart_QC_criteria, D3_concepts_QC)