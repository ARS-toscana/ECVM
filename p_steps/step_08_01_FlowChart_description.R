##############################################################################
##########################  FlowChart description   ##########################
##############################################################################

# library
if (!require("rmarkdown")) install.packages("rmarkdown")
library(rmarkdown )

# output file path
PathOutputFolder=paste0(thisdir,"/g_describeHTML")

# creating output file folder 
suppressWarnings(if (!file.exists(PathOutputFolder)) dir.create(file.path( PathOutputFolder)))

#loading the flowchart

Flowchart_doses<- fread(paste0(direxp,"Flowchart_doses.csv"))

#rendering the file
render(paste0(dirmacro,"FlowChart_Description.Rmd"),           
       output_dir=PathOutputFolder,
       output_file="HTML_Flowchart_doses_description", 
       params=list(FlowChart = Flowchart_doses)) 
