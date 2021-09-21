
#countpersontime per year

#D4_persontime b----------------------------------------------
load(paste0(diroutput,"D4_persontime_b.RData"))
#load(paste0(dirtemp,"list_outcomes_observed.RData"))


for (ev in list_outcomes_MIS) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  D4_persontime_b[, (name_cols) := exactPoiCI(D4_persontime_b, name_count, name_pt)]
}


D4_IR_MIS_b<-D4_persontime_b[, !grep("^Person", names(D4_persontime_b)) , with = FALSE]

save(D4_IR_MIS_b,file=paste0(direxp,"D4_IR_MIS_b.RData"))
fwrite(D4_IR_MIS_b,file=paste0(direxp,"D4_IR_MIS_b.csv"))

#D4_persontime c----------------------------------------------
load(paste0(diroutput,"D4_persontime_c.RData"))
#load(paste0(dirtemp,"list_outcomes_observed.RData"))


for (ev in list_outcomes_MIS) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  D4_persontime_c[, (name_cols) := exactPoiCI(D4_persontime_c, name_count, name_pt)]
}


D4_IR_MIS_c<-D4_persontime_c[, !grep("^Person", names(D4_persontime_c)) , with = FALSE]

save(D4_IR_MIS_c,file=paste0(direxp,"D4_IR_MIS_c.RData"))
fwrite(D4_IR_MIS_c,file=paste0(direxp,"D4_IR_MIS_c.csv"))


#D4_persontime d----------------------------------------------
load(paste0(diroutput,"D4_persontime_d.RData"))
#load(paste0(dirtemp,"list_outcomes_observed.RData"))


for (ev in list_outcomes_MIS) {
  name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
  name_count <- paste0(ev,"_b")
  name_pt <- paste0("Persontime_",ev)
  D4_persontime_d[, (name_cols) := exactPoiCI(D4_persontime_d, name_count, name_pt)]
}


D4_IR_MIS_d<-D4_persontime_d[, !grep("^Person", names(D4_persontime_d)) , with = FALSE]

save(D4_IR_MIS_d,file=paste0(direxp,"D4_IR_MIS_d.RData"))
fwrite(D4_IR_MIS_d,file=paste0(direxp,"D4_IR_MIS_d.csv"))

