#NOTE add cycle trough the concept dfs?

concepts <- import_concepts(dirtemp, concept_set_domains)
concepts <- concepts[, vx_record_date := ymd(vx_record_date)]
concepts <- concepts[, derived_date := fifelse(!is.na(date), date, vx_record_date)]

concepts <- concepts[, .(person_id, date, derived_date, vx_dose, vx_manufacturer)]

setorderv(concepts, c("person_id", "derived_date"))
concepts <- concepts[, derived_dose := rowid(person_id)]
concepts[1:5, "vx_dose"] <- 2

QC_dose_derived <- concepts[, wrong_dose := fifelse(vx_dose != derived_dose, 1, 0)]
nrow_wrong <- nrow(QC_dose_derived)
nrow_wrong_0 <- nrow(QC_dose_derived[wrong_dose == 0, ])
nrow_wrong_1 <- nrow(QC_dose_derived[wrong_dose == 1, ])
save(QC_dose_derived, file = paste0(dirtemp, "QC_dose_derived.RData"))
table_QC_dose_derived <- data.table(a = c("", "Number of doses", "Correct doses", "Misclassified doses"),
                                    b = c("N", nrow_wrong, nrow_wrong_0, nrow_wrong_1),
                                    c = c("%", "", round(nrow_wrong_0/nrow(QC_dose_derived)*100, 2),
                                          round(nrow_wrong_1/nrow(QC_dose_derived)*100, 2)))
setnames(table_QC_dose_derived, c("a", "b", "c"), c("", thisdatasource, thisdatasource))
fwrite(table_QC_dose_derived, file = paste0(direxp, "table_QC_dose_derived.csv"))

concepts <- concepts[, qc_1_date := as.numeric(is.na(derived_date))]
concepts <- concepts[, qc_1_dose := as.numeric(is.na(derived_dose))]
concepts$derived_dose <- as.numeric(concepts$derived_dose)
concepts$vx_manufacturer <- as.character(concepts$vx_manufacturer)

if (thisdatasource %in% c("ARS", "TEST")) {
  concepts <- concepts[.(vx_manufacturer = c("MODERNA BIOTECH SPAIN S.L.",
                                             "PFIZER Srl", "ASTRAZENECA SpA", "J&J"), to = c("Moderna", "Pfizer", "AstraZeneca", "J&J")),
                       on = "vx_manufacturer", vx_manufacturer := i.to]
}

concepts <- concepts[vx_manufacturer %not in% c("Moderna", "Pfizer", "AstraZeneca", "J&J"), vx_manufacturer := "UKN"]

# TODO to unknows
setorder(concepts, person_id, derived_dose, derived_date)
concepts[, temp_id := rowid(person_id, derived_dose, derived_date, vx_manufacturer)]
#NOTE remove the filter for lot_num when it will be necessary (moved above)

concepts[, temp_id := rowid(person_id, derived_dose, derived_date, vx_manufacturer)]
concepts <- concepts[, qc_dupl := fifelse(temp_id == 1, 0, 1), by = c("person_id", "derived_dose", "derived_date", "vx_manufacturer")]
concepts <- concepts[, qc_2_date := fifelse(derived_date >= ymd(20201227), 0, 1)]
concepts <- concepts[, qc_2_dose := fifelse(derived_dose <= 2, 0, 1), by = c("person_id", "derived_date")]

concepts[, temp_id := rowid(person_id, derived_dose, derived_date)]
concepts <- concepts[qc_dupl == 0, qc_manufacturer := fifelse(temp_id == 1, 0, 1), by = c("person_id", "derived_dose", "derived_date")]

concepts[, temp_id := rowid(person_id, derived_dose)]
concepts <- concepts[qc_dupl == 0 & qc_2_date == 0 & qc_2_dose == 0 & qc_manufacturer == 0,
                     qc_mult_date_for_dose := fifelse(temp_id == 1, 0, 1), by = c("person_id", "derived_dose")]
concepts[, temp_id := rowid(person_id, derived_date)]
concepts <- concepts[qc_dupl == 0 & qc_2_date == 0 & qc_2_dose == 0 & qc_manufacturer == 0 & qc_mult_date_for_dose == 0,
                     qc_mult_dose_for_date := fifelse(temp_id == 1, 0, 1), by = c("person_id", "derived_date")]


concepts_wider <- concepts[qc_dupl == 0 & qc_2_date == 0 & qc_2_dose == 0 & qc_manufacturer == 0 & qc_mult_date_for_dose == 0 & qc_mult_dose_for_date == 0, ]
concepts_wider <- concepts_wider[, .(person_id, derived_date, derived_dose)]

concepts_wider <- data.table::dcast(concepts_wider, person_id ~ derived_dose, value.var = "derived_date")

setnames(concepts_wider, c("1", "2"), c("date_vax1", "date_vax2"))
concepts_wider <- concepts_wider[, qc_3_date := fifelse(is.na(date_vax2) | date_vax1 < date_vax2, 0, 1)][, .(person_id, qc_3_date)]
concepts_wider <- unique(concepts_wider)

concepts <- merge(concepts, concepts_wider, by = "person_id",all.x=T)

setnames(concepts, "vx_dose", "old_dose")
setnames(concepts, "derived_dose", "vx_dose")
setnames(concepts, "date", "old_date")
setnames(concepts, "derived_date", "date")
D3_concepts_QC_criteria <- concepts[, .(person_id, date, vx_dose, vx_manufacturer, qc_1_date, qc_1_dose, qc_dupl,
                                        qc_2_date, qc_2_dose, qc_manufacturer, qc_mult_date_for_dose,
                                        qc_mult_dose_for_date, qc_3_date)]

for (i in names(D3_concepts_QC_criteria)){
  D3_concepts_QC_criteria[is.na(get(i)), (i):=0]
}

save(D3_concepts_QC_criteria, file = paste0(dirtemp, "D3_concepts_QC_criteria.RData"))
rm(concepts, concepts_wider, D3_concepts_QC_criteria, QC_dose_derived)
