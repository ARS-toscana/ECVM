# COUNT PERSON TIME PER COVID
#-----------------------------------------------
#To estimate the weekly incidence rates of COVID-19 (overall and by severity level) in 2020 by data source

# input: D3_studyweeks, D3_algorithm_covid ,list_outcomes_observed_COVID
# output: D4_persontime_benefit_week (exported to csv)


print("COUNT PERSON TIME PER COVID by week benefits")

load(paste0(dirtemp,paste0("D3_outcomes_covid.RData")))
load(paste0(dirtemp,"D3_studyweeks.RData"))
load(paste0(dirpargen,paste0("list_outcomes_observed_COVID.RData")))

D4_persontime_benefit_week <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {  
  print(subpop)
  start_week=seq.Date(as.Date("20200106","%Y%m%d"),Sys.Date(),by = "week")
  
  if (this_datasource_has_subpopulations == TRUE){ 
    study_population <- D3_studyweeks[[subpop]]
    events_ALL_OUTCOMES <- D3_outcomes_covid[[subpop]]
    list_outcomes <- list_outcomes_observed_COVID[[subpop]]
  }else{
    study_population <- D3_studyweeks
    events_ALL_OUTCOMES <- D3_outcomes_covid
    list_outcomes <- list_outcomes_observed_COVID
  }
  # last_event<-events_ALL_OUTCOMES[,max(date_event)]
  # if (last_event>study_end)  last_event<-study_end
  # 
  # start_week=start_week[start_week<last_event-7]
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
      Start_date = "study_entry_date",
      End_date = "study_exit_date",
      #Birth_date = "date_of_birth",
      Strata = c("sex","Birthcohort_persons","Dose","type_vax"),
      Name_event = "name_event",
      Date_event = "date_event",
      #Age_bands = c(0,19,29,39,49,59,69,79),
      Increment="week",
      Outcomes =  list_outcomes, 
      # Unit_of_age = "year",
      # include_remaning_ages = T,
      Aggregate = T
    )
    )
    if (i==1) {
      persontime_benefit_week<-get(paste0("Output_file",start_week[i]))
      rm(list=paste0("Output_file",start_week[i]))
    }else{
      persontime_benefit_week<-rbind(persontime_benefit_week,get(paste0("Output_file",start_week[i])),fill=TRUE)
      rm(list=paste0("Output_file",start_week[i]))
    }
  }
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  fwrite(persontime_benefit_week,file=paste0(thisdirexp,"D4_persontime_benefit_week.csv"))
  if (this_datasource_has_subpopulations == TRUE){ 
    D4_persontime_benefit_week[[subpop]] <- persontime_benefit_week
  }else{
    D4_persontime_benefit_week <- persontime_benefit_week
  }
}

save(D4_persontime_benefit_week,file=paste0(diroutput,"D4_persontime_benefit_week.RData"))


for (subpop in subpopulations_non_empty){
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  col<-colnames(persontime_benefit_week)[-(1:3)]
  temp<-paste0(col,"=5")
  temp2<-paste("c(",paste(temp, collapse = ','),")")
  suppressWarnings(
    DRE_Treshold(
      Inputfolder = thisdirexp,
      Outputfolder = thisdirsmallcountsremoved,
      Delimiter = ",",
      Varlist = c(eval(parse(text=(temp2)))),
      FileContains = "D4_persontime_benefit_week"
    )
  )
}
# rm(list = nameobject)
rm(D3_studyweeks,persontime_benefit_week,study_population,events_ALL_OUTCOMES)
