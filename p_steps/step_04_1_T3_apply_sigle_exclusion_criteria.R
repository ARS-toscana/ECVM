#---------------------------------------------------------------
# QUALITY CHECKS

#carica concetto pulito

load(paste0(dirtemp,"D3_selection_criteria_doses.RData"))

find_last_monday <- function(tmp_date, monday_week) {
  tmp_date <- as.Date(lubridate::ymd(tmp_date))
  Sys_option <- c("LC_COLLATE", "LC_CTYPE", "LC_MONETARY", "LC_NUMERIC", "LC_TIME")
  str_option <- lapply(strsplit(Sys.getlocale(), ";"), strsplit, "=")[[1]]
  Sys.setlocale("LC_ALL","English_United States.1252")
  while (weekdays(tmp_date) != "Monday") {
    tmp_date <- tmp_date - 1
  }
  for (i in seq(length(Sys_option))) {
    Sys.setlocale(Sys_option[i], str_option[[i]][[2]])
  }
  return(tmp_date)
}

all_mondays <- seq.Date(as.Date("20200106","%Y%m%d"), Sys.Date(), by = "week")

monday_week <- seq.Date(from = find_last_monday(study_start, all_mondays), to = find_last_monday(study_end, all_mondays),
                        by = "week")
double_weeks <- data.table(weeks_to_join = monday_week, monday_week = monday_week)
all_days_df <- data.table(all_days = seq.Date(from = find_last_monday(study_start, monday_week), to = study_end, by = "days"))
all_days_df <- merge(all_days_df, double_weeks, by.x = "all_days", by.y = "weeks_to_join", all.x = T)
all_days_df <- all_days_df[, monday_week := nafill(monday_week, type="locf")]
all_days_df <- all_days_df[all_days >= study_start,]


temp3<-merge(concepts,all_days_df, by.x=c("date"), by.y = "all_days")
assign("table_no_exclution_criteria",unique(temp3[,doses_week:=.N ,by="monday_week"][,.(monday_week,doses_week)]))
fwrite(get("table_no_exclution_criteria"),file=paste0(direxp,"table_noexclution_criteria.csv"))
       
coords<-c("sex_or_birth_date_missing", "birth_date_absurd", "no_observation_period", "insufficient_run_in","no_observation_period_including_study_start", "death_before_study_entry")

for (i in coords) {
  assign(paste0("dataset_",i),D3_selection_criteria_doses[get(i)==0,])
  temp<-merge(concepts,get(paste0("dataset_",i)),all.x=T,by="person_id")
  temp1<-merge(temp,all_days_df, by.x=c("date"), by.y = "all_days")
  assign(paste0("table_",i),unique(temp1[,doses_week:=.N ,by="monday_week"][,.(monday_week,doses_week)]))
  fwrite(get(paste0("table_",i)),file=paste0(direxp,paste0("table_",i,".csv")))
  
}


