#-------------------------------
# ECVM script - short version to generate summary tables on top of version 3.5
# v3.6 - 28 June 2021
# authors: Rosa Gini, Olga Paoletti, Davide Messina, Giorgio Limoncella

rm(list=ls(all.names=TRUE))

#set the directory where the file is saved as the working directory
if (!require("rstudioapi")) install.packages("rstudioapi")
thisdir<-setwd(dirname(rstudioapi::getSourceEditorContext()$path))
thisdir<-setwd(dirname(rstudioapi::getSourceEditorContext()$path))


#load parameters
source(paste0(thisdir,"/p_parameters/01_parameters_program.R"))
source(paste0(thisdir,"/p_parameters/02_parameters_CDM.R"))
source(paste0(thisdir,"/p_parameters/03_concept_sets.R"))
source(paste0(thisdir,"/p_parameters/04_itemsets.R"))
source(paste0(thisdir,"/p_parameters/05_subpopulations_restricting_meanings.R"))
source(paste0(thisdir,"/p_parameters/06_algorithms.R"))


#run scripts

system.time(source(paste0(thisdir,"/p_steps/step_09_2_T3_create_D4_descriptive_tables.R")))

#11 Create descriptive tables
system.time(source(paste0(thisdir,"/p_steps/step_11_T4_create_dummy_tables.R")))
