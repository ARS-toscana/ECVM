# COUNT PERSON TIME PER COVID
#-----------------------------------------------
#To estimate the weekly incidence rates of risks in 2020 by data source

# input: D3_vaxweeks_including_not_vaccinated, D3_events_ALL_OUTCOMES.RData ,list_outcomes_observed.RData
# output: D4_persontime_risk_week (exported to csv)


print("COUNT PERSON TIME by week for risks")

load(paste0(dirtemp,"list_outcomes_observed.RData"))
load(paste0(dirtemp,"D3_events_ALL_OUTCOMES.RData"))
load(paste0(dirtemp,"D3_vaxweeks_including_not_vaccinated.RData"))


D4_persontime_risk_week <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {  
  print(subpop)
  start_week=seq.Date(as.Date("20200106","%Y%m%d"),Sys.Date(),by = "week")
  
  if (this_datasource_has_subpopulations == TRUE){ 
    study_population <- D3_vaxweeks_including_not_vaccinated[[subpop]]
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES[[subpop]]
    list_outcomes <- list_outcomes_observed[[subpop]]
  }else{
    study_population <- D3_vaxweeks_including_not_vaccinated
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES
    list_outcomes <- list_outcomes_observed
  }

  
  max_exit<-study_population[,max(study_exit_date)]
  last_event<-events_ALL_OUTCOMES[,max(date_event)]
  if (last_event<ymd("20200101")) {
    next
  }
  end_persontime_studytime<-min(max_exit,last_event)
  start_week=start_week[start_week<=end_persontime_studytime]
  end_week=start_week+6
  start_week=gsub("-","", start_week)
  end_week=gsub("-","", end_week)
  
  for (i in 1:length(start_week)){
    start_persontime_studytime = start_week[i]
    end_persontime_studytime = end_week[i]
    nameoutput <- paste0("Output_file",start_week[i])
    print(nameoutput)
    assign(nameoutput,CountPersonTime(
      Dataset_events = events_ALL_OUTCOMES,
      Dataset = study_population,
      Person_id = "person_id",
      Start_study_time = start_persontime_studytime,
      End_study_time = end_persontime_studytime,
      Start_date = "start_date_of_period",
      End_date = "end_date_of_period",
      #Birth_date = "date_of_birth",
      Strata = c("sex","Birthcohort_persons","Dose","type_vax"),
      Name_event = "name_event",
      Date_event = "date_event",
      #Age_bands = c(0,19,29,39,49,59,69,79),
      Increment="week",
      Outcomes =  list_outcomes, 
      Unit_of_age = "year",
      include_remaning_ages = T,
      Aggregate = T
    )
    )
    if (i==1) {
      persontime_risk_week<-get(paste0("Output_file",start_week[i]))
      rm(list=paste0("Output_file",start_week[i]))
    }else{
      persontime_risk_week<-rbind(persontime_risk_week,get(paste0("Output_file",start_week[i])),fill=TRUE)
      rm(list=paste0("Output_file",start_week[i]))
    }
  }
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  fwrite(persontime_risk_week,file=paste0(thisdirexp,"D4_persontime_risk_week.csv"))
  if (this_datasource_has_subpopulations == TRUE){ 
    D4_persontime_risk_week[[subpop]] <- persontime_risk_week
  }else{
    D4_persontime_risk_week <- persontime_risk_week
  }
}

save(D4_persontime_risk_week,file=paste0(diroutput,"D4_persontime_risk_week.RData"))


for (subpop in subpopulations_non_empty){
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  col<-colnames(persontime_risk_week)[-(1:3)]
  temp<-paste0(col,"=5")
  temp2<-paste("c(",paste(temp, collapse = ','),")")
  suppressWarnings(
    DRE_Treshold(
      Inputfolder = thisdirexp,
      Outputfolder = thisdirsmallcountsremoved,
      Delimiter = ",",
      Varlist = c(eval(parse(text=(temp2)))),
      FileContains = "D4_persontime_risk_week"
    )
  )
}
# rm(list = nameobject)
rm(D3_vaxweeks_including_not_vaccinated,persontime_risk_week,study_population,events_ALL_OUTCOMES)
