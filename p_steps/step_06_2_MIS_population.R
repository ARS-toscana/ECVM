load(paste0(dirtemp, "D3_study_population.RData"))
load(paste0(dirtemp, "D3_events_ALL_OUTCOMES.RData"))
load(paste0(dirtemp, "D3_outcomes_covid.RData")) #L1plus

end_dic_2021<-as_date("20211231")
first_jan_2020<-as_date("20200101")
first_jan_2021<-as_date("20210101")


#add date of first covid to the population
temp_covid<-unique(D3_outcomes_covid[name_event=="COVID_L1plus",.(person_id,date_event)])
temp_covid<-temp_covid[,min(date_event,na.rm = T),by="person_id"]

setnames(temp_covid,"V1","covid_date")
D3_study_variables_for_MIS <- merge(D3_study_population, temp_covid, all.x = T, by="person_id")
rm(temp_covid)

#add date of MIS broad to the population
temp_MIS_broad<-D3_events_ALL_OUTCOMES[name_event=="MIS_broad",][,.(person_id,date_event)]
setnames(temp_MIS_broad,"date_event","MIS_date_broad")
D3_study_variables_for_MIS <- merge(D3_study_variables_for_MIS, temp_MIS_broad, all.x = T, by="person_id")
rm(temp_MIS_broad)

#add date of MIS narrow to the population
temp_MIS_narrow<-D3_events_ALL_OUTCOMES[name_event=="MIS_narrow",][,.(person_id,date_event)]
setnames(temp_MIS_narrow,"date_event","MIS_date_narrow")
D3_study_variables_for_MIS <- merge(D3_study_variables_for_MIS, temp_MIS_narrow, all.x = T, by="person_id")
rm(temp_MIS_narrow)

D3_study_variables_for_MIS<-D3_study_variables_for_MIS [,agebands_at_1_jan_2021:=cut(age_at_1_jan_2021, breaks = Agebands_MIS,  labels = Agebands_lables_MIS)]

save(D3_study_variables_for_MIS, file = paste0(dirtemp, "D3_study_variables_for_MIS.RData"))

#COHORT B
#add the study entry date for MIS
D3_study_variables_for_MIS[,study_entry_date_MIS_b:=max(first_jan_2020,study_entry_date,na.rm = T),by="person_id"]
#add the study exit date for MIS
D3_study_variables_for_MIS[,study_exit_date_MIS_b:=min(end_dic_2021,study_exit_date,covid_date-1, date_vax1-1,na.rm = T),by="person_id"]
# calculate correct fup_days
D3_study_variables_for_MIS[, fup_days := correct_difftime(study_exit_date_MIS_b, study_entry_date_MIS_b)]
#select the variables and save
D4_population_b<-D3_study_variables_for_MIS[,.(person_id,sex,age_at_1_jan_2021,agebands_at_1_jan_2021,study_entry_date_MIS_b, study_exit_date_MIS_b, MIS_date_narrow,MIS_date_broad, fup_days)]
#save(D3_cohort_b, file = paste0(dirtemp, "D3_cohort_b.RData"))

# D4_population_b[, age_at_study_entry := as.character(findInterval(age_at_study_entry, c(11,17, 29, 39, 49, 59, 69, 79)))]
# vect_age_cat <- c("0" = "0-11","1"="12-17","2" = "18-29", "3" = "30-39", "4" = "40-49",
#                   "5" = "50-59", "6" = "60-69", "7" = "70-79", "8" = ">80")
# D4_population_b[, ageband_at_study_entry_b := vect_age_cat[age_at_study_entry]]

save(D4_population_b, file = paste0(diroutput, "D4_population_b.RData"))

#---------------------------------
#COHORT C
#add the study entry date for MIS
D3_study_variables_for_MIS[,study_entry_date_MIS_c:=study_entry_date,by="person_id"]
#add the study exit date for MIS
D3_study_variables_for_MIS[,study_exit_date_MIS_c:=min(end_dic_2021,study_exit_date,date_vax1-1,na.rm = T),by="person_id"]
# calculate correct fup_days
D3_study_variables_for_MIS[, fup_days := correct_difftime(study_exit_date_MIS_c, study_entry_date_MIS_c)]
#select the variables and save                           

D3_selection_criteria_c <- D3_study_variables_for_MIS[is.na(covid_date) , not_in_cohort_c:=1]
D3_selection_criteria_c <- D3_selection_criteria_c[, not_in_cohort_c := replace(.SD, is.na(.SD), 0), .SDcols = "not_in_cohort_c"]
save(D3_selection_criteria_c, file = paste0(dirtemp, "D3_selection_criteria_c.RData"))

D4_population_c <- CreateFlowChart(
  dataset = D3_selection_criteria_c[,.(person_id,sex,age_at_1_jan_2021,agebands_at_1_jan_2021,study_entry_date_MIS_c, study_exit_date_MIS_c, MIS_date_narrow,MIS_date_broad,not_in_cohort_c, fup_days)],
  listcriteria = c("not_in_cohort_c"),
  flowchartname = "Flowchart_cohort_c")

# D4_population_c[, age_at_study_entry := as.character(findInterval(age_at_study_entry, c(11,17, 29, 39, 49, 59, 69, 79)))]
# vect_age_cat <- c("0" = "0-11","1"="12-17","2" = "18-29", "3" = "30-39", "4" = "40-49",
#                   "5" = "50-59", "6" = "60-69", "7" = "70-79", "8" = ">80")
# D4_population_c[, ageband_at_study_entry_c := vect_age_cat[age_at_study_entry]]

# D4_population_c<-D4_population_c [,age_strata_at_study_entry:=cut(age_at_study_entry, breaks = Agebands_MIS,  labels = Agebands_lables_MIS)]

save(D4_population_c, file = paste0(diroutput, "D4_population_c.RData"))

#---------------------------------
#COHORT D

#d crea: covid prima vaccinazione (usa in strato countpersontime) e e covdi dopo(usa per exit)

#covid_d<-unique(D3_outcomes_covid[name_event=="COVID_L1plus",.(person_id,date_event)])
#add the study entry date for MIS
D3_study_variables_for_MIS[,study_entry_date_MIS_d:=first_jan_2021]

D3_selection_criteria_d <- D3_study_variables_for_MIS[is.na(date_vax1), not_in_cohort_d:=1]
D3_selection_criteria_d <- D3_selection_criteria_d[, not_in_cohort_d := replace(.SD, is.na(.SD), 0), .SDcols = "not_in_cohort_d"]
save(D3_selection_criteria_d, file = paste0(dirtemp, "D3_selection_criteria_d.RData"))

D4_population_d <- CreateFlowChart(
  dataset = D3_selection_criteria_d,
  listcriteria = c("not_in_cohort_d"),
  flowchartname = "Flowchart_cohort_d")

#add the study exit date for MIS
#D3_study_variables_for_MIS[covid_date>date_vax1,study_exit_date_MIS_d:=min(covid_date,study_exit_date,na.rm = T)]
D4_population_d[covid_date<=date_vax1,history_covid:=1][covid_date>date_vax1 | is.na(covid_date),history_covid:=0]
D4_population_d[covid_date>date_vax1 & !is.na(covid_date),study_exit_date_MIS_d:=min(covid_date-1,study_end,study_exit_date),by="person_id"]
D4_population_d[covid_date<date_vax1 | is.na(covid_date),study_exit_date_MIS_d:=min(study_end,study_exit_date),by="person_id"]

# calculate correct fup_days
D4_population_d[, fup_days := correct_difftime(study_exit_date_MIS_d, study_entry_date_MIS_d)]

D4_population_d<-D4_population_d[,.(person_id,sex,age_at_1_jan_2021,agebands_at_1_jan_2021,study_entry_date_MIS_d,study_exit_date_MIS_d,MIS_date_broad,date_vax1,covid_date,history_covid,age_at_date_vax_1,type_vax_1,not_in_cohort_d, fup_days)]

D4_population_d<-D4_population_d[study_exit_date_MIS_d>study_entry_date_MIS_d,]
# D4_population_d[, age_at_1_jan_2021 := as.character(findInterval(age_at_1_jan_2021, c(19, 29, 39, 49, 59, 69, 79)))]
# vect_age_cat <- c("0" = "0-19", "1" = "20-29", "2" = "30-39", "3" = "40-49",
#                   "4" = "50-59", "5" = "60-69", "6" = "70-79", "7" = ">80")
# D4_population_d[, ageband_at_1_jan_2021 := vect_age_cat[age_at_1_jan_2021]]

save(D4_population_d, file = paste0(diroutput, "D4_population_d.RData"))
                        

