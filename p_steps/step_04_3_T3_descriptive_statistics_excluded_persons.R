load(paste0(dirtemp,"D3_selection_criteria.RData"))

population_ins_run_in <- copy(D3_selection_criteria)[sex_or_birth_date_missing == 0 & birth_date_absurd == 0 & 
                                                       no_observation_period == 0 & death_before_study_entry == 0 & 
                                                       no_observation_period_including_study_start == 0 & insufficient_run_in == 1, ]

population_no_obs_start <- copy(D3_selection_criteria)[sex_or_birth_date_missing == 0 & birth_date_absurd == 0 &
                                                         no_observation_period == 0 & death_before_study_entry == 0 & 
                                                         no_observation_period_including_study_start == 1 & insufficient_run_in == 0, ]

population_ins_run_in <- population_ins_run_in[, .(person_id, sex, date_of_birth)]
population_ins_run_in <- population_ins_run_in[, date_of_birth := findInterval(year(date_of_birth), c(1940, 1950, 1960, 1970, 1980, 1990))]
population_ins_run_in$date_of_birth <- as.character(population_ins_run_in$date_of_birth)
population_ins_run_in <- population_ins_run_in[.(date_of_birth = c("0", "1", "2", "3", "4", "5", "6"),
                                                 to = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
                                                        "1980-1989", "1990+")),
                                               on = "date_of_birth", date_of_birth := i.to]

population_no_obs_start <- population_no_obs_start[, .(person_id, sex, date_of_birth)]
population_no_obs_start <- population_no_obs_start[, date_of_birth := findInterval(year(date_of_birth), c(1940, 1950, 1960, 1970, 1980, 1990))]
population_no_obs_start$date_of_birth <- as.character(population_no_obs_start$date_of_birth)
population_no_obs_start <- population_no_obs_start[.(date_of_birth = c("0", "1", "2", "3", "4", "5", "6"),
                                                     to = c("<1940", "1940-1949", "1950-1959", "1960-1969", "1970-1979",
                                                            "1980-1989", "1990+")),
                                                   on = "date_of_birth", date_of_birth := i.to]

population_ins_run_in_sex <- unique(copy(population_ins_run_in)[, N := .N, by = c("sex")][, c("person_id", "date_of_birth") := NULL])
population_ins_run_in_date <- unique(population_ins_run_in[, N := .N, by = c("date_of_birth")][, c("person_id", "sex") := NULL])
population_ins_run_in_sex <- population_ins_run_in_sex[ , variable := "ins_run_in"]
population_ins_run_in_date <- population_ins_run_in_date[ , variable := "ins_run_in"]
  
population_no_obs_start_sex <- unique(copy(population_no_obs_start)[, N := .N, by = c("sex")][, c("person_id", "date_of_birth") := NULL])
population_no_obs_start_date <- unique(population_no_obs_start[, N := .N, by = c("date_of_birth")][, c("person_id", "sex") := NULL])
population_no_obs_start_sex <- population_no_obs_start_sex[ , variable := "no_obs_in_start"]
population_no_obs_start_date <- population_no_obs_start_date[ , variable := "no_obs_in_start"]

population_sex <- rbind(population_ins_run_in_sex, population_no_obs_start_sex)
population_date <- rbind(population_ins_run_in_date, population_no_obs_start_date)

population_sex <- dcast(population_sex, sex ~ variable, value.var = "N")
population_date <- dcast(population_date, date_of_birth ~ variable, value.var = "N")
setnames(population_sex, "sex", "")
setnames(population_date, "date_of_birth", "")

pop_excluded <- rbind(population_sex, population_date)

for (i in names(pop_excluded)){
  pop_excluded[is.na(get(i)), (i):=0]
}

fwrite(pop_excluded, file = paste0(direxp, "pop_excluded.csv"))

rm(D3_selection_criteria, population_ins_run_in, population_no_obs_start, population_ins_run_in_sex,
   population_ins_run_in_date, population_no_obs_start_sex, population_no_obs_start_date, population_sex,
   population_date, pop_excluded)