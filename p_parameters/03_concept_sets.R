concept_sets_of_our_study <- c("Covid_vaccine")

concept_set_domains<- vector(mode="list")
concept_set_domains[["Covid_vaccine"]] = "VaccineATC"



concept_set_codes_our_study <- vector(mode="list")


#old: c("049269018","049314026","049283017")
if (thisdatasource == "ARS") {
  concept_set_codes_our_study[["Covid_vaccine"]][["ATC"]] <- c("J07BX03")
}


