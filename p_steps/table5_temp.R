
load(file = paste0(dirtemp, "D3_study_population.RData"))
load(paste0(diroutput, "D3_study_population_cov_ALL.RData"))
load(paste0(diroutput, "D4_population_c.RData"))



D4_descriptive_dataset_age_studystart_c <- D4_population_c[, .(person_id, age_at_1_jan_2021, agebands_at_1_jan_2021,cohort_entry_date_MIS_c,fup_days)]
setnames(D4_descriptive_dataset_age_studystart_c, c("agebands_at_1_jan_2021", "age_at_1_jan_2021"), c("ageband_at_study_entry", "age_at_study_entry"))

D4_descriptive_dataset_covid_studystart_c <- D4_descriptive_dataset_age_studystart_c[, .(person_id, cohort_entry_date_MIS_c)]
D4_descriptive_dataset_covid_studystart_c[,covid_month:=(as.character(substr(cohort_entry_date_MIS_c, 1, 7)))][,cohort_entry_date_MIS_c:=NULL]
D4_descriptive_dataset_covid_studystart_c <- unique(D4_descriptive_dataset_covid_studystart_c[, N := .N, by = "covid_month"][, person_id := NULL])
D4_descriptive_dataset_covid_studystart_c <- D4_descriptive_dataset_covid_studystart_c[, Datasource := thisdatasource]
recode_age_vect_c <- c("2020-01" = "01-2020", "2020-02" = "02-2020", "2020-03" = "03-2020", "2020-04" = "04-2020","2020-05" = "05-2020","2020-06" = "06-2020","2020-07" = "07-2020","2020-08" = "08-2020","2020-09" = "09-2020","2020-10" = "10-2020","2020-11" = "11-2020","2020-12" = "12-2020","2021-01" = "01-2021", "2021-02" = "02-2021", "2021-03" = "03-2021", "2021-04" = "04-2021","2021-05" = "05-2021","2021-06" = "06-2021","2021-07" = "07-2021","2021-08" = "08-2021","2021-09" = "09-2021")
D4_descriptive_dataset_covid_studystart_c[, covid_month := recode_age_vect_c[covid_month]]
 D4_descriptive_dataset_covid_studystart_c <- data.table::dcast(D4_descriptive_dataset_covid_studystart_c, Datasource ~ covid_month, value.var = "N")
# 
 fwrite(D4_descriptive_dataset_covid_studystart_c, file = paste0(dirD4tables, "D4_descriptive_dataset_covid_studystart_c_MIS.csv"))

D4_descriptive_dataset_age_studystart_c <- D4_descriptive_dataset_age_studystart_c[,c("Age_P25", "Age_P50", "Age_p75") :=
                                                                                 as.list(round(quantile(age_at_study_entry, probs = c(0.25, 0.50, 0.75)), 0))]
D4_descriptive_dataset_age_studystart_c <- D4_descriptive_dataset_age_studystart_c[, c("Age_mean", "Age_min", "Age_max") :=
                                                                                 list(round(mean(age_at_study_entry), 0), min(age_at_study_entry), max(age_at_study_entry))]

D4_descriptive_dataset_age_studystart_c <- D4_descriptive_dataset_age_studystart_c[, Followup := round(sum(fup_days) / 365.25)][, Datasource := thisdatasource]
D4_descriptive_dataset_age_studystart_c <- unique(D4_descriptive_dataset_age_studystart_c[, .(Datasource, Followup, Age_P25, Age_P50, Age_p75, Age_mean, Age_min, Age_max)])

fwrite(D4_descriptive_dataset_age_studystart_c, file = paste0(dirD4tables, "D4_descriptive_dataset_age_studystart_c_MIS.csv"))

D4_descriptive_dataset_ageband_studystart_c <- D3_study_population_c[, .(person_id, ageband_at_study_entry)]
setnames(D4_descriptive_dataset_ageband_studystart_c, "ageband_at_study_entry", "age_at_study_entry")

recode_age_vect <- c("0-11" = "AgeCat_011", "12-17" = "AgeCat_1217", "18-19" = "AgeCat_1819", "20-29" = "AgeCat_2029",
                     "30-39" = "AgeCat_3039", "40-49" = "AgeCat_4049", "50-59" = "AgeCat_5059", "60-69" = "AgeCat_6069",
                     "70-79" = "AgeCat_7079", "80+" = "AgeCat_80+")
D4_descriptive_dataset_ageband_studystart_c[, age_at_study_entry := recode_age_vect[age_at_study_entry]]

D4_descriptive_dataset_ageband_studystart_c <- unique(D4_descriptive_dataset_ageband_studystart_c[, N := .N, by = "age_at_study_entry"][, person_id := NULL])
D4_descriptive_dataset_ageband_studystart_c <- D4_descriptive_dataset_ageband_studystart_c[, Datasource := thisdatasource]
D4_descriptive_dataset_ageband_studystart_c <- data.table::dcast(D4_descriptive_dataset_ageband_studystart_c, Datasource ~ age_at_study_entry, value.var = "N")

fwrite(D4_descriptive_dataset_ageband_studystart_c, file = paste0(dirD4tables, "D4_descriptive_dataset_ageband_studystart_c_MIS.csv"))



setnames(D3_study_population_cov_ALL,
         c("CV_either_DX_or_DP", "COVCANCER_either_DX_or_DP", "COVCOPD_either_DX_or_DP", "COVHIV_either_DX_or_DP",
           "COVCKD_either_DX_or_DP", "COVDIAB_either_DX_or_DP", "COVOBES_either_DX_or_DP", "COVSICKLE_either_DX_or_DP",
           "IMMUNOSUPPR_at_study_entry"),
         c("CV", "Cancer", "CLD", "HIV", "CKD", "Diabetes", "Obesity", "Sicklecell", "immunosuppressants"))

cols_chosen <- c("CV", "Cancer", "CLD", "HIV", "CKD", "Diabetes", "Obesity", "Sicklecell", "immunosuppressants")
D3_study_population_cov_ALL_c<-merge(D4_population_c,D3_study_population_cov_ALL,all.x=T,by="person_id")
D4_descriptive_dataset_covariate_studystart_c <- D3_study_population_cov_ALL_c[, lapply(.SD, sum, na.rm=TRUE), .SDcols = cols_chosen]
D4_descriptive_dataset_covariate_studystart_c <- D4_descriptive_dataset_covariate_studystart_c[, Datasource := thisdatasource]
D4_descriptive_dataset_covariate_studystart_c <- D4_descriptive_dataset_covariate_studystart_c[, .(Datasource, CV, Cancer, CLD, HIV, CKD, Diabetes, Obesity, Sicklecell, immunosuppressants)]

fwrite(D4_descriptive_dataset_covariate_studystart_c, file = paste0(dirD4tables, "D4_descriptive_dataset_covariate_studystart_c_MIS.csv"))

D4_followup_fromstudystart_MIS_c <- D4_population_c[, sum(fup_days)]
D4_followup_fromstudystart_MIS_c <- data.table(total = D4_followup_fromstudystart_MIS_c)
fwrite(D4_followup_fromstudystart_MIS_c, file = paste0(dirD4tables, "D4_followup_fromstudystart_MIS_c.csv"))



# table5 ------------------------------------------------------------------


ageband_studystart_c <- fread(paste0(dirD4tables, "D4_descriptive_dataset_ageband_studystart_c_MIS.csv"))

ageband_studystart_c[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                     BIFAP = "ES_BIFAP")[Datasource]]

'%!in%' <- function(x,y)!('%in%'(x,y))

if ("AgeCat_011" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_011:=0]
if ("AgeCat_1217" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_1217:=0]
if ("AgeCat_1819" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_1819:=0]
if ("AgeCat_2029" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_2029:=0]
if ("AgeCat_3039" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_3039:=0]
if ("AgeCat_4049" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_4049:=0]
if ("AgeCat_5059" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_5059:=0]
if ("AgeCat_6069" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_6069:=0]
if ("AgeCat_7079" %!in% colnames(ageband_studystart_c)) ageband_studystart_c[,AgeCat_7079:=0]

ageband_studystart_c[, TOTAL := sum(AgeCat_011, AgeCat_1217, AgeCat_1819, AgeCat_2029, AgeCat_3039, AgeCat_4049,
                                  AgeCat_5059, AgeCat_6069, AgeCat_7079, get("AgeCat_80+")), by = Datasource]

total_pop_c <- ageband_studystart_c[, a := "Study population"][, Parameters := "N"][, .(a, Parameters, Datasource, TOTAL)]
total_pop_c <- dcast(total_pop_c, a + Parameters ~ Datasource, value.var = 'TOTAL')
col_to_keep <- intersect(c("a", "Parameters", "Italy_ARS", "NL_PHARMO",
                           "UK_CPRD", "ES_BIFAP", "Test"), names(total_pop_c))
total_pop_c <- total_pop_c[, ..col_to_keep]


age_studystart_c <- fread(paste0(dirD4tables, "D4_descriptive_dataset_age_studystart_c_MIS.csv"))

age_studystart_c[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                 BIFAP = "ES_BIFAP")[Datasource]]

pt_total_c <- age_studystart_c[, a := "Person years of follow-up"][, Parameters := "PY"][, .(a, Parameters, Datasource, Followup)]
pt_total_c <- dcast(pt_total_c, a + Parameters ~ Datasource, value.var = 'Followup')
pt_total_c <- pt_total_c[, ..col_to_keep]

age_start_c <- copy(age_studystart_c)[, a := "Age in years"][, Followup := NULL]
age_start_c <- melt(age_start_c, id.vars = c("a", "Datasource"),
                  measure.vars = c("Age_min", "Age_P25", "Age_P50", "Age_mean", "Age_p75", "Age_max"),
                  variable.name = "Parameters")
age_start_c <- dcast(age_start_c, a + Parameters  ~ Datasource, value.var = 'value')
age_start_c[, Parameters := c(Age_min = "Min", Age_P25 = "P25", Age_P50 = "P50", Age_mean = "Mean", Age_p75 = "P75",
                            Age_max = "Max")[Parameters]]
age_start_c <- age_start_c[, ..col_to_keep]


ageband_start_c <- ageband_studystart_c[, a := "Age in categories"][, TOTAL := NULL]
ageband_start_c <- melt(ageband_start_c, id.vars = c("a", "Datasource"),
                      measure.vars = c("AgeCat_011", "AgeCat_1217", "AgeCat_1819", "AgeCat_2029", "AgeCat_3039",
                                       "AgeCat_4049", "AgeCat_5059", "AgeCat_6069", "AgeCat_7079", "AgeCat_80+"),
                      variable.name = "Parameters")
ageband_start_c <- dcast(ageband_start_c, a + Parameters  ~ Datasource, value.var = 'value')
ageband_start_c[, Parameters := c(AgeCat_011 = "0-11", AgeCat_1217 = "12-17", AgeCat_0119 = "18-19", AgeCat_2029 = "20-29",
                                AgeCat_3039 = "30-39", AgeCat_4049 = "40-49", AgeCat_5059 = "50-59", AgeCat_6069 = "60-69",
                                AgeCat_7079 = "70-79", "Agecat_80+" = ">=80")[Parameters]]



D4_descriptive_dataset_covid_studystart_c_MIS <- fread(paste0(dirD4tables, "D4_descriptive_dataset_covid_studystart_c_MIS.csv"))
D4_descriptive_dataset_covid_studystart_c_MIS[, Datasource := c(TEST = "Test", ARS = "Italy_ARS",
                                 PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                 BIFAP = "ES_BIFAP")[Datasource]]


covid_month <- D4_descriptive_dataset_covid_studystart_c_MIS[, a := "Month of first diagnosis"]
x<-colnames(covid_month)
cols_covid<-x[grepl("-", x)]

covid_month <- melt(covid_month, id.vars = c("a", "Datasource"),
                  measure.vars = cols_covid,
                  variable.name = "Parameters")
covid_month <- dcast(covid_month, a + Parameters  ~ Datasource, value.var = 'value')
#covid_month[, Parameters := c(Sex_male = "Male", Sex_female = "Female")[Parameters]]


risk_factors_studystart_c <- fread(paste0(dirD4tables, "D4_descriptive_dataset_covariate_studystart_c_MIS.csv"))
risk_factors_studystart_c[, Datasource := c(TEST = "Test", ARS = "Italy_ARS", PHARMO = "NL_PHARMO", CPRD = "UK_CPRD",
                                          BIFAP = "ES_BIFAP")[Datasource]]
risk_factors_start_c <- risk_factors_studystart_c[, a := "At risk population at January 1-2020"]
risk_factors_start_c <- melt(risk_factors_start_c, id.vars = c("a", "Datasource"),
                           measure.vars = c("CV", "Cancer", "CLD", "HIV", "CKD", "Diabetes",
                                            "Obesity", "Sicklecell", "immunosuppressants"),
                           variable.name = "Parameters")
risk_factors_start_c <- dcast(risk_factors_start_c, a + Parameters  ~ Datasource, value.var = 'value')
risk_factors_start_c[, Parameters := c(CV = "Cardiovascular disease", Cancer = "Cancer", CLD = "Chronic lung disease",
                                     HIV = "HIV", CKD = "Chronic kidney disease", Diabetes = "Diabetes",
                                     Obesity = "Severe obesity", Sicklecell = "Sickle cell disease",
                                     immunosuppressants = "Use of immunosuppressants")[Parameters]]

table5 <- rbind(total_pop_c, pt_total_c,covid_month, age_start_c, ageband_start_c,  risk_factors_start_c)
daps <- intersect(c("Italy_ARS", "NL_PHARMO", "UK_CPRD", "ES_BIFAP", "Test"), names(table5))
daps_perc <- paste("perc", daps, sep="_")
col_order <- c(rbind(daps, daps_perc))
table5 <- table5[, (daps_perc) := character(nrow(table5))]
total_pop_c <- total_pop_c[, ..daps]
pt_total_c <- pt_total_c[, ..daps]
table5 <- table5[a %in% c("Age in categories", "Month of first diagnosis", "At risk population at January 1-2020"),
                 (daps_perc) := round(.SD / as.numeric(total_pop_c) * 100, 3), .SDcols = daps]

table5 <- table5[a == "Person years across age categories",
                 (daps_perc) := round(.SD / as.numeric(pt_total_c) * 100, 3), .SDcols = daps]

table5 <- table5[a %in% c("Age in categories", "Person years across sex", "At risk population at January 1-2020", 
                          "Person years across age categories"), (daps_perc) := lapply(.SD, paste0, "%"), .SDcols = daps_perc]

empty_df <- table5[0,]
empty_df <- rbindlist(list(empty_df, list("", "", "N", "%")))

table5 <- rbindlist(list(empty_df, table5))

setcolorder(table5, c("a", "Parameters", col_order))

setnames(table5, "a", " ")

fwrite(table5, file = paste0(dummytables_MIS, "Cohort characteristics at first occurrence of COVID-19 prior to vaccination (cohort c).csv"))


