#NOTE add cycle trough the concept dfs?

import_concepts <- function(dirtemp, concept_set_domains) {
  concepts<-data.table()
  for (concept in names(concept_set_domains)) {
    load(paste0(dirtemp, concept,".RData"))
    if (exists("concepts")) {
      concepts <- rbind(concepts, get(concept))
    } else {
      concepts <- get(concept)
    }
  }
  return(concepts)
}

concepts <- import_concepts(dirtemp, concept_set_domains)

concepts <- concepts[, .(person_id, date, vx_dose, vx_manufacturer)]
concepts <- concepts[, qc_1_date := as.numeric(is.na(date))]
concepts <- concepts[, qc_1_dose := as.numeric(is.na(vx_dose))]
concepts <- concepts[vx_manufacturer %in% c("Moderna", "Pfizer", "AstraZeneca", "J&J"), vx_manufacturer := "UKN"]
# concepts <- concepts[, qc_1_lot_num := as.numeric(!is.na(vx_lot_num))]

# err_1_lot_num <- nrow(concepts[qc_1_lot_num == 0, ])
#NOTE add the filter for lot_num when it will be necessary

if (thisdatasource %in% c("ARS", "TEST")) {
  concepts <- concepts[.(vx_manufacturer = c("MODERNA BIOTECH SPAIN S.L.",
                                             "PFIZER Srl", "ASTRAZENECA SpA", "J&J"), to = c("Moderna", "Pfizer", "AstraZeneca", "J&J")),
                       on = "vx_manufacturer", vx_manufacturer := i.to]
}

# TODO to unknows
setorder(concepts, person_id, vx_dose, date)
concepts[, temp_id := rowid(person_id, vx_dose, date, vx_manufacturer)]
#NOTE remove the filter for lot_num when it will be necessary (moved above)

concepts[, temp_id := rowid(person_id, vx_dose, date, vx_manufacturer)]
concepts <- concepts[, qc_dupl := fifelse(temp_id == 1, 0, 1), by = c("person_id", "vx_dose", "date", "vx_manufacturer")]
concepts <- concepts[, qc_2_date := fifelse(date >= ymd(20201227), 0, 1)]
concepts <- concepts[, qc_2_dose := fifelse(vx_dose <= 2, 0, 1), by = c("person_id", "date")]

concepts[, temp_id := rowid(person_id, vx_dose, date)]
concepts <- concepts[qc_dupl == 0, qc_manufacturer := fifelse(temp_id == 1, 0, 1), by = c("person_id", "vx_dose", "date")]

# concepts <- concepts[qc_dupl == 0 & qc_2_date == 0 & qc_2_dose == 0, qc_2a_dose := fifelse(max(vx_dose) == 1 & date > min(date + 21), 0, 1), by = c("person_id", "vx_dose")]
# # NOTE is it really ok?
# concepts <- concepts[qc_dupl == 0 & qc_2_date == 0 & qc_2_dose == 0, qc_2b_dose := fifelse(min(vx_dose) == 2 & date < max(date - 21), 0, 1), by = c("person_id", "vx_dose")]

concepts[, temp_id := rowid(person_id, vx_dose)]
concepts <- concepts[qc_dupl == 0 & qc_2_date == 0 & qc_2_dose == 0 & qc_manufacturer == 0,
                     qc_mult_date_for_dose := fifelse(temp_id == 1, 0, 1), by = c("person_id", "vx_dose")]
concepts[, temp_id := rowid(person_id, date)]
concepts <- concepts[qc_dupl == 0 & qc_2_date == 0 & qc_2_dose == 0 & qc_manufacturer == 0 & qc_mult_date_for_dose == 0,
                     qc_mult_dose_for_date := fifelse(temp_id == 1, 0, 1), by = c("person_id", "date")]

concepts <- concepts[qc_dupl == 0 & qc_2_date == 0 & qc_2_dose == 0 & qc_manufacturer == 0 & qc_mult_date_for_dose == 0 & qc_mult_dose_for_date == 0, ]
concepts_wider <- concepts[, .(person_id, date, vx_dose)]

concepts_wider <- dcast(concepts_wider, person_id ~ vx_dose, value.var = "date")

setnames(concepts_wider, c("1", "2"), c("date_vax1", "date_vax2"))
concepts_wider <- concepts_wider[, qc_3_date := fifelse(is.na(date_vax2) | date_vax1 < date_vax2, 0, 1)][, .(person_id, qc_3_date)]
concepts_wider <- unique(concepts_wider)

concepts <- merge(concepts, concepts_wider, by = "person_id")
D3_concepts_QC_criteria <- concepts[, .(person_id, date, vx_dose, vx_manufacturer, qc_1_date, qc_1_dose, qc_dupl,
                                        qc_2_date, qc_2_dose, qc_manufacturer, qc_mult_date_for_dose,
                                        qc_mult_dose_for_date, qc_3_date)]

for (i in names(D3_concepts_QC_criteria)){
  D3_concepts_QC_criteria[is.na(get(i)), (i):=0]
}

save(D3_concepts_QC_criteria, file = paste0(dirtemp, "D3_concepts_QC_criteria"))

rm(concepts, concepts_wider, D3_concepts_QC_criteria)


