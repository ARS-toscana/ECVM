###################################################################
# ASSIGN PARAMETERS DESCRIBING THE DATA MODEL OF THE INPUT FILES
###################################################################

# assign -ConcePTION_CDM_tables-: it is a 2-level list describing the ConcePTION CDM tables, and will enter the function as the first parameter. the first level is the data domain (in the example: 'Diagnosis' and 'Medicines') and the second level is the list of tables that has a column pertaining to that data domain 

ConcePTION_CDM_tables <- vector(mode="list")

files<-sub('\\.csv$', '', list.files(dirinput))
for (i in 1:length(files)) {
  if (str_detect(files[i],"^VACCINES"))  ConcePTION_CDM_tables[["VaccineATC"]][[(length(ConcePTION_CDM_tables[["VaccineATC"]]) + 1)]]<-files[i]
}

alldomain<-names(ConcePTION_CDM_tables)

ConcePTION_CDM_codvar <- vector(mode="list")
person_id <- vector(mode="list")
date<- vector(mode="list")
ConcePTION_CDM_datevar<-vector(mode="list")

for (ds in ConcePTION_CDM_tables[["VaccineATC"]]) {
  ConcePTION_CDM_codvar[["VaccineATC"]][[ds]] <- "vx_atc"
  person_id[["VaccineATC"]][[ds]] <- "person_id"
  date[["VaccineATC"]][[ds]] <- "vx_admin_date"
  ConcePTION_CDM_datevar[["VaccineATC"]][[ds]] <- "vx_admin_date"
}

