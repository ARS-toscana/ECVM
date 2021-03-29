###################################################################
# DESCRIBE THE ATTRIBUTE-VALUE PAIRS
###################################################################
CDM_SOURCE<- fread(paste0(dirinput,"CDM_SOURCE.csv"))
thidatasource <- as.character(CDM_SOURCE[1,2])

# -itemset_AVpair_our_study- is a nested list, with 3 levels: foreach study variable, for each coding system of its data domain, the list of AVpair is recorded

study_variables_of_our_study <- c("GESTAGE_FROM_LMP_WEEKS","GESTAGE_FROM_LMP_DAYS","GESTAGE_FROM_USOUNDS","DATESTARTPREGNANCY")

itemset_AVpair_our_study <- vector(mode="list")
datasources<-c("ARS","BIPS","BIFAP","FISABIO","SIDIAP","PEDIANET","PHARMO")
#itemset_domains[["GESTAGE_FROM_LMP_WEEKS"]] = "Survey"


# specification GESTAGE_FROM_LMP_WEEKS
files<-sub('\\.csv$', '', list.files(dirinput))
for (i in 1:length(files)) {
  if (str_detect(files[i],"^SURVEY_OB")) {
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_WEEKS"]][[files[i]]][["ARS"]] <- list(list("CAP1","SETTAMEN"))
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_WEEKS"]][[files[i]]][["AARHUS"]] <- list()
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_WEEKS"]][[files[i]]][["AARHUS"]] <- list() # AARHUS not in this project
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_WEEKS"]][[files[i]]][["BPE"]] <- list()
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_WEEKS"]][[files[i]]][["BIPS"]] <- list() 
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_WEEKS"]][[files[i]]][["BIFAP"]] <- list() # no pregnancies
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_WEEKS"]][[files[i]]][["FISABIO"]] <- list() #no data in FISABIO for this project  list(list("CMBD","semanasgest"))
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_WEEKS"]][[files[i]]][["SIDIAP"]] <- list()
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_WEEKS"]][[files[i]]][["PEDIANET"]] <- list() # no pregnancy in PEDIANET
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_WEEKS"]][[files[i]]][["PHARMO"]] <- list()
    for (dat in datasources) {
      itemset_AVpair_our_study[["GESTAGE_FROM_LMP_DAYS"]][[files[i]]][[dat]]=list()
    }
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_DAYS"]][[files[i]]][["AARHUS"]] <- list(list("MFR","Gestationsalder_dage"))
    itemset_AVpair_our_study[["GESTAGE_FROM_LMP_DAYS"]][[files[i]]][["BPE"]] <- list(list("HOSPITALISATION","AGE_GES"))
    
    # specification GESTAGE_FROM_USOUNDS
    itemset_AVpair_our_study[["GESTAGE_FROM_USOUNDS"]][[files[i]]][["ARS"]] <- list(list("CAP1","GEST_ECO"))
    itemset_AVpair_our_study[["GESTAGE_FROM_USOUNDS"]][[files[i]]][["AARHUS"]] <- list()
    itemset_AVpair_our_study[["GESTAGE_FROM_USOUNDS"]][[files[i]]][["BPE"]] <- list(list("HOSPITALISATION","DEL_REG_ENT"))
    itemset_AVpair_our_study[["GESTAGE_FROM_USOUNDS"]][[files[i]]][["BIPS"]] <- list() 
    itemset_AVpair_our_study[["GESTAGE_FROM_USOUNDS"]][[files[i]]][["BIFAP"]] <- list() # no pregnancies
    itemset_AVpair_our_study[["GESTAGE_FROM_USOUNDS"]][[files[i]]][["FISABIO"]] <- list()
    itemset_AVpair_our_study[["GESTAGE_FROM_USOUNDS"]][[files[i]]][["SIDIAP"]] <- list(list("Pregnancies","durada"))
    itemset_AVpair_our_study[["GESTAGE_FROM_USOUNDS"]][[files[i]]][["PEDIANET"]] <- list()
    itemset_AVpair_our_study[["GESTAGE_FROM_USOUNDS"]][[files[i]]][["PHARMO"]] <- list()
    
    # specification DATESTARTPREGNANCY
    itemset_AVpair_our_study[["DATESTARTPREGNANCY"]][[files[i]]][["ARS"]] <- list()
    itemset_AVpair_our_study[["DATESTARTPREGNANCY"]][[files[i]]][["AARHUS"]] <- list()
    itemset_AVpair_our_study[["DATESTARTPREGNANCY"]][[files[i]]][["BPE"]] <- list()
    itemset_AVpair_our_study[["DATESTARTPREGNANCY"]][[files[i]]][["BIPS"]] <- list(list("T_PREG","PREG_BEG_EDD"))
    itemset_AVpair_our_study[["DATESTARTPREGNANCY"]][[files[i]]][["BIFAP"]] <- list() # no pregnancies
    itemset_AVpair_our_study[["DATESTARTPREGNANCY"]][[files[i]]][["FISABIO"]] <- list(list("CMBD","f_concep"))
    itemset_AVpair_our_study[["DATESTARTPREGNANCY"]][[files[i]]][["SIDIAP"]] <- list(list("Pregnancies","dur"))
    itemset_AVpair_our_study[["DATESTARTPREGNANCY"]][[files[i]]][["PEDIANET"]] <- list()
    itemset_AVpair_our_study[["DATESTARTPREGNANCY"]][[files[i]]][["PHARMO"]] <- list(list("Perined","RESP_ZW")) # TO BE CHECKED
    
  }
}


itemset_AVpair_our_study_this_datasource<-vector(mode="list")

for (t in  names(itemset_AVpair_our_study)) {
  for (f in names(itemset_AVpair_our_study[[t]])) {
    for (s in names(itemset_AVpair_our_study[[t]][[f]])) {
      if (s==thidatasource ){
        itemset_AVpair_our_study_this_datasource[[t]][[f]]<-itemset_AVpair_our_study[[t]][[f]][[s]]
      }
    }
  }
}
    

# 
# for (t in  names(person_id)) {
#   person_id = person_id [[t]]
# }
# 
# 
# for (t in  names(date)) {
#   date = date [[t]]
# }

