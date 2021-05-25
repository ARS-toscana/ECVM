##############################################################################
##########################    Doses description     ##########################
##############################################################################

# library
if (!require("rmarkdown")) install.packages("rmarkdown")
library(rmarkdown )

# output file path
PathOutputFolder=paste0(thisdir,"/g_describeHTML")

# creating output file folder 
suppressWarnings(if (!file.exists(PathOutputFolder)) dir.create(file.path( PathOutputFolder)))

#loading the flowchart

DOSES_BIRTHCOHORTS<- fread(paste0(direxp,"DOSES_BIRTHCOHORTS.csv"))

#rendering the file
render(paste0(dirmacro,"DOSES_BIRTHCOHORTS_description.Rmd"),           
       output_dir=PathOutputFolder,
       output_file="HTML_DOSES_BIRTHCOHORTS_description", 
       params=list(Dataset=DOSES_BIRTHCOHORTS))