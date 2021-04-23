
load(paste0(dirtemp,"persons_doses.RData"))

#add quality checks davide

all_mondays <- seq.Date(as.Date("19000101","%Y%m%d"), Sys.Date(), by = "week")

monday_week <- seq.Date(from = find_last_monday(study_start, all_mondays), to = find_last_monday(study_end, all_mondays),
                        by = "week")
double_weeks <- data.table(weeks_to_join = monday_week, monday_week = monday_week)
all_days_df <- data.table(all_days = seq.Date(from = find_last_monday(study_start, monday_week), to = study_end, by = "days"))
all_days_df <- merge(all_days_df, double_weeks, by.x = "all_days", by.y = "weeks_to_join", all.x = T)
all_days_df <- all_days_df[, monday_week := nafill(monday_week, type="locf")]
all_days_df <- all_days_df[all_days >= study_start,]

##add the corresponding moday to each date
temp<-merge(persons_doses,all_days_df, by.x=c("date"), by.y = "all_days")
temp<-temp[monday_week>=as.Date("20201228","%Y%m%d"),]
temp2<-unique(temp[,doses_week:=.N ,by="monday_week"][,.(monday_week,doses_week)])

selected_population <- CreateFlowChart(
  dataset = temp,
  listcriteria = c("qc_1_date" ,"qc_1_dose","qc_dupl","qc_2_date" ,"qc_2_dose", "qc_manufacturer",
                  "qc_mult_date_for_dose", "qc_mult_dose_for_date", "qc_3_date","sex_or_birth_date_missing",
                  "birth_date_absurd", "no_observation_period", "death_before_study_entry",
                  "no_observation_period_including_study_start","insufficient_run_in", "death_before_vax",
                  "exit_spell_before_vax", "study_end_before_vax"),
  strata = "monday_week",
  flowchartname = "Flowchart_doses")

fwrite(Flowchart_doses,file=paste0(direxp,"Flowchart_doses.csv"))


## FlowChart description
PathOutputFolder=paste0(thisdir,"/g_describeHTML")

if (!require("rmarkdown")) install.packages("rmarkdown")
library(rmarkdown )

render(paste0(dirmacro,"FlowChart_Description.Rmd"),           
       output_dir=PathOutputFolder,
       output_file="FlowChart", 
       params=list(FlowChart = Flowchart_doses)) 

rm(persons_doses, all_mondays, monday_week, double_weeks, all_days_df, temp, temp2, selected_population, Flowchart_doses)