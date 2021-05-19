#------------------------------------------------------------------
# create age and other simple covariates at baseline

# input: D4_study_population, D3_study_population_covariates
# output: D4_study_population_cov.RData

print('create age and other simple covariates at baseline')

load(paste0(dirpargen,"subpopulations_non_empty.RData"))

D4_study_population_cov <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {
  print(subpop)
  load(paste0(diroutput,"D4_study_population.RData"))
  load(paste0(dirtemp,"D3_study_population_covariates.RData"))
  
  if (this_datasource_has_subpopulations == TRUE){  
    study_population <- D4_study_population[[subpop]]
    study_population_covariates <- D3_study_population_covariates[[subpop]]
  }else{
    study_population <- as.data.table(D4_study_population)  
    study_population_covariates <- D3_study_population_covariates
  }


  population_var<- study_population[,age_at_study_entry:=age_fast(date_of_birth,study_entry_date)] [, year_at_study_entry:=year(study_entry_date)] 
  population_var<-population_var [,age_strata_at_study_entry:=cut(age_at_study_entry, breaks = Agebands,  labels = c("0-19","20-29", "30-39", "40-49","50-59","60-69", "70-79","80+"))]
  
  study_population_cov<-merge(population_var, study_population_covariates[,-"study_entry_date"], by="person_id", all.x = T)
  
  study_population_cov <- study_population_cov[,-c("date_of_birth","study_entry_date","study_exit_date")]
  if (this_datasource_has_subpopulations == TRUE){ 
    D4_study_population_cov[[subpop]] <- study_population_cov
  }else{
    D4_study_population_cov <- study_population_cov
  }
} 

save(D4_study_population_cov,file=paste0(diroutput,"D4_study_population_cov.RData"))
rm(population_var, D4_study_population,study_population_cov,study_population,study_population_covariates)
rm(D3_study_population_covariates,D4_study_population_cov)
