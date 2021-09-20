#COHORT B
load(paste0(dirtemp, "D4_population_cohort_b.RData"))
load(paste0(dirtemp,"D3_events_ALL_OUTCOMES.RData"))
load(paste0(dirtemp,"list_outcomes_observed.RData"))

list_outcomes_MIS <- c("MIS_narrow","MIS_broad")

for (subpop in subpopulations_non_empty) {  
  print(subpop)
  start_persontime_studytime = "20200101"
  
  if (this_datasource_has_subpopulations == TRUE){ 
    D4_population_cohort_b <- D4_population_cohort_b[[subpop]]
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES[[subpop]]
    intersect(list_outcomes_observed[[subpop]],list_outcomes_MIS)
    list_outcomes <- list_outcomes_observed[[subpop]]
  }else{
    D4_population_cohort_b <- D4_population_cohort_b
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES
    list_outcomes <-intersect(list_outcomes_observed,list_outcomes_MIS)
  }
}

endyear<- substr(D4_population_cohort_b[,max(study_exit_date_MIS_b)], 1, 4)
end_persontime_studytime<-as.character(paste0(endyear,"1231"))

Output_file<-CountPersonTime(
  Dataset_events = events_ALL_OUTCOMES,
  Dataset = D4_population_cohort_b,
  Person_id = "person_id",
  Start_study_time = start_persontime_studytime,
  End_study_time = end_persontime_studytime,
  Start_date = "start_date_of_period",
  End_date = "end_date_of_period",
  #Birth_date = "date_of_birth",
  Strata = c("sex","ageband_at_study_entry_b"),
  Name_event = "name_event",
  Date_event = "date_event",
  #Age_bands = c(0,19,29,39,49,59,69,79),
  Increment="year",
  Outcomes =  list_outcomes, 
  #Unit_of_age = "year",
  #include_remaning_ages = T,
  Aggregate = T
)

D4_persontime_cohort_b<-Output_file
save(D4_persontime_cohort_b, file = paste0(dirtemp, "D4_persontime_cohort_b.RData"))

for (subpop in subpopulations_non_empty){
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  col<-colnames(D4_persontime_cohort_b)[-(1:6)]
  temp<-paste0(col,"=5")
  temp2<-paste("c(",paste(temp, collapse = ','),")")
  suppressWarnings(
    DRE_Treshold(
      Inputfolder = thisdirexp,
      Outputfolder = thisdirsmallcountsremoved,
      Delimiter = ",",
      Varlist = c(eval(parse(text=(temp2)))),
      FileContains = "D4_persontime_cohort_b"
    )
  )
}

#COHORT C
load(paste0(dirtemp, "D4_population_cohort_c.RData"))

for (subpop in subpopulations_non_empty) {  
  print(subpop)
  start_persontime_studytime = "20200101"
  
  if (this_datasource_has_subpopulations == TRUE){ 
    D4_population_cohort_c <- D4_population_cohort_c[[subpop]]
  }else{
    D4_population_cohort_c <- D4_population_cohort_c
  }
}

endyear<- substr(D4_population_cohort_c[,max(study_exit_date_MIS_c)], 1, 4)
end_persontime_studytime<-as.character(paste0(endyear,"1231"))


Output_file<-CountPersonTime(
  Dataset_events = events_ALL_OUTCOMES,
  Dataset = D4_population_cohort_c,
  Person_id = "person_id",
  Start_study_time = start_persontime_studytime,
  End_study_time = end_persontime_studytime,
  Start_date = "start_date_of_period",
  End_date = "end_date_of_period",
  #Birth_date = "date_of_birth",
  Strata = c("sex","ageband_at_study_entry_c"),
  Name_event = "name_event",
  Date_event = "date_event",
  #Age_bands = c(0,19,29,39,49,59,69,79),
  Increment="year",
  Outcomes =  list_outcomes, 
  #Unit_of_age = "year",
  #include_remaning_ages = T,
  Aggregate = T
)

D4_persontime_cohort_c<-Output_file
save(D4_persontime_cohort_c, file = paste0(dirtemp, "D4_persontime_cohort_c.RData"))

for (subpop in subpopulations_non_empty){
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  col<-colnames(D4_persontime_cohort_c)[-(1:6)]
  temp<-paste0(col,"=5")
  temp2<-paste("c(",paste(temp, collapse = ','),")")
  suppressWarnings(
    DRE_Treshold(
      Inputfolder = thisdirexp,
      Outputfolder = thisdirsmallcountsremoved,
      Delimiter = ",",
      Varlist = c(eval(parse(text=(temp2)))),
      FileContains = "D4_persontime_cohort_c"
    )
  )
}

#COHORT D
load(paste0(dirtemp, "D4_population_cohort_d.RData"))

start_persontime_studytime = "20210101"
endyear<- substr(D4_population_cohort_c[,max(study_exit_date_MIS_d)], 1, 4)
end_persontime_studytime<-as.character(paste0(endyear,"1231"))


Output_file<-CountPersonTime(
  Dataset_events = events_ALL_OUTCOMES,
  Dataset = D4_population_cohort_d,
  Person_id = "person_id",
  Start_study_time = start_persontime_studytime,
  End_study_time = end_persontime_studytime,
  Start_date = "start_date_of_period",
  End_date = "end_date_of_period",
  #Birth_date = "date_of_birth",
  Strata = c("sex","ageband_at_1_jan_2021"),
  Name_event = "name_event",
  Date_event = "date_event",
  #Age_bands = c(0,19,29,39,49,59,69,79),
  Increment="year",
  Outcomes =  list_outcomes, 
  #Unit_of_age = "year",
  #include_remaning_ages = T,
  Aggregate = T
)

D4_persontime_cohort_d<-Output_file
save(D4_persontime_cohort_d, file = paste0(dirtemp, "D4_persontime_cohort_d.RData"))

for (subpop in subpopulations_non_empty){
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  col<-colnames(D4_persontime_cohort_d)[-(1:6)]
  temp<-paste0(col,"=5")
  temp2<-paste("c(",paste(temp, collapse = ','),")")
  suppressWarnings(
    DRE_Treshold(
      Inputfolder = thisdirexp,
      Outputfolder = thisdirsmallcountsremoved,
      Delimiter = ",",
      Varlist = c(eval(parse(text=(temp2)))),
      FileContains = "D4_persontime_cohort_d"
    )
  )
}