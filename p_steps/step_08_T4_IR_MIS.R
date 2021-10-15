
#countpersontime per year

#D4_persontime b----------------------------------------------
for (subpop in subpopulations_non_empty) {  
  print(subpop)
  
  namedataset<-paste0("D4_persontime_b",suffix[[subpop]])
  load(paste0(diroutput,"D4_persontime_b",suffix[[subpop]],".RData"))


for (ev in list_outcomes_MIS) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  get(namedataset)[, (name_cols) := exactPoiCI(get(namedataset), name_count, name_pt)]
}

  nameoutput<-paste0("D4_IR_MIS_b",suffix[[subpop]])
  assign(nameoutput,get(namedataset)[, !grep("^Person", names(get(namedataset))) , with = FALSE])
  
  save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)
  
  fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
  rm(list=nameoutput)

  

  namedataset<-paste0("D4_persontime_monthly_b_BC",suffix[[subpop]])
  load(paste0(diroutput,"D4_persontime_monthly_b_BC",suffix[[subpop]],".RData"))
  

for (ev in list_outcomes_MIS) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  get(namedataset)[, (name_cols) := exactPoiCI(get(namedataset), name_count, name_pt)]
}
  nameoutput<-paste0("D4_IR_monthly_MIS_b",suffix[[subpop]])

  
  assign(nameoutput,get(namedataset))
  first_cols <- c("sex", "month", "year", "Ageband")
  all_cols <- colnames(get(nameoutput))
  setcolorder(get(nameoutput), c(first_cols, all_cols[all_cols %not in% first_cols]))
  
  save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)
  
  fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
  rm(list=nameoutput)
  


#D4_persontime c----------------------------------------------

  namedataset<-paste0("D4_persontime_c",suffix[[subpop]])
  load(paste0(diroutput,"D4_persontime_c",suffix[[subpop]],".RData"))
  

for (ev in list_outcomes_MIS) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  get(namedataset)[, (name_cols) := exactPoiCI(get(namedataset), name_count, name_pt)]
}

  nameoutput<-paste0("D4_IR_MIS_c",suffix[[subpop]])
  assign(nameoutput,get(namedataset)[, !grep("^Person", names(get(namedataset))) , with = FALSE])

  save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)
  
  fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
  rm(list=nameoutput)
  

  namedataset<-paste0("D4_persontime_monthly_c_BC",suffix[[subpop]])
  load(paste0(diroutput,"D4_persontime_monthly_c_BC",suffix[[subpop]],".RData"))

for (ev in list_outcomes_MIS) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  get(namedataset)[, (name_cols) := exactPoiCI(get(namedataset), name_count, name_pt)]
}

  nameoutput<-paste0("D4_IR_monthly_MIS_c",suffix[[subpop]])
  
  
  assign(nameoutput,get(namedataset))
  first_cols <- c("sex", "month", "year", "Ageband")
  all_cols <- colnames(get(nameoutput))
  setcolorder(get(nameoutput), c(first_cols, all_cols[all_cols %not in% first_cols]))
  
  save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)
  
  fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
  rm(list=nameoutput)



#D4_persontime d----------------------------------------------
namedataset<-paste0("D4_persontime_d",suffix[[subpop]])
load(paste0(diroutput,"D4_persontime_d",suffix[[subpop]],".RData"))
  
for (ev in list_outcomes_MIS) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  get(namedataset)[, (name_cols) := exactPoiCI(get(namedataset), name_count, name_pt)]
}

nameoutput<-paste0("D4_IR_MIS_d",suffix[[subpop]])


assign(nameoutput,get(namedataset)[, !grep("^Person", names(get(namedataset))) , with = FALSE])

save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)

fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
rm(list=nameoutput)



namedataset<-paste0("D4_persontime_monthly_d_BC",suffix[[subpop]])
load(paste0(diroutput,"D4_persontime_monthly_d_BC",suffix[[subpop]],".RData"))


for (ev in list_outcomes_MIS) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  get(namedataset)[, (name_cols) := exactPoiCI( get(namedataset), name_count, name_pt)]
}

nameoutput<-paste0("D4_IR_monthly_MIS_d",suffix[[subpop]])


assign(nameoutput,get(namedataset))
first_cols <- c("sex", "month", "year", "Ageband")
all_cols <- colnames(get(nameoutput))
setcolorder(get(nameoutput), c(first_cols, all_cols[all_cols %not in% first_cols]))

save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)

fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
rm(list=nameoutput)
rm(namedataset)


}

