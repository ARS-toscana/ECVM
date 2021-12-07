for (subpop in subpopulations_non_empty) {
  print(subpop)
  
  load(paste0(diroutput,"D4_persontime_monthly_poisson_RF", suffix[[subpop]],".RData"))
  D4_persontime_poisson <- get(paste0("D4_persontime_monthly_poisson_RF", suffix[[subpop]]))
  rm(list=paste0("D4_persontime_monthly_poisson_RF", suffix[[subpop]]))
  
  D4_persontime_poisson <- D4_persontime_poisson[, Dose := as.numeric(Dose1) + as.numeric(Dose2)]
  D4_persontime_poisson <- D4_persontime_poisson[, Vaccine := fifelse(Dose == 1, Vaccine1, Vaccine2)]
  
  col_names <- copy(colnames(D4_persontime_poisson))[str_detect(colnames(D4_persontime_poisson),
                                                                "Myocardalone_narrow|PERICARD_narrow")]
  D4_persontime_poisson <- D4_persontime_poisson[, c("COVID19", "Vaccine1", "Vaccine2", "Dose", ..col_names)]
  
  
  
  D4_persontime_poisson <- D4_persontime_poisson[Dose == 2, Vaccine2 := "Pfizer"]
  D4_persontime_poisson <- D4_persontime_poisson[Dose == 2 & Vaccine1 != Vaccine2, Vaccine2 := "Heterologous"]
  
  
  
  
  
  nameoutput1<-paste0("D4_persontime_monthly_poisson_RF",suffix[[subpop]])
  assign(nameoutput1, D4_persontime_poisson)
  
  save(nameoutput1,file=paste0(diroutput,nameoutput1,".RData"), list=nameoutput1)
  rm(list=nameoutput1)
  rm(col_names, D4_persontime_poisson)
  
}