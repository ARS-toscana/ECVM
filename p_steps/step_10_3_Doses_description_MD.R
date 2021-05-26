##############################################################################
##########################    Doses description     ##########################
##############################################################################

# library
if (!require("rmarkdown")) install.packages("rmarkdown")
library(rmarkdown )

# output file path
PathOutputFolder=paste0(thisdir,"/g_describeMD")

#loading the flowchart
DOSES_BIRTHCOHORTS<- fread(paste0(dirdashboard,"DOSES_BIRTHCOHORTS.csv"))

#converting rmd the file to md
setwd(paste0(PathOutputFolder, "/Doses/"))
knitr::knit(input = paste0(dirmacro,"DOSES_BIRTHCOHORTS_description_MD.Rmd"),           
            output = paste0(PathOutputFolder,"/Doses/DOSES_BIRTHCOHORTS_description_MD.md"),
            envir = globalenv()) 
setwd(thisdir)
