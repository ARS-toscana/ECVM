###################################################################
# ASSIGN PARAMETERS DESCRIBING THE DATA MODEL OF THE INPUT FILES
###################################################################

# assign -ECVM_CDM_tables-: it is a 2-level list describing the ECVM CDM tables, and will enter the function as the first parameter. the first level is the data domain (in the example: 'Diagnosis' and 'Medicines') and the second level is the list of tables that has a column pertaining to that data domain 

ECVM_CDM_tables <- vector(mode="list")

files<-sub('\\.csv$', '', list.files(dirinput))
for (i in 1:length(files)) {
  if (str_detect(files[i],"^VACCINES"))  ECVM_CDM_tables[["VaccineATC"]][[(length(ECVM_CDM_tables[["VaccineATC"]]) + 1)]]<-files[i]
}

alldomain<-names(ECVM_CDM_tables)

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

