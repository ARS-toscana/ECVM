#-------------------------------
# ECVM script

rm(list=ls(all.names=TRUE))

#set the directory where the file is saved as the working directory
if (!require("rstudioapi")) install.packages("rstudioapi")
thisdir<-setwd(dirname(rstudioapi::getSourceEditorContext()$path))
thisdir<-setwd(dirname(rstudioapi::getSourceEditorContext()$path))

if (!require("rmarkdown")) install.packages("rmarkdown")
library(rmarkdown )


render(paste0(thisdir,"/DOSES_BIRTHCOHORTS_description_MD.md"),           
       output_dir=thisdir,
       output_format = "html_document",
       output_file="/HTML_DOSES_BIRTHCOHORTS_description") 

