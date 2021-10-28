# Program Information  ----------------------------------------------------

# Program:      step_12_1_create_scri_dataset.R 
# Author:       Anna Schultze; Ema Alsina, Sophie Bots, Ivonne Martens 
# Description:  calls a function which creates SCRI dataset in wide format 
#               takes user provided brands and outcomes
#               outputs datasets provided N is >5. 
#               if N is < 5 no output data is provided and a warning printed to console 
# Requirements: 
#               dependencies: 07_scri_inputs.R
#               input:  D3_study_variables_for_SCRI (g_intermediate) in RData format 
#               parameters: in 07_scri_inputs.R
#               output: g_output/scri/scri_input_[brand]_[outcome]_flowchart.txt
#                       g_intermediate/scri/scri_input_[brand]_[outcome]_input.csv               

# Housekeeping  -----------------------------------------------------------
# install and load packages 
if (!require("pacman")) install.packages("pacman")
pacman::p_load(packages, character.only = TRUE)

# ensure required folders are created 
dir.create(file.path("./g_intermediate/scri"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("./g_output/scri"), showWarnings = FALSE, recursive = TRUE)

# Functions for Cohort Creation -------------------------------------------
# note - one thing to change in these I think is the hard coded data name, which is awkward 

#' FUNCTION 1. scri flowchart
#' takes the an input dataset and outputs a flowchart as txt, per outcome and vaccine
#' 
#' @param brand = vaccine brand, as quoted character
#' @param outcome = outcome, as quoted character 
#' @param outcome_name = outcome display name, as quoted character

scri_flowchart <- function(brand, outcome, outcome_name) {
  
  # create required variables to determine study period 
  scri_data_extract <- scri_data_extract %>% 
    mutate(start = date_vax1 - 90, 
           riskd1 = date_vax1 + 28, 
           riskd2 = date_vax2 + 28) %>% 
    # calculate the end of the risk period taking into account both doses
    mutate(end_risk = case_when(!is.na(date_vax2) ~ riskd2, 
                                TRUE ~ riskd1)) %>% 
    rowwise() %>% 
    # create study end date 
    mutate(end = min(end_risk, study_exit_date, death_date, na.rm = T)) %>% 
    ungroup()
  
  total <- scri_data_extract %>% 
    nrow() 
  
  step1 <- scri_data_extract %>%
    filter(!is.na(sex)) %>% 
    nrow()
  
  step2 <- scri_data_extract %>%
    filter(!is.na(sex), 
           !is.na(age_at_study_entry)) %>% 
    nrow()
  
  step3 <- scri_data_extract %>%
    filter(!is.na(sex), 
           !is.na(age_at_study_entry), 
           !is.na(date_vax1)) %>% 
    nrow()
  
  step4 <- scri_data_extract %>% 
    filter(!is.na(sex), 
           !is.na(age_at_study_entry), 
           !is.na(date_vax1), 
           study_entry_date <= date_vax1 & date_vax1 <= study_exit_date) %>% 
    nrow() 
  
  step5 <- scri_data_extract %>%
    filter(!is.na(sex), 
           !is.na(age_at_study_entry), 
           !is.na(date_vax1), 
           study_entry_date <= date_vax1 & date_vax1 <= study_exit_date, 
           type_vax_1 == {{brand}}) %>% 
    nrow()
  
  step6 <- scri_data_extract %>% 
    filter(!is.na(sex), 
           !is.na(age_at_study_entry), 
           !is.na(date_vax1), 
           study_entry_date <= date_vax1 & date_vax1 <= study_exit_date, 
           type_vax_1 == {{brand}}, 
           !is.na({{outcome}})) %>% 
    nrow()
  
  step7 <- scri_data_extract %>% 
    filter(!is.na(sex), 
           !is.na(age_at_study_entry), 
           !is.na(date_vax1), 
           study_entry_date <= date_vax1 & date_vax1 <= study_exit_date, 
           type_vax_1 == {{brand}}, 
           !is.na({{outcome}}), 
           study_entry_date <= eval(parse(text = {{outcome}})) & eval(parse(text = {{outcome}})) <= study_exit_date) %>%  
    nrow()
  
  step8 <- scri_data_extract %>% 
    filter(!is.na(sex), 
           !is.na(age_at_study_entry), 
           !is.na(date_vax1), 
           study_entry_date <= date_vax1 & date_vax1 <= study_exit_date, 
           type_vax_1 == {{brand}}, 
           !is.na({{outcome}}), 
           study_entry_date <= eval(parse(text = {{outcome}})) & eval(parse(text = {{outcome}})) <= study_exit_date, 
           start <= eval(parse(text = {{outcome}})) & eval(parse(text = {{outcome}})) <= end) %>% 
    nrow()
  
  step9 <- scri_data_extract %>% 
    filter(!is.na(sex), 
           !is.na(age_at_study_entry), 
           !is.na(date_vax1), 
           study_entry_date <= date_vax1 & date_vax1 <= study_exit_date, 
           type_vax_1 == {{brand}}, 
           !is.na({{outcome}}), 
           study_entry_date <= eval(parse(text = {{outcome}})) & eval(parse(text = {{outcome}})) <= study_exit_date, 
           start <= eval(parse(text = {{outcome}})) & eval(parse(text = {{outcome}})) <= end,
           type_vax_1 == type_vax_2 | is.na(type_vax_2)) %>% 
    nrow()
  
  # print how many also had dose 2 (note, not applied for case series selection)
  step10 <- scri_data_extract %>% 
    filter(!is.na(sex), 
           !is.na(age_at_study_entry), 
           !is.na(date_vax1), 
           study_entry_date <= date_vax1 & date_vax1 <= study_exit_date, 
           type_vax_1 == {{brand}}, 
           !is.na({{outcome}}), 
           study_entry_date <= eval(parse(text = {{outcome}})) & eval(parse(text = {{outcome}})) <= study_exit_date, 
           start <= eval(parse(text = {{outcome}})) & eval(parse(text = {{outcome}})) <= end,
           type_vax_1 == type_vax_2 | is.na(type_vax_2), 
           !is.na(date_vax2)) %>% 
    nrow()
  
  # basic flowchart to see how each criteria affects selection 
  # add descriptions to each of the steps and make a dataframe 
  flowchart_n <- c(total, step1, step2, step3, step4, step5, step6, step7, step8, step9, step10)
  flowchart_text <- c("total", "known sex", "known age", "any vaccine", "vaccine in study period", 
                      paste0("vaccine of brand ", brand), paste0(outcome_name, " ever"), 
                      paste0(outcome_name," in study period"), 
                      paste0(outcome_name," between start of control and end of risk period"), 
                      "dose 1 vaccine same as dose 2 vaccine", 
                      "dose 2")
  flowchart <- data.frame(flowchart_text, flowchart_n)
  # apply small number redaction 
  flowchart <- flowchart %>% 
    mutate(flowchart_n = as.numeric(flowchart_n), 
           redacted_n = case_when(flowchart_n <=5 ~ "[REDACTED]", 
                                   TRUE ~ as.character(flowchart_n))) %>% 
    select(flowchart_text, redacted_n)
  
  # export txt file of results 
  write.table(flowchart, file = paste0("./g_output/scri/",brand, "_", outcome_name, "_flowchart"), sep = "\t", na = "", row.names=FALSE)
  return(paste("flowchart", brand, outcome_name, "outputted")) 
} 

#' FUNCTION 2. create scri dataset 
#' 
#' takes the an input dataset and applies scri selection criteria 
#' outputs a csv with variables required for running the scri using sccs package
#' 
#' @param brand = vaccine brand, as quoted character
#' @param outcome = outcome of interest, as quoted character 
#' @param outcome_name = outcome display name, as quoted character

create_scri_dataset <- function(brand, outcome, outcome_name) {
  
  # apply filters 
  temp <- scri_data_extract %>% 
    mutate(start = date_vax1 - 90, 
           riskd1 = date_vax1 + 28, 
           riskd2 = date_vax2 + 28) %>% 
    # calculate the end of the risk period taking into account both doses
    mutate(end_risk = case_when(!is.na(date_vax2) ~ riskd2, 
                                TRUE ~ riskd1)) %>% 
    rowwise() %>% 
    # create study end date 
    mutate(end = min(end_risk, study_exit_date, death_date, na.rm = T)) %>% 
    ungroup() %>% 
    filter(!is.na(sex), 
           !is.na(age_at_study_entry), 
           !is.na(date_vax1), 
           study_entry_date <= date_vax1 & date_vax1 <= study_exit_date, 
           type_vax_1 == {{brand}}, 
           !is.na({{outcome}}), 
           study_entry_date <= eval(parse(text = {{outcome}})) & eval(parse(text = {{outcome}})) <= study_exit_date, 
           start <= eval(parse(text = {{outcome}})) & eval(parse(text = {{outcome}})) <= end,
           type_vax_1 == type_vax_2 | is.na(type_vax_2))
  
  # required data wrangling to fit SCRI
  # create required variables 
  temp <- temp %>% 
    # ensure date vars are treated as dates 
    mutate(date_vax1 = lubridate::as_date(date_vax1), 
           date_vax2 = lubridate::as_date(date_vax2)) %>% 
    # create columns for required timevariables 
    # note, exposure vars should start with same prefix for sccs macro 
    mutate(vd = date_vax1 - 30, 
           vd1 = date_vax1, 
           vd2 = date_vax2) %>% 
    # create start variable for period in between dose 1 and 2, if applicable 
    mutate(vd3 = case_when(riskd1<vd2 ~ riskd1, 
                           TRUE ~ NA_real_))  %>% 
    # create end of risk windows taking into account study end and doses 
    rowwise() %>% 
    mutate(r1end = min(end, vd1+28, vd2-1), 
           r2end = min(end, vd2+28)) %>% 
    ungroup() %>% 
    # change time scale to days since study entry 
    mutate(across(c(start, end, vd, vd1, vd2, vd3, r1end, r2end), ~ .x - study_entry_date)) %>% 
    mutate(across(c(start, end, vd, vd1, vd2, vd3, r2end, r2end), ~ as.numeric(.x, units = "days"))) %>% 
    mutate(event = as.numeric(eval(parse(text = {{outcome}})) - study_entry_date)) 
  
  temp <- temp %>% 
    # ID needs to be numeric for SCCS function, recreate one from rownumber
    mutate(case = row_number()) %>% 
    # select variables needed for the SCRI
    select(start, end, vd, vd1, vd2, vd3, r1end, r2end, event, case) %>% 
    # add variables of brand and event type for clarity 
    mutate(eventtype = outcome_name, 
           vaccinetype = brand)
  
  # total number of events 
  total <- temp %>% 
   nrow() 
  
  # export txt file of results if more than 5 cases, otherwise warning 
  if (total>5) {
    write.csv(temp, file = paste0("./g_intermediate/scri/",brand, "_", outcome_name, "_input.csv"), row.names=FALSE)
    return(paste("case series", brand, outcome_name, "outputted")) 
  } else {
    return(paste("numbers for case series", brand, outcome_name, "<=5")) 
  }
}

# Import Data -------------------------------------------------------------
load(here::here("g_intermediate", raw_data)) 
scri_data_extract <- eval(parse(text = raw_data_name))

# Fix Simulated Data ------------------------------------------------------
# note - this should be REMOVED after code development is finalised 
# note - this is quite hacky as I've never simulated data before 
# improvements would also be very welcome! 

# add random number2 and dates 
scri_data_extract$random <- sample(100, size = nrow(scri_data_extract), replace = TRUE)
scri_data_extract$random2 <- sample(100, size = nrow(scri_data_extract), replace = TRUE)
scri_data_extract$random_dates<-sample(seq(as.Date('2020/12/01'), 
                                           as.Date('2021/05/31'), 
                                           by="day"), 
                                       length(scri_data_extract$person_id), 
                                       replace = TRUE) 


# replace the myocarditis and pericarditis dates with some more ones to increase N
scri_data_extract <- scri_data_extract %>% 
  mutate(myocarditis_date = case_when(random <60 ~ random_dates, 
                                      TRUE ~ myocarditis_date), 
         pericarditis_date = case_when(random <60 ~ random_dates, 
                                       TRUE ~ pericarditis_date), 
         myocarditis = ifelse(!is.na(myocarditis_date), 1, 0), 
         pericarditis = ifelse(!is.na(pericarditis_date), 1,0))

# ensure that second doses are at least 20 days after the first 
# in simulated data appeared to be a lot 1 day apart, which made checking interval construction harder
scri_data_extract <- scri_data_extract %>% 
  mutate(dose_diff = as.numeric(date_vax2 - date_vax1)) %>% 
  mutate(date_vax2 = ifelse(dose_diff<20, date_vax2+20, date_vax2)) 

# increase missingness for second doses to look more like true situation 
scri_data_extract <- scri_data_extract %>% 
  mutate(date_vax2 = ifelse(random2 < 90, date_vax2, NA), 
         type_vax_2 = ifelse(is.na(date_vax2), NA, type_vax_2), 
         date_vax2 = lubridate::as_date(date_vax2), 
         vax1 = ifelse(!is.na(date_vax1), 1, 0), 
         vax2 = ifelse(!is.na(date_vax2), 1,0))

# check the frequency of key variables 
vars <- c("myocarditis", "pericarditis", "vax1", "vax2", "type_vax_1", "type_vax_2") 
apply(scri_data_extract[c(vars)], 2, tabyl)

# check contents 
glimpse(scri_data_extract)

# Call Functions  ---------------------------------------------------------
# NOTE - unsure whether this is the most appropriate way to invoke 
# reviewer, please confirm 
pmap(scri_input_grid, scri_flowchart)
pmap(scri_input_grid, create_scri_dataset) 
