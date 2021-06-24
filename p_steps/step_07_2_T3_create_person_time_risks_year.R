# COUNT PERSON TIME PER COVID
#-----------------------------------------------
#To estimate the weekly incidence rates of risks in 2020 by data source

# input: D3_vaxweeks_including_not_vaccinated, D3_events_ALL_OUTCOMES.RData ,list_outcomes_observed.RData
# output: D4_persontime_risk_year (exported to csv)


print("COUNT PERSON TIME by year for risks")

load(paste0(dirtemp,"list_outcomes_observed.RData"))
load(paste0(dirtemp,"D3_events_ALL_OUTCOMES.RData"))
load(paste0(dirtemp,"D3_vaxweeks_including_not_vaccinated.RData"))


D4_persontime_risk_year <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {  
  print(subpop)
  start_persontime_studytime = "20200101"
  
  if (this_datasource_has_subpopulations == TRUE){ 
    study_population <- D3_vaxweeks_including_not_vaccinated[[subpop]]
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES[[subpop]]
    list_outcomes <- list_outcomes_observed[[subpop]]
  }else{
    study_population <- D3_vaxweeks_including_not_vaccinated
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES
    list_outcomes <- list_outcomes_observed
  }
}
  
  
  endyear<- substr(study_population[,max(end_date_of_period)], 1, 4)
  end_persontime_studytime<-as.character(paste0(endyear,"1231"))
  
  list_recurrent_outcomes <- list_outcomes[str_detect(list_outcomes, "^GENCONV_") | str_detect(list_outcomes, "^ANAPHYL_")]
  list_outcomes <- setdiff(list_outcomes, list_recurrent_outcomes)
  
  pop_sex_0 <- study_population[sex == 0, ]
  save(pop_sex_0, file = paste0(dirtemp, "pop_sex_0.RData"))
  rm(pop_sex_0)
  pop_sex_1 <- study_population[sex == 1, ]
  save(pop_sex_1, file = paste0(dirtemp, "pop_sex_1.RData"))
  rm(study_population, pop_sex_1)

  
  for (events_df_sex in c("pop_sex_0", "pop_sex_1")) {
    print(fifelse(events_df_sex == "pop_sex_0", "Sex 0", "Sex 1"))
    load(paste0(dirtemp, events_df_sex, ".RData"))
    print("recurrent")
    Recurrent_output_file<-CountPersonTime(
      Dataset_events = events_ALL_OUTCOMES,
      Dataset = get(events_df_sex),
      Person_id = "person_id",
      Start_study_time = start_persontime_studytime,
      End_study_time = end_persontime_studytime,
      Start_date = "start_date_of_period",
      End_date = "end_date_of_period",
      #Birth_date = "date_of_birth",
      Strata = c("sex","Birthcohort_persons","Dose","type_vax","week_fup", "CV", "COVCANCER","COVCOPD", "COVHIV",
                 "COVCKD", "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
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
    )
    save(Recurrent_output_file, file=paste0(dirtemp,"D3_recurrent_year.RData"))
    rm(Recurrent_output_file)
    print("normal")
    Output_file<-CountPersonTime(
      Dataset_events = events_ALL_OUTCOMES,
      Dataset = get(events_df_sex),
      Person_id = "person_id",
      Start_study_time = start_persontime_studytime,
      End_study_time = end_persontime_studytime,
      Start_date = "start_date_of_period",
      End_date = "end_date_of_period",
      #Birth_date = "date_of_birth",
      Strata = c("sex","Birthcohort_persons","Dose","type_vax","week_fup", "CV", "COVCANCER","COVCOPD", "COVHIV",
                 "COVCKD", "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
      Name_event = "name_event",
      Date_event = "date_event",
      #Age_bands = c(0,19,29,39,49,59,69,79),
      Increment="year",
      Outcomes =  list_outcomes, 
      Unit_of_age = "year",
      include_remaning_ages = T,
      Aggregate = T
    )
    load(paste0(dirtemp,"D3_recurrent_year.RData"))
    Output_file <- merge(Output_file, Recurrent_output_file,
                         by = c("sex","Birthcohort_persons","Dose","type_vax","week_fup", "CV", "COVCANCER","COVCOPD",
                                "COVHIV", "COVCKD", "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors",
                                "year", "Persontime"),
                         all = T)
    save(Output_file, file = paste0(dirtemp, events_df_sex, ".RData"))
    
    rm(Recurrent_output_file, Output_file)
  }
  
  vect_df_persontime <- list()
  for (events_df_sex in c("pop_sex_0", "pop_sex_1")) {
    load(paste0(dirtemp, events_df_sex, ".RData"))
    vect_df_persontime <- append(vect_df_persontime, list(Output_file))
  }
  
  Output_file <- rbindlist(vect_df_persontime)
  rm(vect_df_persontime)
  
  for (i in names(Output_file)){
    Output_file[is.na(get(i)), (i):=0]
  }

  D4_persontime_risk_year <- Output_file
  fwrite(D4_persontime_risk_year,file=paste0(direxp,"D4_persontime_risk_year.csv"))
save(D4_persontime_risk_year,file=paste0(diroutput,"D4_persontime_risk_year.RData"))


for (subpop in subpopulations_non_empty){
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  col<-colnames(D4_persontime_risk_year)[-(1:6)]
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
rm(D3_vaxweeks_including_not_vaccinated,D4_persontime_risk_year,events_ALL_OUTCOMES,Output_file)
