##############################################################################
##########################     risk description     ##########################
##############################################################################

# library
if (!require("rmarkdown")) install.packages("rmarkdown")
library(rmarkdown )

# output file path
PathOutputFolder=paste0(thisdir,"/g_describeHTML")

# creating output file folder 
suppressWarnings(if (!file.exists(PathOutputFolder)) dir.create(file.path( PathOutputFolder)))

#loading the datasets
RISK_BIRTHCOHORTS_CALENDARTIME <- fread(paste0(dirdashboard, "RISK_BIRTHCOHORTS_CALENDARTIME.csv"))
RISK_BIRTHCOHORTS_TIMESINCEVACCINATION <- fread( paste0(dirdashboard, "RISK_BIRTHCOHORTS_TIMESINCEVACCINATION.csv"))

#rendering the file
render(paste0(dirmacro,"risk_Description.Rmd"),           
       output_dir=PathOutputFolder,
       output_file="HTML_risk_description", 
       params=list(RISK_BIRTHCOHORTS_CALENDARTIME = RISK_BIRTHCOHORTS_CALENDARTIME,
                   RISK_BIRTHCOHORTS_TIMESINCEVACCINATION = RISK_BIRTHCOHORTS_TIMESINCEVACCINATION)) 
