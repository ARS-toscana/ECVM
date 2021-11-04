#-------------------------------
# ECVM script

# authors: Rosa Gini, Olga Paoletti, Davide Messina, Giorgio Limoncella

# v 6.4.1
# bugfix and incident cases in 11/11_3 now counted only if person in study

# v 6.4
# Inclusion of use of hypertensive drugs in cardiovascular risk
# bug fix in final tables and insufficient run_in
# PT -> Counts in final tables
# Risk factors calculated from 1/1/2019
# Added any_risk_factors in final tables

#v 6.3.1
#DO NOT include use of hypertensive drugs in cardiovascular risk,k small bug fix in final tables

#v 6.3
#changes in final tables for October report

#v 6.2.2
#changes in the vaccines lables and small fix for the MIS final tables

#v.6.2.1
##small fix on final table 7, fix on filter for covid dates 

#v.6.2
##small changes on final tables,addition of KD as a conceptset and PERICARD in CVM report

#v.6.1
#small changes on final tables

# v6.0 - 29 September 2021
# adjustment for subpopulations and change of agebands

# changelog V5.3_MIS:
# addition of final tables 1-7

# changelog V5.2_MIS:
# correction: start of countpersontime at cohort entry and not at study entry


# changelog V5.1_MIS:
# changed codes for MIS and added a specifi to_run for BIFAP (to correct for subpopulations)

# changelog V5_MIS:
# added MIS section

# changelog V4.3.2:
# changed severity level algorithm for BIFAP

# changelog V4.3.1:
# fixed numerator for coverage. Now with vaccinated excluded when exit study
# bugfix for table 3_4_5_6

# changelog V4.3:
# fixed denominator for coverage. Now with dynamic population

# changelog V4.2:
# new codes ICPC and italian ICD9 codes
# improved BIFAP covid registry

# changelog V4.0.2:
# bugfix

# changelog V4.0.1:
# - SAP tables included until 8
# - Added ageband 60+
# - Added column for age at 1 Jan 2021
# - Implementation of exact Poisson confidence intervals for IR (Ulm, 1990)

# changelog V4.0:
# included ACCESS codes

# changelog V3.6:
# - SAP tables included until 6

# changelog V3.5:
# - Support for recurrent events
# - CreateConceptSetDatasets V18
# - support for COVID severity in BIFAP

# changelog V3.4:
# - Cumulative results for risks time since vaccination
# - Inclusion of column ageband and numerator in dashboard tables

# changelog V3.3:
# - Risk factors now are in wide format, not long, for countpersontime

# changelog V3.2:
# - Debugged Createconceptset
# - IR dataset now in Rdata too.

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

# 01 RETRIEVE RECORDS FRM CDM
# if (thisdatasource=="TEST"){
# system.time(source(paste0(thisdir,"/p_steps/step_01_1_T2.1_create_conceptset_datasets_VACCINES.R")))
# }
system.time(source(paste0(thisdir,"/p_steps/step_01_1_T2.1_create_conceptset_datasets.R")))
system.time(source(paste0(thisdir,"/p_steps/step_01_2_T2.1_create_spells.R")))

system.time(source(paste0(thisdir,"/p_steps/step_01_3_T2.1_create_dates_in_PERSONS.R")))

system.time(source(paste0(thisdir,"/p_steps/step_01_4_T2.1_create_prompt_and_itemset_datasets.R")))

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

#10 describing the datasets
system.time(source(paste0(thisdir,"/p_steps/step_10_1_FlowChart_description.R")))

#05 create D3 for doses and coverage
system.time(source(paste0(thisdir,"/p_steps/step_05_1_T2.2_components.R")))
system.time(source(paste0(thisdir,"/p_steps/step_05_2_T2.2_secondary_components.R")))
system.time(source(paste0(thisdir,"/p_steps/step_05_3_T2_create_events_ALL_OUTCOMES.R")))
system.time(source(paste0(thisdir,"/p_steps/step_05_4_QC_count_codes_ALL_OUTCOMES.R")))
system.time(source(paste0(thisdir,"/p_steps/step_05_5_QC_apply_component_strategy.R")))
system.time(source(paste0(thisdir,"/p_steps/step_05_6_T2.2_covariates_at_baseline.R")))
system.time(source(paste0(thisdir,"/p_steps/step_05_7_T2.2_DP_at_baseline.R")))
system.time(source(paste0(thisdir,"/p_steps/step_05_8_T2.3_baseline_characteristics.R")))
system.time(source(paste0(thisdir,"/p_steps/step_05_9_T2.3_ALL_covariates_at_baseline_V2.R")))
system.time(source(paste0(thisdir,"/p_steps/step_05_10_T2.2_components_COVID_severity.R")))
system.time(source(paste0(thisdir,"/p_steps/step_05_11_T2.3_algorithms_COVID_severity.R")))

#06 create D3 for doses and coverage
system.time(source(paste0(thisdir,"/p_steps/step_06_1_T2_create_D3_datasets.R")))
system.time(source(paste0(thisdir,"/p_steps/step_06_2_T2.2_covariates_at_vaccination.R")))
system.time(source(paste0(thisdir,"/p_steps/step_06_3_T2.2_DP_at_vaccination.R")))
system.time(source(paste0(thisdir,"/p_steps/step_06_4_T2.3_vaccination_characteristics.R")))
system.time(source(paste0(thisdir,"/p_steps/step_06_5_T2.3_ALL_covariates_at_vaccination_V2.R")))
system.time(source(paste0(thisdir,"/p_steps/step_06_6_T2_create_D3_datasets.R")))

#MIS and Myocarditis section
# create D3 MIS population

system.time(source(paste0(thisdir,"/p_steps/step_06_7_MIS_population.R")))
system.time(source(paste0(thisdir,"/p_steps/step_06_8_T2.2_covariates_at_covid.R")))
system.time(source(paste0(thisdir,"/p_steps/step_06_9_T2.2_DP_at_covid.R")))
system.time(source(paste0(thisdir,"/p_steps/step_06_10_T2.3_covid_characteristics.R")))
system.time(source(paste0(thisdir,"/p_steps/step_06_11_T2.3_ALL_covariates_at_covid_V2.R")))
system.time(source(paste0(thisdir,"/p_steps/step_06_12_MIS_population_d.R")))
system.time(source(paste0(thisdir,"/p_steps/step_07_9_T3_create_person_time_MIS_year.R")))
system.time(source(paste0(thisdir,"/p_steps/step_07_10_T3_aggregate_monthly_MIS.R")))
system.time(source(paste0(thisdir,"/p_steps/step_08_T4_IR_MIS.R")))

#descriptive
system.time(source(paste0(thisdir,"/p_steps/step_09_4_T3_create_D4_descriptive_tables_MIS.R")))
system.time(source(paste0(thisdir,"/p_steps/step_11_2_T4_create_dummy_tables_MIS_KD.R")))

##end MIS and Myocarditis section------------

#07 create persontime
system.time(source(paste0(thisdir,"/p_steps/step_07_1_T3_create_person_time_risks.R")))
system.time(source(paste0(thisdir,"/p_steps/step_07_2_T3_create_person_time_risks_year.R")))
system.time(source(paste0(thisdir,"/p_steps/step_07_3_T3_create_person_time_benefits.R")))
system.time(source(paste0(thisdir,"/p_steps/step_07_4_T3_create_person_time_benefits_year.R")))
system.time(source(paste0(thisdir,"/p_steps/step_07_5_T3_aggregate_sex_birth_cohort.R")))
system.time(source(paste0(thisdir,"/p_steps/step_07_6_T3_aggregate_sex_risk_factor.R")))
system.time(source(paste0(thisdir,"/p_steps/step_07_7_T3_create_person_time_vax_cohort.R")))
system.time(source(paste0(thisdir,"/p_steps/step_07_8_T3_aggregate_monthly.R")))



#08 Calculate Incidence Rates
system.time(source(paste0(thisdir,"/p_steps/step_08_T4_IR.R")))


#09 create D4 for doses and coverage
system.time(source(paste0(thisdir,"/p_steps/step_09_1_T3_create_D4_doses_weeks.R")))
system.time(source(paste0(thisdir,"/p_steps/step_09_2_T3_create_D4_descriptive_tables.R")))
system.time(source(paste0(thisdir,"/p_steps/step_09_3_T3_create_dashboard_tables.R")))


# system.time(source(paste0(thisdir,"/p_steps/step_10_2_Coverage_description.R")))
# system.time(source(paste0(thisdir,"/p_steps/step_10_3_Doses_description.R")))
# system.time(source(paste0(thisdir,"/p_steps/step_10_4_benefit_description.R")))


#11 Create descriptive tables
system.time(source(paste0(thisdir,"/p_steps/step_11_T4_create_dummy_tables.R")))
system.time(source(paste0(thisdir,"/p_steps/step_11_3_T4_create_dummy_tables_October.R")))

