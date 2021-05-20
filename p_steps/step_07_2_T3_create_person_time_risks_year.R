# COUNT PERSON TIME PER COVID
#-----------------------------------------------
#To estimate the weekly incidence rates of risks in 2020 by data source

# input: D3_studyweeks, D3_events_ALL_OUTCOMES.RData ,list_outcomes_observed.RData
# output: D4_persontime_risk_year (exported to csv)


print("COUNT PERSON TIME by week for risks")

load(paste0(dirtemp,"list_outcomes_observed.RData"))
load(paste0(dirtemp,"D3_events_ALL_OUTCOMES.RData"))
load(paste0(dirtemp,"D3_studyweeks.RData"))


D4_persontime_risk_year <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {  
  print(subpop)
  start_persontime_studytime = "20200101"
  
  if (this_datasource_has_subpopulations == TRUE){ 
    study_population <- D3_studyweeks[[subpop]]
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES[[subpop]]
    list_outcomes <- list_outcomes_observed[[subpop]]
  }else{
    study_population <- D3_studyweeks
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES
    list_outcomes <- list_outcomes_observed
  }
}
  
  
  endyear<- substr(study_population[,max(study_exit_date)], 1, 4)
  end_persontime_studytime<-as.character(paste0(endyear,"1231"))
  

  Output_file<-CountPersonTime(
      Dataset_events = events_ALL_OUTCOMES,
      Dataset = study_population,
      Person_id = "person_id",
      Start_study_time = start_persontime_studytime,
      End_study_time = end_persontime_studytime,
      Start_date = "study_entry_date",
      End_date = "study_exit_date",
      #Birth_date = "date_of_birth",
      Strata = c("sex","Birthcohort_persons","Dose","type_vax","fup"),
      Name_event = "name_event",
      Date_event = "date_event",
      #Age_bands = c(0,19,29,39,49,59,69,79),
      Increment="year",
      Outcomes =  list_outcomes, 
      Unit_of_age = "year",
      include_remaning_ages = T,
      Aggregate = T
    )

  D4_persontime_risk_year <- Output_file
save(D4_persontime_risk_year,file=paste0(diroutput,"D4_persontime_risk_year.RData"))


for (subpop in subpopulations_non_empty){
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  col<-colnames(persontime_risk_year)[-(1:3)]
  temp<-paste0(col,"=5")
  temp2<-paste("c(",paste(temp, collapse = ','),")")
  suppressWarnings(
    DRE_Treshold(
      Inputfolder = thisdirexp,
      Outputfolder = thisdirsmallcountsremoved,
      Delimiter = ",",
      Varlist = c(eval(parse(text=(temp2)))),
      FileContains = "D4_persontime_risk_year"
    )
  )
}
# rm(list = nameobject)
rm(D3_studyweeks,persontime_risk_year,study_population,events_ALL_OUTCOMES,Output_file)
