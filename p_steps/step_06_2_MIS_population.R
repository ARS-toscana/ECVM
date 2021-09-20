load(paste0(dirtemp, "D3_study_population.RData"))
load(paste0(dirtemp, "COVID_narrow.RData"))
load(paste0(dirtemp, "MIS_broad.RData"))
load(paste0(dirtemp, "MIS_narrow.RData"))

#add date of first covid to the population
COVID_narrow<-unique(COVID_narrow[,.(person_id,date)])
D3_study_variables_for_MIS <- merge(D3_study_population, COVID_narrow, all.x = T, by="person_id")
setnames(D3_study_population,"date","covid_date")

#add date of MIS broad to the population
COVID_narrow<-unique(COVID_narrow[,.(person_id,date)])
D3_study_variables_for_MIS <- merge(D3_study_population, MIS_broad, all.x = T, by="person_id")
setnames(D3_study_population,"date","MIS_date_broad")

#add date of MIS narrow to the population
COVID_narrow<-unique(COVID_narrow[,.(person_id,date)])
D3_study_variables_for_MIS <- merge(D3_study_population, MIS_narrow, all.x = T, by="person_id")
setnames(D3_study_population,"date","MIS_date_narrow")

save(D3_study_variables_for_MIS, file = paste0(dirtemp, "D3_study_variables_for_MIS.RData"))