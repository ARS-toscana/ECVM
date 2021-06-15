# personyear_&x.=Persontime_&x./365.25; 
# personyear_&x.=Persontime_&x./365.25;
# 
# round(100000*calculated Events_&x./calculated PT_&x.,0.01) as IR_&x., 
# round(calculated IR_&x.*exp(-1.96/SQRT(calculated Events_&x.)),0.01) as LL_&x., 
# round(calculated IR_&x.*exp(+1.96/SQRT(calculated Events_&x.)),0.01) as UL_&x.

#birthcohort---------------
#D4_persontime_benefit_week----------------------------------------------
load(paste0(diroutput,"D4_persontime_benefit_week_BC.RData"))
load(paste0(dirtemp,"list_outcomes_observed.RData"))

events<-c("COVID_L1plus","COVID_L2plus", "COVID_L3plus","COVID_L4plus","COVID_L5plus")

for (ev in events) {
  D4_persontime_benefit_week_BC[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/(get(paste0("Persontime_",ev))/365.25), 2)]
  D4_persontime_benefit_week_BC <- D4_persontime_benefit_week_BC[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

#D4_IR_benefit_week_BC<-D4_persontime_benefit_week_BC[,-c(6:14)]
D4_IR_benefit_week_BC<-D4_persontime_benefit_week_BC[, !grep("^Person", names(D4_persontime_benefit_week_BC)) , with = FALSE]

save(D4_IR_benefit_week_BC,file=paste0(direxp,"D4_IR_benefit_week_BC.RData"))

fwrite(D4_IR_benefit_week_BC,file=paste0(direxp,"D4_IR_benefit_week_BC.csv"))




#D4_persontime_benefit_year-----------------------------------------------------
load(paste0(diroutput,"D4_persontime_benefit_year_BC.RData"))
for (ev in events) {
  D4_persontime_benefit_year_BC[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/(get(paste0("Persontime_",ev))/365.25), 2)]
  D4_persontime_benefit_year_BC <- D4_persontime_benefit_year_BC[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

#D4_IR_benefit_fup_BC<-D4_persontime_benefit_year_BC[,-c(6:14)]
D4_IR_benefit_fup_BC<-D4_persontime_benefit_year_BC[, !grep("^Person", names(D4_persontime_benefit_week_BC)) , with = FALSE]

save(D4_IR_benefit_fup_BC,file=paste0(direxp,"D4_IR_benefit_fup_BC.RData"))
fwrite(D4_IR_benefit_fup_BC,file=paste0(direxp,"D4_IR_benefit_fup_BC.csv"))




#for all outcomes

#D4_persontime_risk_week----------------------------------------------
load(paste0(diroutput,"D4_persontime_risk_week_BC.RData"))


for (ev in list_outcomes_observed) {
  D4_persontime_risk_week_BC[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/(get(paste0("Persontime_",ev))/365.25), 2)]
  D4_persontime_risk_week_BC <- D4_persontime_risk_week_BC[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

#D4_IR_risk_week_BC<-D4_persontime_risk_week_BC[,-c(6:44)]
D4_IR_risk_week_BC<-D4_persontime_risk_week_BC[, !grep("^Person", names(D4_persontime_benefit_week_BC)) , with = FALSE]

save(D4_IR_risk_week_BC,file=paste0(direxp,"D4_IR_risk_week_BC.RData"))

fwrite(D4_IR_risk_week_BC,file=paste0(direxp,"D4_IR_risk_week_BC.csv"))




#D4_persontime_risk_year-----------------------------------------------------
load(paste0(diroutput,"D4_persontime_risk_year_BC.RData"))
for (ev in list_outcomes_observed) {
  D4_persontime_risk_year_BC[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/(get(paste0("Persontime_",ev))/365.25), 2)]
  D4_persontime_risk_year_BC <- D4_persontime_risk_year_BC[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

#D4_IR_risk_fup_BC<-D4_persontime_risk_year_BC[,-c(6:44)]
D4_IR_risk_fup_BC<-D4_persontime_risk_year_BC[, !grep("^Person", names(D4_persontime_benefit_week_BC)) , with = FALSE]

save(D4_IR_risk_fup_BC,file=paste0(direxp,"D4_IR_risk_fup_BC.RData"))
fwrite(D4_IR_risk_fup_BC,file=paste0(direxp,"D4_IR_risk_fup_BC.csv"))



#risk factors---------------
#D4_persontime_benefit_week----------------------------------------------
load(paste0(diroutput,"D4_persontime_benefit_week_RF.RData"))
load(paste0(dirtemp,"list_outcomes_observed.RData"))

events<-c("COVID_L1plus","COVID_L2plus", "COVID_L3plus","COVID_L4plus","COVID_L5plus")

for (ev in events) {
  D4_persontime_benefit_week_RF[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/(get(paste0("Persontime_",ev))/365.25), 2)]
  D4_persontime_benefit_week_RF <- D4_persontime_benefit_week_RF[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

#D4_IR_benefit_week_RF<-D4_persontime_benefit_week_RF[,-c(6:14)]
D4_IR_benefit_week_RF<-D4_persontime_benefit_week_RF[, !grep("^Persontime", names(D4_persontime_benefit_week_BC)) , with = FALSE]

save(D4_IR_benefit_week_RF,file=paste0(direxp,"D4_IR_benefit_week_RF.RData"))

fwrite(D4_IR_benefit_week_RF,file=paste0(direxp,"D4_IR_benefit_week_RF.csv"))




#D4_persontime_benefit_year-----------------------------------------------------
load(paste0(diroutput,"D4_persontime_benefit_year_RF.RData"))
for (ev in events) {
  D4_persontime_benefit_year_RF[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/(get(paste0("Persontime_",ev))/365.25), 2)]
  D4_persontime_benefit_year_RF <- D4_persontime_benefit_year_RF[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

#D4_IR_benefit_fup_RF<-D4_persontime_benefit_year_RF[,-c(6:14)]
D4_IR_benefit_fup_RF<-D4_persontime_benefit_year_RF[, !grep("^Persontime", names(D4_persontime_benefit_week_BC)) , with = FALSE]

save(D4_IR_benefit_fup_RF,file=paste0(direxp,"D4_IR_benefit_fup_RF.RData"))
fwrite(D4_IR_benefit_fup_RF,file=paste0(direxp,"D4_IR_benefit_fup_RF.csv"))




#for all outcomes

#D4_persontime_risk_week----------------------------------------------
load(paste0(diroutput,"D4_persontime_risk_week_RF.RData"))


for (ev in list_outcomes_observed) {
  D4_persontime_risk_week_RF[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/(get(paste0("Persontime_",ev))/365.25), 2)]
  D4_persontime_risk_week_RF <- D4_persontime_risk_week_RF[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

#D4_IR_risk_week_RF<-D4_persontime_risk_week_RF[,-c(6:44)]
D4_IR_risk_week_RF<-D4_persontime_risk_week_RF[, !grep("^Persontime", names(D4_persontime_benefit_week_BC)) , with = FALSE]


save(D4_IR_risk_week_RF,file=paste0(direxp,"D4_IR_risk_week_RF.RData"))

fwrite(D4_IR_risk_week_RF,file=paste0(direxp,"D4_IR_risk_week_RF.csv"))




#D4_persontime_risk_year-----------------------------------------------------
load(paste0(diroutput,"D4_persontime_risk_year_RF.RData"))
for (ev in list_outcomes_observed) {
  D4_persontime_risk_year_RF[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/(get(paste0("Persontime_",ev))/365.25), 2)]
  D4_persontime_risk_year_RF <- D4_persontime_risk_year_RF[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

#D4_IR_risk_fup_RF<-D4_persontime_risk_year_RF[,-c(6:44)]
D4_IR_risk_fup_RF<-D4_persontime_risk_year_RF[, !grep("^Persontime", names(D4_persontime_benefit_week_BC)) , with = FALSE]

save(D4_IR_risk_fup_RF,file=paste0(direxp,"D4_IR_risk_fup_RF.RData"))
fwrite(D4_IR_risk_fup_RF,file=paste0(direxp,"D4_IR_risk_fup_RF.csv"))


