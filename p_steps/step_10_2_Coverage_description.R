##############################################################################
##########################   Coverage description   ##########################
##############################################################################

# library
if (!require("rmarkdown")) install.packages("rmarkdown")
library(rmarkdown )

# output file path
PathOutputFolder=paste0(thisdir,"/g_describeHTML")

# creating output file folder 
suppressWarnings(if (!file.exists(PathOutputFolder)) dir.create(file.path( PathOutputFolder)))

#loading the flowchart

for (subpop in subpopulations_non_empty ) {
  
  COVERAGE_BIRTHCOHORTS<- fread(paste0(dirdashboard,"COVERAGE_BIRTHCOHORTS",suffix[[subpop]],".csv"))
  
  #rendering the file
  render(paste0(dirmacro,"COVERAGE_BIRTHCOHORTS_description.Rmd"),           
         output_dir=PathOutputFolder,
         output_file=paste0("HTML_COVERAGE_BIRTHCOHORTS_description",suffix[[subpop]]), 
         params=list(Dataset=COVERAGE_BIRTHCOHORTS))
}
