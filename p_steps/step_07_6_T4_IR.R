# personyear_&x.=Persontime_&x./365.25; 
# personyear_&x.=Persontime_&x./365.25;
# 
# round(100000*calculated Events_&x./calculated PT_&x.,0.01) as IR_&x., 
# round(calculated IR_&x.*exp(-1.96/SQRT(calculated Events_&x.)),0.01) as LL_&x., 
# round(calculated IR_&x.*exp(+1.96/SQRT(calculated Events_&x.)),0.01) as UL_&x.

#D4_persontime_benefit_week----------------------------------------------
load(paste0(diroutput,"D4_persontime_benefit_week_totals.RData"))
load(paste0(dirtemp,"list_outcomes_observed.RData"))

events<-c("COVID_L1plus","COVID_L2plus", "COVID_L3plus","COVID_L4plus","COVID_L5plus")

for (ev in events) {
  D4_persontime_benefit_week_totals[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/get(paste0("Persontime_",ev)), 2)]
  D4_persontime_benefit_week_totals <- D4_persontime_benefit_week_totals[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

D4_IR_benefit_week<-D4_persontime_benefit_week_totals[,-c(6:14)]

save(D4_IR_benefit_week,file=paste0(direxp,"D4_IR_benefit_week.RData"))

fwrite(D4_IR_benefit_week,file=paste0(direxp,"D4_IR_benefit_week.csv"))




#D4_persontime_benefit_year-----------------------------------------------------
load(paste0(diroutput,"D4_persontime_benefit_year_totals.RData"))
for (ev in events) {
  D4_persontime_benefit_year_totals[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/get(paste0("Persontime_",ev)), 2)]
  D4_persontime_benefit_year_totals <- D4_persontime_benefit_year_totals[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

D4_IR_benefit_fup<-D4_persontime_benefit_year_totals[,-c(6:14)]

save(D4_IR_benefit_week,file=paste0(direxp,"D4_IR_benefit_week.RData"))
fwrite(D4_IR_benefit_fup,file=paste0(direxp,"D4_IR_benefit_fup.csv"))




#for all outcomes

#D4_persontime_risk_week----------------------------------------------
load(paste0(diroutput,"D4_persontime_risk_week_totals.RData"))


for (ev in list_outcomes_observed) {
  D4_persontime_risk_week_totals[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/get(paste0("Persontime_",ev)), 2)]
  D4_persontime_risk_week_totals <- D4_persontime_risk_week_totals[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

D4_IR_risk_week<-D4_persontime_risk_week_totals[,-c(6:44)]

save(D4_IR_risk_week,file=paste0(direxp,"D4_IR_risk_week.RData"))

fwrite(D4_IR_risk_week,file=paste0(direxp,"D4_IR_risk_week.csv"))




#D4_persontime_risk_year-----------------------------------------------------
load(paste0(diroutput,"D4_persontime_risk_year_totals.RData"))
for (ev in list_outcomes_observed) {
  D4_persontime_risk_year_totals[, paste0("IR_",ev) :=  round(100000*(get(paste0(ev,"_b")))/get(paste0("Persontime_",ev)), 2)]
  D4_persontime_risk_year_totals <- D4_persontime_risk_year_totals[, c(paste0("lb_",ev), paste0("ub_",ev)) := list(
    round(get(paste0("IR_",ev))*exp(-1.96/sqrt(get(paste0(ev,"_b")))), 2),
    round(get(paste0("IR_",ev))*exp(+1.96/sqrt(get(paste0(ev,"_b")))), 2))]
}

D4_IR_risk_fup<-D4_persontime_risk_year_totals[,-c(6:44)]

save(D4_IR_risk_fup,file=paste0(direxp,"D4_IR_risk_fup.RData"))
fwrite(D4_IR_risk_fup,file=paste0(direxp,"D4_IR_risk_fup.csv"))


