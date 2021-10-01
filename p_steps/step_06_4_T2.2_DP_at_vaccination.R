#------------------------------------------------------------------
# CREATE RISK FACTORS
# input: D3_Vaccin_cohort, concept set datasets in DRUGS_conceptssets ("CV","COVCANCER","COVCOPD","COVHIV","COVCKD","COVDIAB","COVOBES","COVSICKLE","IMMUNOSUPPRESSANTS")
# 
# output: D3_Vaccin_cohort_DP.RData


print('CREATE RISK FACTORS (drugs only) at vaccination')


# covariate : =1 if there are at least 2 records during 365 days of lookback
# 


load(paste0(dirpargen,"subpopulations_non_empty.RData"))


D3_study_population_DP <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {
  print(subpop)
  load(paste0(dirtemp,"D3_Vaccin_cohort.RData")) 
  
  if (this_datasource_has_subpopulations == TRUE){  
    study_population <- D3_Vaccin_cohort[[subpop]]
  }else{
    study_population <- as.data.table(D3_Vaccin_cohort)  
  }
  COHORT_TMP <- study_population[,.(person_id, date_vax1)]
  study_population_DP <- COHORT_TMP
  for (conceptset in DRUGS_conceptssets) {
    load(paste0(dirtemp,conceptset,".RData"))
    output <- MergeFilterAndCollapse(list(get(conceptset)),
                                     condition= "date >= date_vax1 - 365 & date<=date_vax1",
                                     key = c("person_id"),
                                     datasetS = COHORT_TMP,
                                     additionalvar = list(
                                       list(c("n"),"1","date <= date_vax1")
                                     ),
                                     saveintermediatedataset= F,
                                     strata=c("person_id"),
                                     summarystat = list(
                                       list(c("sum"),"n","howmanyrecords")
                                     )
    )
    output <- output[howmanyrecords > 1 ,namevar := 1]
    output <- output[,.(person_id,namevar)]
    setnames(output,"namevar",paste0(conceptset,"_at_vaccination"))
    study_population_DP <- merge(study_population_DP,output,all.x = T, by="person_id")
    study_population_DP[is.na(study_population_DP)] <- 0
    rm(list = conceptset)
    rm(output)
  }
  if (this_datasource_has_subpopulations == TRUE){ 
    D3_Vaccin_cohort_DP[[subpop]] <- study_population_DP
  }else{
    D3_Vaccin_cohort_DP <- study_population_DP
  }
}

save(D3_Vaccin_cohort_DP,file=paste0(dirtemp,"D3_Vaccin_cohort_DP.RData"))

rm(COHORT_TMP, D3_study_population_DP, D3_Vaccin_cohort, study_population_DP, study_population)



