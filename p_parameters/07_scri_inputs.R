# Program Information  ----------------------------------------------------

# Program:      07_scri_inputs.R 
# Author:       Anna Schultze; Ema Alsina, Sophie Bots, Ivonne Martens 
# Description:  sets a series of "parameters" (i.e, input values) 
# Requirements: none
#
# INPUT LISTS  -----------------------------------------------------------

# package list 
packages<- c("tidyverse", "data.table", "here", "SCCS", "gtsummary", "janitor", "ggplot2")

# names of input data 
raw_data <- "D3_study_variables_for_SCRI.RData"
raw_data_name <- "D3_study_variables_for_SCRI"
intermediate_data <- "scri_data_extract"

# outcomes of interest 
outcomes <- c("myocarditis_date", "pericarditis_date")

# vaccine brands of interest 
brands <- c("Pfizer", "AstraZeneca", "Moderna")

# create data frame of outcome/brand combinations (note, base R as no packages at this point)
scri_input_grid <- expand.grid(brands, outcomes, stringsAsFactors = F) 
scri_input_grid$Var3[scri_input_grid$Var2 == "myocarditis_date"] <- "Myocarditis"
scri_input_grid$Var3[scri_input_grid$Var2 == "pericarditis_date"] <- "Pericarditis"
names(scri_input_grid)[names(scri_input_grid) == "Var1"] <- "brand"
names(scri_input_grid)[names(scri_input_grid) == "Var2"] <- "outcome"
names(scri_input_grid)[names(scri_input_grid) == "Var3"] <- "outcome_name"
  