# Program Information  ----------------------------------------------------

# Program:      step_12_2_run_scri.R 
# Author:       Anna Schultze; Ema Alsina, Sophie Bots, Ivonne Martens 
# Description:  calls a function which runs an SCRI on specified datasets 
#               runs on all datasets in g_intermediate/scri 
# Requirements: 
#               dependencies: preceding steps, packages below 
#               input:  g_intermediate/scri/*
#               parameters: in 07_scri_inputs.R 
#               output: g_output/scri/*model_output.csv

# Housekeeping  -----------------------------------------------------------
# install and load packages 
if (!require("pacman")) install.packages("pacman")
pacman::p_load(packages, character.only = TRUE)

# ensure required folders are created 
dir.create(file.path("./g_intermediate/scri"), showWarnings = FALSE, recursive = TRUE)
dir.create(file.path("./g_output/scri"), showWarnings = FALSE, recursive = TRUE)

# get a list of all the datasets 

# Functions ---------------------------------------------------------------

#' FUNCTION 1. run scri
#' takes a case series csv and fits unadjusted and adjusted scri 
#' outputs a csv of results for all coefficients 
#' 
#' @param brand = vaccine brand, as quoted character
#' @param outcome = outcome, as quoted character 
#' @param outcome_name = outcome display name, as quoted character
#' 
#' relies on the standardsccs from sccs package, which must be loaded 
#' note; date cuts specified in the standardsccs function are inclusive of both start and end 
#' that is, the difference between date1 and date1 is 1 day. 
#' variables are as follows: 
#' start = dose 1 - 90 
#' vd = start pre-exposure window (dose 1 - 30)
#' vd1 = dose 1 
#' vd2 = dose 2 
#' vd3 = start of the "in between doses" period, missing if no dose 2
#' r1end = min(dose1 + 28, dose2, end)
#' r2end = min(dose2 + 28, end)
#' end = min(death, dose1 + 28, dose2 + 28, study_end)
#' note, have included vd3 as min of d1 risk end and d2, otherwise chops up risk window 2 (which doesn't matter hugely, but for clarity)
#' note, in the long data, risk periods of interest are numbered 3 and 6, essentially the number of the input vars in the below vector

run_scri <- function(inputdata) {
  
  # Import Data -------------------------------------------------------------
  scri_input <- read.csv(inputdata)

  # Define Covariates -------------------------------------------------------
  # create a vector which is every 30 days since study start until end (last week not complete)
  # WARNING - NEEDED TO CHANGE INTERVALS TO ENSURE CONVERGENCE IN DUMMY DATA. NEED TO CHANGE AFTER CODE IS DEVELOPED. 
  min_start <- min(scri_input$start, na.rm = TRUE)
  max_end <- max(scri_input$end, na.rm = TRUE)
  # calendar_time <- seq(from = min_start+1, to = max_end-1, by = 30)
  # convergence issues, appear to only handle a single split 
  # 450 is days since calendar time study start, but it's chosen at random through trial and error 
  # unsure why convergence is so hard with covariate - issue of simulated data? would appreciate input
  calendar_time <- c(430)

  # Unadjusted --------------------------------------------------------------
  output.1 <- standardsccs(event ~ vd, 
                           indiv = case, 
                           astart = start, 
                           aend = end-1,
                           aevent = event,
                           adrug = cbind(vd, vd1, vd1+1, vd3, vd2, vd2+1),
                           aedrug = cbind(vd1-1, vd1, r1end, vd2-1, vd2, r2end), 
                           dataformat = "multi",
                           sameexpopar = F, 
                           data = scri_input) 
  
  # extract relevant results 
  output.mod.1 <- as.data.frame(cbind(output.1$conf.int, output.1$coefficients[,c(1,3)])) %>%
    rename(irr = `exp(coef)`,
           lci = `lower .95`,
           uci = `upper .95`,
           yi = `coef`,
           sei = `se(coef)`) %>%
    select(irr, lci, uci, yi, sei) %>% 
    mutate(var = rownames(.), 
           analysis = "unadjusted") 
  
  # Adjusted core model -------------------------------------------------------------- 
  # Note - calendar time adjustment is added through a variable called age in this function, as per Farrington et al 2019. 
  # Note - lots of convergence issues with calendar time variable included here, unsure whether a feature of simulated data 
  # reviewer - please confirm specification looks ok 
  output.2 <- standardsccs(event ~ vd + age, 
                           indiv = case, 
                           astart = start, 
                           aend = end-1,
                           aevent = event,
                           adrug = cbind(vd, vd1, vd1+1, vd3, vd2, vd2+1),
                           aedrug = cbind(vd1-1, vd1, r1end, vd2-1, vd2, r2end), 
                           agegrp = calendar_time, 
                           dataformat = "multi",
                           sameexpopar = c(F,F), 
                           data = scri_input) 
  
  # extract relevant results 
  output.mod.2 <- as.data.frame(cbind(output.2$conf.int, output.2$coefficients[,c(1,3)])) %>%
    rename(irr = `exp(coef)`,
           lci = `lower .95`,
           uci = `upper .95`,
           yi = `coef`,
           sei = `se(coef)`) %>%
    select(irr, lci, uci, yi, sei) %>% 
    mutate(var = rownames(.), 
           analysis = "adjusted") 
  
  # Format results  -------------------------------------------------------
  # stack and format datasets 
  output.total <- rbind(output.mod.1, output.mod.2) %>% 
    mutate(label = case_when(var == "vd1" ~ "pre-exposure pindow", 
                             var == "vd2" ~ "dose 1 day 0", 
                             var == "vd3" ~ "dose 1 risk window", 
                             var == "vd4" ~ "time between dose 1 and dose 2", 
                             var == "vd5" ~ "dose 2 day 0", 
                             var == "vd6" ~ "dose 2 risk window", 
                             TRUE ~ var)) %>% 
    select(-c(var))
  
  # add columns with vaccine and outcome type 
  # slightly hacky solution here, suggestions for improvement v welcome!
  output.total$vacctype <- scri_input$vaccinetype[[1]] 
  output.total$eventtype <- scri_input$eventtype[[1]]
  
  output.total <- output.total %>% 
    relocate(vacctype, eventtype, analysis, label, irr, lci, uci, sei, yi)
  
  return(output.total)
  
} 
  
# Call Functions  ---------------------------------------------------------

# automatically invoke for all datasets 
file_list <- list.files(path = "./g_intermediate/scri", pattern="input", full.names=TRUE)
all_results <- map_dfr(file_list, ~run_scri(.x))

# write output
write.csv(all_results, file = paste0("./g_output/scri/scri_model_output.csv"), row.names=FALSE)

# Checks ------------------------------------------------------------------
# checks conducted during code development 
# may be of use for incorporating when testing the function 

# read in one of the dummy case series 
scri_input <- read.csv("./g_intermediate/scri/AstraZeneca_Myocarditis_input.csv")

# make the data into long format
# note, the standardscccs function does this implicitly 
sccs_data_long <- formatdata(indiv = case, 
                             astart = start, 
                             aend = end-1,
                             aevent = event,
                             adrug = cbind(vd, vd1, vd1+1, vd3, vd2, vd2+1),
                             aedrug = cbind(vd1-1, vd1, r1end, vd2-1, vd2, r2end), 
                             dataformat = "multi",
                             sameexpopar = F, 
                             data = scri_input) 

# check the first row is always the control period 
check1 <- sccs_data_long %>% 
  group_by(indivL) %>% 
  mutate(counter = row_number()) %>% 
  filter(vd == 0)

# should be 1 always 
tabyl(check1$counter)

# check the length of all periods 
interval_distribution <- sccs_data_long %>%
  select(vd, interval, event) %>% 
  tbl_summary(by = vd, 
              type = all_continuous() ~ "continuous2", 
              statistic = list(all_continuous() ~ c("{median} ({p25}, {p75})", 
                                                    "{min}, {max}"),
                               all_categorical() ~ "{n}")) %>% 
  modify_header(update = all_stat_cols() ~ "**{level}**")

interval_distribution 

# check there is just one risk window for each dose 
check2 <- sccs_data_long %>% 
  group_by(indivL) %>% 
  filter(vd == 3) %>% 
  summarise(n = n())

# dose 1 
tabyl(check2$n)

check3 <- sccs_data_long %>% 
  group_by(indivL) %>% 
  filter(vd == 6) %>% 
  summarise(n = n())

# dose 2 
tabyl(check3$n)

# calculate number of events per window 
scri_input <- scri_input %>% 
  # create variables that represent the earlier of study end and risk windows
  rowwise() %>% 
  mutate(studystart = 0, 
         riskwindow1end = min(end, vd1+28, vd2-1), 
         riskwindow2end = min(end, vd2+28), 
         d1d2end = min(end,vd2-1)) %>% 
  ungroup() %>% 
  # create indicator for whether event is in a certain window or not 
  # note ,the reason I'm not using dplyr between is because NAs gave unexpected results 
  mutate(ntotal = if_else(event >= 0 , 1, 0), 
         nearly = if_else((event >= studystart & event <= start-1), 1, 0),
         ncontrol = if_else((event >= start & event <= vd-1), 1, 0),
         npreexp = if_else((event >= vd & event <= vd1-1), 1, 0),
         nd1day0 = if_else((event >= vd1 & event <= vd1), 1, 0),
         nd1risk = if_else((event >= vd1+1 & event <= riskwindow1end), 1, 0),
         nd1d2 = if_else((event >= vd3 & event <= d1d2end), 1, 0),
         nd2day0 = if_else((event >= vd2 & event <= vd2), 1, 0),
         nd2risk = if_else((event >= vd2+1 & event <= riskwindow2end), 1, 0),
         npostd1 = if_else((event >= riskwindow2end+1 & event <= end), 1, 0),
         npostend = if_else((event > end), 1, 0), 1, 0)

# check the events per window 
# note, some of these should be zero or NA
tabyl(scri_input$ntotal) 
tabyl(scri_input$nearly) # events before control, should be zero
tabyl(scri_input$ncontrol)
tabyl(scri_input$npreexp)
tabyl(scri_input$nd1day0)
tabyl(scri_input$nd1risk)
tabyl(scri_input$nd1d2) # most likely missing for some 
tabyl(scri_input$nd2day0) # may be missing for some 
tabyl(scri_input$nd2risk) # may be missing for some 
tabyl(scri_input$npostd1) # events after the end of risk window 2 
tabyl(scri_input$npostend) # events after study end 

#sum of the above tabulations should sum to row numbers in the wide dataset 


check3 <- check2 

check2$test2 <- "trial"

check3 <- check3 %>% 
  slice(1:10)

check3$newvar <- check2$test2[[1]]
