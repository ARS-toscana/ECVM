
MIS_OUTCOMES<-c("MIS_narrow","MIS_possible")

CreateConceptSetDatasets(concept_set_names = c(MIS_OUTCOMES),
                         dataset = ECVM_CDM_tables,
                         codvar = ECVM_CDM_codvar,
                         datevar = ECVM_CDM_datevar,
                         EAVtables = ECVM_CDM_EAV_tables,
                         EAVattributes = ECVM_CDM_EAV_attributes_this_datasource,
                         dateformat= "YYYYmmdd",
                         vocabulary = ECVM_CDM_coding_system_cols,
                         rename_col = list(person_id=person_id,date=date),
                         concept_set_domains = concept_set_domains,
                         concept_set_codes =	concept_set_codes_our_study,
                         concept_set_codes_excl = concept_set_codes_our_study_excl,
                         discard_from_environment = T,
                         dirinput = dirinput,
                         diroutput = dirtemp,
                         extension = c("csv"),
                         vocabularies_with_dot_wildcard=c("READ"))