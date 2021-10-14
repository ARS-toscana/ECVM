# COUNT PERSON TIME PER COVID
#-----------------------------------------------
#To estimate the weekly incidence rates of risks in 2020 by data source

# input: D3_vaxweeks_including_not_vaccinated, D3_events_ALL_OUTCOMES.RData ,list_outcomes_observed.RData
# output: D4_persontime_risk_year (exported to csv)


print("COUNT PERSON TIME by year for risks")

persontime_risk_year <- vector(mode = 'list')

for (subpop in subpopulations_non_empty) {  
  print(subpop)
  start_persontime_studytime = "20200101"
  
  load(paste0(dirtemp,"list_outcomes_observed",suffix[[subpop]],".RData"))
  load(paste0(dirtemp,"D3_events_ALL_OUTCOMES",suffix[[subpop]],".RData"))
  load(paste0(dirtemp,"D3_vaxweeks_including_not_vaccinated",suffix[[subpop]],".RData"))
  
  list_outcomes<-get(paste0("list_outcomes_observed", suffix[[subpop]]))
  events_ALL_OUTCOMES<-get(paste0("D3_events_ALL_OUTCOMES", suffix[[subpop]]))
  study_population<-get(paste0("D3_vaxweeks_including_not_vaccinated", suffix[[subpop]]))

  endyear<- substr(study_population[,max(end_date_of_period)], 1, 4)
  end_persontime_studytime<-as.character(paste0(endyear,"1231"))
  
  list_recurrent_outcomes <- list_outcomes[str_detect(list_outcomes, "^GENCONV_") | str_detect(list_outcomes, "^ANAPHYL_")]
  list_outcomes <- setdiff(list_outcomes, list_recurrent_outcomes)

  nameoutput <- paste0("pop_age_1940",suffix[[subpop]])
  assign(nameoutput, study_population[Birthcohort_persons == "<1940", ])
  save(nameoutput, file = paste0(dirtemp, nameoutput,".RData"),list=nameoutput)
  rm(list=nameoutput)
  
  nameoutput <- paste0("pop_age_1940_1949",suffix[[subpop]])
  assign(nameoutput, study_population[Birthcohort_persons == "1940-1949", ])
  save(nameoutput, file = paste0(dirtemp, nameoutput,".RData"),list=nameoutput)
  rm(list=nameoutput)

  nameoutput <- paste0("pop_age_1950_1959",suffix[[subpop]])
  assign(nameoutput, study_population[Birthcohort_persons == "1950-1959", ])
  save(nameoutput, file = paste0(dirtemp, nameoutput,".RData"),list=nameoutput)
  rm(list=nameoutput)
  
  nameoutput <- paste0("pop_age_1960_1969",suffix[[subpop]])
  assign(nameoutput, study_population[Birthcohort_persons == "1960-1969", ])
  save(nameoutput, file = paste0(dirtemp, nameoutput,".RData"),list=nameoutput)
  rm(list=nameoutput)

  nameoutput <- paste0("pop_age_1970_1979",suffix[[subpop]])
  assign(nameoutput, study_population[Birthcohort_persons == "1970-1979", ])
  save(nameoutput, file = paste0(dirtemp, nameoutput,".RData"),list=nameoutput)
  rm(list=nameoutput)
  
  nameoutput <- paste0("pop_age_1980_1989",suffix[[subpop]])
  assign(nameoutput, study_population[Birthcohort_persons == "1980-1989", ])
  save(nameoutput, file = paste0(dirtemp, nameoutput,".RData"),list=nameoutput)
  rm(list=nameoutput)

  nameoutput <- paste0("pop_age_1990",suffix[[subpop]])
  assign(nameoutput, study_population[Birthcohort_persons == "1990+", ])
  save(nameoutput, file = paste0(dirtemp, nameoutput,".RData"),list=nameoutput)
  rm(list=nameoutput)

  for (events_df_sex in c("pop_age_1940", "pop_age_1940_1949", "pop_age_1950_1959", "pop_age_1960_1969",
                          "pop_age_1970_1979", "pop_age_1980_1989", "pop_age_1990")) {
    print(paste("Age", substring(events_df_sex, 9)))
    load(paste0(dirtemp, events_df_sex,suffix[[subpop]], ".RData"))
    print("recurrent")
    
    nameoutput <- paste0("Recurrent_output_file",suffix[[subpop]])
    assign(nameoutput,CountPersonTime(
      Dataset_events = events_ALL_OUTCOMES,
      Dataset = get(paste0(events_df_sex,suffix[[subpop]])),
      Person_id = "person_id",
      Start_study_time = start_persontime_studytime,
      End_study_time = end_persontime_studytime,
      Start_date = "start_date_of_period",
      End_date = "end_date_of_period",
      #Birth_date = "date_of_birth",
      Strata = c("sex","Birthcohort_persons","Dose","type_vax","week_fup", "CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD",
                 "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
      Name_event = "name_event",
      Date_event = "date_event",
      #Age_bands = c(0,19,29,39,49,59,69,79),
      Increment="year",
      Outcomes =  list_recurrent_outcomes, 
      Unit_of_age = "year",
      include_remaning_ages = T,
      Aggregate = T,
      Rec_events = T,
      Rec_period = c(rep(30, length(list_recurrent_outcomes)))
    ))

    save(nameoutput, file=paste0(dirtemp,"D3_recurrent_year",suffix[[subpop]],".RData"),list=nameoutput)
    rm(list=nameoutput)
    
    print("normal")
    nameoutput <- paste0("Output_file",suffix[[subpop]])
    assign(nameoutput,CountPersonTime(
      Dataset_events = events_ALL_OUTCOMES,
      Dataset = get(paste0(events_df_sex,suffix[[subpop]])),
      Person_id = "person_id",
      Start_study_time = start_persontime_studytime,
      End_study_time = end_persontime_studytime,
      Start_date = "start_date_of_period",
      End_date = "end_date_of_period",
      #Birth_date = "date_of_birth",
      Strata = c("sex","Birthcohort_persons","Dose","type_vax","week_fup", "CV", "COVCANCER", "COVCOPD", "COVHIV", "COVCKD",
                 "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
      Name_event = "name_event",
      Date_event = "date_event",
      #Age_bands = c(0,19,29,39,49,59,69,79),
      Increment="year",
      Outcomes =  list_outcomes, 
      Unit_of_age = "year",
      include_remaning_ages = T,
      Aggregate = T
    ))

    load(paste0(dirtemp,"D3_recurrent_year",suffix[[subpop]],".RData"))
    print("Merging")
    nameoutput<-paste0("Output_file",suffix[[subpop]])
    assign(nameoutput,merge(get(paste0("Output_file",suffix[[subpop]])), get(paste0("Recurrent_output_file",suffix[[subpop]])) ,
                         by = c("sex","Birthcohort_persons","Dose","type_vax","week_fup", "CV", "COVCANCER", "COVCOPD",
                                "COVHIV", "COVCKD", "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors",
                                "year", "Persontime"),
                         all = T)
    )
    print("Saving")
    save(nameoutput, file = paste0(dirtemp, events_df_sex,suffix[[subpop]], ".RData"),list=nameoutput)
    rm(list=paste0(events_df_sex,suffix[[subpop]]))
    
  }
  
  vect_df_persontime <- list()
  for (events_df_sex in c("pop_age_1940", "pop_age_1940_1949", "pop_age_1950_1959", "pop_age_1960_1969",
                          "pop_age_1970_1979", "pop_age_1980_1989", "pop_age_1990")) {
    load(paste0(dirtemp, events_df_sex,suffix[[subpop]], ".RData"))
    vect_df_persontime <- append(vect_df_persontime, list(get(paste0("Output_file",suffix[[subpop]]) )))
  }
  
  assign(paste0("Output_file",suffix[[subpop]]),rbindlist(vect_df_persontime))
  rm(vect_df_persontime)
  
  for (i in names(get(paste0("Output_file",suffix[[subpop]])))){
    get(paste0("Output_file",suffix[[subpop]]))[is.na(get(i)), (i):=0]
  }

  persontime_risk_year <- get(paste0("Output_file",suffix[[subpop]]))

thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
fwrite(persontime_risk_year,file=paste0(thisdirexp,"D4_persontime_risk_year",suffix[[subpop]],".csv"))

nameoutput<-paste0("D4_persontime_risk_year",suffix[[subpop]])
assign(nameoutput,persontime_risk_year)
save(nameoutput,file=paste0(diroutput,nameoutput,".RData"),list=nameoutput)

rm(list=paste0("Output_file",suffix[[subpop]]) )
rm(list=paste0("Recurrent_output_file",suffix[[subpop]]))
rm(list=nameoutput)
rm(list=paste0("D3_vaxweeks_including_not_vaccinated", suffix[[subpop]]))
rm(list=paste0("D3_events_ALL_OUTCOMES", suffix[[subpop]]))
rm(list=paste0("list_outcomes_observed", suffix[[subpop]]))
}

for (subpop in subpopulations_non_empty){
  tempname<-paste0("D4_persontime_risk_year",suffix[[subpop]],"_",thisdatasource,"_",currentdate,"_",scriptversion)
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  assign(tempname,fread(paste0(thisdirexp,tempname,".csv")))
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  col<-colnames(get(tempname))[-(1:6)]
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
  rm(list=tempname)
}
# rm(list = nameobject)
rm(persontime_risk_year,events_ALL_OUTCOMES,study_population)
