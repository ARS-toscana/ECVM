# ----------------------------------
# for all covariates create binary variable drug proxy OR diagnosis; also create binary 'overall'

# input: D3_Vaccin_cohort, D4_Vaccin_cohort_cov , D3_Vaccin_cohort_DP.RData
# output: D3_Vaccin_cohort_cov_ALL.RData

print('create RISK FACTORS at vaccination as either diagnosis or drugs')

COVnames<-c("CV","COVCANCER","COVCOPD","COVHIV","COVCKD","COVDIAB","COVOBES","COVSICKLE")

# create variable added to study population

load(paste0(diroutput,"D4_Vaccin_cohort_cov.RData"))
load(paste0(dirtemp,"D3_Vaccin_cohort_DP.RData"))
load(paste0(dirpargen,"subpopulations_non_empty.RData"))


D3_Vaccin_cohort_cov_ALL <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {
  print(subpop)
  load(paste0(dirtemp,"D3_Vaccin_cohort.RData")) 
  
  if (this_datasource_has_subpopulations == TRUE){  
    study_population <- D3_Vaccin_cohort[[subpop]]
    study_population_cov <- D4_Vaccin_cohort_cov[[subpop]]
    study_population_DP <- D3_Vaccin_cohort_DP[[subpop]]
  }else{
    study_population <- as.data.table(D3_Vaccin_cohort)
    study_population_cov <- D4_Vaccin_cohort_cov
    study_population_DP <- D3_Vaccin_cohort_DP
  }
  
  keep_col <- c("person_id", paste0(COVnames, "_at_vaccination"))
  study_population_cov_ALL <- merge(study_population, study_population_cov[, ..keep_col], by=c("person_id"), all.x = T)
  
  study_population_cov_ALL <- merge(study_population_cov_ALL, study_population_DP[, date_vax1 := NULL], by="person_id", all.x = T)
  
  study_population_cov_ALL <- study_population_cov_ALL[, all_covariates_non_CONTR := 0 ]
  
  for (cov in COVnames){
    if ( cov!="CV" ){
      nameDP =  paste0("DP_",cov,"_at_vaccination")
    }
    else{
      nameDP = "DP_CVD_at_vaccination"
    }
    study_population_cov_ALL <- study_population_cov_ALL[get(paste0(cov,"_at_vaccination")) == 1 | get(nameDP) == 1, namevar := 1]
    # print(nameDP)
    study_population_cov_ALL <- study_population_cov_ALL[namevar == 1 ,all_covariates_non_CONTR :=1]
    
    setnames(study_population_cov_ALL,"namevar",paste0(cov,"_either_DX_or_DP"))
    
    for (i in names(study_population_cov_ALL)){
      study_population_cov_ALL[is.na(get(i)), (i):=0]
    }
  }
  
  study_population_cov_ALL <- study_population_cov_ALL[IMMUNOSUPPR_at_vaccination == 1, all_covariates_non_CONTR :=1]
  
  if (this_datasource_has_subpopulations == TRUE){ 
    D3_Vaccin_cohort_cov_ALL[[subpop]] <- study_population_cov_ALL
  }else{
    D3_Vaccin_cohort_cov_ALL <- study_population_cov_ALL
  }
}


save(D3_Vaccin_cohort_cov_ALL,file=paste0(diroutput,"D3_Vaccin_cohort_cov_ALL.RData"))
rm(D4_Vaccin_cohort_cov, D3_Vaccin_cohort_DP, D3_Vaccin_cohort, D3_Vaccin_cohort_cov_ALL, study_population_DP, study_population,study_population_cov, study_population_cov_ALL)

