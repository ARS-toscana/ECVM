#---------------------------------------------------------------
# FLOWCHART 

# input: D3_selection_criteria
# output: flowchart (export to csv),  D4_study_population.RData

print('FLOWCHART')

#USE THE FUNCTION CREATEFLOWCHART TO SELECT THE SUBJECTS IN POPULATION

# subpopulations_non_empty <- c()
D4_study_source_population <- vector(mode="list")
D4_study_population <- vector(mode="list")
# if (this_datasource_has_subpopulations == TRUE){ 
#   D4_study_population <- vector(mode="list")
# }

load(paste0(dirtemp,"D3_selection_criteria_doses.RData"))



selected_population <- CreateFlowChart(
  dataset = D3_selection_criteria_doses,
  listcriteria = c("sex_or_birth_date_missing", "birth_date_absurd", "no_observation_period", "death_before_study_entry", "no_observation_period_including_study_start"),
  flowchartname = "Flowchart_basic_exclusion_criteria")

suppressWarnings(
  if(!(file.exists(direxp))) {dir.create(file.path(direxp))}
)
suppressWarnings(
  if(!(file.exists(diroutput))) {dir.create(file.path(diroutput))}
)

fwrite(Flowchart_basic_exclusion_criteria, paste0(direxp,"Flowchart_basic_exclusion_criteria.csv"))

D4_study_source_population <- unique(selected_population)
save(D4_study_source_population,file = paste0(diroutput,"D4_study_source_population.RData"))


selected_population_all_filter <- CreateFlowChart(
  dataset = selected_population[,.(person_id, sex, date_of_birth, date_of_death, insufficient_run_in)],
  listcriteria = c("insufficient_run_in"),
  flowchartname = "Flowchart_exclusion_criteria")

fwrite(Flowchart_exclusion_criteria, paste0(direxp,"Flowchart_exclusion_criteria.csv"))

D4_study_population <- unique(selected_population_all_filter)
save(D4_study_population,file = paste0(diroutput, "D4_study_population.RData"))

# rm(PERSONS, OBSERVATION_PERIODS)
rm(D3_selection_criteria_doses, D4_study_population, D4_study_source_population,
   Flowchart_basic_exclusion_criteria, Flowchart_exclusion_criteria, selected_population)



