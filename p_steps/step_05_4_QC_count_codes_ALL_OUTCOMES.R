# COUNT CODES PER ALL OUTCOMES IN THE STUDY POPULATION
# input: D4_study_population, D3_events_ALL_OUTCOMES 
# output: QC_code_counts_in_study_population_OUTCOME_YYYY (exported to csv)
# parameters: list_outcomes_observed_only_diagnosis

#-----------------------------------------------

print("CREATE CODE COUNT FOR ALL OUTCOMES PER YEAR IN THE STUDY POPULATION")


load(paste0(dirtemp,"list_outcomes_observed_for_QC.RData")) 
load(paste0(dirtemp,"D3_events_ALL_OUTCOMES.RData")) 
load(paste0(diroutput,"D4_study_population.RData")) 

start_persontime_studytime = as.character(paste0(study_years[1],"0101"))
end_persontime_studytime = as.character(paste0(study_years[length(study_years)],"1231"))

load(paste0(dirpargen,"subpopulations_non_empty.RData"))


FirstJan <- list()
conditionYear <- list()
for (year in study_years) {
  FirstJan[[year]] <- as.Date(as.character(paste0(year,"0101")), date_format)
  conditionYear[[year]] <- paste0("date_event >= study_entry_date & date_event <= as.Date('",FirstJan[[year]],"')+365 & date_event >= as.Date('",FirstJan[[year]],"')")
}
if (this_datasource_has_subpopulations == TRUE){ 
  list_outcomes <- c()
  for (subpop in subpopulations_non_empty) {  
    list_outcomes <- c(list_outcomes, list_outcomes_observed_for_QC[[subpop]])
  }
  list_outcomes <- unique(list_outcomes)
}else{
  list_outcomes <- list_outcomes_observed_for_QC
}

for (outcome in list_outcomes) {
  print(outcome)
  outcome_code_counts <- vector(mode = 'list')
  for (subpop in subpopulations_non_empty) {  
    if (this_datasource_has_subpopulations == TRUE){ 
      study_population <- D4_study_population[[subpop]]
      events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES[[subpop]] 
      admissible_outcomes <- list_outcomes_observed_for_QC[[subpop]]
    }else{
      study_population <- as.data.table(D4_study_population)
      events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES
      admissible_outcomes <- list_outcomes_observed_for_QC
    }
    if (outcome %in% admissible_outcomes){
      for (year in study_years) {
        print(paste(outcome,year,subpop))
        nameobject <- paste0("QC_code_counts_in_study_population",outcome,"_",year)
    temp <- MergeFilterAndCollapse(list(events_ALL_OUTCOMES[name_event == outcome,]),
                                          key = 'person_id',
                                          condition = conditionYear[[year]],
                                          datasetS = study_population,
                                          additionalvar = list(list(c("n"),1)),
                                          strata=c( "meaning_of_first_event", "coding_system_of_code_first_event", "code_first_event"),
                                          summarystat = list(
                                            list(c("count"),"n")
                                            )
                                          )
    
    thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
    fwrite(temp, file = paste0(thisdirexp,nameobject,".csv"))
    if (this_datasource_has_subpopulations == TRUE){ 
      outcome_code_counts[[subpop]] <- temp
    }else{
      outcome_code_counts <-temp
    }
    assign(nameobject, outcome_code_counts)
    save(nameobject, file = paste0(diroutput,nameobject,".RData"),list = nameobject )
    rm(nameobject, list = nameobject )
      }
    }
  }
}

for (subpop in subpopulations_non_empty){
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  suppressWarnings(
    DRE_Treshold(
      Inputfolder = thisdirexp,
      Outputfolder = thisdirsmallcountsremoved,
      Delimiter = ",",
      Varlist = c(count_n=5),
      FileContains = "QC_code_counts_in_"
    )
  )
}
rm(D3_events_ALL_OUTCOMES,D4_study_population,study_population,events_ALL_OUTCOMES)
