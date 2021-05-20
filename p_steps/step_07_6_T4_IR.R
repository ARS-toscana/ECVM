# personyear_&x.=Persontime_&x./365.25; 
# personyear_&x.=Persontime_&x./365.25;
# 
# round(100000*calculated Events_&x./calculated PT_&x.,0.01) as IR_&x., 
# round(calculated IR_&x.*exp(-1.96/SQRT(calculated Events_&x.)),0.01) as LL_&x., 
# round(calculated IR_&x.*exp(+1.96/SQRT(calculated Events_&x.)),0.01) as UL_&x.

#D4_persontime_benefit_week----------------------------------------------
load(paste0(diroutput,"D4_persontime_benefit_week.RData"))

events<-c("COVID_L1plus","COVID_L2plus", "COVID_L3plus","COVID_L4plus")

for (ev in events) {
  D4_persontime_benefit_week[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/get(paste0("Persontime_",ev)), 2)]
  D4_persontime_benefit_week <- D4_persontime_benefit_week[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

fwrite(D4_persontime_benefit_week,file=paste0(direxp,"D4_IR_benefit_week.csv"))




#D4_persontime_benefit_year-----------------------------------------------------
load(paste0(diroutput,"D4_persontime_benefit_year.RData"))
for (ev in events) {
  D4_persontime_benefit_year[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/get(paste0("Persontime_",ev)), 2)]
  D4_persontime_benefit_year <- D4_persontime_benefit_year[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}
fwrite(D4_persontime_benefit_year,file=paste0(direxp,"D4_IR_benefit_fup.csv"))




#for all outcomes

#D4_persontime_risk_week----------------------------------------------
load(paste0(diroutput,"D4_persontime_risk_week.RData"))


for (ev in list_outcomes_observed) {
  D4_persontime_risk_week[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/get(paste0("Persontime_",ev)), 2)]
  D4_persontime_risk_week <- D4_persontime_risk_week[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

fwrite(D4_persontime_risk_week,file=paste0(direxp,"D4_IR_risk_week.csv"))




#D4_persontime_risk_year-----------------------------------------------------
load(paste0(diroutput,"D4_persontime_risk_year.RData"))
for (ev in list_outcomes_observed) {
  D4_persontime_risk_year[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/get(paste0("Persontime_",ev)), 2)]
  D4_persontime_risk_year <- D4_persontime_risk_year[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}
fwrite(D4_persontime_risk_year,file=paste0(direxp,"D4_IR_risk_fup.csv"))

load(paste0(diroutput,"D4_persontime_risk_week.RData"))