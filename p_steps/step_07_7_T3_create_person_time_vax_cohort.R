print("COUNT PERSON TIME by month for risks")

load(paste0(dirtemp,"list_outcomes_observed.RData"))
load(paste0(dirtemp,"D3_events_ALL_OUTCOMES.RData"))
load(paste0(dirtemp,"D3_vaxweeks_vaccin_cohort.RData"))

D4_persontime_risk_month <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {
  print(subpop)
  start_month=seq.Date(as.Date("20200101","%Y%m%d"),Sys.Date(),by = "month")
  
  if (this_datasource_has_subpopulations == TRUE){ 
    study_population <- D3_vaxweeks_vaccin_cohort[[subpop]]
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES[[subpop]]
    list_outcomes <- list_outcomes_observed[[subpop]]
  }else{
    study_population <- D3_vaxweeks_vaccin_cohort
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES
    list_outcomes <- list_outcomes_observed
  }
  
  
  max_exit<-study_population[,max(study_exit_date)]
  last_event<-events_ALL_OUTCOMES[,max(date_event)]
  if (last_event<ymd("20200101")) {
    next
  }
  end_persontime_studytime<-min(max_exit,last_event)
  start_month=start_month[start_month<=end_persontime_studytime]
  end_month=start_month %m+% months(1) - 1
  start_month=gsub("-","", start_month)
  end_month=gsub("-","", end_month)
  
  list_recurrent_outcomes <- list_outcomes[str_detect(list_outcomes, "^GENCONV_") | str_detect(list_outcomes, "^ANAPHYL_")]
  list_outcomes <- setdiff(list_outcomes, list_recurrent_outcomes)
  
  for (i in 1:length(start_month)){
    start_persontime_studytime = start_month[i]
    end_persontime_studytime = end_month[i]
    nameoutput <- paste0("Output_file",start_month[i])
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
      Strata = c("sex", "age_at_1_jan_2021"),
      Name_event = "name_event",
      Date_event = "date_event",
      #Age_bands = c(0,19,29,39,49,59,69,79),F
      Increment="month",
      Outcomes =  list_recurrent_outcomes, 
      Unit_of_age = "year",
      include_remaning_ages = T,
      Aggregate = T,
      Rec_events = T,
      Rec_period = c(rep(30, length(list_recurrent_outcomes)))
    )
    )
    if (i==1) {
      persontime_risk_month<-get(paste0("Output_file",start_month[i]))
      rm(list=paste0("Output_file",start_month[i]))
    }else{
      persontime_risk_month<-rbind(persontime_risk_month,get(paste0("Output_file",start_month[i])),fill=TRUE)
      rm(list=paste0("Output_file",start_month[i]))
    }
  }
  recurrent_persontime_risk_month <- persontime_risk_month
  rm(persontime_risk_month)
  for (i in 1:length(start_month)){
    start_persontime_studytime = start_month[i]
    end_persontime_studytime = end_month[i]
    nameoutput <- paste0("Output_file",start_month[i])
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
      Strata = c("sex", "age_at_1_jan_2021"),
      Name_event = "name_event",
      Date_event = "date_event",
      #Age_bands = c(0,19,29,39,49,59,69,79),F
      Increment="month",
      Outcomes =  list_outcomes, 
      Unit_of_age = "year",
      include_remaning_ages = T,
      Aggregate = T
    )
    )
    if (i==1) {
      persontime_risk_month<-get(paste0("Output_file",start_month[i]))
      rm(list=paste0("Output_file",start_month[i]))
    }else{
      persontime_risk_month<-rbind(persontime_risk_month,get(paste0("Output_file",start_month[i])),fill=TRUE)
      rm(list=paste0("Output_file",start_month[i]))
    }
  }
  
  persontime_risk_month <- merge(persontime_risk_month, recurrent_persontime_risk_month,
                                by = c("sex","age_at_1_jan_2021", "month", "Persontime"), all = T)
  
  for (i in names(persontime_risk_month)){
    persontime_risk_month[is.na(get(i)), (i):=0]
  }
  
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  fwrite(persontime_risk_month,file=paste0(thisdirexp,"D4_persontime_risk_month.csv"))
  if (this_datasource_has_subpopulations == TRUE){ 
    D4_persontime_risk_month[[subpop]] <- persontime_risk_month
  }else{
    D4_persontime_risk_month <- persontime_risk_month
  }
}

save(D4_persontime_risk_month,file=paste0(diroutput,"D4_persontime_risk_month.RData"))


for (subpop in subpopulations_non_empty){
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  col<-colnames(persontime_risk_month)[-(1:3)]
  temp<-paste0(col,"=5")
  temp2<-paste("c(",paste(temp, collapse = ','),")")
  suppressWarnings(
    DRE_Treshold(
      Inputfolder = thisdirexp,
      Outputfolder = thisdirsmallcountsremoved,
      Delimiter = ",",
      Varlist = c(eval(parse(text=(temp2)))),
      FileContains = "D4_persontime_risk_month"
    )
  )
}
# rm(list = nameobject)
rm(D3_vaxweeks_vaccin_cohort,D4_persontime_risk_month,persontime_risk_month,study_population,events_ALL_OUTCOMES)
