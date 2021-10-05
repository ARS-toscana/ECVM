#------------------------------------------------------------------
# create age and other simple covariates at baseline

# input: D3_Vaccin_cohort, D3_Vaccin_cohort_covariates
# output: D4_Vaccin_cohort_cov.RData

print('create age and other simple covariates at date_vax_1')

load(paste0(dirpargen,"subpopulations_non_empty.RData"))

D4_Vaccin_cohort_cov <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {
  print(subpop)
  load(paste0(dirtemp,"D3_Vaccin_cohort_no_risk.RData"))
  load(paste0(dirtemp,"D3_Vaccin_cohort_covariates.RData"))
  
  if (this_datasource_has_subpopulations == TRUE){  
    study_population <- D3_Vaccin_cohort[[subpop]]
    study_population_covariates <- D3_Vaccin_cohort_covariates[[subpop]]
  }else{
    study_population <- as.data.table(D3_Vaccin_cohort)  
    study_population_covariates <- D3_Vaccin_cohort_covariates
  }
  
  
  population_var<- study_population[, year_at_date_vax_1:=year(date_vax1)] 
  population_var<-population_var [, age_strata_at_date_vax_1 := cut(age_at_date_vax_1, breaks = Agebands, 
                                                                    labels = Agebands_labels)]
  
  study_population_cov<-merge(population_var, study_population_covariates[,-"date_vax1"],
                              by="person_id", all.x = T)
  
  study_population_cov <- study_population_cov[,-c("date_of_birth","date_vax1","study_exit_date")]
  if (this_datasource_has_subpopulations == TRUE){ 
    D4_Vaccin_cohort_cov[[subpop]] <- study_population_cov
  }else{
    D4_Vaccin_cohort_cov <- study_population_cov
  }
} 

save(D4_Vaccin_cohort_cov,file=paste0(diroutput,"D4_Vaccin_cohort_cov.RData"))
rm(population_var, D3_Vaccin_cohort,study_population_cov,study_population,study_population_covariates)
rm(D3_Vaccin_cohort_covariates,D4_Vaccin_cohort_cov)
