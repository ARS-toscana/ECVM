###################################################################
# ASSIGN PARAMETERS DESCRIBING THE DATA MODEL OF THE INPUT FILES
###################################################################

# assign -ECVM_CDM_tables-: it is a 2-level list describing the ECVM CDM tables, and will enter the function as the first parameter. the first level is the data domain (in the example: 'Diagnosis' and 'Medicines') and the second level is the list of tables that has a column pertaining to that data domain 

thisdatasource_has_prescriptions = TRUE

ECVM_CDM_tables <- vector(mode="list")

files<-sub('\\.csv$', '', list.files(dirinput))
for (i in 1:length(files)) {
  if (str_detect(files[i],"^VACCINES"))  ECVM_CDM_tables[["VaccineATC"]][[(length(ECVM_CDM_tables[["VaccineATC"]]) + 1)]]<-files[i]
}
files<-sub('\\.csv$', '', list.files(dirinput))
for (i in 1:length(files)) {
  if (str_detect(files[i],"^EVENTS"))  ECVM_CDM_tables[["Diagnosis"]][[(length(ECVM_CDM_tables[["Diagnosis"]]) + 1)]]<-files[i]
  else{if (str_detect(files[i],"^MEDICINES")) ECVM_CDM_tables[["Medicines"]][[(length(ECVM_CDM_tables[["Medicines"]]) + 1)]]<-files[i] }
}

alldomain<-names(ECVM_CDM_tables)

ECVM_CDM_EAV_tables <- vector(mode="list")
EAV_table<-c()
for (i in 1:length(files)) {
  if (str_detect(files[i],"^SURVEY_OB")) { ECVM_CDM_EAV_tables[["Diagnosis"]][[(length(ECVM_CDM_EAV_tables[["Diagnosis"]]) + 1)]]<-list(list(files[i], "so_source_table", "so_source_column"))
  EAV_table<-append(EAV_table,files[i])
  }
  else{if (str_detect(files[i],"^MEDICAL_OB")){ ECVM_CDM_EAV_tables[["Diagnosis"]][[(length(ECVM_CDM_EAV_tables[["Diagnosis"]]) + 1)]]<-list(list(files[i], "mo_source_table", "mo_source_column"))
  EAV_table<-append(EAV_table,files[i])
  }
  }
}

if(length(ECVM_CDM_EAV_tables)!=0) {
  for (t in  names(ECVM_CDM_EAV_tables)) {
    ECVM_CDM_EAV_tables_retrieve = ECVM_CDM_EAV_tables [[t]]
  }
}else { ECVM_CDM_EAV_tables_retrieve <- vector(mode="list")
}

ECVM_CDM_codvar <- vector(mode="list")
person_id <- vector(mode="list")
date<- vector(mode="list")
ECVM_CDM_datevar<-vector(mode="list")

for (ds in ECVM_CDM_tables[["VaccineATC"]]) {
  ECVM_CDM_codvar[["VaccineATC"]][[ds]] <- "vx_atc"
  person_id[["VaccineATC"]][[ds]] <- "person_id"
  date[["VaccineATC"]][[ds]] <- "vx_admin_date"
  ECVM_CDM_datevar[["VaccineATC"]][[ds]] <- "vx_admin_date"
}

if (length(ECVM_CDM_EAV_tables)!=0 ){
  for (dom in alldomain) {
    for (i in 1:(length(ECVM_CDM_tables[["Diagnosis"]]))){
      for (ds in append(ECVM_CDM_tables[[dom]],ECVM_CDM_EAV_tables[["Diagnosis"]][[i]][[1]][[1]])) {
        if (ds==ECVM_CDM_EAV_tables[["Diagnosis"]][[i]][[1]][[1]]) {
          if (str_detect(ds,"^SURVEY_OB"))  ECVM_CDM_codvar[["Diagnosis"]][[ds]]="so_source_value"
          if (str_detect(ds,"^MEDICAL_OB"))  ECVM_CDM_codvar[["Diagnosis"]][[ds]]="mo_source_value"
        }else{
          if (dom=="Medicines") ECVM_CDM_codvar[[dom]][[ds]]="medicinal_product_atc_code"
          if (dom=="Diagnosis") ECVM_CDM_codvar[[dom]][[ds]]="event_code"
        }
      }
    }
  }
}else{
  for (dom in alldomain) {
    for (ds in ECVM_CDM_tables[[dom]]) {
      if (dom=="Medicines") ECVM_CDM_codvar[[dom]][[ds]]="medicinal_product_atc_code"
      if (dom=="Diagnosis") ECVM_CDM_codvar[[dom]][[ds]]="event_code"
    }
  }
}

ECVM_CDM_coding_system_cols <-vector(mode="list")
#coding system
for (dom in alldomain) {
  for (ds in ECVM_CDM_tables[[dom]]) {
    if (dom=="Diagnosis") ECVM_CDM_coding_system_cols[[dom]][[ds]] = "event_record_vocabulary"
    #    if (dom=="Medicines") ECVM_CDM_coding_system_cols[[dom]][[ds]] = "code_indication_vocabulary"
  }
}

if (length(ECVM_CDM_EAV_tables)!=0 ){
  for (dom in alldomain) {
    for (i in 1:(length(ECVM_CDM_EAV_tables[["Diagnosis"]]))){
      for (ds in append(ECVM_CDM_tables[[dom]],ECVM_CDM_EAV_tables[["Diagnosis"]][[i]][[1]][[1]])) {
        if (ds==ECVM_CDM_EAV_tables[["Diagnosis"]][[i]][[1]][[1]]) {
          if (str_detect(ds,"^SURVEY_OB"))  ECVM_CDM_codvar[["Diagnosis"]][[ds]]="so_source_value"
          if (str_detect(ds,"^MEDICAL_OB"))  ECVM_CDM_codvar[["Diagnosis"]][[ds]]="mo_source_value"
        }else{
          if (dom=="Medicines") ECVM_CDM_codvar[[dom]][[ds]]="medicinal_product_atc_code"
          if (dom=="Diagnosis") ECVM_CDM_codvar[[dom]][[ds]]="event_code"
        }
      }
    }
  }
}else{
  for (dom in alldomain) {
    for (ds in ECVM_CDM_tables[[dom]]) {
      if (dom=="Medicines") ECVM_CDM_codvar[[dom]][[ds]]="medicinal_product_atc_code"
      if (dom=="Diagnosis") ECVM_CDM_codvar[[dom]][[ds]]="event_code"
    }
  }
}

#coding system
for (dom in alldomain) {
  for (ds in ECVM_CDM_tables[[dom]]) {
    if (dom=="Diagnosis") ECVM_CDM_coding_system_cols[[dom]][[ds]] = "event_record_vocabulary"
    #    if (dom=="Medicines") ECVM_CDM_coding_system_cols[[dom]][[ds]] = "code_indication_vocabulary"
  }
}

# assign 2 more 2-level lists: -id- -date-. They encode from the data model the name of the column(s) of each data table that contain, respectively, the personal identifier and the date. Those 2 lists are to be inputted in the rename_col option of the function. 
#NB: GENERAL  contains the names columns will have in the final datasets

if (length(ECVM_CDM_EAV_tables)!=0 ){
  for (dom in alldomain) {
    for (i in 1:(length(ECVM_CDM_EAV_tables[[dom]]))){
      for (ds in append(ECVM_CDM_tables[[dom]],ECVM_CDM_EAV_tables[[dom]][[i]][[1]][[1]])) {
        person_id [[dom]][[ds]] = "person_id"
      }
    }
  }
}else{
  for (dom in alldomain) {
    for (ds in ECVM_CDM_tables[[dom]]) {
      person_id [[dom]][[ds]] = "person_id"
    }
  }
}


if (length(ECVM_CDM_EAV_tables)!=0 ){
  for (dom in alldomain) {
    for (i in 1:(length(ECVM_CDM_EAV_tables[["Diagnosis"]]))){
      for (ds in append(ECVM_CDM_tables[[dom]],ECVM_CDM_EAV_tables[["Diagnosis"]][[i]][[1]][[1]])) {
        if (ds==ECVM_CDM_EAV_tables[["Diagnosis"]][[i]][[1]][[1]]) {
          if (str_detect(ds,"^SURVEY_OB")) date[["Diagnosis"]][[ds]]="so_date"
          if (str_detect(ds,"^MEDICAL_OB")) date[["Diagnosis"]][[ds]]="mo_date"
        }else{
          if (dom=="Medicines") { 
            # if (thisdatasource_has_prescriptions == TRUE){
            #   date[[dom]][[ds]]="date_prescription"
            # }else{
              date[[dom]][[ds]]="date_dispensing"
            # }
          }
          if (dom=="Diagnosis") date[[dom]][[ds]]="start_date_record"
        }
      }
    }
  }
}else{
  for (dom in alldomain) {
    for (ds in ECVM_CDM_tables[[dom]]) { 
      if (dom=="Medicines") { 
        if (thisdatasource_has_prescriptions == TRUE){
          date[[dom]][[ds]]="date_prescription"
        }else{
          date[[dom]][[ds]]="date_dispensing"
        }
      }
      if (dom=="Diagnosis") date[[dom]][[ds]]="start_date_record"
    }
  }
}


#DA CMD_SOURCE
ECVM_CDM_EAV_attributes<-vector(mode="list")
datasources<-c("ARS","TEST")

if (length(ECVM_CDM_EAV_tables)!=0 ){
  for (dom in alldomain) {
    for (i in 1:(length(ECVM_CDM_EAV_tables[[dom]]))){
      for (ds in ECVM_CDM_EAV_tables[[dom]][[i]][[1]][[1]]) {
        for (dat in datasources) {
          if (dom=="Diagnosis") ECVM_CDM_EAV_attributes[[dom]][[ds]][[dat]][["ICD9"]] <-  list(list("RMR","CAUSAMORTE"))
          ECVM_CDM_EAV_attributes[[dom]][[ds]][[dat]][["ICD10"]] <-  list(list("RMR","CAUSAMORTE_ICDX"))
          ECVM_CDM_EAV_attributes[[dom]][[ds]][[dat]][["SNOMED"]] <-  list(list("AP","COD_MORF_1"),list("AP","COD_MORF_2"),list("AP","COD_MORF_3"),list("AP","COD_TOPOG"))
          #        if (dom=="Medicines") ECVM_CDM_EAV_attributes[[dom]][[ds]][[dat]][["ICD9"]] <-  list(list("CAP1","SETTAMEN_ARSNEW"),list("CAP1","GEST_ECO"),list("AP","COD_MORF_1"),list("AP","COD_MORF_2"),list("AP","COD_MORF_3"),list("AP","COD_TOPOG"))
        }
      }
    }
  }
}


ECVM_CDM_EAV_attributes_this_datasource<-vector(mode="list")

if (length(ECVM_CDM_EAV_attributes)!=0 ){
  for (t in  names(ECVM_CDM_EAV_attributes)) {
    for (f in names(ECVM_CDM_EAV_attributes[[t]])) {
      for (s in names(ECVM_CDM_EAV_attributes[[t]][[f]])) {
        if (s==thisdatasource ){
          ECVM_CDM_EAV_attributes_this_datasource[[t]][[f]]<-ECVM_CDM_EAV_attributes[[t]][[f]][[s]]
        }
      }
    }
  }
}

if (length(ECVM_CDM_EAV_tables)!=0 ){
  for (dom in alldomain) {
    for (i in 1:(length(ECVM_CDM_EAV_tables[["Diagnosis"]]))){
      for (ds in append(ECVM_CDM_tables[[dom]],ECVM_CDM_EAV_tables[["Diagnosis"]][[i]][[1]][[1]])) {
        if (ds==ECVM_CDM_EAV_tables[["Diagnosis"]][[i]][[1]][[1]]) {
          if (str_detect(ds,"^SURVEY_OB")) ECVM_CDM_datevar[["Diagnosis"]][[ds]]="so_date"
          if (str_detect(ds,"^MEDICAL_OB"))  ECVM_CDM_datevar[["Diagnosis"]][[ds]]="mo_date"
        }else{
          if (dom=="Medicines") ECVM_CDM_datevar[[dom]][[ds]]= list("date_dispensing","date_prescription")
          if (dom=="Diagnosis") ECVM_CDM_datevar[[dom]][[ds]]=list("start_date_record","end_date_record")
        }
      }
    }
  }
}else{
  for (dom in alldomain) {
    for (ds in ECVM_CDM_tables[[dom]]) { 
      if (dom=="Medicines") ECVM_CDM_datevar[[dom]][[ds]]= list("date_dispensing","date_prescription")
      if (dom=="Diagnosis") ECVM_CDM_datevar[[dom]][[ds]]=list("start_date_record","end_date_record")
    }
  }
}


ECVM_CDM_datevar_retrieve<-list()

if (length(ECVM_CDM_EAV_tables)!=0 ){
  for (i in 1:(length(ECVM_CDM_EAV_tables[["Diagnosis"]]))){
    for (ds in ECVM_CDM_EAV_tables[["Diagnosis"]][[i]][[1]][[1]]) {
      ECVM_CDM_datevar_retrieve = ECVM_CDM_datevar [["Diagnosis"]]
    }
  }
}