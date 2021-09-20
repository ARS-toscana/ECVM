load(paste0(dirtemp, "D3_study_population.RData"))

load(paste0(dirtemp, "D3_events_all_outcomes.RData"))


#add date of first covid to the population
temp_covid<-D3_events_all_outcomes[name_event=="COVID_narrow",][,.(person_id,date_event)]

setnames(temp_covid,"date_event","covid_date")
D3_study_variables_for_MIS <- merge(D3_study_population, temp_covid, all.x = T, by="person_id")
rm(temp_covid)

#add date of MIS broad to the population
temp_MIS_broad<-D3_events_all_outcomes[name_event=="MIS_broad",][,.(person_id,date_event)]
setnames(temp_MIS_broad,"date_event","MIS_date_broad")
D3_study_variables_for_MIS <- merge(D3_study_variables_for_MIS, temp_MIS_broad, all.x = T, by="person_id")
rm(temp_MIS_broad)

#add date of MIS narrow to the population
temp_MIS_narrow<-D3_events_all_outcomes[name_event=="MIS_narrow",][,.(person_id,date_event)]
setnames(temp_MIS_narrow,"date_event","MIS_date_narrow")
D3_study_variables_for_MIS <- merge(D3_study_variables_for_MIS, temp_MIS_narrow, all.x = T, by="person_id")
rm(temp_MIS_broad)


save(D3_study_variables_for_MIS, file = paste0(dirtemp, "D3_study_variables_for_MIS.RData"))

#COHORT B
#add the study entry date for MIS
D3_study_variables_for_MIS[,study_entry_date_MIS_b:=max(as_date("20200101"),study_entry_date,na.rm = T)]
#add the study exit date for MIS
D3_study_variables_for_MIS[,study_exit_date_MIS_b:=min(as_date("20211231"),study_exit_date,covid_date, date_vax1,na.rm = T)]
#select the variables and save                           
D4_population_cohort_b<-D3_study_variables_for_MIS[,.(person_id,sex,age_at_study_entry,study_entry_date_MIS_b, study_exit_date_MIS_b, MIS_date_narrow,MIS_date_broad)]
#save(D3_cohort_b, file = paste0(dirtemp, "D3_cohort_b.RData"))

save(D4_population_cohort_b, file = paste0(dirtemp, "D4_population_cohort_b.RData"))

#---------------------------------
#COHORT C
#add the study entry date for MIS
D3_study_variables_for_MIS[,study_entry_date_MIS_c:=max(as_date("20200101"),study_entry_date,na.rm = T)]
#add the study exit date for MIS
D3_study_variables_for_MIS[,study_exit_date_MIS_c:=min(as_date("20211231"),study_exit_date,na.rm = T)]
#select the variables and save                           

D3_cohort_c <- D3_cohort_c[!is.na(date_covid) |!is.na(date_vax1), in_cohort_c:=1]
D3_cohort_c <- D3_cohort_c[, in_cohort_c := replace(.SD, is.na(.SD), 0), .SDcols = in_cohort_c]
save(D3_cohort_c, file = paste0(dirtemp, "D3_cohort_c.RData"))

D4_population_cohort_c <- CreateFlowChart(
  dataset = D3_cohort_c[,.(person_id,sex,age_at_study_entry,study_entry_date_MIS_c,       study_exit_date_MIS_c, MIS_date_narrow,MIS_date_broad,in_cohort_c)],
  listcriteria = c("in_cohort_c"),
  flowchartname = "Flowchart_cohort_c")

save(D4_population_cohort_c, file = paste0(dirtemp, "D4_population_cohort_c.RData"))

#---------------------------------
#COHORT D
#add the study entry date for MIS
D3_study_variables_for_MIS[,study_entry_date_MIS_d:=as_date("20200101")]
#add the study exit date for MIS
D3_study_variables_for_MIS[,study_exit_date_MIS_d:=min(covid_date,study_exit_date,na.rm = T)]

D3_cohort_d <- D3_study_variables_for_MIS[!is.na(date_covid) |!is.na(date_vax1), in_cohort_d:=1]
D3_cohort_d <- D3_cohort_d[, in_cohort_d := replace(.SD, is.na(.SD), 0), .SDcols = in_cohort_d]
save(D3_cohort_d, file = paste0(dirtemp, "D3_cohort_d.RData"))

D4_population_cohort_d <- CreateFlowChart(
  dataset = D3_cohort_d[,.(person_id,sex,age_at_1_jan_2021,study_entry_date_MIS_c,study_exit_date_MIS_d,MIS_date_broad,date_vax1,age_at_date_vax_1,type_vax_1,in_cohort_d)],
  listcriteria = c("in_cohort_d"),
  flowchartname = "Flowchart_cohort_d")

save(D4_population_cohort_d, file = paste0(dirtemp, "D4_population_cohort_d.RData"))
                        

