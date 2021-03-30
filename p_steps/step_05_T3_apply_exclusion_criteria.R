#---------------------------------------------------------------
# FLOWCHART 

# input: D3_selection_criteria
# output: flowchart (export to csv),  D4_study_population.RData

print('FLOWCHART')

#USE THE FUNCTION CREATEFLOWCHART TO SELECT THE SUBJECTS IN POPULATION

# subpopulations_non_empty <- c()

D4_study_population <- vector(mode="list")
# if (this_datasource_has_subpopulations == TRUE){ 
#   D4_study_population <- vector(mode="list")
# }

load(paste0(dirtemp,"D3_selection_criteria_doses.RData"))

selected_population <- CreateFlowChart(
  dataset = D3_selection_criteria_doses,
  listcriteria = c("sex_or_birth_date_missing", "birth_date_absurd", "no_observation_periods", "insufficient_run_in","observation_periods_not_overlapping", "death_before_study_entry"),
  flowchartname = "FlowChart")

suppressWarnings(
  if(!(file.exists(direxp))) {dir.create(file.path(direxp))}
)
suppressWarnings(
  if(!(file.exists(diroutput))) {dir.create(file.path(diroutput))}
)

fwrite(FlowChart, paste0(direxp,"FlowChart.csv"))

# for (subpop in subpopulations[[thisdatasource]]){ 
#   load(paste0(dirtemp,"D3_selection_criteria.RData"))
#     if (this_datasource_has_subpopulations == TRUE)D3_selection_criteria <- D3_selection_criteria[[subpop]]
#   
#   selected_population <- CreateFlowChart(
#     dataset = D3_selection_criteria,
#     listcriteria = c("sex_or_birth_date_missing","birth_date_absurd","no_op_start_date","death_before_study_entry","observed_time_no_overlap","insufficient_run_in"),
#     flowchartname = "FlowChart" )
  
  
  # # D4_study_population contains the starting information on age and days of follow up per each patient
  # selected_population <- unique(selected_population[,.(person_id,sex,date_of_birth,study_entry_date,study_exit_date)])
  # 
  # if (this_datasource_has_subpopulations == TRUE & nrow(selected_population)>0){
  #   subpopulations_non_empty <- c(subpopulations_non_empty,subpop)
  #   
  #   D4_study_population[[subpop]] <- selected_population
  #   fwrite(FlowChart, paste0(direxpsubpop[[subpop]],"FlowChart.csv"))  }  
  # 
  # if (this_datasource_has_subpopulations == FALSE & nrow(selected_population)>0){ 
  #   fwrite(FlowChart, paste0(direxp,"FlowChart.csv"))
  #   D4_study_population <- selected_population
  #   subpopulations_non_empty <- c(subpopulations_non_empty,subpop)
  #   }
# }
# save(subpopulations_non_empty,file=paste0(dirpargen,"subpopulations_non_empty.RData"))
D4_study_population_doses <- unique(selected_population)
save(D4_study_population_doses,file=paste0(diroutput,"D4_study_population_doses.RData"))

# rm(PERSONS, OBSERVATION_PERIODS)
rm(D3_selection_criteria_doses,D4_study_population_doses,FlowChart, selected_population)


# mask small counts
# for (subpop in subpopulations_non_empty){ 
#   col <- c('N')  
#   temp<-paste0(col,"=5")  
#   temp2<-paste("c(",paste(temp, collapse = ','),")")
#   thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
#   thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
#   suppressWarnings(
#     DRE_Treshold(
#       Inputfolder = thisdirexp,
#       Outputfolder = thisdirsmallcountsremoved,
#       Delimiter = ",",
#       Varlist = c(eval(parse(text=(temp2)))),
#       FileContains = "FlowChart" 
#     )
#   )
# }

