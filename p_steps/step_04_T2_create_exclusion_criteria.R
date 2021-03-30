# -----------------------------------------------------
# CREATE EXCLUSION CRITERIA

# input: PERSONS, D3_output_spells_category, D3_output_spells_overlap
# output: D3_selection_criteria.RData

print('CREATE EXCLUSION CRITERIA')

PERSONS <- data.table()
files<-sub('\\.csv$', '', list.files(dirinput))
for (i in 1:length(files)) {
  if (str_detect(files[i],"^PERSONS")) {  
    temp <- fread(paste0(dirinput,files[i],".csv"))
    PERSONS <- rbind(PERSONS, temp,fill=T)
    rm(temp)
  }
}

OBSERVATION_PERIODS <- data.table()
files<-sub('\\.csv$', '', list.files(dirinput))
for (i in 1:length(files)) {
  if (str_detect(files[i],"^OBSERVATION_PERIODS")) {  
    temp <- fread(paste0(dirinput,files[i],".csv"))
    OBSERVATION_PERIODS <- rbind(OBSERVATION_PERIODS, temp,fill=T)
    rm(temp)
  }
}

#STANDARDIZE THE DATE FORMAT WITH  LUBRIDATE
PERSONS<-PERSONS[,date_of_birth:=lubridate::ymd(with(PERSONS, paste(year_of_birth, month_of_birth, day_of_birth,sep="-")))]
PERSONS<-suppressWarnings(PERSONS[,date_of_death:=lubridate::ymd(with(PERSONS, paste(year_of_death, month_of_death, day_of_death,sep="-")))])

#CONVERT SEX to BINARY 0/1
PERSONS<-PERSONS[,sex:=as.numeric(ifelse(sex_at_instance_creation=="M",1,0))] #1:M 0:F
#[,age_at_index_date:=age_fast(date_of_birth,index_date)][age_at_index_date<12 | age_at_index_date>55,age:=1]

PERSONS<-PERSONS[is.na(sex) | is.na(date_of_birth),sex_or_birth_date_missing:=1]
PERSONS<-PERSONS[year(date_of_birth)<1899 | year(date_of_birth)>2021, birth_date_absurd:=1]

# no observation period
PERSONS_in_OP<-unique(merge(PERSONS, OBSERVATION_PERIODS, all.x = T, by="person_id")[is.na(op_start_date),no_observation_periods:=1][is.na(no_observation_periods),no_observation_periods:=0][,MAXop_start_date:=max(no_observation_periods), by="person_id"][MAXop_start_date==no_observation_periods,],by="person_id")
D3_exclusion_no_observation_periods<-PERSONS_in_OP[,.(person_id,sex_or_birth_date_missing,birth_date_absurd,no_observation_periods)]

## KEEP ONLY NEEDED VARs
D3_inclusion_from_PERSONS <- PERSONS[,.(person_id,sex,date_of_birth,date_of_death)]

# if (this_datasource_has_subpopulations == TRUE)D3_selection_criteria <- vector(mode="list")

# OBSERVATION PERIODS -----------------------------------------------------

load(paste0(dirtemp,"output_spells_category.RData"))

output_spells_category_enriched <- merge(output_spells_category,D3_inclusion_from_PERSONS, by="person_id")
output_spells_category_enriched <- output_spells_category_enriched[entry_spell_category>date_of_birth,one_year_obs:=entry_spell_category+1*365][entry_spell_category<=date_of_birth,one_year_obs:=date_of_birth]

## CALCULATE study_entry_date
output_spells_category_enriched <- output_spells_category_enriched[,study_entry_date:=max(date_of_birth,study_start,one_year_obs),by="person_id"]

output_spells_category_enriched <- output_spells_category_enriched[date_of_birth>study_start & date_of_birth==entry_spell_category, study_entry_date:=date_of_birth]
  
## KEEP ONLY SPELLS THAT INCLUDE study_entry_date AND WHOSE entry_spell_category IS < exit_spell_category
# TODO mistake here
output_spells_category_enriched <- output_spells_category_enriched[study_entry_date %between% list(entry_spell_category,exit_spell_category ) & entry_spell_category< exit_spell_category ,spell_contains_study_entry_date:=1, by="person_id"][is.na(spell_contains_study_entry_date),spell_contains_study_entry_date:=0]
  
D3_exclusion_observation_periods_not_overlapping<-output_spells_category_enriched[,spell_contains_study_entry_dateMAX:=max(spell_contains_study_entry_date), by="person_id"][,observation_periods_not_overlapping:=1-spell_contains_study_entry_dateMAX] #[,.(person_id,observation_periods_not_overlapping)])
  
D3_exclusion_observation_periods_not_overlapping <- D3_exclusion_observation_periods_not_overlapping[one_year_obs>study_end | one_year_obs> exit_spell_category,insufficient_run_in:=1]
D3_exclusion_observation_periods_not_overlapping[is.na(insufficient_run_in),insufficient_run_in:=0]
  
  
D3_exclusion_observation_periods_not_overlapping <-merge(PERSONS[,.(person_id)],D3_exclusion_observation_periods_not_overlapping,by="person_id", all.x = T)[is.na(observation_periods_not_overlapping), observation_periods_not_overlapping := 1]
  
D3_exclusion_observation_periods_not_overlapping <-D3_exclusion_observation_periods_not_overlapping[is.na(insufficient_run_in),insufficient_run_in:=1]
  
  # there is some people whose death has not been recorded in the exit_spell, let's remove them
# TODO ask Claudia???
  # D3_exclusion_observation_periods_not_overlapping <-D3_exclusion_observation_periods_not_overlapping[is.na(date_of_death),min_death_exit_spell:=min(date_of_death,exit_spell_category)]

D3_exclusion_observation_periods_not_overlapping <-D3_exclusion_observation_periods_not_overlapping[!is.na(date_of_death) & date_of_death < study_entry_date, death_before_study_entry:=1]
# TODO ask Rosa if want binary variable for quality check
D3_exclusion_observation_periods_not_overlapping <-D3_exclusion_observation_periods_not_overlapping[!is.na(date_of_death) & date_of_death < exit_spell_category, exit_spell_category:=date_of_death]
  
D3_exclusion_observation_periods_not_overlapping <-D3_exclusion_observation_periods_not_overlapping[is.na(death_before_study_entry),death_before_study_entry:=0]
  
D3_exclusion_observation_periods_not_overlapping <-D3_exclusion_observation_periods_not_overlapping[,.(person_id,observation_periods_not_overlapping, insufficient_run_in, death_before_study_entry, study_entry_date)]
  
  
## KEEP ONLY NEEDES VARs
D3_inclusion_from_OBSERVATION_PERIODS <- output_spells_category_enriched[spell_contains_study_entry_date==1,.(person_id,exit_spell_category)]

D3_inclusion_from_OBSERVATION_PERIODS <-merge(PERSONS[,.(person_id)],D3_inclusion_from_OBSERVATION_PERIODS,by="person_id", all.x = T)

PERSONS_OP <- merge(D3_inclusion_from_PERSONS,
                    D3_exclusion_no_observation_periods,
                    by="person_id",
                    all.x = T)
PERSONS_OP2 <- merge(PERSONS_OP,
                     D3_inclusion_from_OBSERVATION_PERIODS,
                     by="person_id",
                     all.x = T)
PERSONS_OP3 <- merge(PERSONS_OP2,
                     D3_exclusion_observation_periods_not_overlapping,
                     by="person_id",
                     all.x = T)
  
coords<-c("sex_or_birth_date_missing", "birth_date_absurd", "no_observation_periods", "insufficient_run_in","observation_periods_not_overlapping", "death_before_study_entry")
PERSONS_OP3[, (coords) := replace(.SD, is.na(.SD), 0), .SDcols = coords]
  
# CREATE study_exit_date
selcriteria <- PERSONS_OP3[,study_exit_date:=min(date_of_death, exit_spell_category, study_end, na.rm = T), by="person_id"]
D3_selection_criteria_doses <- selcriteria
  # if (this_datasource_has_subpopulations == FALSE){ 
  #   D3_selection_criteria <- selcriteria
  # }else{
  #   D3_selection_criteria[[subpop]] <- selcriteria
  # }
  # 

save(D3_selection_criteria_doses,file=paste0(dirtemp,"D3_selection_criteria_doses.RData"))

rm(output_spells_category_enriched,D3_inclusion_from_OBSERVATION_PERIODS,D3_inclusion_from_PERSONS,D3_exclusion_observation_periods_not_overlapping,selcriteria)
rm(PERSONS_OP, PERSONS_OP2, PERSONS_OP3)
rm(PERSONS, PERSONS_in_OP, output_spells_category,OBSERVATION_PERIODS, D3_selection_criteria_doses, D3_exclusion_no_observation_periods)






