for (subpop in subpopulations_non_empty) {
  print(subpop)
  
  simplified_myo = c("Myocardalone_narrow", "PERICARD_narrow")
  
  thisdirexp <- ifelse(this_datasource_has_subpopulations == FALSE,direxp,direxpsubpop[[subpop]])
  
  load(paste0(thisdirexp,"D4_persontime_monthly_poisson_RF", suffix[[subpop]],".RData"))
  D4_persontime_poisson <- get(paste0("D4_persontime_monthly_poisson_RF", suffix[[subpop]]))
  rm(list=paste0("D4_persontime_monthly_poisson_RF", suffix[[subpop]]))
  
  D4_persontime_poisson <- D4_persontime_poisson[, Dose := Dose1 + Dose2]
  
  D4_persontime_poisson <- D4_persontime_poisson[Dose == 2, Vaccine2 := "Pfizer"]
  D4_persontime_poisson <- D4_persontime_poisson[Dose == 2 & Vaccine1 != Vaccine2, Vaccine2 := "Heterologous"]
  D4_persontime_poisson <- D4_persontime_poisson[, Vaccine := fifelse(Dose == 1, Vaccine1, Vaccine2)]
  
  col_names <- copy(colnames(D4_persontime_poisson))[str_detect(colnames(D4_persontime_poisson),
                                                                paste(simplified_myo, collapse = '|'))]
  present_simplified_myo = simplified_myo[sapply(simplified_myo, function(x) {any(str_detect(col_names, x))})]
  
  
  D4_persontime_poisson <- D4_persontime_poisson[, c("COVID19", "Vaccine", "Dose", "ageband_at_study_entry",
                                                     ..col_names)]
  
  D4_persontime_poisson[, ageband_at_study_entry := fifelse(ageband_at_study_entry %in% c("0-4","5-11", "12-17", "18-24",
                                                                                          "25-29"), "<30", ">=30")]
  
  D4_persontime_poisson <- D4_persontime_poisson[, lapply(.SD, sum),
                                                 by = c("COVID19", "Vaccine", "Dose", "ageband_at_study_entry"),
                                                 .SDcols = col_names]
  
  
  
  
  for (ev in present_simplified_myo) {
    name_cols <- paste0(c("IR_", "lb_", "ub_"), ev)
    name_count <- paste0(ev,"_b")
    name_pt <- paste0("Persontime_",ev)
    D4_persontime_poisson[, (name_cols) := exactPoiCI(D4_persontime_poisson, name_count, name_pt)]
  }
  
  nameoutput<-paste0("RES_IR_MIS_simplified")
  assign(nameoutput,D4_persontime_poisson)
  
  
  
}