#COHORT B
load(paste0(dirtemp, "D4_population_cohort_b.RData"))

list_outcomes_MIS <- c("MIS_narrow","MIS_broad")

D4_persontime_risk_year <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {  
  print(subpop)
  start_persontime_studytime = "20200101"
  
  if (this_datasource_has_subpopulations == TRUE){ 
    study_population <- D3_vaxweeks_including_not_vaccinated[[subpop]]
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES[[subpop]]
    intersect(list_outcomes_observed[[subpop]],list_outcomes_MIS)
    list_outcomes <- list_outcomes_observed[[subpop]]
  }else{
    study_population <- D3_vaxweeks_including_not_vaccinated
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES
    list_outcomes <-intersect(list_outcomes_observed,list_outcomes_MIS)
  }
}

for (subpop in subpopulations_non_empty) {  
  print(subpop)
  start_persontime_studytime = "20200101"
  
  if (this_datasource_has_subpopulations == TRUE){ 
    study_population <- D4_population_cohort_b[[subpop]]
    events_ALL_OUTCOMES <- D3_events_ALL_OUTCOMES[[subpop]]
    list_outcomes <- list_outcomes_observed[[subpop]]
  }else{
    study_population <- 
    events_ALL_OUTCOMES <- D4_population_cohort_b
    list_outcomes <- list_outcomes_observed
  }
}

Output_file<-CountPersonTime(
  Dataset_events = events_ALL_OUTCOMES,
  Dataset = get(events_df_sex),
  Person_id = "person_id",
  Start_study_time = start_persontime_studytime,
  End_study_time = end_persontime_studytime,
  Start_date = "start_date_of_period",
  End_date = "end_date_of_period",
  #Birth_date = "date_of_birth",
  Strata = c("sex","Age_at_study_entry"),
  Name_event = "name_event",
  Date_event = "date_event",
  #Age_bands = c(0,19,29,39,49,59,69,79),
  Increment="year",
  Outcomes =  list_outcomes, 
  Unit_of_age = "year",
  include_remaning_ages = T,
  Aggregate = T
)

#COHORT C
load(paste0(dirtemp, "D4_population_cohort_c.RData"))

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

#COHORT D
load(paste0(dirtemp, "D4_population_cohort_d.RData"))

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