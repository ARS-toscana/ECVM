#---------------------------------------------------------------
# QUALITY CHECKS

#carica concetto pulito

load(paste0(dirtemp,"D3_selection_criteria_doses.RData"))

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
       
temporary<-D3_selection_criteria_doses[sex_or_birth_date_missing==0,]
temp<-merge(temporary,concepts,all.x=T,by="person_id")
temp1<-merge(temp,all_days_df, by.x=c("date"), by.y = "all_days")
table_1<-unique(temp1[,doses_week:=.N ,by="monday_week"][,.(monday_week,doses_week)])
fwrite(table_1,file=paste0(direxp,paste0("table_1.csv")))

temporary<-temp1[birth_date_absurd==0,]
table_2<-unique(temporary[,doses_week:=.N ,by="monday_week"][,.(monday_week,doses_week)])
fwrite(table_2,file=paste0(direxp,paste0("table_2.csv")))

temporary<-temporary[no_observation_period==0,]
table_3<-unique(temporary[,doses_week:=.N ,by="monday_week"][,.(monday_week,doses_week)])
fwrite(table_3,file=paste0(direxp,paste0("table_3.csv")))

temporary<-temporary[death_before_study_entry==0,]
table_4<-unique(temporary[,doses_week:=.N ,by="monday_week"][,.(monday_week,doses_week)])
fwrite(table_4,file=paste0(direxp,paste0("table_4.csv")))

temporary<-temporary[no_observation_period_including_study_start==0,]
table_5<-unique(temporary[,doses_week:=.N ,by="monday_week"][,.(monday_week,doses_week)])
fwrite(table_5,file=paste0(direxp,paste0("table_5.csv")))

temporary<-temporary[insufficient_run_in==0,]
table_6<-unique(temporary[,doses_week:=.N ,by="monday_week"][,.(monday_week,doses_week)])
fwrite(table_6,file=paste0(direxp,paste0("table_6.csv")))

rm(table_1,table_2,table_3,table4,table_5,table_6,temporary,temp1,temp3)