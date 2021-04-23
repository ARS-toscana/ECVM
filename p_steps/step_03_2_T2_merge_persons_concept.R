

#merge vaccine information to persons
# for (subpop in subpopulations[[thisdatasource]]){
#   print(subpop)
  load(paste0(dirtemp,"output_spells_category.RData"))
  load(paste0(dirtemp,"D3_selection_criteria.RData"))
  load(paste0(dirtemp,"D3_concepts_QC_criteria.RData"))
  
  # if (this_datasource_has_subpopulations == TRUE)output_spells_category <- as.data.table(output_spells_category[[subpop]])
  # if (this_datasource_has_subpopulations == TRUE)D3_selection_criteria <- as.data.table(D3_selection_criteria[[subpop]]) 


persons_doses<-merge(D3_selection_criteria,D3_concepts_QC_criteria, by=c("person_id"),all=T)

persons_doses<-persons_doses[is.na(sex_or_birth_date_missing),sex_or_birth_date_missing:=1]

temp <- copy(D3_selection_criteria)[, .(person_id, date_of_death)]
temp1 <- copy(D3_concepts_QC_criteria)[, .(person_id, date, vx_dose)]
names(output_spells_category)
temp2 <- copy(output_spells_category)[, .(person_id, entry_spell_category, exit_spell_category)]
temp2 <- temp2[study_start %between% list(entry_spell_category,exit_spell_category) & entry_spell_category < exit_spell_category, ]

temp_tot <- merge(temp, temp1)
temp_tot <- merge(temp_tot, temp2)
temp_tot <- temp_tot[date_of_death < date, death_before_vax := 1]
temp_tot <- temp_tot[exit_spell_category < date, exit_spell_before_vax := 1]
temp_tot <- temp_tot[study_end < date, study_end_before_vax := 1]
temp_tot <- temp_tot[, .(person_id, vx_dose, death_before_vax, exit_spell_before_vax, study_end_before_vax)]

for (i in names(temp_tot)){
  temp_tot[is.na(get(i)), (i):=0]
}

persons_doses <- merge(persons_doses, unique(temp_tot), by = c("person_id", "vx_dose"),all.x=T)

# if (this_datasource_has_subpopulations == FALSE){ 
  persons_doses <- persons_doses
# }else{
#   persons_doses[[subpop]] <- persons_doses
# }
# }


save(persons_doses,file=paste0(dirtemp,"persons_doses.RData"))

rm(D3_selection_criteria, D3_concepts_QC_criteria, persons_doses, temp, temp1, output_spells_category, temp2, temp_tot)
