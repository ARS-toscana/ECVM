concept_sets_of_our_study <- c("Pfizer", "AstraZeneca", "Moderna","UnspecifiedCovidVaccine")

concept_set_domains<- vector(mode="list")
concept_set_domains[["Pfizer"]] = "Vaccine"
concept_set_domains[["AstraZeneca"]] = "Vaccine"
concept_set_domains[["Moderna"]] = "Vaccine"
concept_set_domains[["UnspecifiedCovidVaccine"]] = "VaccineATC"


concept_set_codes_our_study <- vector(mode="list")

if (thisdatasource == "ARS") {
  concept_set_codes_our_study[["Pfizer"]][[""]] <- c("049269018")
  concept_set_codes_our_study[["AstraZeneca"]][[""]] <- c("049314026")
  concept_set_codes_our_study[["Moderna"]][[""]] <- c("049283017")
}
concept_set_codes_our_study[["UnspecifiedCovidVaccine"]][["ATC"]] <- c("J07BX03")

