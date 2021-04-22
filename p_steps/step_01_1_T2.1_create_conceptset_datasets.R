
# APPLY THE FUNCTION CreateConceptSetDatasets TO CREATE ONE DATASET PER CONCEPT SET CONTAINING ONLY RECORDS WITH A CODE OF INTEREST

# input: EVENTS, MEDICINES, SURVEY_OBSERVATIONS, MEDICAL_OBSERVATIONS
# output: concept set datasets, one per concept set, named after the concept set itself


print('RETRIEVE FROM CDM RECORDS CORRESPONDING TO CONCEPT SETS')

CreateConceptSetDatasets(concept_set_names = c(concept_sets_of_our_study),
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
