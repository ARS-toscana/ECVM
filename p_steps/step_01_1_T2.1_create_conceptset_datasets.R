
# APPLY THE FUNCTION CreateConceptSetDatasets TO CREATE ONE DATASET PER CONCEPT SET CONTAINING ONLY RECORDS WITH A CODE OF INTEREST

# input: EVENTS, MEDICINES, SURVEY_OBSERVATIONS, MEDICAL_OBSERVATIONS
# output: concept set datasets, one per concept set, named after the concept set itself


print('RETRIEVE FROM CDM RECORDS CORRESPONDING TO CONCEPT SETS')
CreateConceptSetDatasets(concept_set_names = c(vaccine__conceptssets),
                         dataset = ECVM_CDM_tables,
                         codvar = ECVM_CDM_codvar,
                         datevar= ECVM_CDM_datevar,
                         dateformat= "YYYYmmdd",
                         rename_col = list(person_id=person_id,date=date),
                         concept_set_domains = concept_set_domains,
                         concept_set_codes =	concept_set_codes_our_study,
                         discard_from_environment = T,
                         dirinput = dirinput,
                         diroutput = dirtemp,
                         extension = c("csv")
                         )

CreateConceptSetDatasets(concept_set_names = c(OUTCOMES_conceptssets, COV_conceptssets, DRUGS_conceptssets, SEVERCOVID_conceptsets),
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


