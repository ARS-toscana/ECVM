---
title: Actions in each step
date: []
chapter: true
pre: <b>4. </b>
weight: 7
---

# Actions in each step

# 01 RETRIEVE RECORDS FROM CDM


## [step 01_1]: create conceptset datasets (T2.1)
 **input**: VACCINES, EVENTS, MEDICINES

**parameters** : concept_sets_of_our_study, ECVM_CDM_tables, ECVM_CDM_codvar, ECVM_CDM_datevar, concept_set_domains, concept_set_domains, concept_set_codes_our_study. 

 **output**: concept set datasets, one per concept set, named after the concept set itself   (data model: it is a sequence of records from multiple tables of the Common Data Model) 

In this step the function [CreateConceptSetDatasets](https://github.com/ARS-toscana/CreateConceptSetDatasets) is used. The set of input tables are inspected and a group of datasets is created, each corresponding to a concept set. 
Each dataset contains the records of the input tables that match the corresponding concept set codes.

## [step 01_2]: create spells (T2.1)
 **input**: OBSERVATION_PERIODS

**parameters**: study_end, this_datasource_has_subpopulations, op_meanings_list_per_set, op_meaning_sets, subpopulations, op_meaning_sets_in_subpopulations

 **output**:  D3_output_spells_category , output_spells_category_meaning_set (only if the datasource has subpopulations)

In this step the function [CreateSpells](https://github.com/ARS-toscana/CreateSpells) is used. It takes as input a dataset with multiple time windows per unit of observation (OBSERVATION_PERIODS). The output is a datasetof <i>spells</i>, i.e., disjoint periods of time.

## [step 01_3]: create dates from PERSONS (T2.1)  
 **input**: PERSONS , OBSERVATION_PERIODS 

 **output**:   D3_PERSONS, D3_events_DEATH

In this step birth date and date of death from PERSONS are fixed in case days or months are missing (they are not mandatory variables). Once PERSONS is corrected it is saved as D3_PERSONS. D3_events_DEATH is also created containing date of death

## [step 01_4]: create prompt and itemset datasets (T2.1)  
 **input**: SURVEY_ID, SURVEY_OBSERVATIONS
 
 **parameters**: ECVM_CDM_EAV_tables_retrieve, ECVM_CDM_datevar_retrieve, dateformat, study_variable_names, itemset_AVpair_our_study_this_datasource

 **output**:   covid_registry

In this step, the set of input tables are inspected and a group of datasets is created, each corresponding to a prompt or to a itemset. 
Each dataset contains the records of the input tables that match the corresponding prompt or itemset.


# 02 QUALITY CHECK FOR DOSES

## [step 02_1]: create quality check criteria (T2)

**input**: concept set datasets

**parameters** : concept_set_domains, study_years

 **output**: D3_concepts_QC_criteria

Creation of quality check criteria for vaccine doses and recoding of missing manufacturer

## [step 02_2]: apply quality check criteria (T3)

**input**: D3_concepts_QC_criteria, 

**parameters** : concept_set_domains, study_years, thisdatasource

 **output**: Flowchart_QC_criteria, selected_doses

Application of the vaccine doses QC criteria. Creation of final dataset for the dosses and flowchart including the number of doses excluded by criteria

# 03 CREATE EXCLUSION CRITERIA

## [step 03_1]: create exclusion criteria (T2)

  **input**: PERSONS, OBSERVATION_PERIODS, D3_output_spells_category

  **parameters** : study_start, study_end, this_datasource_has_subpopulations

 **output**: D3_selection_criteria_doses

Creation of quality check criteria for D3_PERSONS, based on personal data and spells.

## [step 03_2]: merge persons concept (T2)

  **input**: D3_selection_criteria_doses, D3_concepts_QC_criteria, output_spells_category

  **parameters** : study_end

 **output**: persons_doses

Merge vaccine doses information with persons. (with exclusion criteria variables)

# 04 APPLY EXCLUSION CRITERIA

## [step 04_1]: apply exclusion criteria (T3)

  **input**: D3_selection_criteria_doses

  **parameters** : this_datasource_has_subpopulations, subpopulations,

  **output**: Flowchart_exclusion_criteria, Flowchart_basic_exclusion_criteria, D4_study_population (data model), D4_study_source_population

  **output parameters**: subpopulations_non_empty

In this step the function CreateFlowchart is used: the selection criteria are applied and the study population is selected. A flowchart is created as a byproduct.

## [step 04_2]: apply quality checks exclusion criteria (T3)

  **input**: persons_doses

  **parameters** : this_datasource_has_subpopulations, subpopulations,

  **output**: Flowchart_doses, HTML_flowchart_doses

In this step the function CreateFlowchart is used: the selection criteria are applied and the study population is selected. A flowchart is created as a byproduct.

# 05 CREATE STUDY VARIABLES

## [step 05_1]: components (T2.2)
  **input**: concept set datasets of outcomes (narrow and possible), D4_study_population, subpopulations_non_empty

  **parameters**: firstYearComponentAnalysis, secondYearComponentAnalysis, OUTCOME_events, this_datasource_has_subpopulations, date_format, datasources_with_specific_algorithms, exclude_meanings_from_OUTCOME

  **output**: for each outcome <i>OUTCOME</i>,  D3_events_<i>OUTCOME</i>_ <i>TYPE</i> and D3_components_<i>OUTCOME</i> 

In this step the function [MergeFilterAndCollapse](https://github.com/ARS-toscana/MergeFilterAndCollapse/wiki) is used. All outcomes that occurred to the persons in the study population during the study period or during lookback are listed. Moreover, components are created for narrow and possible concept sets, for HOSP and PC meanings. Finally, datasource-tailored algorithms are implemented.

## [step 05_2] : create secondary components (T2.2)

**input**: concept set datasets involved in secondary components, D4_study_population

**parameters**: this_datasource_has_subpopulations, SECCOMPONENTS, concept_set_seccomp, rule_seccomp, distance_seccomp, direction_seccomp

**output**: for each secondary component SECCOMP, D3_eventsSecondary_<i>SECCOMP</i>.RData

## [step 05_3] : create events all outcomes (T2)

  **input**: D4_study_population, subpopulations_non_empty, D3_events_OUTCOME_narrow, D3_events_OUTCOME_possible, for all outcomes <i>OUTCOME</i>; conceptsets for CONTROL_events

  **parameters** : OUTCOMEnoCOVID, CONTROL_events, this_datasource_has_subpopulations

 **output**: list_outcomes_observed, D3_events_ALL_OUTCOMES

In this step a list containing all observed outcomes including control outcomes and excluding COVID, and a dataset is created, containing the first occurrence recorded during lookback or during study period of each outcome.

## [step 05_4] : code counts of first occurrence of outcomes in the study population (QC)

  **input**: D4_study_population, D3_events_ALL_OUTCOMES

  **parameters** : this_datasource_has_subpopulations, list_outcomes_observed_only_diagnosis

 **output**: QC_code_counts_in_study_population_<i>OUTCOME</i>_YYYY (exported to csv)

This step counts the codes occurring during each year of the study period of each outcome. Only the first occurrence of each person is included

## [step 05_5]: apply component strategy (QC)

 **input**: D4_study_population, D3_events_<i>OUTCOME</i>_<i>TYPE</i>

  **parameters** : this_datasource_has_subpopulations, firstYearComponentAnalysis, secondYearComponentAnalysis, OUTCOME_events, date_format, subpopulations_non_empty

  **output**: QC_all_components_<i>OUTCOME</i>

In this step outcomes are split in all possible components

## [step 05_6]: covariates at baseline (T2.2)

  **input**: D4_study_population, concept set datasets corresponding to COV_conceptssets, plus the six datasets corresponding to the concept sets of the three outcomes CAD, MYOCARD and HF, which are to be used in the covariate CV: "CV","COVCANCER","COVCOPD","COVCKD","COVDIAB","COVOBES","COVSICKLE"

  **parameters** : this_datasource_has_subpopulations, exclude_meaning_of_event, subpopulations_non_empty

  **output**:  D3_study_population_covariates 

In this step the diagnostic components of the risk factors are created as presence of a diagnostic code during lookback, and added to the study population

## [step 05_7]: Drug Proxy at baseline (T2.2)

  **input**: D4_study_population, concept set datasets in DRUGS_conceptssets ("CV", "COVCOPD", "COVCKD", "COVDIAB")

  **parameters** : this_datasource_has_subpopulations, DRUGS_conceptssets, subpopulations_non_empty,
 **output**: D3_study_population_DP  

In this step for each subject in the study population a the drug proxy component of each risk factor is created: there must be at least 2 records during 365 days of lookback.

## [step 05_8]: baseline characteristics (T2.3) 

  **input**: D4_study_population, D3_study_population_covariates, subpopulations_non_empty

  **parameters** : this_datasource_has_subpopulations

 **output**: D4_study_population_cov

In this step few simple covariates (age etc) are added to the study population.

## [step 05_9]: ALL covariates at baseline (T2.3)

  **input**: subpopulations_non_empty, D4_study_population, D4_study_population_cov, D3_study_population_DP

  **parameters** : this_datasource_has_subpopulations

 **output**: D3_study_population_cov_ALL 

In this step the diagnostic and the drug proxy component of each risk factor are merged into a composite OR, and added to the study population.

## [step 05_10]: components for COVID severity (T2.2) 

  **input**:   D4_study_population.RData, D3_events_COVID_narrow, D3_events_DEATH.RData, covid_registry, COVID_symptoms
  **parameters**: this_datasource_has_subpopulations, subpopulations_non_empty
  **output**:  D3_components_covid_severity

In this step, components to identify occurrence of covid and of its level of severity are computed based on the concept sets COVID_narrow, "COVIDSYMPTOM","ARD_narrow","ARD_possible", and 'MechanicalVent', and possibly on the records of covid registry, if available in the data source

## [step 05_11]: algorithms for COVID severity (T2.3) 

  **input**:   # input: D3_components_covid_severity.RData, D4_study_population.RData

  **parameters**: this_datasource_has_subpopulations, subpopulations_non_empty

  **output**:  D3_algorithm_covid, D3_outcomes_covid

In this step, the components created in the previous step are combined to obtain levels of covid severity

# 06 CREATE D3 FOR DOSES AND COVERAGE

## [step 06]: create D3 datasets(T2)
  **input**: D4_study_population, selected_doses, D3_outcomes_covid

  **parameters**: thisdatasource

  **output**: D3_study_population, D3_Vaccin_cohort, D3_studyweeks, D3_vaxweeks, D3_vaxweeks_including_not_vaccinated

Creation of all D3 datasets present in the SAP document.

# 07 CREATE D4 RISK AND BENEFIT

## [step 07_1]: create person time for risks (T3)

  **input**: D3_vaxweeks_including_not_vaccinated, D3_events_ALL_OUTCOMES

  **parameters** : this_datasource_has_subpopulations, subpopulations_non_empty, list_outcomes_observed

 **output**: D4_persontime_risk_week

In this step the function [CountPersonTime](https://github.com/IMI-ConcePTION/CountPersonTime/wiki) is used. The output contains persontime and counts of all outcomes, measured both as narrow and as broad.

## [step 07_2]: create person time risks year (T3)

  **input**: D3_vaxweeks_including_not_vaccinated, D3_events_ALL_OUTCOMES

  **parameters** : this_datasource_has_subpopulations, subpopulations_non_empty, list_outcomes_observed

 **output**: D4_persontime_risk_year

In this step the function [CountPersonTime](https://github.com/IMI-ConcePTION/CountPersonTime/wiki) is used. The output contains persontime and counts of all outcomes, measured both as narrow and as broad.

## [step 07_3]: create person time for benefit (T3)

  **input**: D3_vaxweeks_including_not_vaccinated, D3_outcomes_covid

  **parameters** : this_datasource_has_subpopulations, subpopulations_non_empty, list_outcomes_observed_COVID

 **output**: D4_persontime_benefit_week

In this step the function [CountPersonTime](https://github.com/IMI-ConcePTION/CountPersonTime/wiki) is used. The output contains persontime and counts of the levels of covid.

## [step 07_4]: create person time benefits year (T3)

  **input**: D3_vaxweeks_including_not_vaccinated, D3_outcomes_covid

  **parameters** : this_datasource_has_subpopulations, subpopulations_non_empty, list_outcomes_observed_COVID

 **output**: D4_persontime_benefit_year

In this step the function [CountPersonTime](https://github.com/IMI-ConcePTION/CountPersonTime/wiki) is used. The output contains persontime and counts of the levels of covid.

## [step 07_5]: aggregate sex birth cohort (T3)

  **input**: D4_persontime_risk_week, D4_persontime_benefit_week, D4_persontime_risk_year, D4_persontime_benefit_year

 **output**: D4_persontime_risk_week_BC, D4_persontime_benefit_week_BC, D4_persontime_risk_year_BC, D4_persontime_benefit_year_BC

Aggregating the data for birth_coohort and sex

## [step 07_6]: aggregate sex risk factor (T3)

  **input**: D4_persontime_risk_week, D4_persontime_benefit_week, D4_persontime_risk_year, D4_persontime_benefit_year

 **output**: D4_persontime_risk_week_RF, D4_persontime_benefit_week_RF, D4_persontime_risk_year_RF, D4_persontime_benefit_year_RF

Aggregating the data for risk_factors

## [step 07_7]: create person time vax cohort (T3)
  **input**: D3_events_ALL_OUTCOMES, D3_vaxweeks_vaccin_cohort

  **parameters** : this_datasource_has_subpopulations, subpopulations_non_empty, list_outcomes_observed

 **output**: D4_persontime_risk_month

In this step the function [CountPersonTime](https://github.com/IMI-ConcePTION/CountPersonTime/wiki) is used. The output contains monthly persontime and counts of the levels of covid for the vaccinated cohort.

## [step 07_8]: aggregate monthly (T3)

  **input**: D4_persontime_risk_month

 **output**: D4_persontime_risk_month_RFBC

Aggregating the monthly data for risk_factors and birth cohort.


# 08 CALCULATE THE INCIDENCE RATES

## [step 08_1]: IR (T4)

  **input**: D4_persontime_risk_week_BC, D4_persontime_benefit_week_BC, D4_persontime_risk_year_BC, D4_persontime_benefit_year_BC, D4_persontime_risk_week_RF, D4_persontime_benefit_week_RF, D4_persontime_risk_year_RF, D4_persontime_benefit_year_RF, D4_persontime_risk_month_RFBC

  **parameters** : list_outcomes_observed

  **output**: D4_IR_benefit_week_BC, D4_IR_benefit_fup_BC, D4_IR_risk_week_BC, D4_IR_risk_fup_BC, D4_IR_benefit_week_RF, D4_IR_benefit_fup_RF, D4_IR_risk_week_RF, D4_IR_risk_fup_RF, D4_persontime_ALL_OUTCOMES

Calculate the incidence rates for birth cohorts and risk factors datasets for both risk and benefit


# 09 ANALYSIS: DESCRIPTIVE TABLES AND DASHBOARD TABLES FOR DOSES, COVERAGE, RISK AND BENEFIT

## [step 09_1]: create D4_doses_weeks (T3)
  **input**: D3_studyweeks

  **parameters** : study_start, study_end

  **output**: D4_doses_weeks

Creation of D4_doses_weeks dataset starting from D3_studyweeks

## [step 09_2]: create descriptive tables (T4)
  **input**: D3_study_population, D3_Vaccin_cohort, D3_study_population_cov_ALL

  **output**: D4_descriptive_dataset_age_studystart, D4_descriptive_dataset_ageband_studystart, D4_descriptive_dataset_sex_studystart, D4_descriptive_dataset_covariate_studystart, D4_followup_fromstudystart, D4_descriptive_dataset_age_vax1, D4_descriptive_dataset_ageband_vax, D4_descriptive_dataset_sex_vaccination, D4_followup_from_vax, Density_plot_distance_doses, Histogram_distance_doses, D4_distance_doses

Create the remaining D4 datasets and tables described in the SAP.

## [step 09_3]: create dashboard tables for doses and coverage (T4)

  **input**: D3_vaxweeks, D3_Vaccin_cohort, D3_study_population, D3_study_population_cov_ALL, D4_IR_benefit_week_BC, D4_IR_benefit_fup_BC, D4_IR_benefit_week_RF, D4_IR_benefit_fup_RF, D4_IR_risk_week_BC, D4_IR_risk_fup_BC, D4_IR_risk_week_RF, D4_IR_risk_fup_RF

  **parameters** : list_outcomes_observed

  **output**: DOSES_BIRTHCOHORTS, COVERAGE_BIRTHCOHORTS, DOSES_RISKFACTORS, COVERAGE_RISKFACTORS, BENEFIT_BIRTHCOHORTS_CALENDARTIME, BENEFIT_BIRTHCOHORTS_TIMESINCEVACCINATION, BENEFIT_RISKFACTORS_CALENDARTIME, BENEFIT_RISKFACTORS_TIMESINCEVACCINATION, RISK_BIRTHCOHORTS_CALENDARTIME, RISK_BIRTHCOHORTS_TIMESINCEVACCINATION, RISK_RISKFACTORS_CALENDARTIME, RISK_RISKFACTORS_TIMESINCEVACCINATION

Creation of all dashboard tables (excluding dummy tables)

# 10 CREATE HTML FILES THAT DESCRIBE DATASETS

## [step 10_1]: FlowChart description (T4)

  **input**: Flowchart_doses

  **output**: HTML_Flowchart_doses_description

## [step 10_2]: Coverage description (T4)

  **input**: COVERAGE_BIRTHCOHORTS

  **output**: HTML_COVERAGE_BIRTHCOHORTS_description

## [step 10_3]: Doses description (T4)

  **input**: DOSES_BIRTHCOHORTS

  **output**: HTML_DOSES_BIRTHCOHORTS_description

## [step 10_4]: benefit description (T4)

  **input**: BENEFIT_BIRTHCOHORTS_CALENDARTIME, BENEFIT_BIRTHCOHORTS_TIMESINCEVACCINATION

  **output**: HTML_benefit_description

# 11 ANALYSIS: DESCRIPTIVE TABLES AND DASHBOARD TABLES FOR DOSES, COVERAGE, RISK AND BENEFIT

## [step 11]: create_dummy_tables (T4)
  **input**: Flowchart_basic_exclusion_criteria, Flowchart_exclusion_criteria, D4_descriptive_dataset_ageband_studystart, D4_descriptive_dataset_age_studystart, D4_followup_fromstudystart, D4_descriptive_dataset_sex_studystart, D4_descriptive_dataset_covariate_studystart

  **output**: Attrition diagram 1, Attrition diagram 2, Cohort characteristics at start of study (1-1-2020), Cohort characteristics at first COVID-19 vaccination, Doses of COVID-19 vaccines and distance between first and second dose, Number of incident cases entire study period, Code counts for narrow definitions (for each event) separately, Incidence of AESI (narrow) per 100,000 PY by calendar month in 2020, Incidence of AESI (narrow) per 100,000 PY by age in 2020, Incidence of AESI (narrow) per 100,000 PY by age & sex in 2020, Incidence of AESI (narrow) per 100,000 PY by age & sex in 2020, Incidence of AESI (narrow) per 100,000 PY by month in 2021 (non-vaccinated), Incidence of AESI (narrow) per 100,000 PY by week since vaccination

Creation of dummy tables present in SAP.