#-------------------------------
# ECVM script
# v0.2 - 14 April 2021
# authors:


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
source(paste0(thisdir,"/p_parameters/05_subpopulations_restricting_meanings.R"))
# source(paste0(thisdir,"/p_parameters/06_algorithms.R"))


#run scripts

# 01 RETRIEVE RECORDS FRM CDM

system.time(source(paste0(thisdir,"/p_steps/step_01_1_T2.1_create_conceptset_datasets.R")))
system.time(source(paste0(thisdir,"/p_steps/step_01_2_T2.1_create_spells.R")))
# TODO ask about step4
system.time(source(paste0(thisdir,"/p_steps/step_04_T2_create_exclusion_criteria.R")))
# TODO is flowchart results correct?
system.time(source(paste0(thisdir,"/p_steps/step_05_T3_apply_exclusion_criteria.R")))
system.time(source(paste0(thisdir,"/p_steps/step_A.R")))
system.time(source(paste0(thisdir,"/p_steps/step_B.R")))
