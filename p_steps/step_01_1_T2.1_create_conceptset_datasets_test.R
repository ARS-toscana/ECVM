
# APPLY THE FUNCTION CreateConceptSetDatasets TO CREATE ONE DATASET PER CONCEPT SET CONTAINING ONLY RECORDS WITH A CODE OF INTEREST

# input: EVENTS, MEDICINES, SURVEY_OBSERVATIONS, MEDICAL_OBSERVATIONS
# output: concept set datasets, one per concept set, named after the concept set itself

library(logger)
t <- paste0(dirtest,'/logger.txt')

if (file.exists(t)) {
  file.remove(t)
}

dirtest <- paste0(thisdir,"/g_test/")

log_appender(appender_file(t))

original <- function() {
  first_run <- system.time({
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
    
    
    # APPLY THE FUNCTION CreateConceptSetDatasets TO CREATE ONE DATASET PER CONCEPT SET CONTAINING ONLY RECORDS WITH A CODE OF INTEREST
    for (conceptset in OUTCOMES_conceptssets){
      CreateConceptSetDatasets(concept_set_names = conceptset,
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
    }
    
    for (conceptset in COV_conceptssets){
      CreateConceptSetDatasets(concept_set_names = conceptset,
                               dataset = ECVM_CDM_tables,
                               codvar = ECVM_CDM_codvar,
                               datevar= ECVM_CDM_datevar,
                               EAVtables = ECVM_CDM_EAV_tables,
                               EAVattributes = ECVM_CDM_EAV_attributes_this_datasource,
                               dateformat = "YYYYmmdd",
                               vocabulary = ECVM_CDM_coding_system_cols,
                               rename_col = list(person_id=person_id,date=date),
                               concept_set_domains = concept_set_domains,
                               concept_set_codes =	concept_set_codes_our_study,
                               concept_set_codes_excl = concept_set_codes_our_study_excl,
                               discard_from_environment = T,
                               dirinput = dirinput,
                               diroutput = dirtemp,
                               extension = c("csv"),
                               vocabularies_with_dot_wildcard = c("READ"))
    }
    
    for (conceptset in DRUGS_conceptssets){
      CreateConceptSetDatasets(concept_set_names = conceptset,
                               dataset = ECVM_CDM_tables,
                               codvar = ECVM_CDM_codvar,
                               datevar = ECVM_CDM_datevar,
                               EAVtables = ECVM_CDM_EAV_tables,
                               EAVattributes = ECVM_CDM_EAV_attributes_this_datasource,
                               dateformat = "YYYYmmdd",
                               vocabulary = ECVM_CDM_coding_system_cols,
                               rename_col = list(person_id=person_id,date=date),
                               concept_set_domains = concept_set_domains,
                               concept_set_codes =	concept_set_codes_our_study,
                               concept_set_codes_excl = concept_set_codes_our_study_excl,
                               discard_from_environment = T,
                               dirinput = dirinput,
                               diroutput = dirtemp,
                               extension = c("csv"))
    }
    
    for (conceptset in SEVERCOVID_conceptsets){
      CreateConceptSetDatasets(concept_set_names = conceptset,
                               dataset = ECVM_CDM_tables,
                               codvar = ECVM_CDM_codvar,
                               datevar= ECVM_CDM_datevar,
                               EAVtables=ECVM_CDM_EAV_tables,
                               EAVattributes= ECVM_CDM_EAV_attributes_this_datasource,
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
                               vocabularies_with_dot_wildcard = c("READ"))
    }
  })
  log_info(paste("Original run in:", as.integer(first_run[[3]]), "seconds"))
  log_appender()
}

time_optimized <- function() {
  second_run <- system.time({
  source(paste0(dirmacro,"CreateConceptSetDatasets_v17.R"))
  
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
                           diroutput = dirtest,
                           extension = c("csv")
  )
  
  
  # APPLY THE FUNCTION CreateConceptSetDatasets TO CREATE ONE DATASET PER CONCEPT SET CONTAINING ONLY RECORDS WITH A CODE OF INTEREST
  
  CreateConceptSetDatasets(concept_set_names = c(OUTCOMES_conceptssets),
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
                           diroutput = dirtest,
                           extension = c("csv"),
                           vocabularies_with_dot_wildcard=c("READ"))
  
  
  
  CreateConceptSetDatasets(concept_set_names = c(COV_conceptssets),
                           dataset = ECVM_CDM_tables,
                           codvar = ECVM_CDM_codvar,
                           datevar= ECVM_CDM_datevar,
                           EAVtables = ECVM_CDM_EAV_tables,
                           EAVattributes = ECVM_CDM_EAV_attributes_this_datasource,
                           dateformat = "YYYYmmdd",
                           vocabulary = ECVM_CDM_coding_system_cols,
                           rename_col = list(person_id=person_id,date=date),
                           concept_set_domains = concept_set_domains,
                           concept_set_codes =	concept_set_codes_our_study,
                           concept_set_codes_excl = concept_set_codes_our_study_excl,
                           discard_from_environment = T,
                           dirinput = dirinput,
                           diroutput = dirtest,
                           extension = c("csv"),
                           vocabularies_with_dot_wildcard = c("READ"))
  
  
  
  CreateConceptSetDatasets(concept_set_names = c(DRUGS_conceptssets),
                           dataset = ECVM_CDM_tables,
                           codvar = ECVM_CDM_codvar,
                           datevar = ECVM_CDM_datevar,
                           EAVtables = ECVM_CDM_EAV_tables,
                           EAVattributes = ECVM_CDM_EAV_attributes_this_datasource,
                           dateformat = "YYYYmmdd",
                           vocabulary = ECVM_CDM_coding_system_cols,
                           rename_col = list(person_id=person_id,date=date),
                           concept_set_domains = concept_set_domains,
                           concept_set_codes =	concept_set_codes_our_study,
                           concept_set_codes_excl = concept_set_codes_our_study_excl,
                           discard_from_environment = T,
                           dirinput = dirinput,
                           diroutput = dirtest,
                           extension = c("csv"))
  
  
  CreateConceptSetDatasets(concept_set_names = c(SEVERCOVID_conceptsets),
                           dataset = ECVM_CDM_tables,
                           codvar = ECVM_CDM_codvar,
                           datevar= ECVM_CDM_datevar,
                           EAVtables=ECVM_CDM_EAV_tables,
                           EAVattributes= ECVM_CDM_EAV_attributes_this_datasource,
                           dateformat= "YYYYmmdd",
                           vocabulary = ECVM_CDM_coding_system_cols,
                           rename_col = list(person_id=person_id,date=date),
                           concept_set_domains = concept_set_domains,
                           concept_set_codes =	concept_set_codes_our_study,
                           concept_set_codes_excl = concept_set_codes_our_study_excl,
                           discard_from_environment = T,
                           dirinput = dirinput,
                           diroutput = dirtest,
                           extension = c("csv"),
                           vocabularies_with_dot_wildcard = c("READ"))
  })
  log_info(paste("New run in:", as.integer(second_run[[3]]), "seconds"))
  log_appender()
}

p <- peakRAM::peakRAM(
  original(),
  time_optimized()
)

log_info(paste0("Original peak RAM: ", p[[1,4]], "MiB"))
log_info(paste0("New peak RAM: ", p[[2,4]], "MiB"))
log_appender()

for (concept in concept_sets_of_our_study) {
  load(paste0(dirtemp, concept, ".RData"))
  old <- get(concept)
  load(paste0(dirtest, concept, ".RData"))
  new <- get(concept)
  cond = all.equal(old, new)
  print(paste(concept, cond))
}

readLines(t)
unlink(t)
