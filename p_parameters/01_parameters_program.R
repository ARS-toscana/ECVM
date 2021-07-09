# #set directory with input data

# setwd("..")
# setwd("..")
# dirbase<-getwd()
# dirinput <- paste0(dirbase,"/CDMInstances/ECVM2104/")

dirinput <- paste0(thisdir,"/i_input/")

# set other directories
diroutput <- paste0(thisdir,"/g_output/")
dirinput <- paste0(thisdir,"/i_input/")
dirtemp <- paste0(thisdir,"/g_intermediate/")
direxp <- paste0(thisdir,"/g_export/")
dirdashboard <- paste0(direxp,"dashboard tables/")
dirD4tables <- paste0(direxp,"D4 tables/")
dummytables <- paste0(direxp,"Dummy tables for report/")
dirmacro <- paste0(thisdir,"/p_macro/")
dirfigure <- paste0(thisdir,"/g_figure/")
extension <- c(".csv")
dirpargen <- paste0(thisdir,"/g_parameters/")
dirsmallcountsremoved <- paste0(thisdir,"/g_export_SMALL_COUNTS_REMOVED/")
PathOutputFolder=paste0(thisdir,"/g_describeHTML")

# load packages
if (!require("haven")) install.packages("haven")
library(haven)
if (!require("tidyverse")) install.packages("tidyverse")
library(dplyr)
if (!require("lubridate")) install.packages("lubridate")
library(lubridate)
if (!require("data.table")) install.packages("data.table")
library(data.table)
if (!require("AdhereR")) install.packages("AdhereR")
library(AdhereR)
if (!require("stringr")) install.packages("stringr")
library(stringr)
if (!require("purrr")) install.packages("purrr")
library(purrr)
if (!require("readr")) install.packages("readr")
library(readr)
if (!require("dplyr")) install.packages("dplyr")
library(dplyr)
if (!require("survival")) install.packages("survival")
library(survival)
if (!require("rmarkdown")) install.packages("rmarkdown")
library(rmarkdown)
if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)


# load macros

source(paste0(dirmacro,"CreateConceptSetDatasets_v18.R"))
#source(paste0(dirmacro,"RetrieveRecordsFromEAVDatasets.R"))
source(paste0(dirmacro,"CreateItemsetDatasets.R"))
source(paste0(dirmacro,"CreateItemsetDatasets_v02.R"))
source(paste0(dirmacro,"MergeFilterAndCollapse_v5.R"))
source(paste0(dirmacro,"CreateSpells_v14.R"))
source(paste0(dirmacro,"CreateFlowChart.R"))
source(paste0(dirmacro,"CountPersonTimeV12.4.R"))
source(paste0(dirmacro,"ApplyComponentStrategy_v13_2.R"))
source(paste0(dirmacro,"CreateFigureComponentStrategy_v4.R"))
source(paste0(dirmacro,"DRECountThresholdV3.R"))

#other parameters

date_format <- "%Y%m%d"

#---------------------------------------
# understand which datasource the script is querying

CDM_SOURCE<- fread(paste0(dirinput,"CDM_SOURCE.csv"))
thisdatasource <- as.character(CDM_SOURCE[1,3])

study_start <- as.Date(as.character(20200101), date_format)

study_end <- as.Date(as.character(CDM_SOURCE[1,"recommended_end_date"]), date_format)

start_COVID_vaccination_date <- fifelse(thisdatasource == 'CPRD',as.Date(as.character(20201206), date_format),as.Date(as.character(20201227), date_format))
 
###################################################################
# CREATE FOLDERS
###################################################################

suppressWarnings(if (!file.exists(diroutput)) dir.create(file.path( diroutput)))
suppressWarnings(if (!file.exists(dirtemp)) dir.create(file.path( dirtemp)))
suppressWarnings(if (!file.exists(direxp)) dir.create(file.path( direxp)))
suppressWarnings(if (!file.exists(dirdashboard)) dir.create(file.path(dirdashboard)))
suppressWarnings(if (!file.exists(dirD4tables)) dir.create(file.path(dirD4tables)))
suppressWarnings(if (!file.exists(dummytables)) dir.create(file.path(dummytables)))
suppressWarnings(if (!file.exists(dirfigure)) dir.create(file.path( dirfigure)))
suppressWarnings(if (!file.exists(dirpargen)) dir.create(file.path( dirpargen)))
suppressWarnings(if (!file.exists(dirsmallcountsremoved)) dir.create(file.path(dirsmallcountsremoved)))
suppressWarnings(if (!file.exists(dirsmallcountsremoved)) dir.create(file.path(dirsmallcountsremoved)))

###################################################################
# CREATE EMPTY FILES
###################################################################

files<-sub('\\.csv$', '', list.files(dirinput))

if (!any(str_detect(files,"^SURVEY_ID"))) {
  print("Creating empty SURVEY_ID since none were found")
  fwrite(data.table(person_id = character(0), survey_id = character(0), survey_date = character(0),
                    survey_meaning = character(0)),
         paste0(dirinput, "SURVEY_ID", ".csv"))
}

if (!any(str_detect(files,"^SURVEY_OBSERVATIONS"))) {
  print("Creating empty SURVEY_OBSERVATIONS since none were found")
  fwrite(data.table(person_id = character(0), so_date = character(0), so_source_table = character(0),
                    so_source_column = character(0), so_source_value = character(0), so_unit = character(0),
                    survey_id = character(0)),
         paste0(dirinput, "SURVEY_OBSERVATIONS", ".csv"))
}

#############################################
#SAVE METADATA TO direxp
#############################################

file.copy(paste0(dirinput,'/METADATA.csv'), direxp, overwrite = T)
file.copy(paste0(dirinput,'/CDM_SOURCE.csv'), direxp, overwrite = T)
file.copy(paste0(dirinput,'/INSTANCE.csv'), direxp, overwrite = T)
file.copy(paste0(dirinput,'/METADATA.csv'), dirsmallcountsremoved, overwrite = T)
file.copy(paste0(dirinput,'/CDM_SOURCE.csv'), dirsmallcountsremoved, overwrite = T)
file.copy(paste0(dirinput,'/INSTANCE.csv'), dirsmallcountsremoved, overwrite = T)

#############################################
#SAVE to_run.R TO direxp
#############################################

file.copy(paste0(thisdir,'/to_run.R'), direxp, overwrite = T)
file.copy(paste0(thisdir,'/to_run.R'), dirsmallcountsremoved, overwrite = T)

#study_years_datasource


study_years <- c("2020","2021")


firstYearComponentAnalysis = "2019"
secondYearComponentAnalysis = "2020"

days<-ifelse(thisdatasource %in% c("ARS","TEST"),21,1)

Birthcohorts =c("<1940", "1940-1949", "1950-1959", "1960-1969",
                "1970-1979", "1980-1989", "1990+")

#############################################
#FUNCTION TO COMPUTE AGE
#############################################
Agebands =c(-1, 19, 29, 39, 49, 59, 69, 80, Inf)

age_fast = function(from, to) {
  from_lt = as.POSIXlt(from)
  to_lt = as.POSIXlt(to)
  
  age = to_lt$year - from_lt$year
  
  ifelse(to_lt$mon < from_lt$mon |
           (to_lt$mon == from_lt$mon & to_lt$mday < from_lt$mday),
         age - 1, age)
}

`%not in%` = Negate(`%in%`)

find_last_monday <- function(tmp_date, monday_week) {
  
  tmp_date <- as.Date(lubridate::ymd(tmp_date))
  
  while (tmp_date %not in% monday_week) {
    tmp_date <- tmp_date - 1
  }
  return(tmp_date)
}

correct_difftime <- function(t1, t2, t_period = "years") {
  return(difftime(t1, t2, units = "days") + 1)
}

calc_precise_week <- function(time_diff) {
  weeks_frac <- time_length(time_diff, "week")
  fifelse(weeks_frac%%1==0, weeks_frac, floor(weeks_frac) + 1)
}

join_and_replace <- function(df1, df2, join_cond, old_name) {
  temp <- merge(df1, df2, by.x = join_cond[1], by.y = join_cond[2])
  temp[, join_cond[1] := NULL]
  setnames(temp, old_name, join_cond[1])
}


import_concepts <- function(dirtemp, concept_set) {
  concepts<-data.table()
  for (concept in concept_set) {
    load(paste0(dirtemp, concept,".RData"))
    if (exists("concepts")) {
      concepts <- rbind(concepts, get(concept))
    } else {
      concepts <- get(concept)
    }
  }
  return(concepts)
}


exactPoiCI <- function (df, X, PT, conf.level = 0.95) {
  alpha <- 1 - conf.level
  IR <- df[, get(X)]
  upper <- df[, 0.5 * qchisq((1-(alpha/2)), 2*(get(X)+1))]
  lower <- df[, 0.5 * qchisq(alpha/2, 2*get(X))]
  temp_list <- lapply(list(IR, lower, upper), `/`, df[, get(PT)/365.25])
  temp_list <- lapply(temp_list, `*`, 100000)
  return(lapply(temp_list, round, 2))
}
