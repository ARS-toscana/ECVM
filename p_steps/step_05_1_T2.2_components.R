#------------------------------------------------------------------
# create events and components of OUTCOMES for narrow and broad

# input: concept set datasets of outcomes (narrow and possible), D4_study_population
# output: for each outcome OUTCOME, D3_components_OUTCOME.RData and D3_events_ OUTCOME_type.RData, for type = narrow, possible

print('create events and create components of OUTCOMES for narrow and broad.')

firstyear=firstYearComponentAnalysis
secondyear=secondYearComponentAnalysis


load(paste0(dirpargen,"subpopulations_non_empty.RData"))

##for each OUTCOME create components

for (OUTCOME in OUTCOME_events) {
  tempOUTCOME <- vector(mode="list")
  componentsOUTCOME <- vector(mode="list")
  print(OUTCOME)
  for (subpop in subpopulations_non_empty) {
    print(subpop)
    load(paste0(diroutput,"D4_study_population.RData")) 
    
    if (this_datasource_has_subpopulations == TRUE){  
      COHORT_TMP <- D4_study_population[[subpop]]
    }else{
      COHORT_TMP <- as.data.table(D4_study_population)  
    }
    
    COHORT_TMP <- COHORT_TMP[,.(person_id,study_entry_date)]
   
    namenewvar<-c()
    for (type in c("narrow","possible")) {
      print(type)
      counter<-0
      counter2<-0
      summarystatOUTCOME<-vector(mode="list")
      addvarOUTCOME <- vector(mode="list")
      FirstJan<-vector(mode="list")
      for (year in c(firstYearComponentAnalysis,secondYearComponentAnalysis)) {
        FirstJan[[year]]<-as.Date(as.character(paste0(year,"0101")), date_format)
  
        for (level1 in c("HOSP","PC")) {
          namenewvar <- paste0(OUTCOME,"_",type,"_",level1,"_",year)
          counter<-counter+1
          counter2<-counter2+1
          summarystatOUTCOME[[counter2]]<-list(c("max"),namenewvar,namenewvar)
          addvarOUTCOME[[counter]]=list(c(namenewvar),"1",paste0("(",condmeaning[[level1]], ") & date<=as.Date('",FirstJan[[year]],"')+365 & date>=as.Date('",FirstJan[[year]],"')"))
          counter<-counter+1
          addvarOUTCOME[[counter]]=list(c(namenewvar),"0",paste0("is.na(",namenewvar,")"))
        }
      }
      
      selectionOUTCOME <- "date>=study_entry_date - 365 "
      # implement datasource-specific algorithms
      if (thisdatasource %in% datasources_with_specific_algorithms){
        for (meaningevent in exclude_meanings_from_OUTCOME[[thisdatasource]][[OUTCOME]]){
          selectionOUTCOME <- paste0(selectionOUTCOME," & meaning_of_event!= '",meaningevent,"' ")
        }
      }
      # delete records that are not observed in this whole subpopulation
      if (this_datasource_has_subpopulations == TRUE){
        selectionOUTCOME <- paste0(selectionOUTCOME,' & ',select_in_subpopulationsEVENTS[[subpop]])
      }
      nameconceptsetdatasetOUTCOMEtype <- paste0(OUTCOME, "_",type)
      components <- MergeFilterAndCollapse(
        listdatasetL= list(get(load(paste0(dirtemp,nameconceptsetdatasetOUTCOMEtype,".RData"))[[1]])),
        condition = selectionOUTCOME,
        key = c("person_id"),
        datasetS = COHORT_TMP,
        additionalvar = addvarOUTCOME,
        saveintermediatedataset = T,
        nameintermediatedataset = paste0(dirtemp,'tempfile'),
        strata = c("person_id"),
        summarystat = summarystatOUTCOME
      )
      
      
      load(paste0(dirtemp,'tempfile.RData') )
      if (this_datasource_has_subpopulations == TRUE){  
        tempOUTCOME[[type]][[subpop]] <- tempfile
        componentsOUTCOME[[type]][[subpop]]<- components 
      }else{
        tempOUTCOME[[type]] <- tempfile
        componentsOUTCOME[[type]]<- components 
      }
      rm(nameconceptsetdatasetOUTCOMEtype,list = paste0(nameconceptsetdatasetOUTCOMEtype) )
    }
    
  }

  for (type in c("narrow","possible")) {
    nameobjectOUTCOMEtype <- paste0('D3_events_',OUTCOME,"_",type)
    foroutput <- tempOUTCOME[[type]]
    assign(nameobjectOUTCOMEtype,foroutput)
    save(nameobjectOUTCOMEtype,file=paste0(dirtemp,paste0(nameobjectOUTCOMEtype,".RData")),list = nameobjectOUTCOMEtype)
    rm(foroutput)
    rm(nameobjectOUTCOMEtype,list = nameobjectOUTCOMEtype)
  }
     
 
  nameobjectOUTCOME <- paste0("D3_components_",OUTCOME)
  componentsOUTCOMEfinal <- vector(mode = 'list')
  for (subpop in subpopulations_non_empty) {
    if (this_datasource_has_subpopulations == TRUE){ 
      OUTCOME_narrow <- componentsOUTCOME[['narrow']][[subpop]]
      OUTCOME_possible <- componentsOUTCOME[['possible']][[subpop]]
    }else{
      OUTCOME_narrow <- componentsOUTCOME[['narrow']]
      OUTCOME_possible <- componentsOUTCOME[['possible']]
    }
    temp2 <- merge(COHORT_TMP,OUTCOME_narrow, by="person_id",all.x  = T)
    temp2 <- merge(temp2,OUTCOME_possible, by="person_id",all.x = T)
    temp2[is.na(temp2)] <- 0
    if (this_datasource_has_subpopulations == TRUE){ 
      componentsOUTCOMEfinal[[subpop]] <- temp2
    }
  }  
  if (this_datasource_has_subpopulations == TRUE){
    assign(nameobjectOUTCOME, componentsOUTCOMEfinal)
  }else{
    assign(nameobjectOUTCOME, temp2)
  }
  save(nameobjectOUTCOME,file=paste0(dirtemp,paste0(nameobjectOUTCOME,".RData")),list= nameobjectOUTCOME)
  rm(OUTCOME_narrow,OUTCOME_possible,temp2,componentsOUTCOMEfinal,componentsOUTCOME,tempOUTCOME)
  rm(nameobjectOUTCOME, list = nameobjectOUTCOME)
 
  rm(addvarOUTCOME,D4_study_population,summarystatOUTCOME, COHORT_TMP,tempfile,components)
  
}

  


