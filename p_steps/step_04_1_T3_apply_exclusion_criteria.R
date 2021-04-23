#---------------------------------------------------------------
# FLOWCHART 

# input: D3_selection_criteria
# output: flowchart (export to csv),  D4_study_population.RData

print('FLOWCHART')

#USE THE FUNCTION CREATEFLOWCHART TO SELECT THE SUBJECTS IN POPULATION

# subpopulations_non_empty <- c()
# 
# 
# if (this_datasource_has_subpopulations == TRUE){ 
#   D4_study_population <- vector(mode="list")
#   D4_study_source_population <- vector(mode="list")
# }
# 
# for (subpop in subpopulations[[thisdatasource]]){ 
#   print(subpop)
  load(paste0(dirtemp,"D3_selection_criteria.RData"))
  # if (this_datasource_has_subpopulations == TRUE)D3_selection_criteria <- D3_selection_criteria[[subpop]]
  
  selected_population <- CreateFlowChart(
    dataset = D3_selection_criteria,
    listcriteria = c("sex_or_birth_date_missing", "birth_date_absurd", "no_observation_period", "death_before_study_entry", "no_observation_period_including_study_start"),
    flowchartname = "Flowchart_basic_exclusion_criteria")
  
  suppressWarnings(
    if(!(file.exists(direxp))) {dir.create(file.path(direxp))}
  )
  suppressWarnings(
    if(!(file.exists(diroutput))) {dir.create(file.path(diroutput))}
  )
  
  
  to_study_pop <- unique(selected_population)[, .(person_id, sex, date_of_birth, date_of_death,study_entry_date,start_follow_up, study_exit_date, insufficient_run_in)]
  
  D4_study_source_population <- to_study_pop[, .(person_id, sex, date_of_birth, date_of_death, study_entry_date,start_follow_up, study_exit_date)]
  
  # if (this_datasource_has_subpopulations == TRUE & nrow(selected_population)>0){
  #   
  #   D4_study_source_population[[subpop]] <- selected_population
  #   fwrite(Flowchart_basic_exclusion_criteria, paste0(direxpsubpop[[subpop]],"Flowchart_basic_exclusion_criteria.csv"))}  
  
  # if (this_datasource_has_subpopulations == FALSE & nrow(selected_population)>0){ 
    fwrite(Flowchart_basic_exclusion_criteria, paste0(direxp,"Flowchart_basic_exclusion_criteria.csv"))
    D4_study_source_population <- selected_population
  # }
  
  
  selected_population_all_filter <- CreateFlowChart(
    dataset = selected_population[,.(person_id, sex, date_of_birth, date_of_death, study_entry_date, start_follow_up, study_exit_date, insufficient_run_in)],
    listcriteria = c("insufficient_run_in"),
    flowchartname = "Flowchart_exclusion_criteria")
  
  D4_study_population <- unique(selected_population_all_filter)[, .(person_id, sex, date_of_birth, date_of_death, study_entry_date,
                                                                    start_follow_up, study_exit_date)]
  
  # if (this_datasource_has_subpopulations == TRUE & nrow(selected_population_all_filter)>0){
  #   subpopulations_non_empty <- c(subpopulations_non_empty,subpop)
  #   
  #   D4_study_population[[subpop]] <- selected_population_all_filter
  #   fwrite(Flowchart_exclusion_criteria, paste0(direxpsubpop[[subpop]],"Flowchart_exclusion_criteria.csv"))}  
  
  # if (this_datasource_has_subpopulations == FALSE & nrow(selected_population_all_filter)>0){ 
    fwrite(Flowchart_exclusion_criteria, paste0(direxp,"Flowchart_exclusion_criteria.csv"))
    D4_study_population <- selected_population_all_filter
  # }
# }

save(D4_study_population,file = paste0(diroutput, "D4_study_population.RData"))
#save(subpopulations_non_empty,file=paste0(dirpargen,"subpopulations_non_empty.RData"))
save(D4_study_source_population,file = paste0(diroutput,"D4_study_source_population.RData"))


rm(D4_study_source_population, D4_study_population, D3_selection_criteria, Flowchart_basic_exclusion_criteria,
   Flowchart_exclusion_criteria, selected_population, to_study_pop, selected_population_all_filter)



