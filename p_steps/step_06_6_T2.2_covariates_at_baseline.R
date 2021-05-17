#------------------------------------------------------------------
# CREATE RISK FACTORS

print('CREATE RISK FACTORS (diagnosis only)')

# input: D4_study_population, concept set datasets of covariates (plus the six concept sets of the three outcomes CAD, MYOCARD and HF which form the covariate CV): "CV","COVCANCER","COVCOPD","COVHIV","COVCKD","COVDIAB","COVOBES","COVSICKLE"
# output: D3_study_population_covariates.RData

CV_string<-c("HF_narrow","HF_possible","MYOCARD_narrow","MYOCARD_possible","CAD_narrow","CAD_possible") 

lapply(paste0(dirtemp,CV_string,".RData"),load,.GlobalEnv)


CV<- rbind(HF_narrow, HF_possible,MYOCARD_narrow,MYOCARD_possible,CAD_narrow, CAD_possible)
rm(HF_narrow,MYOCARD_narrow,HF_possible,MYOCARD_possible, CAD_narrow, CAD_possible)


COVnames<-c("CV","COVCANCER","COVCOPD","COVHIV","COVCKD","COVDIAB","COVOBES","COVSICKLE")

load(paste0(dirpargen,"subpopulations_non_empty.RData"))


D3_study_population_covariates <- vector(mode = 'list')
for (subpop in subpopulations_non_empty) {
  print(subpop)
  load(paste0(diroutput,"D4_study_population.RData")) 
  
  if (this_datasource_has_subpopulations == TRUE){  
    study_population <- D4_study_population[[subpop]]
  }else{
    study_population <- as.data.table(D4_study_population)  
  }

  study_population_covariates <- study_population[,.(person_id, study_entry_date)]
  
  
  
  
  #file<-"COVCANCER_narrow"
  for (file in COVnames) {
    if ( file!="CV" ){
      
      load(paste0(dirtemp,file,".RData"))
      filecovariate <- get(file)
      
      if (this_datasource_has_subpopulations == TRUE){
        selection <- select_in_subpopulationsEVENTS[[subpop]]
        filecovariate = filecovariate[eval(parse(text = selection)),]
      }
      
      temp<-merge(study_population,filecovariate, all.x = T, by="person_id")[,.(person_id,study_entry_date,date)]
      temp<-temp[date>=study_entry_date-365 & date<study_entry_date,file:=1][is.na(file),file:=0]
      suppressWarnings(temp<-unique(temp[,file1:=max(file),by="person_id"][,.(person_id,file1)]))
      setnames(temp,"file1",paste0(file,"_at_study_entry"))
      study_population_covariates<-merge(study_population_covariates,temp,all.x = T, by="person_id")
      
    } else {
      
      temp<-merge(study_population,get(file), all.x = T, by="person_id")[,.(person_id,study_entry_date,date)]
      temp<-temp[date>=study_entry_date-365 & date<study_entry_date,file:=1][is.na(file),file:=0]
      suppressWarnings(temp<-unique(temp[,file1:=max(file),by="person_id"][,.(person_id,file1)]))
      setnames(temp,"file1",paste0(file,"_at_study_entry"))
      study_population_covariates<-merge(study_population_covariates,temp,all.x = T, by="person_id")
    }
  }
  
  if (this_datasource_has_subpopulations == TRUE){ 
    D3_study_population_covariates[[subpop]] <- study_population_covariates
  }else{
    D3_study_population_covariates <- study_population_covariates
    }
}    

save(D3_study_population_covariates,file=paste0(dirtemp,"D3_study_population_covariates.RData"))

rm(CV,COVCANCER,COVCOPD,COVHIV,COVCKD,COVDIAB,COVOBES,COVSICKLE) 
rm(temp,D3_study_population_covariates,D4_study_population, study_population, study_population_covariates,filecovariate)


