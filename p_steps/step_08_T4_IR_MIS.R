



#D4_persontime_risk_week----------------------------------------------
load(paste0(diroutput,"D4_persontime_risk_week_BC.RData"))
load(paste0(dirtemp,"list_outcomes_observed.RData"))

list_outcomes <-intersect(list_outcomes_observed,list_outcomes_MIS)


for (ev in list_outcomes) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  D4_persontime_risk_week_BC[, (name_cols) := exactPoiCI(D4_persontime_risk_week_BC, name_count, name_pt)]
}


D4_IR_risk_week_BC<-D4_persontime_risk_week_BC[, !grep("^Person", names(D4_persontime_risk_week_BC)) , with = FALSE]

save(D4_IR_risk_week_BC,file=paste0(direxp,"D4_IR_risk_week_BC.RData"))

fwrite(D4_IR_risk_week_BC,file=paste0(direxp,"D4_IR_risk_week_BC.csv"))
