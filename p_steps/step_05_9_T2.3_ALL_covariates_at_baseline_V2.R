# ----------------------------------
# for all covariates create binary variable drug procy OR diagnosis; also create binary 'overall'

# input: D3_study_population_covariates , D3_study_population_DP.RData
# output: D3_study_population_cov_ALL.RData

print('create RISK FACTORS at baseline as either diagnosis or drugs')

COVnames<-c("CV","COVCANCER","COVCOPD","COVHIV","COVCKD","COVDIAB","COVOBES","COVSICKLE")

# create variable added to study population

load(paste0(diroutput,"D4_study_population.RData"))
load(paste0(diroutput,"D4_study_population_cov.RData"))
load(paste0(dirtemp,"D3_study_population_DP.RData"))

load(paste0(dirpargen,"subpopulations_non_empty.RData"))


D3_study_population_cov_ALL <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {
  print(subpop)
  load(paste0(diroutput,"D4_study_population.RData")) 
  
  if (this_datasource_has_subpopulations == TRUE){  
    study_population <- D4_study_population[[subpop]]
    study_population_cov <- D4_study_population_cov[[subpop]]
    study_population_DP <- D3_study_population_DP[[subpop]]
  }else{
    study_population <- as.data.table(D4_study_population)
    study_population_cov <- D4_study_population_cov
    study_population_DP <- D3_study_population_DP
  }
  study_population_cov_ALL <- merge(study_population[,-c("study_entry_date","sex")], study_population_cov, by=c("person_id", "date_of_death", "start_follow_up"), all.x = T)
  
  study_population_cov_ALL <- merge(study_population_cov_ALL, study_population_DP, by="person_id", all.x = T)
  
  study_population_cov_ALL <- study_population_cov_ALL[, all_covariates_non_CONTR := 0 ]
  
  for (cov in COVnames ){
    if ( cov!="CV" ){
      nameDP =  paste0("DP_",cov,"_at_study_entry")
    }
    else{
      nameDP = "DP_CVD_at_study_entry"
    }
    study_population_cov_ALL <- study_population_cov_ALL[get(paste0(cov,"_at_study_entry")) == 1 | get(nameDP) == 1, namevar := 1]
    # print(nameDP)
    study_population_cov_ALL <- study_population_cov_ALL[namevar == 1 ,all_covariates_non_CONTR :=1]
   
    setnames(study_population_cov_ALL,"namevar",paste0(cov,"_either_DX_or_DP"))

    is.data.table(study_population_cov_ALL)
    for (i in names(study_population_cov_ALL)){
      study_population_cov_ALL[is.na(get(i)), (i):=0]
    }
  }
  if (this_datasource_has_subpopulations == TRUE){ 
    D3_study_population_cov_ALL[[subpop]] <- study_population_cov_ALL
  }else{
    D3_study_population_cov_ALL <- study_population_cov_ALL
  }
}


save(D3_study_population_cov_ALL,file=paste0(diroutput,"D3_study_population_cov_ALL.RData"))
rm(D4_study_population_cov, D3_study_population_DP, D4_study_population, D3_study_population_cov_ALL, study_population_DP, study_population,study_population_cov, study_population_cov_ALL)

