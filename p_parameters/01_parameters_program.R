# set directory with input data
# setwd("..")
# setwd("..")
# dirbase<-getwd()
# dirinput <- paste0(dirbase,"/CDMInstances/ACCESS/")

setwd("..")
# setwd("..")
dirbase<-getwd()
# dirproducts <- past <- paste0(dirbase,"/i_input_subpop/")

# set other directories
diroutput <- paste0(thisdir,"/g_output/")
dirtemp <- paste0(thisdir,"/g_intermediate/")
direxp <- paste0(thisdir,"/g_export/")
dirmacro <- paste0(thisdir,"/p_macro/")
dirfigure <- paste0(thisdir,"/g_figure/")
extension <- c(".csv")
dirinput <- paste0(thisdir,"/i_input/")
dirpargen <- paste0(thisdir,"/g_parameters/")
dirsmallcountsremoved <- paste0(thisdir,"/g_export_SMALL_COUNTS_REMOVED/")

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

# load macros

source(paste0(dirmacro,"CreateConceptSetDatasets_v15.R"))
source(paste0(dirmacro,"RetrieveRecordsFromEAVDatasets.R"))
source(paste0(dirmacro,"MergeFilterAndCollapse_v5.R"))
source(paste0(dirmacro,"CreateSpells_v11.R"))
source(paste0(dirmacro,"CreateFlowChart.R"))
source(paste0(dirmacro,"CountPersonTimeV10.2.R"))
source(paste0(dirmacro,"ApplyComponentStrategy_v13_2.R"))
source(paste0(dirmacro,"CreateFigureComponentStrategy_v4.R"))
source(paste0(dirmacro,"DRECountThresholdV3.R"))

#other parameters

date_format <- "%Y%m%d"

#---------------------------------------
# understand which datasource the script is querying

CDM_SOURCE<- fread(paste0(dirinput,"CDM_SOURCE.csv"))
thisdatasource <- as.character(CDM_SOURCE[1,2])

study_start <- as.Date(as.character(20200101), date_format)

study_end <- as.Date(as.character(CDM_SOURCE[1,"recommended_end_date"]), date_format)
 
# ###################################################################
# # CREATE FOLDERS
# ###################################################################
# 
# suppressWarnings(if (!file.exists(diroutput)) dir.create(file.path( diroutput)))
# suppressWarnings(if (!file.exists(dirtemp)) dir.create(file.path( dirtemp)))
# suppressWarnings(if (!file.exists(direxp)) dir.create(file.path( direxp)))
# suppressWarnings(if (!file.exists(dirfigure)) dir.create(file.path( dirfigure)))
suppressWarnings(if (!file.exists(dirpargen)) dir.create(file.path( dirpargen)))
# suppressWarnings(if (!file.exists(dirsmallcountsremoved)) dir.create(file.path(dirsmallcountsremoved)))
# 
# 
# 

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

find_last_monday <- function(tmp_date, monday_week) {
  
  tmp_date <- as.Date(lubridate::ymd(tmp_date))
  
  while (tmp_date %not in% monday_week) {
    tmp_date <- tmp_date - 1
  }
  return(tmp_date)
}


calc_precise_week <- function(time_diff) {
  floor(time_length(time_diff, "week")) + 1
}

join_and_replace <- function(df1, df2, join_cond, old_name) {
  temp <- merge(df1, df2, by.x = join_cond[1], by.y = join_cond[2])
  temp[, join_cond[1] := NULL]
  setnames(temp, old_name, join_cond[1])
}


import_concepts <- function(dirtemp, concept_set_domains) {
  concepts<-data.table()
  for (concept in names(concept_set_domains)) {
    load(paste0(dirtemp, concept,".RData"))
    if (exists("concepts")) {
      concepts <- rbind(concepts, get(concept))
    } else {
      concepts <- get(concept)
    }
  }
  return(concepts)
}
