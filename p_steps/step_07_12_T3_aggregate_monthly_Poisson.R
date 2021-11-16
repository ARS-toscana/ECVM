for (subpop in subpopulations_non_empty) {
  print(subpop)
  
  load(paste0(diroutput,"D4_persontime_risk_month_poisson", suffix[[subpop]],".RData"))
  D4_persontime_poisson <- get(paste0("D4_persontime_risk_month_poisson", suffix[[subpop]]))
  rm(list=paste0("D4_persontime_risk_month_poisson", suffix[[subpop]]))
  
  D4_persontime_poisson$year = as.character(lapply(strsplit(D4_persontime_poisson$month, split = "-"), "[", 1))
  D4_persontime_poisson$month = as.character(lapply(strsplit(D4_persontime_poisson$month, split = "-"), "[", 2))
  
  col_names <- copy(colnames(D4_persontime_poisson))[colnames(D4_persontime_poisson) %not in% c("DAP", "Gender",
                    "month", "year", "COVID19", "Comorbity_at_study_entry", "Comorbity_at_date_vax", "Vaccine1",
                    "Vaccine2", "Dose1", "Dose2")]
  D4_persontime_poisson <- D4_persontime_poisson[, c("DAP", "Gender", "month", "year", "COVID19", "Comorbity_at_study_entry",
                                 "Comorbity_at_date_vax", "Vaccine1", "Vaccine2", "Dose1", "Dose2", ..col_names)]
  
  nameoutput1<-paste0("D4_persontime_monthly_poisson_RF",suffix[[subpop]])
  assign(nameoutput1, D4_persontime_poisson)
  
  save(nameoutput1,file=paste0(diroutput,nameoutput1,".RData"), list=nameoutput1)
  rm(list=nameoutput1)
  rm(col_names, D4_persontime_poisson)
  
}