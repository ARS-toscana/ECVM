# we need to create two groups of meanings: one referring to hospitals HOSP (excluding emergency care) and one referring to primary care PC

meanings_of_this_study<-vector(mode="list")
meanings_of_this_study[["HOSP"]]=c("hospitalisation_primary","hospitalisation_secondary","hospital_diagnosis","hopitalisation_diagnosis_unspecified","episode_primary_diagnosis","episode_secondary_diagnosis","diagnosis_procedure","hospitalisation_associated","hospitalisation_linked","HH","NH")
meanings_of_this_study[["PC"]]=c("primary_care_event","primary_care_diagnosis","primary_care_events_BIFAP","primary_care_antecedents_BIFAP","primary_care_condicionants_BIFAP")

# create two conditions on the meaning_of_event variable, associated to HOSP and to PC as listed above

condmeaning <- list()
for (level1 in c("HOSP","PC")) {
  for (meaning in meanings_of_this_study[[level1]]) {
    if (length(condmeaning[[level1]])==0) {condmeaning[[level1]]=paste0("meaning_of_event=='",meanings_of_this_study[[level1]][[1]],"'")
    }else{
      condmeaning[[level1]]=paste0(condmeaning[[level1]], " | meaning_of_event=='",meaning,"'")
    }
  }
}

# DATASOURCE-SPECIFIC ALGORITHMS

datasources_with_specific_algorithms <- c('GePaRD')

exclude_meanings_from_OUTCOME <- vector(mode="list")
# HH HA NH NA NE NN NO NS NU A G V Z
for (OUTCOME in OUTCOME_events){
  exclude_meanings_from_OUTCOME[["GePaRD"]][[OUTCOME]]=c("HA", "NA", "NE", "NN", "NO", "NS", "NU", "A", "G", "V", "Z")
}
for (OUTCOME in OUTCOME_events){
  print(OUTCOME)
  print(exclude_meanings_from_OUTCOME[["GePaRD"]][[OUTCOME]])
}
for (OUTCOME in c('ABS','ADEM','GENCONV','MENINGOENC','ARD','ANAPHYL','MISCC')) {
        exclude_meanings_from_OUTCOME[["GePaRD"]][[OUTCOME]]=c(exclude_meanings_from_OUTCOME[["GePaRD"]][[OUTCOME]],"G")
}
for (OUTCOME in OUTCOME_events){
  print(OUTCOME)
  print(exclude_meanings_from_OUTCOME[["GePaRD"]][[OUTCOME]])
}

#-------------------------------------
# fix for ICD10GM

for (conceptset in concept_sets_of_our_study){
  if (concept_set_domains[[conceptset]] == "Diagnosis"){
    concept_set_codes_our_study[[conceptset]][["ICD10GM"]] <- concept_set_codes_our_study[[conceptset]][["ICD10"]]
  }
}

#-------------------------------------
# fix for ICD10CM
for (conceptset in concept_sets_of_our_study){
  if (concept_set_domains[[conceptset]] == "Diagnosis"){
    concept_set_codes_our_study[[conceptset]][["ICD10CM"]] <- concept_set_codes_our_study[[conceptset]][["ICD10"]]
  }
}