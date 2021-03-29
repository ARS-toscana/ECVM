concept_sets_of_our_study <- c("Pfizer", "AstraZeneca", "Moderna")

concept_set_domains<- vector(mode="list")
concept_set_domains[["Pfizer"]] = "Vaccine"
concept_set_domains[["AstraZeneca"]] = "Vaccine"
concept_set_domains[["Moderna"]] = "Vaccine"


concept_set_codes_our_study<-vector(mode="list")

if (thisdatasource == "ARS") {
  concept_set_codes_our_study[["Pfizer"]][["1"]] <- c("049269018")
  concept_set_codes_our_study[["AstraZeneca"]][["1"]] <- c("049314026")
  concept_set_codes_our_study[["Moderna"]][["1"]] <- c("049283017")
}

