
#merge vaccine information to persons

load(paste0(dirtemp,"D3_selection_criteria_doses.RData"))
load(paste0(dirtemp,"covid_vaccine.RData"))

persons_doses<-merge(D3_selection_criteria_doses,Covid_vaccine, by=c("person_id"),all.x=T)

save(persons_doses,file=paste0(dirtemp,"persons_doses.RData"))
