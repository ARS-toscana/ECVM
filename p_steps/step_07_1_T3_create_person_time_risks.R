# COUNT PERSON TIME PER COVID
#-----------------------------------------------
#To estimate the monthly incidence rates of COVID-19 (overall and by severity level) in 2020 by data source

# input: D4_study_population_coprimary_c, D3_outcomes_covid.RData, list_outcomes_observed_COVID
# output: D4_persontime_coprimary_c_month (exported to csv)

print("COUNT PERSON TIME PER COVID by month for coprimary c")

load(paste0(dirtemp,paste0("D3_outcomes_covid.RData")))
load(paste0(dirpargen,paste0("list_outcomes_observed_COVID.RData")))
load(paste0(diroutput,paste0("D4_study_population.RData")))
load(paste0(dirpargen,"subpopulations_non_empty.RData"))

#monthly incidence
start_persontime_studytime = "20200101"
# first end of month after study_end
#end_persontime_studytime =gsub("-","", study_end)

D4_persontime_coprimary_c_month <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {  
  print(subpop)
  if (this_datasource_has_subpopulations == TRUE){ 
    study_population <- D4_study_population_coprimary_c[[subpop]]
    events_ALL_OUTCOMES <- D3_outcomes_covid[[subpop]]
    list_outcomes <- list_outcomes_observed_COVID[[subpop]]
  }else{
    study_population <- D4_study_population_coprimary_c
    events_ALL_OUTCOMES <- D3_outcomes_covid
    list_outcomes <- list_outcomes_observed_COVID
  }

  max_exit<-study_population[,max(study_exit_date_coprimary_c)]
  
  
  last_event<-events_ALL_OUTCOMES[,max(date_event)]
  end_persontime_studytime<-min(max_exit,last_event)
  
  if (end_persontime_studytime < ymd(start_persontime_studytime)) {
    next
  }

  end_persontime_studytime<-as.Date(format(end_persontime_studytime, "%Y-%m-01")) + months(1) - 1
  
  end_persontime_studytime<-str_remove_all(end_persontime_studytime, "-")
  Output_file<-CountPersonTime(
    Dataset_events = events_ALL_OUTCOMES,
    Dataset = study_population,
    Person_id = "person_id",
    Start_study_time = start_persontime_studytime,
    End_study_time = end_persontime_studytime,
    Start_date = "study_entry_date_coprimary_c",
    End_date = "study_exit_date_coprimary_c",
    Birth_date = "date_of_birth",
    Strata = c("sex"),
    Name_event = "name_event",
    Date_event = "date_event",
    Age_bands = c(0,19,29,39,49,59,69,79),
    Increment="month",
    Outcomes =  list_outcomes,
    Unit_of_age = "year",
    include_remaning_ages = T,
    Aggregate = T
  )
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  fwrite(Output_file,file=paste0(thisdirexp,"D4_persontime_coprimary_c_month.csv"))
  if (this_datasource_has_subpopulations == TRUE){ 
    D4_persontime_coprimary_c_month[[subpop]] <- Output_file
  }else{
    D4_persontime_coprimary_c_month <- Output_file
  }
}   

save(D4_persontime_coprimary_c_month,file=paste0(diroutput,"D4_persontime_coprimary_c_month.RData"))



for (subpop in subpopulations_non_empty){
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  thisdirsmallcountsremoved <- ifelse(this_datasource_has_subpopulations == FALSE,dirsmallcountsremoved,dirsmallcountsremovedsubpop[[subpop]])
  
  col<-colnames(Output_file)[-(1:3)]
  temp<-paste0(col,"=5")
  temp2<-paste("c(",paste(temp, collapse = ','),")")
  suppressWarnings(
    DRE_Treshold(
      Inputfolder = thisdirexp,
      Outputfolder = thisdirsmallcountsremoved,
      Delimiter = ",",
      Varlist = c(eval(parse(text=(temp2)))),
      FileContains = "D4_persontime_coprimary_c_month"
    )
  )
}
 
rm(D4_study_population_coprimary_c, list_outcomes_observed_COVID,D3_outcomes_covid,D4_persontime_coprimary_c_month, Output_file, study_population , events_ALL_OUTCOMES, list_outcomes)
