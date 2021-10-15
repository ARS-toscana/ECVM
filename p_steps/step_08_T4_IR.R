# personyear_&x.=Persontime_&x./365.25; 
# personyear_&x.=Persontime_&x./365.25;
# 
# round(100000*calculated Events_&x./calculated PT_&x.,0.01) as IR_&x., 
# round(calculated IR_&x.*exp(-1.96/SQRT(calculated Events_&x.)),0.01) as LL_&x., 
# round(calculated IR_&x.*exp(+1.96/SQRT(calculated Events_&x.)),0.01) as UL_&x.

#birthcohort---------------
#D4_persontime_benefit_week----------------------------------------------
for (subpop in subpopulations_non_empty) {  
  print(subpop)
  
  load(paste0(diroutput,"D4_persontime_benefit_week_BC",suffix[[subpop]],".RData"))
  load(paste0(dirtemp,"list_outcomes_observed",suffix[[subpop]],".RData"))
  
  persontime_benefit_week_BC<-get(paste0("D4_persontime_benefit_week_BC", suffix[[subpop]]))
  list_outcomes_observed<-get(paste0("list_outcomes_observed", suffix[[subpop]]))
  
events<-c("COVID_L1plus","COVID_L2plus", "COVID_L3plus","COVID_L4plus","COVID_L5plus")

for (ev in events) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  persontime_benefit_week_BC[, (name_cols) := exactPoiCI(persontime_benefit_week_BC, name_count, name_pt)]
}

temp <- copy(persontime_benefit_week_BC)
all.equal(temp, persontime_benefit_week_BC)
#RES_IR_benefit_week_BC<-persontime_benefit_week_BC[,-c(6:14)]

nameoutput<-paste0("RES_IR_benefit_week_BC",suffix[[subpop]])
assign(nameoutput,persontime_benefit_week_BC[, !grep("^Person", names(persontime_benefit_week_BC)) , with = FALSE])

save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)

fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
rm(list=nameoutput)
rm(persontime_benefit_week_BC)



#D4_persontime_benefit_year-----------------------------------------------------

load(paste0(diroutput,"D4_persontime_benefit_year_BC",suffix[[subpop]],".RData"))

persontime_benefit_year_BC<-get(paste0("D4_persontime_benefit_year_BC", suffix[[subpop]]))

for (ev in events) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  persontime_benefit_year_BC[, (name_cols) := exactPoiCI(persontime_benefit_year_BC, name_count, name_pt)]
}

#RES_IR_benefit_fup_BC<-persontime_benefit_year_BC[,-c(6:14)]
nameoutput<-paste0("RES_IR_benefit_fup_BC",suffix[[subpop]])
assign(nameoutput,persontime_benefit_year_BC[, !grep("^Person", names(persontime_benefit_year_BC)) , with = FALSE])

save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)

fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
rm(list=nameoutput)
rm(persontime_benefit_year_BC)


#for all outcomes

#D4_persontime_risk_week----------------------------------------------

load(paste0(diroutput,"D4_persontime_risk_week_BC",suffix[[subpop]],".RData"))

persontime_risk_week_BC<-get(paste0("D4_persontime_risk_week_BC", suffix[[subpop]]))


for (ev in list_outcomes_observed) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  persontime_risk_week_BC[, (name_cols) := exactPoiCI(persontime_risk_week_BC, name_count, name_pt)]
}

nameoutput<-paste0("RES_IR_risk_week_BC",suffix[[subpop]])
assign(nameoutput,persontime_risk_week_BC[, !grep("^Person", names(persontime_risk_week_BC)) , with = FALSE])

save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)

fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
rm(list=nameoutput)
rm(persontime_risk_week_BC)



#D4_persontime_risk_year-----------------------------------------------------

load(paste0(diroutput,"D4_persontime_risk_year_BC",suffix[[subpop]],".RData"))
persontime_risk_year_BC<-get(paste0("D4_persontime_risk_year_BC", suffix[[subpop]]))

for (ev in list_outcomes_observed) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  persontime_risk_year_BC[, (name_cols) := exactPoiCI(persontime_risk_year_BC, name_count, name_pt)]
}

nameoutput<-paste0("RES_IR_risk_fup_BC",suffix[[subpop]])
assign(nameoutput,persontime_risk_year_BC[, !grep("^Person", names(persontime_risk_year_BC)) , with = FALSE])

save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)

fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
rm(list=nameoutput)
rm(persontime_risk_year_BC)



#risk factors---------------
#D4_persontime_benefit_week----------------------------------------------
load(paste0(diroutput,"D4_persontime_benefit_week_RF",suffix[[subpop]],".RData"))
persontime_benefit_week_RF<-get(paste0("D4_persontime_benefit_week_RF", suffix[[subpop]]))

events<-c("COVID_L1plus","COVID_L2plus", "COVID_L3plus","COVID_L4plus","COVID_L5plus")

for (ev in events) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  persontime_benefit_week_RF[, (name_cols) := exactPoiCI(persontime_benefit_week_RF, name_count, name_pt)]
}

nameoutput<-paste0("RES_IR_benefit_week_RF",suffix[[subpop]])
assign(nameoutput,persontime_benefit_week_RF[, !grep("^Person", names(persontime_benefit_week_RF)) , with = FALSE])

save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)

fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
rm(list=nameoutput)
rm(persontime_benefit_week_RF)


#D4_persontime_benefit_year-----------------------------------------------------

load(paste0(diroutput,"D4_persontime_benefit_year_RF",suffix[[subpop]],".RData"))
persontime_benefit_year_RF<-get(paste0("D4_persontime_benefit_year_RF", suffix[[subpop]]))

for (ev in events) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  persontime_benefit_year_RF[, (name_cols) := exactPoiCI(persontime_benefit_year_RF, name_count, name_pt)]
}

nameoutput<-paste0("RES_IR_benefit_fup_RF",suffix[[subpop]])
assign(nameoutput,persontime_benefit_year_RF[, !grep("^Person", names(persontime_benefit_year_RF)) , with = FALSE])

save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)

fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
rm(list=nameoutput)
rm(persontime_benefit_year_RF)



#for all outcomes

#D4_persontime_risk_week----------------------------------------------

load(paste0(diroutput,"D4_persontime_risk_week_RF",suffix[[subpop]],".RData"))
persontime_risk_week_RF<-get(paste0("D4_persontime_risk_week_RF", suffix[[subpop]]))


for (ev in list_outcomes_observed) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  persontime_risk_week_RF[, (name_cols) := exactPoiCI(persontime_risk_week_RF, name_count, name_pt)]
}

nameoutput<-paste0("RES_IR_risk_week_RF",suffix[[subpop]])
assign(nameoutput,persontime_risk_week_RF[, !grep("^Person", names(persontime_risk_week_RF)) , with = FALSE])

save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)

fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
rm(list=nameoutput)
rm(persontime_risk_week_RF)



#D4_persontime_risk_year-----------------------------------------------------

load(paste0(diroutput,"D4_persontime_risk_year_RF",suffix[[subpop]],".RData"))
persontime_risk_year_RF<-get(paste0("D4_persontime_risk_year_RF", suffix[[subpop]]))

for (ev in list_outcomes_observed) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  persontime_risk_year_RF[, (name_cols) := exactPoiCI(persontime_risk_year_RF, name_count, name_pt)]
}

nameoutput<-paste0("RES_IR_risk_fup_RF",suffix[[subpop]])
assign(nameoutput,persontime_risk_year_RF[, !grep("^Person", names(persontime_risk_year_RF)) , with = FALSE])

save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)

fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
rm(list=nameoutput)
rm(persontime_risk_year_RF)


#D4_persontime_risk_month-----------------------------------------------------

load(paste0(diroutput,"D4_persontime_risk_month_RFBC",suffix[[subpop]],".RData"))
persontime_risk_month_RFBC<-get(paste0("D4_persontime_risk_month_RFBC", suffix[[subpop]]))

for (ev in list_outcomes_observed) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  persontime_risk_month_RFBC[, (name_cols) := exactPoiCI(persontime_risk_month_RFBC, name_count, name_pt)]
}



nameoutput<-paste0("RES_IR_week",suffix[[subpop]])
assign(nameoutput,persontime_risk_month_RFBC)

first_cols <- c("sex", "month", "year", "Ageband")
all_cols <- colnames(get(nameoutput))
setcolorder(get(nameoutput), c(first_cols, all_cols[all_cols %not in% first_cols]))

save(nameoutput,file=paste0(direxp,nameoutput,".RData"),list=nameoutput)

fwrite(get(nameoutput),file=paste0(direxp,nameoutput,".csv"))
rm(list=nameoutput)
rm(persontime_risk_month_RFBC)


}

rm( first_cols, all_cols, name_cols, name_count, name_pt)
