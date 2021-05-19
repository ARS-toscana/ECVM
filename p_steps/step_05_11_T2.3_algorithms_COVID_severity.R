# SUMMARIZE ALGORITHMS FOR COVID SEVERITY
#-----------------------------------------------
# input: D3_components_covid_severity.RData, D4_study_population_coprimary_c.RData
# output: D3_algorithm_covid

print("CREATE ALGORITHMS FOR COVID SEVERITY")

load(paste0(diroutput,"D4_study_population_coprimary_c.RData")) 

load(paste0(dirpargen,"subpopulations_non_empty.RData"))

load(paste0(dirtemp,"D3_components_covid_severity.RData"))


D3_algorithm_covid <- vector(mode = 'list')
D3_outcomes_covid <- vector(mode = 'list')
list_outcomes_observed_COVID <- c()
for (subpop in subpopulations_non_empty) {
  print(subpop)

  if (this_datasource_has_subpopulations == TRUE){  
    algorithm_covid  <- D3_components_covid_severity[[subpop]]
  }else{
    algorithm_covid  <- D3_components_covid_severity  
  }
  
  
   # date: covid registry
  algorithm_covid <- algorithm_covid[!is.na(first_date_covid_registry), date_covid := first_date_covid_registry]
  algorithm_covid <- algorithm_covid[!is.na(date_covid), origin_date_covid:= "covid_registry"]
  # date: covid narrow
  algorithm_covid <- algorithm_covid[is.na(date_covid) & !is.na(first_date_covid_narrow),date_covid := first_date_covid_narrow]
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(origin_date_covid),origin_date_covid:="covid_narrow"]
  
  # SEVERITY LEVEL
  
  # level 5: level from covid registry
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & covid_registry_symptoms == 5, severity_level_covid := 5][!is.na(date_covid) & !is.na(severity_level_covid), origin_severity_level_covid :='5-covid_registry']
  # level 5: death at discharge from hospital
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) & covid_death_discharge != 0,severity_level_covid := 5][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='5-death_at_discharge']
  # level 5: death after covid registry
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) & death_after_covid_registry != 0,severity_level_covid :=5][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='5-after_covid_registry']
  # level 5: death within days from covid narrow 
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) & death_after_covid_narrow_date != 0, severity_level_covid := 5][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='5-death_after_covid_narrow_date']
  
  # level 4: level from covid registry
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) & covid_registry_symptoms == 4,severity_level_covid :=4][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='4-covid_registry']
  # level 4: conceptset from covid registry date
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & 
is.na(severity_level_covid) & MechanicalVentilation_within_registry_date != 0, severity_level_covid := 4][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='4-after_covid_registry']
  # level 4: conceptset from covid narrow date
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) & MechanicalVentilation_within_covid_narrow_date != 0,severity_level_covid := 4][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='4-after_covid_narrow']
  
  # level 3: level from covid registry
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) & covid_registry_symptoms == 3,severity_level_covid :=3][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='3-covid_registry']
  # level 3: conceptset from covid registry 
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) & Respiratory_within_registry_date != 0,severity_level_covid := 3][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='3-after_covid_registry']
  # level 3: conceptset from covid narrow  
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) & Respiratory_within_covid_narrow_date != 0,severity_level_covid := 3][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='3-after_covid_narrow']
  
  # level 2: level from covid registry
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) & covid_registry_symptoms == 2,severity_level_covid :=2][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='2-covid_registry']
  # level 2: conceptset from covid registry 
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) & Infection_within_registry_date != 0,severity_level_covid := 2][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='2-after_covid_registry']
  # level 2: conceptset from covid narrow  
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) & Infection_within_covid_narrow_date != 0,severity_level_covid := 2][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='2-after_covid_narrow']
  
  # level 1: level by exclusion
  algorithm_covid <- algorithm_covid[!is.na(date_covid) & is.na(severity_level_covid) ,severity_level_covid :=1][!is.na(date_covid) & !is.na(severity_level_covid) & is.na(origin_severity_level_covid), origin_severity_level_covid :='1-by_exclusion']
  
  
  # cumulative binary variables
  outcomes_covid <- data.table()
  list_outcomes_observed <- c()
  for (j in c(1,2,3,4,5) ){
    temp <- algorithm_covid[severity_level_covid >= j]
    if (nrow(temp) > 0 ){ 
      level <- paste0('COVID_L',j,'plus')
      temp <- temp[, name_event := level]
      temp <- temp[, date_event := date_covid]
      temp <- temp[,.(person_id,name_event,date_event,origin_severity_level_covid)]
      outcomes_covid <- rbind(outcomes_covid, temp)
      list_outcomes_observed <- c(list_outcomes_observed, level)
    }
  }

  

  if (this_datasource_has_subpopulations == TRUE){
    list_outcomes_observed_COVID[[subpop]] <- list_outcomes_observed
    D3_algorithm_covid[[subpop]]  <- algorithm_covid
    D3_outcomes_covid[[subpop]]  <- outcomes_covid
  }else{
    list_outcomes_observed_COVID <- list_outcomes_observed
    D3_algorithm_covid  <- algorithm_covid
    D3_outcomes_covid  <- outcomes_covid
  }
}


# save the COVID outcomes as a dataset and their list as a parameter
save(D3_algorithm_covid,file=paste0(dirtemp,paste0("D3_algorithm_covid.RData")))
save(D3_outcomes_covid,file=paste0(dirtemp,paste0("D3_outcomes_covid.RData")))
save(list_outcomes_observed_COVID,file=paste0(dirpargen,paste0("list_outcomes_observed_COVID.RData")))


rm(algorithm_covid)
