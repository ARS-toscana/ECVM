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

concepts <- concepts[, .(person_id, date, vx_dose, vx_manufacturer, vx_lot_num)]
concepts <- concepts[, qc_1_date := as.numeric(!is.na(date))]
concepts <- concepts[, qc_1_dose := as.numeric(!is.na(vx_dose))]
concepts <- concepts[, qc_1_manufacturer := as.numeric(!is.na(vx_manufacturer))]
concepts <- concepts[, qc_1_lot_num := as.numeric(!is.na(vx_lot_num))]


err_1_date <- nrow(concepts[qc_1_date == 0, ])
err_1_dose <- nrow(concepts[qc_1_dose == 0, ])
err_1_manufacturer <- nrow(concepts[qc_1_manufacturer == 0, ])
err_1_lot_num <- nrow(concepts[qc_1_lot_num == 0, ])
#NOTE add the filter for lot_num when it will be necessary
concepts <- concepts[qc_1_date == 1 & qc_1_dose == 1 & qc_1_manufacturer == 1, ]
concepts <- concepts[, c("qc_1_date", "qc_1_dose", "qc_1_manufacturer") := NULL, ]

if (thisdatasource == "ARS") {
  concepts <- concepts[.(vx_manufacturer = c("MODERNA BIOTECH SPAIN S.L.",
                                             "PFIZER Srl", "ASTRAZENECA SpA", "J&J"), to = c("Moderna", "Pfizer", "AstraZeneca", "J&J")),
                       on = "vx_manufacturer", vx_manufacturer := i.to]
}

concepts <- concepts[, qc_2_manufacturer := as.numeric(vx_manufacturer %in% c("Moderna", "Pfizer", "AstraZeneca", "J&J", "UKN"))]

setorder(concepts, person_id, vx_dose, date)
concepts[, temp_id := rowid(person_id, vx_dose, date, vx_manufacturer)]
#NOTE remove the filter for lot_num when it will be necessary (moved above)
concepts <- concepts[qc_1_lot_num == 1, qc_2_lot_num := fifelse(temp_id == 1, 1, 0), by = c("person_id", "vx_dose", "date", "vx_manufacturer")]
concepts <- concepts[is.na(qc_2_lot_num), qc_2_lot_num := 1]
concepts <- concepts[, qc_2_date := fifelse(date > ymd(20201227), 1, 0)]
concepts <- concepts[, qc_2_dose := fifelse(vx_dose <= 2, 1, 0), by = c("person_id", "date")]
err_2_manufacturer <- nrow(concepts[qc_2_manufacturer == 0, ])
err_2_lot_num <- nrow(concepts[qc_2_lot_num == 0, ])
err_2_date <- nrow(concepts[qc_2_date == 0, ])
err_2_dose <- nrow(concepts[qc_2_dose == 0, ])
#NOTE modify to normal filter when lot_num will be necessary
concepts <- unique(concepts[qc_2_manufacturer == 1 & qc_2_date == 1 & qc_2_dose == 1, ])
concepts <- unique(concepts[, c("qc_2_lot_num", "qc_1_lot_num", "qc_2_manufacturer") := NULL])

concepts[, temp_id := rowid(person_id, vx_dose, date)]
concepts <- concepts[, qc_3_manufacturer := fifelse(temp_id == 1, 1, 0), by = c("person_id", "vx_dose", "date")]
err_3_manufacturer <- nrow(concepts[qc_3_manufacturer == 0, ])
concepts <- concepts[qc_3_manufacturer == 1, ]
concepts <- unique(concepts[, c("qc_3_manufacturer") := NULL])

concepts <- concepts[, qc_2a_dose := fifelse(max(vx_dose) == 1 & date > min(date + 21), 1, 0), by = c("person_id", "vx_dose")]
# NOTE is it really ok?
concepts <- concepts[, qc_2b_dose := fifelse(min(vx_dose) == 2 & date < max(date - 21), 1, 0), by = c("person_id", "vx_dose")]
err_2a_dose <- nrow(concepts[qc_2a_dose == 1, ])
err_2b_dose <- nrow(concepts[qc_2b_dose == 1, ])

concepts[, temp_id := rowid(person_id, vx_dose)]
concepts <- concepts[, qc_mult_date_for_dose := fifelse(temp_id == 1, 1, 0), by = c("person_id", "vx_dose")]
concepts[, temp_id := rowid(person_id, date)]
concepts <- concepts[, qc_mult_dose_for_date := fifelse(temp_id == 1, 1, 0), by = c("person_id", "date")]
err_mult_date_for_dose <- nrow(concepts[qc_mult_date_for_dose == 0, ])
err_mult_dose_for_date <- nrow(concepts[qc_mult_dose_for_date == 0, ])

concepts <- concepts[qc_mult_date_for_dose == 1 & qc_mult_dose_for_date == 1, ]
concepts_wider <- concepts[, .(person_id, date, vx_dose)]

concepts_wider <- dcast(concepts_wider, person_id ~ vx_dose, value.var = "date")

setnames(concepts_wider, c("1", "2"), c("date_vax1", "date_vax2"))
concepts_wider <- concepts_wider[, qc_3_date := fifelse(is.na(date_vax2) | date_vax1 < date_vax2, 1, 0)][, .(person_id, qc_3_date)]
err_3_date <- nrow(concepts_wider[qc_3_date == 0, ])
concepts_wider <- unique(concepts_wider)

concepts <- merge(concepts, concepts_wider, by = "person_id")
concepts <- concepts[qc_3_date == 1, ]
concepts <- concepts[, .(person_id, date, vx_dose, vx_manufacturer)]

save(concepts, file = paste0(dirtemp, names(concept_set_domains),"_qualitychecks.RData"))

test <- data.table(err_1_date, err_1_dose, err_1_manufacturer, err_1_lot_num, err_2_manufacturer, err_2_lot_num, err_2_date,
           err_2_dose, err_3_manufacturer, err_2a_dose, err_2b_dose, err_mult_date_for_dose, err_mult_dose_for_date, err_3_date)

knitr::kable(test, "html") %>%
  kableExtra::kable_styling(bootstrap_options = c("bordered", "hover")) %>%
  cat(., file = paste0(direxp, names(concept_set_domains),"_qualitychecks.html"))
