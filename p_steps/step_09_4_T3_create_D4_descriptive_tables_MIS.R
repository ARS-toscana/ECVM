na_to_0 = function(DT) {
  for (i in names(DT))
    DT[is.na(get(i)), (i):=0]
  return(DT)
}

list_outcomes_MIS <- c("MIS_narrow","KD_narrow","MIS_KD_narrow","MISCC_narrow", "MIS_broad","KD_broad","MIS_KD_broad","MISCC_broad","MYOCARD_narrow","MYOCARD_possible","Myocardalone_narrow","Myocardalone_possible")

for (subpop in subpopulations_non_empty) {  
  print(subpop)
  
  load(paste0(dirtemp,"D3_Vaccin_cohort",suffix[[subpop]],".RData"))
  load(paste0(dirtemp,"D3_study_population",suffix[[subpop]],".RData"))
  load(paste0(diroutput,"D3_study_population_cov_ALL",suffix[[subpop]],".RData"))
  load(paste0(diroutput,"D4_population_b",suffix[[subpop]],".RData"))
  load(paste0(diroutput,"D4_population_c",suffix[[subpop]],".RData"))
  load(paste0(diroutput,"D4_population_d",suffix[[subpop]],".RData"))
  
  D3_Vaccin_cohort<-get(paste0("D3_Vaccin_cohort",suffix[[subpop]]))
  rm(list=paste0("D3_Vaccin_cohort",suffix[[subpop]]))
  D3_study_population<-get(paste0("D3_study_population",suffix[[subpop]]))
  rm(list=paste0("D3_study_population",suffix[[subpop]]))
  D3_study_population_cov_ALL<-get(paste0("D3_study_population_cov_ALL",suffix[[subpop]]))
  rm(list=paste0("D3_study_population_cov_ALL",suffix[[subpop]]))
  D4_population_b<-get(paste0("D4_population_b",suffix[[subpop]]))
  rm(list=paste0("D4_population_b",suffix[[subpop]]))
  D4_population_c<-get(paste0("D4_population_c",suffix[[subpop]]))
  rm(list=paste0("D4_population_c",suffix[[subpop]]))
  D4_population_d<-get(paste0("D4_population_d",suffix[[subpop]]))
  rm(list=paste0("D4_population_d",suffix[[subpop]]))
  

D4_population_c <- D4_population_c[, .(person_id, agebands_at_1_jan_2021, fup_days)]
D4_population_d <- D4_population_d[, .(person_id, agebands_at_1_jan_2021, fup_days, type_vax_1)]

D4_population_b_temp <- D4_population_b[, .(person_id, age_at_1_jan_2021, agebands_at_1_jan_2021)]
setnames(D4_population_b_temp, c("agebands_at_1_jan_2021", "age_at_1_jan_2021"), c("ageband_at_study_entry", "age_at_study_entry"))

D3_study_population <- D3_study_population[, age_at_study_entry := NULL]
D3_study_population <- merge(D3_study_population, D4_population_b_temp, by = "person_id")

D4_descriptive_dataset_age_studystart <- D3_study_population[, .(person_id, age_at_study_entry, fup_days)]
D4_descriptive_dataset_age_studystart <- D4_descriptive_dataset_age_studystart[,c("Age_P25", "Age_P50", "Age_p75") :=
                                                                                 as.list(round(quantile(age_at_study_entry, probs = c(0.25, 0.50, 0.75)), 0))]
D4_descriptive_dataset_age_studystart <- D4_descriptive_dataset_age_studystart[, c("Age_mean", "Age_min", "Age_max") :=
                                                                                 list(round(mean(age_at_study_entry), 0), min(age_at_study_entry), max(age_at_study_entry))]

D4_descriptive_dataset_age_studystart <- D4_descriptive_dataset_age_studystart[, Followup := round(sum(fup_days) / 365.25)][, Datasource := thisdatasource]
D4_descriptive_dataset_age_studystart <- unique(D4_descriptive_dataset_age_studystart[, .(Datasource, Followup, Age_P25, Age_P50, Age_p75, Age_mean, Age_min, Age_max)])

nameoutput <- paste0("D4_descriptive_dataset_age_studystart_MIS",suffix[[subpop]])
assign(nameoutput, D4_descriptive_dataset_age_studystart)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)


load(paste0(dirtemp,"D3_study_population",suffix[[subpop]],".RData"))

D3_study_population<-get(paste0("D3_study_population",suffix[[subpop]]))
rm(list=paste0("D3_study_population",suffix[[subpop]]))

D4_descriptive_dataset_ageband_studystart <- D3_study_population[, .(person_id, ageband_at_study_entry)]
setnames(D4_descriptive_dataset_ageband_studystart, "ageband_at_study_entry", "age_at_study_entry")

recode_age_vect <- c("0-11" = "AgeCat_011", "12-17" = "AgeCat_1217", "18-19" = "AgeCat_1819", "20-29" = "AgeCat_2029",
                     "30-39" = "AgeCat_3039", "40-49" = "AgeCat_4049", "50-59" = "AgeCat_5059", "60-69" = "AgeCat_6069",
                     "70-79" = "AgeCat_7079", "80+" = "AgeCat_80+")
D4_descriptive_dataset_ageband_studystart[, age_at_study_entry := recode_age_vect[age_at_study_entry]]

D4_descriptive_dataset_ageband_studystart <- unique(D4_descriptive_dataset_ageband_studystart[, N := .N, by = "age_at_study_entry"][, person_id := NULL])
D4_descriptive_dataset_ageband_studystart <- D4_descriptive_dataset_ageband_studystart[, Datasource := thisdatasource]
D4_descriptive_dataset_ageband_studystart <- data.table::dcast(D4_descriptive_dataset_ageband_studystart, Datasource ~ age_at_study_entry, value.var = "N")

nameoutput <- paste0("D4_descriptive_dataset_ageband_studystart_MIS",suffix[[subpop]])
assign(nameoutput, D4_descriptive_dataset_ageband_studystart)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)


D4_descriptive_dataset_sex_studystart <- D3_study_population[, .(person_id, sex)]
D4_descriptive_dataset_sex_studystart <- unique(D4_descriptive_dataset_sex_studystart[, N := .N, by = "sex"][, person_id := NULL])
D4_descriptive_dataset_sex_studystart <- D4_descriptive_dataset_sex_studystart[, Datasource := thisdatasource]
D4_descriptive_dataset_sex_studystart <- D4_descriptive_dataset_sex_studystart[, sex := fifelse(sex == 1, "Sex_male", "Sex_female")]
D4_descriptive_dataset_sex_studystart <- data.table::dcast(D4_descriptive_dataset_sex_studystart, Datasource ~ sex, value.var = "N")

nameoutput <- paste0("D4_descriptive_dataset_sex_studystart_MIS",suffix[[subpop]])
assign(nameoutput, D4_descriptive_dataset_sex_studystart)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)


setnames(D3_study_population_cov_ALL,
         c("CV_either_DX_or_DP", "COVCANCER_either_DX_or_DP", "COVCOPD_either_DX_or_DP", "COVHIV_either_DX_or_DP",
           "COVCKD_either_DX_or_DP", "COVDIAB_either_DX_or_DP", "COVOBES_either_DX_or_DP", "COVSICKLE_either_DX_or_DP",
           "IMMUNOSUPPR_at_study_entry"),
         c("CV", "Cancer", "CLD", "HIV", "CKD", "Diabetes", "Obesity", "Sicklecell", "immunosuppressants"))

cols_chosen <- c("CV", "Cancer", "CLD", "HIV", "CKD", "Diabetes", "Obesity", "Sicklecell", "immunosuppressants")
D4_descriptive_dataset_covariate_studystart <- D3_study_population_cov_ALL[, lapply(.SD, sum, na.rm=TRUE), .SDcols = cols_chosen]
D4_descriptive_dataset_covariate_studystart <- D4_descriptive_dataset_covariate_studystart[, Datasource := thisdatasource]
D4_descriptive_dataset_covariate_studystart <- D4_descriptive_dataset_covariate_studystart[, .(Datasource, CV, Cancer, CLD, HIV, CKD, Diabetes, Obesity, Sicklecell, immunosuppressants)]

nameoutput <- paste0("D4_descriptive_dataset_covariate_studystart_MIS",suffix[[subpop]])
assign(nameoutput, D4_descriptive_dataset_covariate_studystart)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)


D4_followup_fromstudystart_MIS_c <- D4_population_c[, round(as.integer(sum(fup_days)) / 365), by = "agebands_at_1_jan_2021"]
D4_followup_fromstudystart_MIS_c <- data.table::dcast(D4_followup_fromstudystart_MIS_c, . ~ agebands_at_1_jan_2021, value.var = c("V1"))
D4_followup_fromstudystart_MIS_c <- D4_followup_fromstudystart_MIS_c[, . := NULL][, Datasource := thisdatasource]
setnames(D4_followup_fromstudystart_MIS_c, c("01-19", "20-29", "30-39", "40-49", "50-59",
             "60-69", "70-79", "80+"), c("Followup_0119", "Followup_2029", "Followup_3039", "Followup_4049", "Followup_5059",
               "Followup_6069", "Followup_7079", "Followup_80"), skip_absent=TRUE)

nameoutput <- paste0("D4_followup_fromstudystart_MIS_c",suffix[[subpop]])
assign(nameoutput, D4_followup_fromstudystart_MIS_c)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)





D4_followup_fromstudystart <- D4_population_b[, .(person_id, sex, agebands_at_1_jan_2021, fup_days)]
# D4_followup_fromstudystart <- D3_study_population[, .(person_id, sex, age_at_study_entry, study_entry_date, study_exit_date, fup_days)]

D4_followup_fromstudystart <- D4_followup_fromstudystart[, sex := fifelse(sex == 1, "Followup_males", "Followup_females")]
D4_followup_fromstudystart <- D4_followup_fromstudystart[, sex_value := sum(fup_days), by = "sex"]

setnames(D4_followup_fromstudystart, "agebands_at_1_jan_2021", "age_at_study_entry")

recode_age_vect <- c("0-11" = "Followup_011", "12-17" = "Followup_1217", "18-19" = "Followup_1819", "20-29" = "Followup_2029",
                     "30-39" = "Followup_3039", "40-49" = "Followup_4049", "50-59" = "Followup_5059", "60-69" = "Followup_6069",
                     "70-79" = "Followup_7079", "80+" = "Followup_80")
D4_followup_fromstudystart[, age_at_study_entry := recode_age_vect[age_at_study_entry]]


D4_followup_fromstudystart <- D4_followup_fromstudystart[, cohort_value := sum(fup_days), by = "age_at_study_entry"]
D4_followup_fromstudystart <- D4_followup_fromstudystart[, Followup_total := sum(fup_days)]
D4_followup_fromstudystart <- unique(D4_followup_fromstudystart[, c("person_id", "fup_days") := NULL][, Datasource := thisdatasource])

D4_followup_sex <- unique(D4_followup_fromstudystart[, .(Datasource, sex, sex_value)])
D4_followup_sex <- data.table::dcast(D4_followup_sex, Datasource ~ sex, value.var = c("sex_value"))

D4_followup_cohort <- unique(D4_followup_fromstudystart[, .(Datasource, age_at_study_entry, cohort_value)])
D4_followup_cohort <- data.table::dcast(D4_followup_cohort, Datasource ~ age_at_study_entry, value.var = c("cohort_value"))

D4_followup_fromstudystart <- Reduce(merge, list(D4_followup_sex, D4_followup_cohort))

vect_col_to_year <- c("Followup_males", "Followup_females", "Followup_011", "Followup_1217",
                      "Followup_1819", "Followup_2029", "Followup_3039", "Followup_4049",
                      "Followup_5059", "Followup_6069", "Followup_7079", "Followup_80")

tot_col <- c("Datasource", vect_col_to_year)

D4_followup_fromstudystart <- D4_followup_fromstudystart[, lapply(.SD, as.numeric), .SDcols = vect_col_to_year]
D4_followup_fromstudystart <- D4_followup_fromstudystart[, (vect_col_to_year) := round(.SD / 365.25),
                                                         .SDcols = vect_col_to_year]
D4_followup_fromstudystart <- D4_followup_fromstudystart[, Datasource := thisdatasource]

D4_followup_fromstudystart <- D4_followup_fromstudystart[, ..tot_col]

nameoutput <- paste0("D4_followup_fromstudystart_MIS",suffix[[subpop]])
assign(nameoutput, D4_followup_fromstudystart)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)










D4_descriptive_dataset_age_vax1 <- D3_Vaccin_cohort[, .(person_id, type_vax_1, date_vax1, fup_vax1, age_at_date_vax_1)]
D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[, Month_vax1 := month(date_vax1)]
setnames(D4_descriptive_dataset_age_vax1, "type_vax_1", "Vax_dose1")
D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[,c("Age_P25", "Age_P50", "Age_p75") :=
                                                                     as.list(round(quantile(age_at_date_vax_1, probs = c(0.25, 0.50, 0.75)), 0)), by = c("Vax_dose1", "Month_vax1")]
D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[, c("Age_mean", "Age_min", "Age_max") :=
                                                                     list(round(mean(age_at_date_vax_1), 0), min(age_at_date_vax_1), max(age_at_date_vax_1)), by = c("Vax_dose1", "Month_vax1")]

D4_descriptive_dataset_age_vax1 <- D4_descriptive_dataset_age_vax1[, Followup_vax1 := sum(fup_vax1), by = c("Vax_dose1", "Month_vax1")][, Datasource := thisdatasource]
D4_descriptive_dataset_age_vax1 <- unique(D4_descriptive_dataset_age_vax1[, .(Datasource, Vax_dose1, Month_vax1, Followup_vax1,
                                                                              Age_P25, Age_P50, Age_p75, Age_mean, Age_min, Age_max)])

nameoutput <- paste0("D4_descriptive_dataset_age_vax1_MIS",suffix[[subpop]])
assign(nameoutput, D4_descriptive_dataset_age_vax1)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)


D4_descriptive_dataset_ageband_vax <- D3_Vaccin_cohort[, .(person_id, type_vax_1, age_at_date_vax_1)]
D4_descriptive_dataset_ageband_vax [,age_at_date_vax_1:=cut(age_at_date_vax_1, breaks = Agebands,  labels = Agebands_labels)]

D4_descriptive_dataset_ageband_vax[, age_at_date_vax_1 := recode_age_vect[age_at_date_vax_1]]

D4_descriptive_dataset_ageband_vax <- unique(D4_descriptive_dataset_ageband_vax[, N := .N, by = c("age_at_date_vax_1", "type_vax_1")][, person_id := NULL])

D4_descriptive_dataset_ageband_vax <- D4_descriptive_dataset_ageband_vax[, Datasource := thisdatasource]
D4_descriptive_dataset_ageband_vax <- data.table::dcast(D4_descriptive_dataset_ageband_vax, Datasource + type_vax_1 ~ age_at_date_vax_1, value.var = "N")
# D4_descriptive_dataset_ageband_vax <- na_to_0(D4_descriptive_dataset_ageband_vax)

nameoutput <- paste0("D4_descriptive_dataset_ageband_vax_MIS",suffix[[subpop]])
assign(nameoutput, D4_descriptive_dataset_ageband_vax)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)


D4_followup_from_vax_MIS_d <- D3_Vaccin_cohort[, .(person_id, type_vax_1, age_at_date_vax_1, fup_vax1)]
D4_followup_from_vax_MIS_d [,age_at_date_vax_1:=cut(age_at_date_vax_1, breaks = Agebands,  labels = Agebands_labels)]
D4_followup_from_vax_MIS_d <- D4_followup_from_vax_MIS_d[, sum(fup_vax1), by = "type_vax_1"]

nameoutput <- paste0("D4_followup_from_vax_MIS_d",suffix[[subpop]])
assign(nameoutput, D4_followup_from_vax_MIS_d)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)





load(paste0(dirtemp,"D3_study_population",suffix[[subpop]],".RData"))
load(paste0(diroutput,"D3_study_population_cov_ALL",suffix[[subpop]],".RData"))
load(paste0(diroutput,"D4_population_c",suffix[[subpop]],".RData"))


D3_study_population<-get(paste0("D3_study_population",suffix[[subpop]]))
rm(list=paste0("D3_study_population",suffix[[subpop]]))
D3_study_population_cov_ALL<-get(paste0("D3_study_population_cov_ALL",suffix[[subpop]]))
rm(list=paste0("D3_study_population_cov_ALL",suffix[[subpop]]))
D4_population_c<-get(paste0("D4_population_c",suffix[[subpop]]))
rm(list=paste0("D4_population_c",suffix[[subpop]]))


D4_descriptive_dataset_age_studystart_c <- D4_population_c[, .(person_id, age_at_1_jan_2021, agebands_at_1_jan_2021,cohort_entry_date_MIS_c,fup_days)]
setnames(D4_descriptive_dataset_age_studystart_c, c("agebands_at_1_jan_2021", "age_at_1_jan_2021"), c("ageband_at_study_entry", "age_at_study_entry"))

D4_descriptive_dataset_covid_studystart_c <- D4_descriptive_dataset_age_studystart_c[, .(person_id, cohort_entry_date_MIS_c)]
D4_descriptive_dataset_covid_studystart_c[,covid_month:=(as.character(substr(cohort_entry_date_MIS_c, 1, 7)))][,cohort_entry_date_MIS_c:=NULL]
D4_descriptive_dataset_covid_studystart_c <- unique(D4_descriptive_dataset_covid_studystart_c[, N := .N, by = "covid_month"][, person_id := NULL])
D4_descriptive_dataset_covid_studystart_c <- D4_descriptive_dataset_covid_studystart_c[, Datasource := thisdatasource]
recode_age_vect_c <- c("2020-01" = "01-2020", "2020-02" = "02-2020", "2020-03" = "03-2020", "2020-04" = "04-2020","2020-05" = "05-2020","2020-06" = "06-2020","2020-07" = "07-2020","2020-08" = "08-2020","2020-09" = "09-2020","2020-10" = "10-2020","2020-11" = "11-2020","2020-12" = "12-2020","2021-01" = "01-2021", "2021-02" = "02-2021", "2021-03" = "03-2021", "2021-04" = "04-2021","2021-05" = "05-2021","2021-06" = "06-2021","2021-07" = "07-2021","2021-08" = "08-2021","2021-09" = "09-2021")
D4_descriptive_dataset_covid_studystart_c[, covid_month := recode_age_vect_c[covid_month]]
D4_descriptive_dataset_covid_studystart_c <- data.table::dcast(D4_descriptive_dataset_covid_studystart_c, Datasource ~ covid_month, value.var = "N")
 

nameoutput <- paste0("D4_descriptive_dataset_covid_studystart_c_MIS",suffix[[subpop]])
assign(nameoutput, D4_descriptive_dataset_covid_studystart_c)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)


D4_descriptive_dataset_age_studystart_c <- D4_descriptive_dataset_age_studystart_c[,c("Age_P25", "Age_P50", "Age_p75") :=
                                                                                     as.list(round(quantile(age_at_study_entry, probs = c(0.25, 0.50, 0.75)), 0))]
D4_descriptive_dataset_age_studystart_c <- D4_descriptive_dataset_age_studystart_c[, c("Age_mean", "Age_min", "Age_max") :=
                                                                                     list(round(mean(age_at_study_entry), 0), min(age_at_study_entry), max(age_at_study_entry))]

D4_descriptive_dataset_age_studystart_c <- D4_descriptive_dataset_age_studystart_c[, Followup := round(sum(fup_days) / 365.25)][, Datasource := thisdatasource]
D4_descriptive_dataset_age_studystart_c <- unique(D4_descriptive_dataset_age_studystart_c[, .(Datasource, Followup, Age_P25, Age_P50, Age_p75, Age_mean, Age_min, Age_max)])

nameoutput <- paste0("D4_descriptive_dataset_age_studystart_c_MIS",suffix[[subpop]])
assign(nameoutput, D4_descriptive_dataset_age_studystart_c)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)


D4_descriptive_dataset_ageband_studystart_c <- D4_population_c[, .(person_id, agebands_at_1_jan_2021)]
setnames(D4_descriptive_dataset_ageband_studystart_c, "agebands_at_1_jan_2021", "age_at_study_entry")

recode_age_vect <- c("0-11" = "AgeCat_011", "12-17" = "AgeCat_1217", "18-19" = "AgeCat_1819", "20-29" = "AgeCat_2029",
                     "30-39" = "AgeCat_3039", "40-49" = "AgeCat_4049", "50-59" = "AgeCat_5059", "60-69" = "AgeCat_6069",
                     "70-79" = "AgeCat_7079", "80+" = "AgeCat_80+")
D4_descriptive_dataset_ageband_studystart_c[, age_at_study_entry := recode_age_vect[age_at_study_entry]]

D4_descriptive_dataset_ageband_studystart_c <- unique(D4_descriptive_dataset_ageband_studystart_c[, N := .N, by = "age_at_study_entry"][, person_id := NULL])
D4_descriptive_dataset_ageband_studystart_c <- D4_descriptive_dataset_ageband_studystart_c[, Datasource := thisdatasource]
D4_descriptive_dataset_ageband_studystart_c <- data.table::dcast(D4_descriptive_dataset_ageband_studystart_c, Datasource ~ age_at_study_entry, value.var = "N")

nameoutput <- paste0("D4_descriptive_dataset_ageband_studystart_c_MIS",suffix[[subpop]])
assign(nameoutput, D4_descriptive_dataset_ageband_studystart_c)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)



setnames(D3_study_population_cov_ALL,
         c("CV_either_DX_or_DP", "COVCANCER_either_DX_or_DP", "COVCOPD_either_DX_or_DP", "COVHIV_either_DX_or_DP",
           "COVCKD_either_DX_or_DP", "COVDIAB_either_DX_or_DP", "COVOBES_either_DX_or_DP", "COVSICKLE_either_DX_or_DP",
           "IMMUNOSUPPR_at_study_entry"),
         c("CV", "Cancer", "CLD", "HIV", "CKD", "Diabetes", "Obesity", "Sicklecell", "immunosuppressants"))

cols_chosen <- c("CV", "Cancer", "CLD", "HIV", "CKD", "Diabetes", "Obesity", "Sicklecell", "immunosuppressants")
D3_study_population_cov_ALL_c<-merge(D4_population_c,D3_study_population_cov_ALL,all.x=T,by="person_id")
D4_descriptive_dataset_covariate_studystart_c <- D3_study_population_cov_ALL_c[, lapply(.SD, sum, na.rm=TRUE), .SDcols = cols_chosen]
D4_descriptive_dataset_covariate_studystart_c <- D4_descriptive_dataset_covariate_studystart_c[, Datasource := thisdatasource]
D4_descriptive_dataset_covariate_studystart_c <- D4_descriptive_dataset_covariate_studystart_c[, .(Datasource, CV, Cancer, CLD, HIV, CKD, Diabetes, Obesity, Sicklecell, immunosuppressants)]

nameoutput <- paste0("D4_descriptive_dataset_covariate_studystart_c_MIS",suffix[[subpop]])
assign(nameoutput, D4_descriptive_dataset_covariate_studystart_c)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)

D4_followup_fromstudystart_MIS_c <- D4_population_c[, sum(fup_days)]
D4_followup_fromstudystart_MIS_c <- data.table(total = D4_followup_fromstudystart_MIS_c)

nameoutput <- paste0("D4_followup_fromstudystart_MIS_c",suffix[[subpop]])
assign(nameoutput, D4_followup_fromstudystart_MIS_c)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)



load(paste0(diroutput,"D4_population_d",suffix[[subpop]],".RData"))
D4_population_d<-get(paste0("D4_population_d",suffix[[subpop]]))
rm(list=paste0("D4_population_d",suffix[[subpop]]))
   

D4_descriptive_dataset_sex_vaccination <- D4_population_d[, .(person_id, sex, type_vax_1)]
D4_descriptive_dataset_sex_vaccination <- unique(D4_descriptive_dataset_sex_vaccination[, N := .N, by = c("sex", "type_vax_1")][, person_id := NULL])
D4_descriptive_dataset_sex_vaccination <- D4_descriptive_dataset_sex_vaccination[, Datasource := thisdatasource]
D4_descriptive_dataset_sex_vaccination <- D4_descriptive_dataset_sex_vaccination[, sex := fifelse(sex == 1, "Sex_male", "Sex_female")]
D4_descriptive_dataset_sex_vaccination <- data.table::dcast(D4_descriptive_dataset_sex_vaccination, Datasource + type_vax_1 ~ sex, value.var = "N")

nameoutput <- paste0("D4_descriptive_dataset_sex_vaccination_MIS",suffix[[subpop]])
assign(nameoutput, D4_descriptive_dataset_sex_vaccination)
fwrite(get(nameoutput), file = paste0(dirD4tables, nameoutput,".csv"))
rm(list=nameoutput)

}



