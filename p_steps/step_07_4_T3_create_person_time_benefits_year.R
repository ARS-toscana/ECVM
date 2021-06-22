# COUNT PERSON TIME PER COVID
#-----------------------------------------------
#To estimate the weekly incidence rates of COVID-19 (overall and by severity level) in 2020 by data source

# input: D3_vaxweeks_including_not_vaccinated, D3_algorithm_covid ,list_outcomes_observed_COVID
# output: D4_persontime_benefit_year (exported to csv)


print("COUNT PERSON TIME PER COVID by week benefits")

load(paste0(dirtemp,paste0("D3_outcomes_covid.RData")))
load(paste0(dirtemp,"D3_vaxweeks_including_not_vaccinated.RData"))
load(paste0(dirpargen,paste0("list_outcomes_observed_COVID.RData")))
D3_outcomes_covid <- unique(D3_outcomes_covid)
D4_persontime_benefit_year <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {  
  print(subpop)
  start_persontime_studytime = "20200101"
  
  if (this_datasource_has_subpopulations == TRUE){ 
    study_population <- D3_vaxweeks_including_not_vaccinated[[subpop]]
    events_ALL_OUTCOMES <- D3_outcomes_covid[[subpop]]
    list_outcomes <- list_outcomes_observed_COVID[[subpop]]
  }else{
    study_population <- D3_vaxweeks_including_not_vaccinated
    events_ALL_OUTCOMES <- D3_outcomes_covid
    list_outcomes <- list_outcomes_observed_COVID
  }
}
  endyear<- substr(study_population[,max(end_date_of_period)], 1, 4)
  end_persontime_studytime<-as.character(paste0(endyear,"1231"))
  
  Output_file<-CountPersonTime(
    Dataset_events = events_ALL_OUTCOMES,
    Dataset = study_population,
    Person_id = "person_id",
    Start_study_time = start_persontime_studytime,
    End_study_time = end_persontime_studytime,
    Start_date = "start_date_of_period",
    End_date = "end_date_of_period",
    #Birth_date = "date_of_birth",
    Strata = c("Dose","sex", "Birthcohort_persons","type_vax","week_fup", "CV", "COVCANCER","COVCOPD", "COVHIV",
               "COVCKD", "COVDIAB", "COVOBES", "COVSICKLE", "IMMUNOSUPPR", "any_risk_factors"),
    Name_event = "name_event",
    Date_event = "date_event",
    #Age_bands = c(0,19,29,39,49,59,69,79),
    Increment="year",
    Outcomes =  list_outcomes, 
    # Unit_of_age = "year",
    # include_remaning_ages = T,
    Aggregate = T
  )

D4_persontime_benefit_year <- Output_file
fwrite(D4_persontime_benefit_year,file=paste0(direxp,"D4_persontime_benefit_year.csv"))
save(D4_persontime_benefit_year,file=paste0(diroutput,"D4_persontime_benefit_year.RData"))


for (subpop in subpopulations_non_empty){
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  col<-colnames(D4_persontime_benefit_year)[-(1:6)]
  temp<-paste0(col,"=5")
  temp2<-paste("c(",paste(temp, collapse = ','),")")
  suppressWarnings(
    DRE_Treshold(
      Inputfolder = thisdirexp,
      Outputfolder = thisdirsmallcountsremoved,
      Delimiter = ",",
      Varlist = c(eval(parse(text=(temp2)))),
      FileContains = "D4_persontime_benefit_year"
    )
  )
}
# rm(list = nameobject)
rm(D3_vaxweeks_including_not_vaccinated,D4_persontime_benefit_year,study_population,events_ALL_OUTCOMES,Output_file)
