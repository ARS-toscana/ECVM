# personyear_&x.=Persontime_&x./365.25; 
# personyear_&x.=Persontime_&x./365.25;
# 
# 
# 
# 
# 
# round(100000*calculated Events_&x./calculated PT_&x.,0.01) as IR_&x., 
# round(calculated IR_&x.*exp(-1.96/SQRT(calculated Events_&x.)),0.01) as LL_&x., 
# round(calculated IR_&x.*exp(+1.96/SQRT(calculated Events_&x.)),0.01) as UL_&x.


load(paste0(diroutput,"D4_persontime_benefit_week.RData"))


#for each event: "COVID_L1plus","COVID_L2plus", "COVID_L3plus","COVID_L4plus"

# COVID_L1plus_b / "Persontime_COVID_L1plus" 

D4_persontime_benefit_week <- D4_persontime_benefit_week[, IR :=  round(100000*round(person_time*1000/Persontime*Incidence, 0)/person_time, 2)]
D4_persontime_benefit_week <- D4_persontime_benefit_week[, c("lb", "ub") := list(
  round(IR*exp(-1.96/sqrt(round(person_time*1000/Persontime*Incidence, 0))), 2),
  round(IR*exp(+1.96/sqrt(round(person_time*1000/Persontime*Incidence, 0))), 2))]



load(paste0(diroutput,"D4_persontime_risk_week.RData"))


#for all outcomes
D4_persontime_risk_week <- D4_persontime_risk_week[, IR :=  round(100000*round(person_time*1000/Persontime*Incidence, 0)/person_time, 2)]
D4_persontime_risk_week <- D4_persontime_risk_week[, c("lb", "ub") := list(
  round(IR*exp(-1.96/sqrt(round(person_time*1000/Persontime*Incidence, 0))), 2),
  round(IR*exp(+1.96/sqrt(round(person_time*1000/Persontime*Incidence, 0))), 2))]