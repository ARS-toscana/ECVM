#------------------------------------------------------------------
# create age and other simple covariates at baseline

# input: D4_study_population, D3_study_population_covariates
# output: D4_study_population_cov.RData

print('create age and other simple covariates at baseline')

D4_study_population_cov <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {
  print(subpop)
  load(paste0(diroutput,"D4_study_population",suffix[[subpop]],".RData")) 
  study_population<-get(paste0("D4_study_population", suffix[[subpop]])) 
  
  load(paste0(dirtemp,"D3_study_population_covariates",suffix[[subpop]],".RData"))
  study_population_covariates<-get(paste0("D3_study_population_covariates", suffix[[subpop]])) 
  

  population_var<- study_population[,age_at_study_entry:=age_fast(date_of_birth,study_entry_date)] [, year_at_study_entry:=year(study_entry_date)] 
  population_var<-population_var [,age_strata_at_study_entry:=cut(age_at_study_entry, breaks = Agebands,  labels = c("0-19","20-29", "30-39", "40-49","50-59","60-69", "70-79","80+"))]
  
  study_population_cov<-merge(population_var, study_population_covariates[,-"study_entry_date"], by="person_id", all.x = T)
  
  study_population_cov <- study_population_cov[,-c("date_of_birth","study_entry_date","study_exit_date")]

  tempname<-paste0("D4_study_population_cov",suffix[[subpop]])
  assign(tempname,study_population_cov)
  save(list=tempname,file=paste0(diroutput,tempname,".RData"))
  rm(tempname,list=tempname)
  
  rm(list=paste0("D4_study_population", suffix[[subpop]]))
  rm(list=paste0("D3_study_population_covariates",suffix[[subpop]]))
} 


rm(population_var, study_population_cov,study_population,study_population_covariates)
rm(D4_study_population_cov)
