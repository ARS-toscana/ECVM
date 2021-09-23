


#table 5

load(file =paste0(dirtemp, "D3_selection_criteria_c.RData"))
load(file = paste0(dirtemp, "D4_population_c.RData"))

D4_population_c_all<-merge(D3_selection_criteria_c,D4_population_c,by="person_id",all=F)
