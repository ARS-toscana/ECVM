#-------------------------------
# ECVM script
# v2.0 - 29 April 2021
# authors: Olga Paoletti, Davide Messina, Giorgio Limoncella

rm(list=ls(all.names=TRUE))

#set the directory where the file is saved as the working directory
if (!require("rstudioapi")) install.packages("rstudioapi")
thisdir<-setwd(dirname(rstudioapi::getSourceEditorContext()$path))
thisdir<-setwd(dirname(rstudioapi::getSourceEditorContext()$path))


#load parameters
source(paste0(thisdir,"/p_parameters/01_parameters_program.R"))
source(paste0(thisdir,"/p_parameters/02_parameters_CDM.R"))
source(paste0(thisdir,"/p_parameters/03_concept_sets.R"))
# source(paste0(thisdir,"/p_parameters/04_itemsets.R"))
#source(paste0(thisdir,"/p_parameters/05_subpopulations_restricting_meanings.R"))
# source(paste0(thisdir,"/p_parameters/06_algorithms.R"))


#run scripts

# 01 RETRIEVE RECORDS FRM CDM
system.time(source(paste0(thisdir,"/p_steps/step_01_1_T2.1_create_conceptset_datasets.R")))
system.time(source(paste0(thisdir,"/p_steps/step_01_2_T2.1_create_spells.R")))

#02 quality checks
system.time(source(paste0(thisdir,"/p_steps/step_02_1_T2_create_QC_criteria.R")))
system.time(source(paste0(thisdir,"/p_steps/step_02_2_T3_apply_QC_exclusion_criteria.R")))

#03 create exclusion criteria
system.time(source(paste0(thisdir,"/p_steps/step_03_1_T2_create_exclusion_criteria.R")))
system.time(source(paste0(thisdir,"/p_steps/step_03_2_T2_merge_persons_concept.R")))

#04 apply exclusion criteria
system.time(source(paste0(thisdir,"/p_steps/step_04_1_T3_apply_exclusion_criteria.R")))
system.time(source(paste0(thisdir,"/p_steps/step_04_2_T3_apply_quality_check_exclusion_criteria_doses.R")))
##use flowchart (apply also quality checks)


#05 create D3 for doses and coverage
system.time(source(paste0(thisdir,"/p_steps/step_05_T2_create_D3_datasets.R")))

#06 create D4 for doses and coverage
system.time(source(paste0(thisdir,"/p_steps/step_06_1_T3_create_D4_doses_weeks.R")))

bench::mark(min_iterations = 10,
            source(paste0(thisdir,"/p_steps/step_06_1_T3_create_D4_doses_weeks.R")),
            source(paste0(thisdir,"/p_steps/step_06_1_T3_create_D4_doses_weeks_RAM_optimized.R")))

system.time(source(paste0(thisdir,"/p_steps/step_06_2_T3_create_dashboard_tables.R")))

system.time(source(paste0(thisdir,"/p_steps/step_06_3_T3_create_D4_descriptive_tables.R")))

#08 describing the datasets
system.time(source(paste0(thisdir,"/p_steps/step_08_01_FlowChart_description.R")))
system.time(source(paste0(thisdir,"/p_steps/step_08_02_Coverage_description.R")))
system.time(source(paste0(thisdir,"/p_steps/step_08_03_Doses_description.R")))

# system.time(source(paste0(thisdir,"/p_steps/step_08_01_FlowChart_description_MD.R")))
# system.time(source(paste0(thisdir,"/p_steps/step_08_02_Coverage_description_MD.R")))
# system.time(source(paste0(thisdir,"/p_steps/step_08_03_Doses_description_MD.R")))

