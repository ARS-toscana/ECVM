concepts<-data.table()
for (concept in names(concept_set_domains)) {
  load(paste0(dirtemp, concept,".RData"))
  if (exists("concepts")) {
    concepts <- rbind(concepts, get(concept))
  } else {
    concepts <- get(concept)
  }
}

create_refine_concepts <- function(concepts) {
  concepts
}

concepts <- concepts[, .(person_id, date, vx_dose, vx_manufacturer, vx_lot_num)]

if (thisdatasource == "ARS") {
  concepts <- concepts[.(vx_manufacturer = c("MODERNA BIOTECH SPAIN S.L.",
                                             "PFIZER Srl", "ASTRAZENECA SpA", "J&J"), to = c("Moderna", "Pfizer", "AstraZeneca", "J&J")),
                       on = "vx_manufacturer", vx_manufacturer := i.to]
}

concepts <- concepts[, qc_manufacturer := as.numeric(vx_manufacturer %in% c("Moderna", "Pfizer", "AstraZeneca", "J&J", "UKN"))]
concepts <- concepts[!is.na(date), ]
concepts <- concepts[!is.na(vx_dose), ]
concepts <- concepts[!is.na(vx_manufacturer), ]
concepts <- concepts[!is.na(vx_lot_num), ]

setorder(concepts, person_id, vx_dose, date)
concepts[, temp_id := rowid(person_id, vx_dose, date, vx_manufacturer)]
concepts <- concepts[, qc_lot_num := fifelse(temp_id == 1, 1, 0), by = c("person_id", "vx_dose", "date", "vx_manufacturer")]
concepts[, temp_id := rowid(person_id, vx_dose, date)]
concepts <- concepts[, qc_manufacturer_1 := fifelse(temp_id == 1, 1, 0), by = c("person_id", "vx_dose", "date")]

# TODO combine next two filters
# TODO add filters in case 1-1 dose > 3 weeks

concepts[, temp_id := rowid(person_id, vx_dose)]
concepts <- concepts[, qc_date := fifelse(temp_id == 1, 1, 0), by = c("person_id", "vx_dose")]
concepts[, temp_id := rowid(person_id, date)]
concepts <- concepts[, qc_dose := fifelse(temp_id == 1, 1, 0), by = c("person_id", "date")]

concepts <- concepts[, qc_date_1 := fifelse(date > ymd(20201227), 1, 0)]
concepts <- concepts[, qc_dose_1 := fifelse(vx_dose <= 2, 1, 0), by = c("person_id", "date")]
concepts_wider <- concepts[qc_dose == 1, .(person_id, date, vx_dose)]

concepts_wider <- dcast(concepts_wider, person_id ~ vx_dose, value.var = "date")

setnames(concepts_wider, c("1", "2"), c("date_vax1", "date_vax2"))
concepts_wider <- concepts_wider[, qc_date_2 := fifelse(is.na(date_vax2) | date_vax1 < date_vax2, 1, 0)][, .(person_id, qc_date_2)]
concepts_wider <- unique(concepts_wider)

concepts <- merge(concepts, concepts_wider, by = "person_id")
concepts <- concepts[pmin(qc_manufacturer, qc_lot_num, qc_manufacturer_1, qc_date, qc_dose, qc_date_1, qc_dose_1, qc_date_2) != 0, ]
concepts <- concepts[, .(person_id, date, vx_dose, vx_manufacturer, vx_lot_num)]
