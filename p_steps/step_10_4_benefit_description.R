##############################################################################
##########################    benefit description   ##########################
##############################################################################

# library
if (!require("rmarkdown")) install.packages("rmarkdown")
library(rmarkdown )

# output file path
PathOutputFolder=paste0(thisdir,"/g_describeHTML")

# creating output file folder 
suppressWarnings(if (!file.exists(PathOutputFolder)) dir.create(file.path( PathOutputFolder)))

#loading the datasets
BENEFIT_BIRTHCOHORTS_CALENDARTIME <- fread(paste0(direxp, "BENEFIT_BIRTHCOHORTS_CALENDARTIME.csv"))
BENEFIT_BIRTHCOHORTS_TIMESINCEVACCINATION <- fread(paste0(direxp, "BENEFIT_BIRTHCOHORTS_TIMESINCEVACCINATION.csv"))


#rendering the file
render(paste0(dirmacro,"benefit_Description.Rmd"),           
       output_dir=PathOutputFolder,
       output_file="HTML_benefit_description", 
       params=list(BENEFIT_BIRTHCOHORTS_CALENDARTIME = BENEFIT_BIRTHCOHORTS_CALENDARTIME,
                   BENEFIT_BIRTHCOHORTS_TIMESINCEVACCINATION = BENEFIT_BIRTHCOHORTS_TIMESINCEVACCINATION)) 
