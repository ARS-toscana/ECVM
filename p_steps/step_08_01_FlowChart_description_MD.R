##############################################################################
##########################  FlowChart description   ##########################
##############################################################################

# library
if (!require("rmarkdown")) install.packages("rmarkdown")
library(rmarkdown )

# output file path
PathOutputFolder=paste0(thisdir,"/g_describeMD")

#loading the flowchart
Flowchart_doses<- fread(paste0(direxp,"Flowchart_doses.csv"))

#converting rmd the file to md
setwd(paste0(PathOutputFolder, "/FlowChart/"))
knitr::knit(input = paste0(dirmacro,"FlowChart_Description_MD.Rmd"),           
            output = paste0(PathOutputFolder,"/FlowChart/Flowchart_doses_description_MD.md"),
            envir = globalenv()) 
setwd(thisdir)
