rm(list=ls(all.names=TRUE))

#set the directory where the file is saved as the working directory
if (!require("rstudioapi")) install.packages("rstudioapi")
thisdir<-setwd(dirname(rstudioapi::getSourceEditorContext()$path))
thisdir<-setwd(dirname(rstudioapi::getSourceEditorContext()$path))


source(paste0(thisdir,"/step_98_parameters_pp.R"))


# step 0: included data from submissions of DAPs
list_of_submitted_folders <- vector(mode="list")

list_of_submitted_folders[["AEMPS"]]<-c("Z:/inbox/transfer-2021-05-31-04-40-pm/export/")
list_of_submitted_folders[["ARS"]]<-c("Z:/inbox/transfer-2021-05-28-08-44-am/g_export/")
list_of_submitted_folders[["PHARMO"]]<-c("Z:/inbox/transfer-2021-05-31-10-35-am/g_export/")
#list_of_submitted_folders[["CPRD"]]<-c("Z:/inbox/transfer-2021-05-03-03-47-pm/version_2.0/g_export/")
list_of_DAP<-c("ARS","PHARMO","AEMPS") #"CPRD","AEMPS"

files_list<-list.files(list_of_submitted_folders[[list_of_DAP[1]]], recursive = T, include.dirs = T)
files_list<-files_list[stringr::str_detect(files_list,"\\.csv")]
files<-sub('\\.csv$', '', files_list)

timestamp_df <- data.table(DAP = character(), delivery_timestamp = character(), dataset = character(),
                           postprocessing_timestamp = character(), script_version = character())

#for (subfolder in c("", "dashboard tables/", "D4 tables/")){
  for (f in files){
    print (f)
    data<-data.table()
    for (dap in list_of_DAP){
      print(dap)
      if( file.exists( paste0(list_of_submitted_folders[[dap]],f,".csv")) ){
        if(stringr::str_detect(paste0(list_of_submitted_folders[[dap]],f,".csv"),"QC_code_counts_in_study_population" )){
          input<-fread(paste0(list_of_submitted_folders[[dap]],f,".csv"), colClasses = list(character="code_first_event"))
          
        } else {
          input<-fread(paste0(list_of_submitted_folders[[dap]],f,".csv") )
        }
        input<-input[,datasource:=dap]
        data<-rbind(data, input, fill=T)
        timestamp_df <- rbind(timestamp_df, data.table(dap, str_match(list_of_submitted_folders[[dap]], "(?<=-).+?(?=/)"),
                                                       str_match(f, ".+?(?=\\.)"), as.character(Sys.time()), "Version 3.3"), use.names=FALSE)
      }
    }
    #assign("f", data)
    #save(f,file=paste0(dirinput_pp, f, ".RData"), list=f)
    fwrite(data, file= paste0(dirinput_pp, f, ".csv"))
  #}
}

save(timestamp_df, file= paste0(dirinput_pp,"timestamp_df.RData"))

direxp <- dirinput_pp
dirD4tables <- paste0(direxp, "D4 tables/")

source(paste0(thisdir,"/step_11_T4_create_dummy_tables.R"))

rm(data, input)




