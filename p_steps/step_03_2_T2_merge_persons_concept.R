
#merge vaccine information to persons

load(paste0(dirtemp,"D3_selection_criteria_doses.RData"))
load(paste0(dirtemp,"D3_concepts_QC_criteria.RData"))

persons_doses<-merge(D3_selection_criteria_doses,D3_concepts_QC_criteria, by=c("person_id"))

save(persons_doses,file=paste0(dirtemp,"persons_doses.RData"))

rm(D3_selection_criteria_doses, D3_concepts_QC_criteria, persons_doses)
