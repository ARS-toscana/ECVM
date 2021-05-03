##############################################################################
##########################   Coverage description   ##########################
##############################################################################

# library
if (!require("rmarkdown")) install.packages("rmarkdown")
library(rmarkdown )

# output file path
PathOutputFolder=paste0(thisdir,"/g_describeMD")

#loading the flowchart
COVERAGE_BIRTHCOHORTS<- fread(paste0(direxp,"COVERAGE_BIRTHCOHORTS.csv"))

#converting rmd the file to md
setwd(paste0(PathOutputFolder, "/Coverage/"))
knitr::knit(input = paste0(dirmacro,"COVERAGE_BIRTHCOHORTS_description_MD.Rmd"),           
            output = paste0(PathOutputFolder,"/Coverage/COVERAGE_BIRTHCOHORTS_description_MD.md"),
            envir = globalenv()) 
setwd(thisdir)
