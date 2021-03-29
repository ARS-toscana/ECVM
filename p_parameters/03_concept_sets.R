
OUTCOME_events<-list()
OUTCOME_events<-c("CAD","GBS","ADEM","NARCOLEPSY","ACUASEARTHRITIS","DM","IDIOTHROM","MICROANGIO","HF","STRCARD","ARR","MYOCARD","COAGDIS","SOCV","ALI","AKI","GENCONV","MENINGOENC","ARD","ERYTH","CHILBLAIN","ANOSMIA","ANAPHYL","MISCC","COVID","TRANSMYELITIS","SUDDENDEAT")

CONTROL_events <-list()
CONTROL_events <-c("CONTRDIVERTIC","CONTRHYPERT")

OUTCOMES_conceptssets <- c("CAD_narrow","CAD_possible","GBS_narrow","GBS_possible","ADEM_narrow","ADEM_possible","NARCOLEPSY_narrow","NARCOLEPSY_possible","ACUASEARTHRITIS_narrow","ACUASEARTHRITIS_possible","DM_narrow","DM_possible","IDIOTHROM_narrow","IDIOTHROM_possible","MICROANGIO_narrow","MICROANGIO_possible","HF_narrow","HF_possible","STRCARD_narrow","STRCARD_possible","ARR_narrow","ARR_possible","MYOCARD_narrow","MYOCARD_possible","COAGDIS_narrow","COAGDIS_possible","SOCV_narrow","SOCV_possible","ALI_narrow","ALI_possible","AKI_narrow","AKI_possible","GENCONV_narrow","GENCONV_possible","MENINGOENC_narrow","MENINGOENC_possible","ARD_narrow","ARD_possible","ERYTH_narrow","ERYTH_possible","CHILBLAIN_narrow","CHILBLAIN_possible","ANOSMIA_narrow","ANOSMIA_possible","ANAPHYL_narrow","ANAPHYL_possible","MISCC_narrow","MISCC_possible","COVID_possible","COVID_narrow","TRANSMYELITIS_narrow","TRANSMYELITIS_possible","SUDDENDEAT_narrow","SUDDENDEAT_possible")

COV_conceptssets <- c("COVCANCER","COVCOPD","COVHIV","COVCKD","COVDIAB","COVOBES","COVSICKLE","CONTRDIVERTIC","CONTRHYPERT")

DRUGS_conceptssets <- c("DP_COVCANCER","DP_COVDIAB","DP_CVD","DP_COVHIV","DP_COVCKD","DP_COVCOPD","DP_COVOBES","DP_COVSICKLE","IMMUNOSUPPR","DP_CONTRHYPERT")

concept_sets_of_our_study <- c(OUTCOMES_conceptssets,COV_conceptssets, DRUGS_conceptssets)

concept_set_domains<- vector(mode="list")
concept_set_domains[["CAD_narrow"]] = "Diagnosis"
concept_set_domains[["CAD_possible"]] = "Diagnosis"
concept_set_domains[["GBS_narrow"]] = "Diagnosis"
concept_set_domains[["GBS_possible"]] = "Diagnosis"
concept_set_domains[["ADEM_narrow"]] = "Diagnosis"
concept_set_domains[["ADEM_possible"]] = "Diagnosis"
concept_set_domains[["NARCOLEPSY_narrow"]] = "Diagnosis"
concept_set_domains[["NARCOLEPSY_possible"]] = "Diagnosis"
concept_set_domains[["ACUASEARTHRITIS_narrow"]] = "Diagnosis"
concept_set_domains[["ACUASEARTHRITIS_possible"]] = "Diagnosis"
concept_set_domains[["DM_narrow"]] = "Diagnosis"
concept_set_domains[["DM_possible"]] = "Diagnosis"
concept_set_domains[["IDIOTHROM_narrow"]] = "Diagnosis"
concept_set_domains[["IDIOTHROM_possible"]] = "Diagnosis"
concept_set_domains[["MICROANGIO_narrow"]] = "Diagnosis"
concept_set_domains[["MICROANGIO_possible"]] = "Diagnosis"
concept_set_domains[["HF_narrow"]] = "Diagnosis"
concept_set_domains[["HF_possible"]] = "Diagnosis"
concept_set_domains[["STRCARD_narrow"]] = "Diagnosis"
concept_set_domains[["STRCARD_possible"]] = "Diagnosis"
concept_set_domains[["ARR_narrow"]] = "Diagnosis"
concept_set_domains[["ARR_possible"]] = "Diagnosis"
concept_set_domains[["MYOCARD_narrow"]] = "Diagnosis"
concept_set_domains[["MYOCARD_possible"]] = "Diagnosis"
concept_set_domains[["COAGDIS_narrow"]] = "Diagnosis"
concept_set_domains[["COAGDIS_possible"]] = "Diagnosis"
concept_set_domains[["SOCV_narrow"]] = "Diagnosis"
concept_set_domains[["SOCV_possible"]] = "Diagnosis"
concept_set_domains[["ALI_narrow"]] = "Diagnosis"
concept_set_domains[["ALI_possible"]] = "Diagnosis"
concept_set_domains[["AKI_narrow"]] = "Diagnosis"
concept_set_domains[["AKI_possible"]] = "Diagnosis"
concept_set_domains[["GENCONV_narrow"]] = "Diagnosis"
concept_set_domains[["GENCONV_possible"]] = "Diagnosis"
concept_set_domains[["MENINGOENC_narrow"]] = "Diagnosis"
concept_set_domains[["MENINGOENC_possible"]] = "Diagnosis"
concept_set_domains[["ARD_narrow"]] = "Diagnosis"
concept_set_domains[["ARD_possible"]] = "Diagnosis"
concept_set_domains[["ERYTH_narrow"]] = "Diagnosis"
concept_set_domains[["ERYTH_possible"]] = "Diagnosis"
concept_set_domains[["CHILBLAIN_narrow"]] = "Diagnosis"
concept_set_domains[["CHILBLAIN_possible"]] = "Diagnosis"
concept_set_domains[["ANOSMIA_narrow"]] = "Diagnosis"
concept_set_domains[["ANOSMIA_possible"]] = "Diagnosis"
concept_set_domains[["ANAPHYL_narrow"]] = "Diagnosis"
concept_set_domains[["ANAPHYL_possible"]] = "Diagnosis"
concept_set_domains[["MISCC_narrow"]] = "Diagnosis"
concept_set_domains[["MISCC_possible"]] = "Diagnosis"
concept_set_domains[["COVID_narrow"]] = "Diagnosis"
concept_set_domains[["COVID_possible"]] = "Diagnosis"
concept_set_domains[["SUDDENDEAT_narrow"]] = "Diagnosis"
concept_set_domains[["SUDDENDEAT_possible"]] = "Diagnosis"
concept_set_domains[["GESTDIAB_narrow"]] = "Diagnosis"
concept_set_domains[["GESTDIAB_possible"]] = "Diagnosis"
concept_set_domains[["PREECLAMP_narrow"]] = "Diagnosis"
concept_set_domains[["PREECLAMP_possible"]] = "Diagnosis"
concept_set_domains[["MATERNALDEATH_narrow"]] = "Diagnosis"
concept_set_domains[["MATERNALDEATH_possible"]] = "Diagnosis"
concept_set_domains[["FGR_narrow"]] = "Diagnosis"
concept_set_domains[["FGR_possible"]] = "Diagnosis"
concept_set_domains[["SPONTABO_narrow"]] = "Diagnosis"
concept_set_domains[["SPONTABO_possible"]] = "Diagnosis"
concept_set_domains[["STILLBIRTH_narrow"]] = "Diagnosis"
concept_set_domains[["STILLBIRTH_possible"]] = "Diagnosis"
concept_set_domains[["PRETERMBIRTH_narrow"]] = "Diagnosis"
concept_set_domains[["PRETERMBIRTH_possible"]] = "Diagnosis"
concept_set_domains[["MAJORCA_narrow"]] = "Diagnosis"
concept_set_domains[["MAJORCA_possible"]] = "Diagnosis"
concept_set_domains[["MICROCEPHALY_narrow"]] = "Diagnosis"
concept_set_domains[["MICROCEPHALY_possible"]] = "Diagnosis"
concept_set_domains[["NEONATALDEATH_narrow"]] = "Diagnosis"
concept_set_domains[["NEONATALDEATH_possible"]] = "Diagnosis"
concept_set_domains[["TOPFA_narrow"]] = "Diagnosis"
concept_set_domains[["TOPFA_possible"]] = "Diagnosis"
concept_set_domains[["TRANSMYELITIS_narrow"]] = "Diagnosis"
concept_set_domains[["TRANSMYELITIS_possible"]] = "Diagnosis"
concept_set_domains[["COVCANCER"]] = "Diagnosis"
concept_set_domains[["COVCOPD"]] = "Diagnosis"
concept_set_domains[["COVHIV"]] = "Diagnosis"
concept_set_domains[["COVCKD"]] = "Diagnosis"
concept_set_domains[["COVDIAB"]] = "Diagnosis"
concept_set_domains[["COVOBES"]] = "Diagnosis"
concept_set_domains[["COVSICKLE"]] = "Diagnosis"
concept_set_domains[["CONTRDIVERTIC"]] = "Diagnosis"
concept_set_domains[["CONTRHYPERT"]] = "Diagnosis"
concept_set_domains[["DEATH"]] = "Diagnosis"

concept_set_domains[["DP_COVCANCER"]] = "Medicines"
concept_set_domains[["DP_COVDIAB"]] = "Medicines"
concept_set_domains[["DP_CVD"]] = "Medicines"
concept_set_domains[["DP_COVHIV"]] = "Medicines"
concept_set_domains[["DP_COVCKD"]] = "Medicines"
concept_set_domains[["DP_COVCOPD"]] = "Medicines"
concept_set_domains[["DP_COVOBES"]] = "Medicines"
concept_set_domains[["DP_COVSICKLE"]] = "Medicines"
concept_set_domains[["IMMUNOSUPPR"]] = "Medicines"
concept_set_domains[["DP_CONTRHYPERT"]] = "Medicines"




concept_set_codes_our_study<-vector(mode="list")
concept_set_codes_our_study_excl<-vector(mode="list")


#--------------------------
# CAD
concept_set_codes_our_study[["CAD_narrow"]][["ICD9"]] <- c("410","410.0","410.6","410.60","410.70","410.9","410.90")
concept_set_codes_our_study[["CAD_possible"]][["ICD9"]] <- c("410","411","412","413","414","411.1","413","413.1","414.0","440")
concept_set_codes_our_study_excl[["CAD_possible"]][["ICD9"]] <- c("410","410.0","410.6","410.60","410.70","410.9","410.90")
concept_set_codes_our_study[["CAD_narrow"]][["ICD10"]] <- c("I21","I21.4","I21.9","I22","I24.0","I24.9","I25.1")
concept_set_codes_our_study[["CAD_possible"]][["ICD10"]] <- c("I20","I21","I22","I23","I24","I25","I20.0","I20.1","I20.8","I20.9","I25.0","I25.1","I25.10","I70","K76.1") #,"I20-I25.9"
concept_set_codes_our_study_excl[["CAD_possible"]][["ICD10"]] <- c("I21","I21.4","I21.9","I22","I24.0","I24.9","I25.1")
concept_set_codes_our_study[["CAD_narrow"]][["READ"]] <- c("G300.","G306.","G30z.","G3110","G312.","G31y2","X200E","X203v","XE0Uh","XE2uV","G3...","G30..","G300.","G306.","G30z.","G3110","G312.","G31y2")
concept_set_codes_our_study[["CAD_possible"]][["READ"]] <- c("G311z","G31y1","G33..","G331.","G33z.","G33z1","G33z2","G3z..","G70..","Ua1eH","X2007","X2009","X200B","X200C","XE0Ui","XE2uV","XM0rN","G3...","G3111","G3112","G3114","G311z","G31y0","G31y1","G33..","G331.","G332.","G33z.","G33z1","G33z2","G33z4","G340.","G3z..","G70..")
concept_set_codes_our_study_excl[["CAD_possible"]][["READ"]] <- c("G300.","G306.","G30z.","G3110","G312.","G31y2","X200E","X203v","XE0Uh","XE2uV","G3...","G30..","G300.","G306.","G30z.","G3110","G312.","G31y2")
concept_set_codes_our_study[["CAD_narrow"]][["ICPC"]] <- c("K75","K75001","K75002","K75008","K75013","K75014","K76003","K76013")
concept_set_codes_our_study[["CAD_possible"]][["ICPC"]] <- c("K74","K74001","K74002","K74003","K74004","K74006","K75010","K76005","K76014","K91003","K92024")
concept_set_codes_our_study_excl[["CAD_possible"]][["ICPC"]] <- c("K75","K75001","K75002","K75008","K75013","K75014","K76003","K76013")
concept_set_codes_our_study[["CAD_narrow"]][["SNOMED"]] <- c("D-7251","D-7256","M-54700","155304006","194796000","194802003","194811003","194815007","194821006","194841001","22298006","233824008","266288001","32598000","34644005","398274000","413439005","414024009","415070008","41702007","46109009","53741008","57054005","66514008","70211005","8957000")
concept_set_codes_our_study[["CAD_possible"]][["SNOMED"]] <- c("D-7250","D-7253","D-7255","D-7260","D-7352","D-7354","F-71500","F-71510","F-71520","F-71530","F-72200","M-52110","NOCODE","155303000","155307004","155308009","155313008","155314002","155315001","155316000","155322009","155382007","155414001","17828002","194795001","194814006","194816008","194817004","194819001","194820007","194824003","194828000","194830003","194832006","194833001","194835008","194839002","194841001","194848007","194878003","195251000","195540001","21470009","225566008","233818002","233820004","233822007","23687008","25106000","2610009","266231003","266290000","266318005","271430002","32598000","367416001","38716007","414545008","414795007","41702007","42531007","443502000","4557003","53741008","64333001","87343002")
concept_set_codes_our_study_excl[["CAD_possible"]][["SNOMED"]] <- c("D-7251","D-7256","M-54700","155304006","194796000","194802003","194811003","194815007","194821006","194841001","22298006","233824008","266288001","32598000","34644005","398274000","413439005","414024009","415070008","41702007","46109009","53741008","57054005","66514008","70211005","8957000")


#--------------------------
# GBS
concept_set_codes_our_study[["GBS_narrow"]][["READ"]] <- c("F370.","F3700","F3701","F3702","F370z")
concept_set_codes_our_study[["GBS_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["GBS_narrow"]][["ICD10"]] <- c("G61.0")
concept_set_codes_our_study[["GBS_possible"]][["ICD10"]] <- c()
concept_set_codes_our_study[["GBS_narrow"]][["READ"]] <- c("F3700","X00AV","F370.","F3700","F3701","F3702","F370z")
concept_set_codes_our_study[["GBS_possible"]][["READ"]] <- c()
concept_set_codes_our_study[["GBS_narrow"]][["ICPC"]] <- c("N94005")
concept_set_codes_our_study[["GBS_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["GBS_narrow"]][["SNOMED"]] <- c("D-0814","D-0821","155082001","1767005","193175006","230548007","267707000","40956001")
concept_set_codes_our_study[["GBS_possible"]][["SNOMED"]] <- c()


#--------------------------
# ADEM
concept_set_codes_our_study[["ADEM_narrow"]][["ICD9"]] <- c("323.61")
concept_set_codes_our_study[["ADEM_possible"]][["ICD9"]] <- c("323","349.9","323","323.81","341.9","348.3","348.30")
concept_set_codes_our_study_excl[["ADEM_possible"]][["ICD9"]] <- c("323.61")
concept_set_codes_our_study[["ADEM_possible"]][["ICD10"]] <- c("G04","G04.9","G35","G36","G37","G36","G36.8","G36.9","G37.9","G93.4","G93.40","G96.9") #"G35-G37.9
concept_set_codes_our_study[["ADEM_narrow"]][["ICD10"]] <- c("G04.00","G04.01","G04.02")
concept_set_codes_our_study_excl[["ADEM_possible"]][["ICD10"]] <- c("G04.00","G04.01","G04.02")
concept_set_codes_our_study[["ADEM_narrow"]][["READ"]] <- c()
concept_set_codes_our_study[["ADEM_possible"]][["READ"]] <- c("F283.","Fyu4.","Fyu40","Fyu42","FyuAH","X001X","X005b","XE15B","XE15D","XE189","XM1RF","Xa3f9","XaEI5","F03..","F03y.","F03z.","F2...","F283.","Fyu4.","Fyu40","Fyu42","FyuAH")
concept_set_codes_our_study[["ADEM_narrow"]][["ICPC"]] <- c()
concept_set_codes_our_study[["ADEM_possible"]][["ICPC"]] <- c("N71006","N99042")
concept_set_codes_our_study[["ADEM_narrow"]][["SNOMED"]] <- c()
concept_set_codes_our_study[["ADEM_possible"]][["SNOMED"]] <- c("D-8002","D-8850","M-40000","138748005","154981003","154991009","155049004","155053002","155059003","192641002","192682002","192735003","192736002","192934005","193051008","193076009","194485009","194486005","194488006","194566008","230196000","23853001","267144009","267576008","267578009","267679005","267682000","267684004","267700003","267702006","275539005","286936006","45170000","6118003","62950007","76011009","81308009")


#--------------------------
# NARCOLEPSY
concept_set_codes_our_study[["NARCOLEPSY_narrow"]][["ICD9"]] <- c("347.00","347","347.0","347.00","347.01","347.1","347.10","347.11")
concept_set_codes_our_study[["NARCOLEPSY_possible"]][["ICD9"]] <- c("89.17","89.18","780.5","780.50","89.17")
concept_set_codes_our_study_excl[["NARCOLEPSY_possible"]][["ICD9"]] <- c("347.00","347","347.0","347.00","347.01","347.1","347.10","347.11")
concept_set_codes_our_study[["NARCOLEPSY_narrow"]][["ICD10"]] <- c("G47.4","G47.41","G47.411","G47.419","G47.421","G47.429")
concept_set_codes_our_study[["NARCOLEPSY_possible"]][["ICD10"]] <- c("G47","G47.9")
concept_set_codes_our_study_excl[["NARCOLEPSY_possible"]][["ICD10"]] <- c("G47.4","G47.41","G47.411","G47.419","G47.421","G47.429")
concept_set_codes_our_study[["NARCOLEPSY_narrow"]][["READ"]] <- c("F27..","F270.","F27z.","F27..","F270.","F271.","F27z.")
concept_set_codes_our_study[["NARCOLEPSY_possible"]][["READ"]] <- c("3148.","F271.","R005.","R0050","R005z","X007q","X77f5","X77iD","XM06i","3148.","7P1B0","Fy0..","R005.","R0050","R005z")
concept_set_codes_our_study_excl[["NARCOLEPSY_possible"]][["READ"]] <- c("F27..","F270.","F27z.","F27..","F270.","F271.","F27z.")
concept_set_codes_our_study[["NARCOLEPSY_narrow"]][["ICPC"]] <- c("N99013")
concept_set_codes_our_study[["NARCOLEPSY_possible"]][["ICPC"]] <- c("P06010","P06011","P06012")
concept_set_codes_our_study_excl[["NARCOLEPSY_possible"]][["ICPC"]] <- c("N99013")
concept_set_codes_our_study[["NARCOLEPSY_narrow"]][["SNOMED"]] <- c("F-85770","F-85940","155059003","193042000","193043005","267702006","46263000","60380001","91521000119104")
concept_set_codes_our_study[["NARCOLEPSY_possible"]][["SNOMED"]] <- c("F-85830","P-8014","154927001","158149000","158150000","164773008","194436004","206746001","206747005","206757006","252731002","252732009","268775007","270961006","39898005","53888004","60554003")
concept_set_codes_our_study_excl[["NARCOLEPSY_possible"]][["SNOMED"]] <- c("F-85770","F-85940","155059003","193042000","193043005","267702006","46263000","60380001","91521000119104")



#--------------------------
# ACUASEARTHRITIS
concept_set_codes_our_study[["ACUASEARTHRITIS_narrow"]][["ICD9"]] <- c()
concept_set_codes_our_study[["ACUASEARTHRITIS_possible"]][["ICD9"]] <- c("274","274.0","274.00","274.01","274.9","711.5","711.50","712","712.1","712.9","712.90","716.4","716.9")
concept_set_codes_our_study[["ACUASEARTHRITIS_narrow"]][["ICD10"]] <- c()
concept_set_codes_our_study[["ACUASEARTHRITIS_possible"]][["ICD10"]] <- c("M10","M10.0","M10.00","M10.9","M11.9","M13.9","M19.90")
concept_set_codes_our_study[["ACUASEARTHRITIS_narrow"]][["READ"]] <- c()
concept_set_codes_our_study[["ACUASEARTHRITIS_possible"]][["READ"]] <- c("6693.","C340.","C34z.","N015.","N0150","N015z","N020.","N020z","N023.","N0230","N023z","N02z.","N02z0","X40PQ","X40UW","X701O","X701e","XE1DS","XM0Ai","44K2.","6693.","C34..","C340.","C342.","C34z.","N015.","N0150","N015z","N02..","N020.","N020z","N023.","N0230","N023z","N02z.","N02z0","N06z.")
concept_set_codes_our_study[["ACUASEARTHRITIS_narrow"]][["ICPC"]] <- c()
concept_set_codes_our_study[["ACUASEARTHRITIS_possible"]][["ICPC"]] <- c("T92","L20009","L70010","L88003","L91009","T92001","T99048")
concept_set_codes_our_study[["ACUASEARTHRITIS_narrow"]][["SNOMED"]] <- c()
concept_set_codes_our_study[["ACUASEARTHRITIS_possible"]][["SNOMED"]] <- c("D-1201","D-3060","D-3170","M-40000","111213004","147966005","154745008","154746009","156511001","170733007","18834007","190827003","190828008","190833007","190844004","201521003","201522005","201532003","201624004","201625003","201636005","201661008","201662001","201672003","201687008","201688003","201721000","202059001","239780003","24595009","36009009","363178003","372091005","3723001","48440001","770924008","90560007")


#--------------------------
# DM
concept_set_codes_our_study[["DM_narrow"]][["ICD9"]] <- c()
concept_set_codes_our_study[["DM_possible"]][["ICD9"]] <- c("250","250.0","250.1","250.5","250.6","250.7","250.9")
concept_set_codes_our_study[["DM_narrow"]][["ICD10"]] <- c("E10","E10.6","E10.69")
concept_set_codes_our_study[["DM_possible"]][["ICD10"]] <- c("E08","E09","E10","E12","E13","E11","E11.6","E11.69","E13.6","E13.69","E14")
concept_set_codes_our_study_excl[["DM_possible"]][["ICD10"]] <- c("E10","E10.6","E10.69")
concept_set_codes_our_study[["DM_narrow"]][["READ"]] <- c("X40J4","C108.","C10E.")
concept_set_codes_our_study[["DM_possible"]][["READ"]] <- c("C10..","C100.","C100z","C101.","C101z","C105.","C105z","C107z","C10y0","C10y1","C10yy","C10z.","C10zz","Cyu20","G73y0","X00Ag","X40J5","XE10I","C10..","C100.","C100z","C101.","C101z","C105.","C105z","C106.","C107.","C107z","C10F.","C10y0","C10y1","C10yy","C10z.","C10zz","Cyu20","F372.","G73y0")
concept_set_codes_our_study_excl[["DM_possible"]][["READ"]] <- c("X40J4","C108.","C10E.")
concept_set_codes_our_study[["DM_narrow"]][["ICPC"]] <- c("T89001","T89002","T89003","T90004","T90006","T90008")
concept_set_codes_our_study[["DM_possible"]][["ICPC"]] <- c("T90","N94012","T89004","T90002","T90003","T90005","T90007","T90009")
concept_set_codes_our_study_excl[["DM_possible"]][["ICPC"]] <- c("T89001","T89002","T89003","T90004","T90006","T90008")
concept_set_codes_our_study[["DM_narrow"]][["SNOMED"]] <- c("D-2387","D-241X","154673001","190322003","190362004","267469001","46635009")
concept_set_codes_our_study[["DM_possible"]][["SNOMED"]] <- c("D-2381","D-2386","D-2394","D-241Y","D-8X52","111552007","127014009","154671004","154672006","154674007","154678005","154683002","190321005","190323008","190324002","190328004","190343002","190348006","190349003","190353001","190354007","190361006","190384004","190418009","190419001","190420007","190422004","190426001","191044006","191045007","193182005","230572002","24927004","25093002","267383000","267467004","267468009","267471001","267472008","267473003","372069003","420422005","44054006","73211009","74627003","866003","982001")
concept_set_codes_our_study_excl[["DM_possible"]][["SNOMED"]] <- c("D-2387","D-241X","154673001","190322003","190362004","267469001","46635009")

#--------------------------
# IDIOTHROM
concept_set_codes_our_study[["IDIOTHROM_narrow"]][["ICD9"]] <- c("279.12","287.31","287.32","287.39","287.4","446.6")
concept_set_codes_our_study_excl[["IDIOTHROM_possible"]][["ICD9"]] <- c("279.12","287.31","287.32","287.39","287.4","446.6")
concept_set_codes_our_study[["IDIOTHROM_possible"]][["ICD9"]] <- c("287.5")
concept_set_codes_our_study[["IDIOTHROM_narrow"]][["ICD10"]] <- c("D69.3","D69.4","D69.41","D69.49","D69.5","D82.0","M31.1")
concept_set_codes_our_study[["IDIOTHROM_possible"]][["ICD10"]] <- c("D69.6")
concept_set_codes_our_study_excl[["IDIOTHROM_possible"]][["ICD10"]] <- c("D69.3","D69.4","D69.41","D69.49","D69.5","D82.0","M31.1")
concept_set_codes_our_study[["IDIOTHROM_narrow"]][["READ"]] <- c("C3912","D3133","D314.","Dyu32","G756.","G756z","X20F8","X20FJ","X20FK","XE146","XE149","Xa3Em","Xa9Ay","C3912","D313.","D3130","D3133","D313z","D314.","D314z","Dyu32","G756.","G756z")
concept_set_codes_our_study[["IDIOTHROM_possible"]][["READ"]] <- c("D315.","XE24o","Xa8Hh","42P2.","D315.")
concept_set_codes_our_study_excl[["IDIOTHROM_possible"]][["READ"]] <- c("C3912","D3133","D314.","Dyu32","G756.","G756z","X20F8","X20FJ","X20FK","XE146","XE149","Xa3Em","Xa9Ay","C3912","D313.","D3130","D3133","D313z","D314.","D314z","Dyu32","G756.","G756z")
concept_set_codes_our_study[["IDIOTHROM_narrow"]][["ICPC"]] <- c("B83006")
concept_set_codes_our_study[["IDIOTHROM_possible"]][["ICPC"]] <- c("B83012")
concept_set_codes_our_study_excl[["IDIOTHROM_possible"]][["ICPC"]] <- c("B83006")
concept_set_codes_our_study[["IDIOTHROM_narrow"]][["SNOMED"]] <- c("D-4275","D-4544","D-4545","D-4548","D-4612","126729006","13172003","154822006","154825008","154826009","155443009","191315003","191316002","191318001","191320003","191325008","191435001","195358008","195359000","195360005","234481002","234490009","267537007","267564008","267567001","28505005","302873008","32273002","360402008","36070007","74576004","75331009","78129009")
concept_set_codes_our_study[["IDIOTHROM_possible"]][["SNOMED"]] <- c("D-4525","M-59100","142969008","154827000","165556002","191326009","302215000","415116008","48788004","70786006")
concept_set_codes_our_study_excl[["IDIOTHROM_possible"]][["SNOMED"]] <- c("D-4275","D-4544","D-4545","D-4548","D-4612","126729006","13172003","154822006","154825008","154826009","155443009","191315003","191316002","191318001","191320003","191325008","191435001","195358008","195359000","195360005","234481002","234490009","267537007","267564008","267567001","28505005","302873008","32273002","360402008","36070007","74576004","75331009","78129009")


#--------------------------
# MICROANGIO
concept_set_codes_our_study[["MICROANGIO_narrow"]][["ICD9"]] <- c("446.6")
concept_set_codes_our_study[["MICROANGIO_possible"]][["ICD9"]] <- c("448")
concept_set_codes_our_study_excl[["MICROANGIO_possible"]][["ICD9"]] <- c("446.6")
concept_set_codes_our_study[["MICROANGIO_narrow"]][["ICD10"]] <- c("M31.1")
concept_set_codes_our_study[["MICROANGIO_possible"]][["ICD10"]] <- c("I78","I78.9")
concept_set_codes_our_study_excl[["MICROANGIO_possible"]][["ICD10"]] <- c("M31.1")
concept_set_codes_our_study[["MICROANGIO_narrow"]][["READ"]] <- c("G756.","G756z","G77z1","G77z2","X200c","G37..","G756.","G756z","G77z1","G77z2")
concept_set_codes_our_study[["MICROANGIO_possible"]][["READ"]] <- c("G39..00","G77..","G77z0","G77zz","XM0Al","XaBYF","G76..","G77..","G77z0","G77zz")
concept_set_codes_our_study_excl[["MICROANGIO_possible"]][["READ"]] <- c("G756.","G756z","G77z1","G77z2","X200c","G37..","G756.","G756z","G77z1","G77z2")
concept_set_codes_our_study[["MICROANGIO_narrow"]][["ICPC"]] <- c("A99004","T99085")
concept_set_codes_our_study[["MICROANGIO_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["MICROANGIO_narrow"]][["SNOMED"]] <- c("126729006","17810004","19472003","194869009","195360005","195387009","195388004","233845001","459701000124101","78129009")
concept_set_codes_our_study[["MICROANGIO_possible"]][["SNOMED"]] <- c("D-7303","D-7304","155413007","155446001","155449008","195250004","195380006","195386000","195390003","23081008","266317000","266324004","271948001","337419004","359557001","359560008","367395004","39823006","43696002","57223003","58729003","77735004")
concept_set_codes_our_study_excl[["MICROANGIO_possible"]][["SNOMED"]] <- c("126729006","17810004","19472003","194869009","195360005","195387009","195388004","233845001","459701000124101","78129009")

#--------------------------
# HF
concept_set_codes_our_study[["HF_narrow"]][["ICD9"]] <- c("398.91","404.01","404.03","428.0","428.1","428.9","669.4","997.1","398.91","402.91","404.01","404.03","404.11","404.12","404.13","404.91","404.92","404.93","423.3","428","428.0","428.1","428.2","428.20","428.21","428.23","428.3","428.30","428.31","428.33","428.4","428.40","428.9")
concept_set_codes_our_study[["HF_possible"]][["ICD9"]] <- c("428.1","429.3","514","518.4","518.52","799.1","402","415.0","514","518.4")
concept_set_codes_our_study_excl[["HF_possible"]][["ICD9"]] <- c("398.91","404.01","404.03","428.0","428.1","428.9","669.4","997.1","398.91","402.91","404.01","404.03","404.11","404.12","404.13","404.91","404.92","404.93","423.3","428","428.0","428.1","428.2","428.20","428.21","428.23","428.3","428.30","428.31","428.33","428.4","428.40","428.9")
concept_set_codes_our_study[["HF_narrow"]][["ICD10"]] <- c("I09.81","I11.0","I13.0","I31.4","I50","I50.0","I50.1","I50.2","I50.20","I50.23","I50.3","I50.30","I50.33","I50.4","I50.40","I50.81","I50.810","I50.82","I50.9","P29.0")
concept_set_codes_our_study[["HF_possible"]][["ICD10"]] <- c("I26.09","I50.1","I51.7","J80","J81","J81.0","J81.1","R09.2")
concept_set_codes_our_study_excl[["HF_possible"]][["ICD10"]] <- c("I09.81","I11.0","I13.0","I31.4","I50","I50.0","I50.1","I50.2","I50.20","I50.23","I50.3","I50.30","I50.33","I50.4","I50.40","I50.81","I50.810","I50.82","I50.9","P29.0")
concept_set_codes_our_study[["HF_narrow"]][["READ"]] <- c("G21z1","G232.","G58..","G5800","G5802","G5803","G5810","G5y4.","Q48y1","X2024","X202k","X202l","X202p","X776M","XE0V8","XE0V9","XE1p9","XE2QG","Xa07h","33BA.","33BB.","G21z1","G232.","G53z.","G58..","G580.","G5800","G5802","G5803","G581.","G5810","G584.","G58z.","G5y4.","Q48y1","Q490.","SP111")
concept_set_codes_our_study[["HF_possible"]][["READ"]] <- c("G400.","G5y30","G5y31","H54..","H541.","H541z","H54z.","H584.","H584z","R0234","R2y10","X102X","X102Y","X202m","XE0VB","XE0Ye","XM07M","Xa6YO","G400.","G575.","G5y30","G5y31","G5y34","H54..","H541.","H541z","H54z.","H584.","H584z","H5853","R0234","R2y10")
concept_set_codes_our_study_excl[["HF_possible"]][["READ"]] <- c("G21z1","G232.","G58..","G5800","G5802","G5803","G5810","G5y4.","Q48y1","X2024","X202k","X202l","X202p","X776M","XE0V8","XE0V9","XE1p9","XE2QG","Xa07h","33BA.","33BB.","G21z1","G232.","G53z.","G58..","G580.","G5800","G5802","G5803","G581.","G5810","G584.","G58z.","G5y4.","Q48y1","Q490.","SP111")
concept_set_codes_our_study[["HF_narrow"]][["ICPC"]] <- c("K77","K29006","K29019","K77002","K77004","K77007","K77008","K77011","K77014","K77025","K77028")
concept_set_codes_our_study[["HF_possible"]][["ICPC"]] <- c("K07013","K29024","K77001","K77005","K77013","K84042","R29001")
concept_set_codes_our_study_excl[["HF_possible"]][["ICPC"]] <- c("K77","K29006","K29019","K77002","K77004","K77007","K77008","K77011","K77014","K77025","K77028")
concept_set_codes_our_study[["HF_narrow"]][["SNOMED"]] <- c("D-7044","D-7050","D-7051","D-7052","F-70330","10633002","128404006","155341007","155374007","155375008","155376009","155377000","194771003","194779001","194975004","195108009","195109001","195111005","195112003","195113008","195114002","195117009","195130005","206586007","206594000","213214001","233924009","233925005","233928007","250908004","266248006","266295005","266308000","269299003","276514007","35304003","367363000","389385008","390116000","417996009","418304008","42343007","443253003","443254009","443343001","443344007","46113002","5148006","55565007","82523003","84114007","85232009","89819002","92506005")
concept_set_codes_our_study[["HF_possible"]][["SNOMED"]] <- c("D-7502","D-7705","D-7709","D-7721","F-75070","M-36500","M-36530","123262009","155325006","155383002","155627006","158246003","158732004","19242006","194881008","195113008","195123004","195124005","195127003","196115007","196118009","196119001","196120007","196148007","196149004","196150004","196154008","206281003","206893004","207553000","266249003","266310003","266408001","266411000","271809000","30298009","397912004","40541001","410431009","424372002","49584005","6210001","67599009","67782005","71892000","82014009","82608003")
concept_set_codes_our_study_excl[["HF_possible"]][["SNOMED"]] <- c("D-7044","D-7050","D-7051","D-7052","F-70330","10633002","128404006","155341007","155374007","155375008","155376009","155377000","194771003","194779001","194975004","195108009","195109001","195111005","195112003","195113008","195114002","195117009","195130005","206586007","206594000","213214001","233924009","233925005","233928007","250908004","266248006","266295005","266308000","269299003","276514007","35304003","367363000","389385008","390116000","417996009","418304008","42343007","443253003","443254009","443343001","443344007","46113002","5148006","55565007","82523003","84114007","85232009","89819002","92506005")


#--------------------------
# STRCARD
concept_set_codes_our_study[["STRCARD_narrow"]][["ICD9"]] <- c("429.83")
concept_set_codes_our_study[["STRCARD_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["STRCARD_narrow"]][["ICD10"]] <- c("I51.81")
concept_set_codes_our_study[["STRCARD_possible"]][["ICD10"]] <- c()
concept_set_codes_our_study[["STRCARD_narrow"]][["READ"]] <- c()
concept_set_codes_our_study[["STRCARD_possible"]][["READ"]] <- c()
concept_set_codes_our_study[["STRCARD_narrow"]][["ICPC"]] <- c()
concept_set_codes_our_study[["STRCARD_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["STRCARD_narrow"]][["SNOMED"]] <- c("441541008")
concept_set_codes_our_study[["STRCARD_possible"]][["SNOMED"]] <- c()

#--------------------------
# ARR
concept_set_codes_our_study[["ARR_narrow"]][["ICD9"]] <- c("426","426.1","426.2","426.3","426.4","426.5","426.50","426.53","426.7","426.9","427","427.0","427.2","427.3","427.31","427.32","427.4","427.41","427.42","427.61","427.69","427.8","427.81","427.89","427.9","785.0")
concept_set_codes_our_study[["ARR_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["ARR_narrow"]][["ICD10"]] <- c("I44","I44.3","I45.0","I45.1","I45.2","I45.3","I45.4","I45.5","I45.6","I45.9","I47","I47.0","I47.1","I47.2","I47.9","I48","I48.0","I48.1","I48.19","I48.2","I48.20","I48.3","I48.4","I48.9","I48.91","I48.92","I49.0","I49.01","I49.02","I49.1","I49.3","I49.5","I49.8","I49.9","R00.0","R00.1")
concept_set_codes_our_study[["ARR_possible"]][["ICD10"]] <- c()
concept_set_codes_our_study[["ARR_narrow"]][["READ"]] <- c("3282.","G5650","G5653","G567.","G5674","G567z","G56z.","G56zz","G57..","G570.","G570z","G572.","G5720","G5721","G572z","G573.","G5730","G5731","G573z","G574.","G5740","G5741","G574z","G5761","G5762","G57y3","G57y4","G57y7","G57y9","G57yA","G57z.","Gyu5U","Gyu5W","Gyu5X","Gyu5a","R050.","Ryu06","X2025","X202K","X202d","X779u","X77AP","X77BB","X77BC","X77BJ","X77BL","X77BY","X77Bo","X77Bv","XE0V2","XM02G","Xa0k6","Xa2E8","Xa2jV","2422.","2426.","3282.","G56..","G5650","G5653","G567.","G5674","G567z","G56z.","G56zz","G57..","G570.","G570z","G571.","G572.","G5720","G5721","G572z","G573.","G5730","G5731","G5732","G573z","G574.","G5740","G5741","G574z","G5761","G5762","G5763","G5765","G577.","G57y3","G57y4","G57y7","G57y9","G57yA","G57z.","Gyu5U","Gyu5W","Gyu5X","Gyu5a","R050.","Ryu06")
concept_set_codes_our_study[["ARR_possible"]][["READ"]] <- c()
concept_set_codes_our_study[["ARR_narrow"]][["ICPC"]] <- c("K78","K79","K80","K04003","K04004","K04005","K04014","K78001","K78003","K78004","K79001","K79002","K79005","K80007","K80008","K80010","K80011","K80012","K80013","K80014","K80015","K84001","K84002","K84003","K84006","K84011","K84013","K84015","K84019","K84020","K84023")
concept_set_codes_our_study[["ARR_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["ARR_narrow"]][["SNOMED"]] <- c("F-73102","F-73140","F-73150","F-73160","F-73210","F-73240","F-73300","F-73340","F-73360","F-73380","F-73410","F-73450","F-73560","F-73570","F-73580","F-73710","F-73850","F-73870","F-73880","F-73890","F-73900","F-73912","F-74000","F-74090","NOCODE","11092001","111288001","12026006","142055005","155354000","155360000","155362008","155363003","155364009","155366006","155367002","155369004","155370003","155371004","155373001","15964901000119107","164895002","17338001","17869006","195038000","195048003","195050006","195057009","195061003","195066008","195068009","195074009","195075005","195076006","195077002","195078007","195079004","195080001","195081002","195082009","195083004","195084005","195093006","195094000","195096003","195098002","195100002","195104006","195105007","195107004","195581009","195583007","195584001","195587008","207003004","207041006","207585002","23265007","251115003","251122006","251151005","251169001","251175005","25569003","266302004","266304003","266305002","266306001","266307005","282825002","284470004","287057009","3424008","36083008","367107008","406461004","426749004","440059007","44808001","48867003","49436004","53488008","5370000","60299007","60423000","6285003","63593006","6374002","6456007","6624005","67198005","698247007","71792006","71908006","720448006","72654001","73712003","74390002","81216002","86651002")
concept_set_codes_our_study[["ARR_possible"]][["SNOMED"]] <- c()


#--------------------------
# MYOCARD
concept_set_codes_our_study[["MYOCARD_narrow"]][["ICD9"]] <- c("420.99","422.0","422.9","422.99","423.9","429.0")
concept_set_codes_our_study[["MYOCARD_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["MYOCARD_narrow"]][["ICD10"]] <- c("I51.4")
concept_set_codes_our_study[["MYOCARD_possible"]][["ICD10"]] <- c("I31.9")
concept_set_codes_our_study_excl[["MYOCARD_possible"]][["ICD10"]] <- c("I51.4")
concept_set_codes_our_study[["MYOCARD_narrow"]][["READ"]] <- c("G520.","G520z","G52y.","G52yz","G5y0.","Gyu50","Gyu52","Gyu53","Gyu54","Gyu5F","Gyu5H","Gyu5J","Gyu5K","Gyu5L","X201i","X201j","X779D","XaDyL","G520.","G520z","G52y.","G52yz","G53..","G5y0.","Gyu50","Gyu52","Gyu53","Gyu54","Gyu5F","Gyu5H","Gyu5J","Gyu5K","Gyu5L")
concept_set_codes_our_study[["MYOCARD_possible"]][["READ"]] <- c()
concept_set_codes_our_study[["MYOCARD_narrow"]][["ICPC"]] <- c("K84010")
concept_set_codes_our_study[["MYOCARD_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["MYOCARD_narrow"]][["SNOMED"]] <- c("D-7480","M-40000","NOCODE","155341007","155380004","194942007","194951004","194952006","194960007","195119007","195552008","195554009","195555005","195556006","195568002","195570006","195571005","195572003","195573008","251060004","266295005","3238004","50920009","55855009")
concept_set_codes_our_study[["MYOCARD_possible"]][["SNOMED"]] <- c()


#--------------------------
# COAGDIS
concept_set_codes_our_study[["COAGDIS_narrow"]][["ICD9"]] <- c("286.9","287.9","415.1","453.3","453.9","776.0","286","287","287.9","434","434.0","434.9","444","453","453.0","453.3","453.9","776.0")
concept_set_codes_our_study[["COAGDIS_possible"]][["ICD9"]] <- c("252.8","285.1","431","432.0","432.9","451.19","596.89","786.30","285.1","430","431","432.0","432.9","451.19","451.2","451.8","451.89","459.0","531.6","532.4","532.6","534.6","772.9")
concept_set_codes_our_study_excl[["COAGDIS_possible"]][["ICD9"]] <- c("286.9","287.9","415.1","453.3","453.9","776.0","286","287","287.9","434","434.0","434.9","444","453","453.0","453.3","453.9","776.0")
concept_set_codes_our_study[["COAGDIS_narrow"]][["ICD10"]] <- c("D65","D66","D67","D68","D69","D68.9","D69","D69.9","I26.0","I26.9","I61","I61.9","I63.2","I63.29","I63.5","I63.9","I64","I74","I82","I82.0","I82.2","I82.21","I82.210","I82.211","I82.220","I82.221","I82.29","I82.290","I82.291","I82.3","I82.4","I82.40","I82.41","I82.411","I82.412","I82.413","I82.419","I82.42","I82.421","I82.8","I82.89","I82.9","I82.90","P53") #"D65-D69.9
concept_set_codes_our_study[["COAGDIS_possible"]][["ICD10"]] <- c("D62","E07.89","H11.33","H45.0","I60","I60.9","I61","I61.9","I62.1","I63.8","I63.89","K25.6","K26.4","K26.6","K27.2","K27.6","K28.6","K29.01","N32.89","N42.1","N92.0","N92.1","N93.0","N93.8","N93.9","P54.9","R04.89","R58","S06.5X0","S06.5X0A","S06.5X0D","S06.5X0S","S06.5X1","S06.5X1A","S06.5X1D","S06.5X1S","S06.5X2","S06.5X2A","S06.5X2D","S06.5X2S","S06.5X3","S06.5X3A","S06.5X3D","S06.5X3S","S06.5X4","S06.5X4A","S06.5X4D","S06.5X4S","S06.6X0","S06.6X0A","S06.6X0D","S06.6X0S","S06.6X1","S06.6X1A","S06.6X1D","S06.6X1S","S06.6X2","S06.6X2A","S06.6X2D","S06.6X2S","S06.6X3","S06.6X3A","S06.6X3D","S06.6X3S","S06.6X4","S06.6X4A","S06.6X4D","S06.6X4S")
concept_set_codes_our_study_excl[["COAGDIS_possible"]][["ICD10"]] <- c("D65","D66","D67","D68","D69","D68.9","D69","D69.9","I26.0","I26.9","I61","I61.9","I63.2","I63.29","I63.5","I63.9","I64","I74","I82","I82.0","I82.2","I82.21","I82.210","I82.211","I82.220","I82.221","I82.29","I82.290","I82.291","I82.3","I82.4","I82.40","I82.41","I82.411","I82.412","I82.413","I82.419","I82.42","I82.421","I82.8","I82.89","I82.9","I82.90","P53") #"D65-D69.9"
concept_set_codes_our_study[["COAGDIS_narrow"]][["READ"]] <- c("D30..","D30z.","D31..","D31z.","Dyu3.","Dyu34","G640.","G74z.","G82..","G822.","G823.","G82z.","G82z0","Gyu63","Gyu6G","Gyu82","Q450.","X00D1","X205t","X76A9","XE0VI","XE0VS","XE0Va","XE2aB","Xa0lV","Xa3fV","XaBUu","XaEGq","D30..","D30z.","D31..","D31z.","Dyu3.","Dyu34","G64..","G640.","G66..","G73..","G74..","G74z.","G82..","G820.","G822.","G823.","G82z.","G82z0","Gyu63","Gyu6G","Gyu82","Q450.")
concept_set_codes_our_study[["COAGDIS_possible"]][["READ"]] <- c("C0630","C12y1","FyuH4","G60z.","G61z.","G620.","G62z.","G802.","G8y0.","Gyu64","Gyu80","K13y8","K16y2","Kyu9D","R0631","X1059","X78zo","XE0VF","XE0Wy","XE13x","XE1nU","XM0mI","XM0rV","XM0zJ","XM1Qv","Xa1uW","Xa9I7","XaE70","C0630","C12y1","D211.","FyuH4","G60..","G60z.","G61..","G61z.","G620.","G62z.","G802.","G8y0.","Gyu64","Gyu80","K13y8","K16y2","Kyu9D","Q41..","R0631","SE4z.")
concept_set_codes_our_study_excl[["COAGDIS_possible"]][["READ"]] <- c("D30..","D30z.","D31..","D31z.","Dyu3.","Dyu34","G640.","G74z.","G82..","G822.","G823.","G82z.","G82z0","Gyu63","Gyu6G","Gyu82","Q450.","X00D1","X205t","X76A9","XE0VI","XE0VS","XE0Va","XE2aB","Xa0lV","Xa3fV","XaBUu","XaEGq","D30..","D30z.","D31..","D31z.","Dyu3.","Dyu34","G64..","G640.","G66..","G73..","G74..","G74z.","G82..","G820.","G822.","G823.","G82z.","G82z0","Gyu63","Gyu6G","Gyu82","Q450.")
concept_set_codes_our_study[["COAGDIS_narrow"]][["ICPC"]] <- c("K90","B28001","B83001","K90002","K90017","K90024","K93003")
concept_set_codes_our_study[["COAGDIS_possible"]][["ICPC"]] <- c("A10001","A10002","K90004","K90006","K90013","N80015")
concept_set_codes_our_study_excl[["COAGDIS_possible"]][["ICPC"]] <- c("K90","B28001","B83001","K90002","K90017","K90024","K93003")
concept_set_codes_our_study[["COAGDIS_narrow"]][["SNOMED"]] <- c("D-4400","D-4423","D-6353","D-8903","D-8904","D-8918","F-54302","M-35300","NOCODE","111293003","123329004","12546009","127073005","128053003","134356002","13713005","154815003","154822006","155388006","155400001","155401002","155403004","155405006","155434000","155438002","155457006","191303002","191304008","191327000","191331006","191432003","191437009","195188006","195208004","195246006","195247002","195315009","195345007","195435006","195436007","195437003","195438008","195440003","195441004","195443001","195599001","195612004","195629001","20059004","21631000119105","230690007","234049002","248250000","266255008","266262004","266312006","266315008","267562007","267564008","268884000","270883006","286956007","291571000119106","313267000","362970003","371039008","399957001","59282003","64779008","69357003","738779002","78596001","82385007","82797006","91523003")
concept_set_codes_our_study[["COAGDIS_possible"]][["SNOMED"]] <- c("D-4012","M-37000","M-37100","U000310","U000311","U000312","123106001","128610004","131148009","1386000","1508000","154811007","155389003","155390007","155391006","155394003","155459009","157124001","158386009","190460008","191264008","194640002","195153006","195162008","195163003","195173001","195175008","195178005","195418007","195511004","195600003","195627004","197824007","197887003","198483005","198594007","206389004","207070002","211530002","21454007","230706003","25114006","266313001","267530009","268877008","274100004","274252009","28293008","3002002","303123004","312987004","35566002","385494008","397809001","400047006","413531005","41788008","423902002","42626004","432504007","44252001","50960005","67406007","68752002","78144005","85539001")
concept_set_codes_our_study_excl[["COAGDIS_possible"]][["SNOMED"]] <- c("D-4400","D-4423","D-6353","D-8903","D-8904","D-8918","F-54302","M-35300","NOCODE","111293003","123329004","12546009","127073005","128053003","134356002","13713005","154815003","154822006","155388006","155400001","155401002","155403004","155405006","155434000","155438002","155457006","191303002","191304008","191327000","191331006","191432003","191437009","195188006","195208004","195246006","195247002","195315009","195345007","195435006","195436007","195437003","195438008","195440003","195441004","195443001","195599001","195612004","195629001","20059004","21631000119105","230690007","234049002","248250000","266255008","266262004","266312006","266315008","267562007","267564008","268884000","270883006","286956007","291571000119106","313267000","362970003","371039008","399957001","59282003","64779008","69357003","738779002","78596001","82385007","82797006","91523003")


#--------------------------
# SOCV
concept_set_codes_our_study[["SOCV_narrow"]][["ICD9"]] <- c("287.0","446.2","446.20","709.1")
concept_set_codes_our_study[["SOCV_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["SOCV_narrow"]][["ICD10"]] <- c("D69.0","L95","L95.0","L95.8","L95.9","L98.8","M31.0")
concept_set_codes_our_study[["SOCV_possible"]][["ICD10"]] <- c()
concept_set_codes_our_study[["SOCV_narrow"]][["READ"]] <- c("D310.","D3100","D310z","G752z","M2y0.","Myu7A","Myu7C","Myu7G","XE0VV","XE1BV","D310.","D3100","D310z","G752.","G752z","M2y0.","M2y0z","Myu7A","Myu7C","Myu7G")
concept_set_codes_our_study[["SOCV_possible"]][["READ"]] <- c("G76B.","G76B.")
concept_set_codes_our_study_excl[["SOCV_possible"]][["READ"]] <- c("D310.","D3100","D310z","G752z","M2y0.","Myu7A","Myu7C","Myu7G","XE0VV","XE1BV","D310.","D3100","D310z","G752.","G752z","M2y0.","M2y0z","Myu7A","Myu7C","Myu7G")
concept_set_codes_our_study[["SOCV_narrow"]][["ICPC"]] <- c("B83019")
concept_set_codes_our_study[["SOCV_possible"]][["ICPC"]] <- c("K99016")
concept_set_codes_our_study_excl[["SOCV_possible"]][["ICPC"]] <- c("B83019")
concept_set_codes_our_study[["SOCV_narrow"]][["SNOMED"]] <- c("D-4587","D-4807","D-4808","11263005","154823001","191305009","191306005","191308006","195350001","195352009","201305007","201306008","201424009","201426006","201430009","21148002","246074004","267565009","267820009","31912009","367437009","53312001","60555002","718217000")
concept_set_codes_our_study[["SOCV_possible"]][["SNOMED"]] <- c("M-40000","195375002","266325003","31996006","393589007")
concept_set_codes_our_study_excl[["SOCV_possible"]][["SNOMED"]] <- c("D-4587","D-4807","D-4808","11263005","154823001","191305009","191306005","191308006","195350001","195352009","201305007","201306008","201424009","201426006","201430009","21148002","246074004","267565009","267820009","31912009","367437009","53312001","60555002","718217000")



#--------------------------
# ALI
concept_set_codes_our_study[["ALI_narrow"]][["ICD9"]] <- c("570","572.2","573.3")
concept_set_codes_our_study[["ALI_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["ALI_narrow"]][["ICD10"]] <- c("B17.9","K71","K71.0","K71.1","K71.2","K71.6","K71.7","K71.8","K71.9","K72","K72.0","K72.01","K72.9","K72.91","K75.9")
concept_set_codes_our_study[["ALI_possible"]][["ICD10"]] <- c()
concept_set_codes_our_study[["ALI_narrow"]][["READ"]] <- c("J60..","J600.","J6000","J6002","J600z","J601.","J6010","J6012","J601z","J60z.","J633.","J6330","J633z","J635.","J6350","J6351","J6352","J6356","Jyu70","Jyu76","X0058","X306T","X3076","X3077","X3078","X3079","XE0bB","XM1Oq","J60..","J600.","J6000","J6002","J600z","J601.","J6010","J6012","J601z","J60z.","J622.","J625.","J62y.","J633.","J6330","J633z","J635.","J6350","J6351","J6352","J6356","Jyu70","Jyu76")
concept_set_codes_our_study[["ALI_possible"]][["READ"]] <- c()
concept_set_codes_our_study[["ALI_narrow"]][["ICPC"]] <- c("D72002","D72004","D97001","D97007","D97008")
concept_set_codes_our_study[["ALI_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["ALI_narrow"]][["SNOMED"]] <- c("D-8721","D-8788","F-04440","F-62605","F-85640","M-40000","M-41000","M-58450","123049003","128241005","13920009","155808003","155820006","197268000","197269008","197270009","197272001","197273006","197274000","197275004","197276003","197277007","197278002","197332007","197334008","197335009","197351001","197352008","197353003","197354009","197355005","197356006","197358007","197362001","197363006","197552007","197558006","235882007","235883002","235884008","25072000","266536009","29001004","33851008","37871000","449902003","59927004","72836002","73418000")
concept_set_codes_our_study[["ALI_possible"]][["SNOMED"]] <- c()

#--------------------------
# AKI
concept_set_codes_our_study[["AKI_narrow"]][["ICD9"]] <- c("580.9","584.5","584.7","593.9","639.3","669.32","669.34","788.5","788.99","958.5","283.11","572.4","583.7","583.89","584","584.5","584.6","584.7","584.8","584.9","586","639.3","669.32","669.34","866")
concept_set_codes_our_study[["AKI_possible"]][["ICD9"]] <- c("275.2","276.2","580.9","583.9","593.9","275.2","276.2","276.5","276.50","276.52","403.9","404.9","580","580.4","580.8","580.89","593.3","788.5","788.9","788.99")
concept_set_codes_our_study_excl[["AKI_possible"]][["ICD9"]] <- c("580.9","584.5","584.7","593.9","639.3","669.32","669.34","788.5","788.99","958.5","283.11","572.4","583.7","583.89","584","584.5","584.6","584.7","584.8","584.9","586","639.3","669.32","669.34","866")
concept_set_codes_our_study[["AKI_narrow"]][["ICD10"]] <- c("D59.3","K76.7","N00","N00.9","N12","N14.0","N14.1","N14.2","N17","N17-N19.9","N17.0","N17.2","N17.9","N19","N28.9","O08.4","O90.4","R39.2","S37.0","S37.00","T79.5")
concept_set_codes_our_study[["AKI_possible"]][["ICD10"]] <- c("E83.41","E86","E86.1","E86.9","E87.2","I12","I12.9","I13","I13.9","N08","N28.9","R34")
concept_set_codes_our_study_excl[["AKI_possible"]][["ICD10"]] <- c("D59.3","K76.7","N00","N00.9","N12","N14.0","N14.1","N14.2","N17","N17-N19.9","N17.0","N17.2","N17.9","N19","N28.9","O08.4","O90.4","R39.2","S37.0","S37.00","T79.5")
concept_set_codes_our_study[["AKI_narrow"]][["READ"]] <- c("1AC0.","D1113","J624.","K04..","K040.","K04z.","K0C1.","K0C2.","L393.","R0851","R08z0","S76..","X30I2","X30Il","X30Im","X30Io","X30JS","XC0dW","XE0dg","XE1mF","XM08q","Xa6nr","1AC0.","D1113","J624.","K04..","K040.","K04z.","K06..","K060.","K0A0.","K0C0.","K0C1.","K0C2.","Kyu2.","L393.","R0851","R08z0","S76..","S76z.")
concept_set_codes_our_study[["AKI_possible"]][["READ"]] <- c("1AC1.","44J3z","C3520","C3534","C362.","C362z","C365.","C365z","G23..","G23z.","K00z.","R085.","R0850","R085z","X30Hc","X40PT","XE0Uf","XE0Ug","XE0dY","XE2q5","XM08i","XM0sW","1AC1.","44J3.","44J3z","C3520","C3534","C362.","C3620","C362z","C365.","C365z","G22..","G22z.","G23..","G23z.","K00z.","K13..","R085.","R0850","R085z")
concept_set_codes_our_study_excl[["AKI_possible"]][["READ"]] <- c("1AC0.","D1113","J624.","K04..","K040.","K04z.","K0C1.","K0C2.","L393.","R0851","R08z0","S76..","X30I2","X30Il","X30Im","X30Io","X30JS","XC0dW","XE0dg","XE1mF","XM08q","Xa6nr","1AC0.","D1113","J624.","K04..","K040.","K04z.","K06..","K060.","K0A0.","K0C0.","K0C1.","K0C2.","Kyu2.","L393.","R0851","R08z0","S76..","S76z.")
concept_set_codes_our_study[["AKI_narrow"]][["ICPC"]] <- c("U05001","U88010","U99005","U99022","U99030")
concept_set_codes_our_study[["AKI_possible"]][["ICPC"]] <- c("K87002","K87003","U05006","U88001","U88007","U99029")
concept_set_codes_our_study_excl[["AKI_possible"]][["ICPC"]] <- c("U05001","U88010","U99005","U99022","U99030")
concept_set_codes_our_study[["AKI_narrow"]][["SNOMED"]] <- c("D-4294","D-6345","D-6510","D-6511","D-6516","D-6760","D-8017","F-66105","M-40000","M-53130","M-53150","NOCODE","111407006","123308008","13010001","139460001","14669001","155850003","155854007","155855008","156092003","157343006","157666004","158479000","158493007","197578003","197649009","197653006","197656003","197657007","197680004","197750002","197751003","197752005","198524000","207182009","207199005","210209001","212376001","236386005","236423003","236424009","23697004","2472002","264536006","266553002","266613008","266616000","269158000","270918008","28689008","298015003","35455006","367481000119108","40095003","42399005","445646001","51292008","55655006","59400006","61503006","723188008","723189000","733839001")
concept_set_codes_our_study[["AKI_possible"]][["SNOMED"]] <- c("D-1085","D-1185","D-6502","D-6704","D-7374","F-10513","F-66104","F-70104","113075003","139461002","144007006","154757004","154763008","155299005","155850003","155871008","158477003","158478008","158482005","166713004","166718008","190887001","190895002","190897005","19351000","194773000","194775007","194776008","194782006","197578003","197588002","20165001","207180001","207181002","207185006","266230002","266612003","266613008","266624005","266627003","271845002","274108006","28560003","365757006","37472003","38481006","51387008","59455009","66978005","816082000","83128009","86234004","90708001")
concept_set_codes_our_study_excl[["AKI_possible"]][["SNOMED"]] <- c("D-4294","D-6345","D-6510","D-6511","D-6516","D-6760","D-8017","F-66105","M-40000","M-53130","M-53150","NOCODE","111407006","123308008","13010001","139460001","14669001","155850003","155854007","155855008","156092003","157343006","157666004","158479000","158493007","197578003","197649009","197653006","197656003","197657007","197680004","197750002","197751003","197752005","198524000","207182009","207199005","210209001","212376001","236386005","236423003","236424009","23697004","2472002","264536006","266553002","266613008","266616000","269158000","270918008","28689008","298015003","35455006","367481000119108","40095003","42399005","445646001","51292008","55655006","59400006","61503006","723188008","723189000","733839001")



#--------------------------
# GENCONV
concept_set_codes_our_study[["GENCONV_narrow"]][["ICD9"]] <- c("345.3","779.0","780.3","780.39")
concept_set_codes_our_study[["GENCONV_possible"]][["ICD9"]] <- c("345","345.1","345.10","345.2","345.80","345.81","345.9","780.31","780.32","293.0")
concept_set_codes_our_study_excl[["GENCONV_possible"]][["ICD9"]] <- c("345.3","779.0","780.3","780.39")
concept_set_codes_our_study[["GENCONV_narrow"]][["ICD10"]] <- c("G40.4","G40.6","G40.89","G41.0","P90","R56","R56.8")
concept_set_codes_our_study[["GENCONV_possible"]][["ICD10"]] <- c("G40","G40.9","G40.909","G41","G41.1","G41.9","R56.0","R56.00","R56.01","R56.9")
concept_set_codes_our_study_excl[["GENCONV_possible"]][["ICD10"]] <- c("G40.4","G40.6","G40.89","G41.0","P90","R56","R56.8")
concept_set_codes_our_study[["GENCONV_narrow"]][["READ"]] <- c("Q480.","R003.","R0032","R003z","Ryu71","XE15Y","XM03h","XM1Dy","XaBM2","XaDbE","XaEHz","XaEI2","1B63.","1B64.","F2516","F253.","F25H.","Q480.","R003.","R0032","R003z","Ryu71")
concept_set_codes_our_study[["GENCONV_possible"]][["READ"]] <- c("F25..","F251.","F251z","F252.","Fyu52","Fyu59","R0030","X007B","X75Z0","XE15a","XM03l","XaEIj","1B6B.","F25..","F251.","F251z","F252.","F253.","F25H.","F25z.","Fyu52","Fyu59","R0030","R003z")
concept_set_codes_our_study_excl[["GENCONV_possible"]][["READ"]] <- c("Q480.","R003.","R0032","R003z","Ryu71","XE15Y","XM03h","XM1Dy","XaBM2","XaDbE","XaEHz","XaEI2","1B63.","1B64.","F2516","F253.","F25H.","Q480.","R003.","R0032","R003z","Ryu71")
concept_set_codes_our_study[["GENCONV_narrow"]][["ICPC"]] <- c("N07001","N07002","N07003","N88001","N88011")
concept_set_codes_our_study[["GENCONV_possible"]][["ICPC"]] <- c("N07","N88","N07004","N07006","N88002","N88003","N88006")
concept_set_codes_our_study_excl[["GENCONV_possible"]][["ICPC"]] <- c("N07001","N07002","N07003","N88001","N88011")
concept_set_codes_our_study[["GENCONV_narrow"]][["SNOMED"]] <- c("F-87000","U000217","13973009","157162003","158138006","158141002","158142009","192995009","192998006","206732001","206735004","206738002","207622007","230436006","271788002","274828008","312078006","313290005","32631004","54200006","65155005","87476004","91175000")
concept_set_codes_our_study[["GENCONV_possible"]][["SNOMED"]] <- c("D-8570","F-87000","F-87020","F-87100","NOCODE","128613002","13973009","140804007","155036009","155039002","155045005","158139003","192988000","192997001","192998006","193019007","193026007","194492004","194499008","206733006","230456007","246545002","267593008","267698007","269033007","271788002","323091004","41497008","433083002","4619009","65120008","7033004","84757009")
concept_set_codes_our_study_excl[["GENCONV_possible"]][["SNOMED"]] <- c("F-87000","U000217","13973009","157162003","158138006","158141002","158142009","192995009","192998006","206732001","206735004","206738002","207622007","230436006","271788002","274828008","312078006","313290005","32631004","54200006","65155005","87476004","91175000")

#--------------------------
# MENINGOENC
concept_set_codes_our_study[["MENINGOENC_narrow"]][["ICD9"]] <- c("323","348.3","348.30")
concept_set_codes_our_study[["MENINGOENC_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["MENINGOENC_narrow"]][["ICD10"]] <- c("A69.22","G04","G04.9","G36","G93.4","G93.40")
concept_set_codes_our_study[["MENINGOENC_possible"]][["ICD10"]] <- c()
concept_set_codes_our_study[["MENINGOENC_narrow"]][["READ"]] <- c("F283.","XE15B","XE15D","F03..","F03z.","F283.")
concept_set_codes_our_study[["MENINGOENC_possible"]][["READ"]] <- c()
concept_set_codes_our_study[["MENINGOENC_narrow"]][["ICPC"]] <- c("N71","N71006","N99042")
concept_set_codes_our_study[["MENINGOENC_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["MENINGOENC_narrow"]][["SNOMED"]] <- c("D-8850","M-40000","155053002","192682002","192736002","193051008","267576008","267578009","267682000","45170000","7125002","76011009","81308009")
concept_set_codes_our_study[["MENINGOENC_possible"]][["SNOMED"]] <- c()


#--------------------------
# ARD
concept_set_codes_our_study[["ARD_narrow"]][["ICD9"]] <- c("518.52","518.81","518.82","518.5","518.82")
concept_set_codes_our_study[["ARD_possible"]][["ICD9"]] <- c("514","518.4","96.71","96.72")
concept_set_codes_our_study_excl[["ARD_possible"]][["ICD9"]] <- c("518.52","518.81","518.82","518.5","518.82")
concept_set_codes_our_study[["ARD_narrow"]][["ICD10"]] <- c("J80","J96.9","R06.03")
concept_set_codes_our_study[["ARD_possible"]][["ICD10"]] <- c("J81","J81.1")
concept_set_codes_our_study_excl[["ARD_possible"]][["ICD10"]] <- c("J80","J96.9","R06.03")
concept_set_codes_our_study[["ARD_narrow"]][["READ"]] <- c("R2y1.","R2y1z","XE0Ye","XM09V","H5853","H59..","R2y1.","R2y1z")
concept_set_codes_our_study[["ARD_possible"]][["READ"]] <- c("H541z","Xa6YO","H541z")
concept_set_codes_our_study_excl[["ARD_possible"]][["READ"]] <- c("R2y1.","R2y1z","XE0Ye","XM09V","H5853","H59..","R2y1.","R2y1z")
concept_set_codes_our_study[["ARD_narrow"]][["ICPC"]] <- c("R99004")
concept_set_codes_our_study[["ARD_possible"]][["ICPC"]] <- c("K77013")
concept_set_codes_our_study_excl[["ARD_possible"]][["ICPC"]] <- c("R99004")
concept_set_codes_our_study[["ARD_narrow"]][["SNOMED"]] <- c("D-7705","D-7709","D-7721","F-75010","111281007","111282000","155627006","158731006","158734003","196150004","196154008","196165003","206281003","207552005","207555007","266411000","373895009","409622000","51395007","67782005")
concept_set_codes_our_study[["ARD_possible"]][["SNOMED"]] <- c("M-36500","19242006","196119001","266408001")
concept_set_codes_our_study_excl[["ARD_possible"]][["SNOMED"]] <- c("D-7705","D-7709","D-7721","F-75010","111281007","111282000","155627006","158731006","158734003","196150004","196154008","196165003","206281003","207552005","207555007","266411000","373895009","409622000","51395007","67782005")



#--------------------------
# ERYTH
concept_set_codes_our_study[["ERYTH_narrow"]][["ICD9"]] <- c("695.1","695.10","695.12")
concept_set_codes_our_study[["ERYTH_possible"]][["ICD9"]] <- c("695.11")
concept_set_codes_our_study_excl[["ERYTH_possible"]][["ICD9"]] <- c("695.1","695.10","695.12")
concept_set_codes_our_study[["ERYTH_narrow"]][["ICD10"]] <- c("L51","L51.9")
concept_set_codes_our_study[["ERYTH_possible"]][["ICD10"]] <- c("L51.9")
concept_set_codes_our_study_excl[["ERYTH_possible"]][["ICD10"]] <- c("L51","L51.9")
concept_set_codes_our_study[["ERYTH_narrow"]][["READ"]] <- c("M151z","XE1B0","M151.","M151z")
concept_set_codes_our_study[["ERYTH_possible"]][["READ"]] <- c()
concept_set_codes_our_study[["ERYTH_narrow"]][["ICPC"]] <- c("S99007")
concept_set_codes_our_study[["ERYTH_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["ERYTH_narrow"]][["SNOMED"]] <- c("M-48560","156362004","200919006","200928007","267848009","36715001")
concept_set_codes_our_study[["ERYTH_possible"]][["SNOMED"]] <- c("123571000119104","28664002")
concept_set_codes_our_study_excl[["ERYTH_possible"]][["SNOMED"]] <- c("M-48560","156362004","200919006","200928007","267848009","36715001")



#--------------------------
# CHILBLAIN
concept_set_codes_our_study[["CHILBLAIN_narrow"]][["ICD9"]] <- c("991.5")
concept_set_codes_our_study[["CHILBLAIN_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["CHILBLAIN_narrow"]][["ICD10"]] <- c("T69.1","T69.1XXA","T69.1XXD")
concept_set_codes_our_study[["CHILBLAIN_possible"]][["ICD10"]] <- c("T69.1XXS")
concept_set_codes_our_study_excl[["CHILBLAIN_possible"]][["ICD10"]] <- c("T69.1","T69.1XXA","T69.1XXD")
concept_set_codes_our_study[["CHILBLAIN_narrow"]][["READ"]] <- c("SN15.","SN15.")
concept_set_codes_our_study[["CHILBLAIN_possible"]][["READ"]] <- c()
concept_set_codes_our_study[["CHILBLAIN_narrow"]][["ICPC"]] <- c("A88001","A88010")
concept_set_codes_our_study[["CHILBLAIN_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["CHILBLAIN_narrow"]][["SNOMED"]] <- c("M-11340","157719006","269421007","37869000")
concept_set_codes_our_study[["CHILBLAIN_possible"]][["SNOMED"]] <- c()

#--------------------------
# ANOSMIA
concept_set_codes_our_study[["ANOSMIA_narrow"]][["ICD9"]] <- c()
concept_set_codes_our_study[["ANOSMIA_possible"]][["ICD9"]] <- c("306.7","352.0","781.1")
concept_set_codes_our_study[["ANOSMIA_narrow"]][["ICD10"]] <- c("R43.0","R43.2")
concept_set_codes_our_study[["ANOSMIA_possible"]][["ICD10"]] <- c("G52.0","R43","R43.1","R43.9")
concept_set_codes_our_study_excl[["ANOSMIA_possible"]][["ICD10"]] <- c("R43.0","R43.2")
concept_set_codes_our_study[["ANOSMIA_narrow"]][["READ"]] <- c("R0110","R0112","XE0r5","XE0rs","XM070","1924.","1B45.","R0110","R0112","ZV415")
concept_set_codes_our_study[["ANOSMIA_possible"]][["READ"]] <- c("F320.","R011.","R0111","X008P","XM06z","F320.","R011.","R0111")
concept_set_codes_our_study_excl[["ANOSMIA_possible"]][["READ"]] <- c("R0110","R0112","XE0r5","XE0rs","XM070","1924.","1B45.","R0110","R0112","ZV415")
concept_set_codes_our_study[["ANOSMIA_narrow"]][["ICPC"]] <- c("N16002","N16003","N16004","N16011","N16012")
concept_set_codes_our_study[["ANOSMIA_possible"]][["ICPC"]] <- c("N16","N16013")
concept_set_codes_our_study_excl[["ANOSMIA_possible"]][["ICPC"]] <- c("N16002","N16003","N16004","N16011","N16012")
concept_set_codes_our_study[["ANOSMIA_narrow"]][["SNOMED"]] <- c("F-83025","139277004","139523002","158191003","158193000","162012003","162254006","1932001","206813000","206815007","230501005","267164004","271801002","36955009","44169009")
concept_set_codes_our_study[["ANOSMIA_possible"]][["SNOMED"]] <- c("D-8301","F-83002","F-83070","112105008","129820002","158190002","158192005","206812005","206814006","271800001","68982002","708673009")
concept_set_codes_our_study_excl[["ANOSMIA_possible"]][["SNOMED"]] <- c("F-83025","139277004","139523002","158191003","158193000","162012003","162254006","1932001","206813000","206815007","230501005","267164004","271801002","36955009","44169009")




#--------------------------
# ANAPHYL
concept_set_codes_our_study[["ANAPHYL_narrow"]][["ICD9"]] <- c("995.0","995.6","995.60","995.61","995.62","995.63","995.64","995.65","995.66","995.67","995.68","995.69","999.4","995.0","995.6","995.60","995.61","995.62","995.63","995.64","995.65","995.66","995.67","995.68","995.69")
concept_set_codes_our_study[["ANAPHYL_possible"]][["ICD9"]] <- c("458.9","782.3","785.50","995.1","995.3","458","458.9","708.0","782.3","782.5","785.50","995.2","995.27","995.3","995.4")
concept_set_codes_our_study_excl[["ANAPHYL_possible"]][["ICD9"]] <- c("995.0","995.6","995.60","995.61","995.62","995.63","995.64","995.65","995.66","995.67","995.68","995.69","999.4","995.0","995.6","995.60","995.61","995.62","995.63","995.64","995.65","995.66","995.67","995.68","995.69")
concept_set_codes_our_study[["ANAPHYL_narrow"]][["ICD10"]] <- c("T78.0","T78.00","T78.01","T78.02","T78.03","T78.04","T78.05","T78.06","T78.07","T78.08","T78.09","T78.2XXA","T78.2XXD","T78.2XXS","T80.5","T88.6")
concept_set_codes_our_study[["ANAPHYL_possible"]][["ICD10"]] <- c("I95","I95.9","L50.0","R23.0","R57.9","R60.9","T78.3","T78.4","T78.40")
concept_set_codes_our_study_excl[["ANAPHYL_possible"]][["ICD10"]] <- c("T78.0","T78.00","T78.01","T78.02","T78.03","T78.04","T78.05","T78.06","T78.07","T78.08","T78.09","T78.2XXA","T78.2XXD","T78.2XXS","T80.5","T88.6")
concept_set_codes_our_study[["ANAPHYL_narrow"]][["READ"]] <- c("SN50.","SN501","SP34.","X208h","X70vi","X70vl","X70vm","X70vo","X70vq","X70w1","X70w2","X70w7","X76E9","XE1BR","M280.","SN50.","SN500","SN501","SP34.")
concept_set_codes_our_study[["ANAPHYL_possible"]][["READ"]] <- c("183Z.","G87..","G87z.","R023.","R0232","R023z","R025.","R0550","SN51.","X77Ux","X78zV","X79pp","X79pv","XE0qw","XE1BR","XE1ot","XM00r","XM02U","XM07N","XM0xz","XM1C7","Xa0ls","Xa1pQ","Xa1zh","16J5.","183..","183Z.","G87..","G87z.","M28..","M280.","R023.","R0232","R023z","R025.","R0550","SN51.","SN53.","SN530")
concept_set_codes_our_study_excl[["ANAPHYL_possible"]][["READ"]] <- c("SN50.","SN501","SP34.","X208h","X70vi","X70vl","X70vm","X70vo","X70vq","X70w1","X70w2","X70w7","X76E9","XE1BR","M280.","SN50.","SN500","SN501","SP34.")
concept_set_codes_our_study[["ANAPHYL_narrow"]][["ICPC"]] <- c("A12001","A12004","A92005","A92012")
concept_set_codes_our_study[["ANAPHYL_possible"]][["ICPC"]] <- c("A12","A12002","A12007","A12009","A92007","A92008","A92010","D20021","K07003","K29005","K29022","K88001","K88006","S04006","S08011")
concept_set_codes_our_study_excl[["ANAPHYL_possible"]][["ICPC"]] <- c("A12001","A12004","A92005","A92012")
concept_set_codes_our_study[["ANAPHYL_narrow"]][["SNOMED"]] <- c("D-4810","D-4811","F-42750","F-42880","10803007","111737003","157755003","212994002","212995001","213320003","241930003","241934007","241935008","241936009","241946006","241947002","241952007","35001004","373674001","39579001","419042001","427903006","429751004","441495001","79337003","87467006","91941002")
concept_set_codes_our_study[["ANAPHYL_possible"]][["SNOMED"]] <- c("D-3541","D-3547","D-4651","F-42400","F-42510","F-70010","F-71100","M-04120","M-36500","U000308","106190000","119419001","12263007","127072000","139241006","139250008","155375008","155487000","155490006","156428000","157754004","157756002","157758001","158241008","158244000","158247007","158252002","158354004","161979002","161988006","195508000","201260002","206888002","206891002","206894005","206899000","207026006","20741006","212998004","212999007","21957007","257550005","266308000","267038008","267302008","269284003","269432007","269433002","271646004","274211000","274729009","278528006","27942005","282092005","3415004","366949006","367174000","400075008","40178009","41291007","416093006","418168000","418634005","418925002","421668005","421961002","423666004","45007003","699376002","79654002","82966003","91232002")
concept_set_codes_our_study_excl[["ANAPHYL_possible"]][["SNOMED"]] <- c("D-4810","D-4811","F-42750","F-42880","10803007","111737003","157755003","212994002","212995001","213320003","241930003","241934007","241935008","241936009","241946006","241947002","241952007","35001004","373674001","39579001","419042001","427903006","429751004","441495001","79337003","87467006","91941002")

#--------------------------
# MISCC
concept_set_codes_our_study[["MISCC_narrow"]][["ICD9"]] <- c("446.1")
concept_set_codes_our_study[["MISCC_possible"]][["ICD9"]] <- c("785.50")
concept_set_codes_our_study_excl[["MISCC_possible"]][["ICD9"]] <- c("446.1")
concept_set_codes_our_study[["MISCC_narrow"]][["ICD10"]] <- c("M30.3")
concept_set_codes_our_study[["MISCC_possible"]][["ICD10"]] <- c("R57.9")
concept_set_codes_our_study_excl[["MISCC_possible"]][["ICD10"]] <- c("M30.3")
concept_set_codes_our_study[["MISCC_narrow"]][["READ"]] <- c("G7510","G751z","G7510","G751z")
concept_set_codes_our_study[["MISCC_possible"]][["READ"]] <- c("R0550","XM00r","XM1C7","R0550")
concept_set_codes_our_study_excl[["MISCC_possible"]][["READ"]] <- c("G7510","G751z","G7510","G751z")
concept_set_codes_our_study[["MISCC_narrow"]][["ICPC"]] <- c("B99022")
concept_set_codes_our_study[["MISCC_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["MISCC_narrow"]][["SNOMED"]] <- c("D-3515","155444003","195348009","195349001","75053002")
concept_set_codes_our_study[["MISCC_possible"]][["SNOMED"]] <- c("F-70010","158354004","207026006","267302008","274729009","27942005")
concept_set_codes_our_study_excl[["MISCC_possible"]][["SNOMED"]] <- c("D-3515","155444003","195348009","195349001","75053002")


#--------------------------
# COVID
concept_set_codes_our_study[["COVID_narrow"]][["ICD9"]] <- c("078.89")
concept_set_codes_our_study[["COVID_possible"]][["ICD9"]] <- c("518.52","518.81","769","780.60","781.1","93.90","99.59","V46.1","363.20","486","490","518.81","769","780.60","786.05","786.2","799.02","V46.1")
concept_set_codes_our_study_excl[["COVID_possible"]][["ICD9"]] <- c("078.89")
concept_set_codes_our_study[["COVID_narrow"]][["ICD10"]] <- c()
concept_set_codes_our_study[["COVID_possible"]][["ICD10"]] <- c("B97.21","B97.29","H30","H30.9","J12.89","J18","J18.9","J80","P22","P22.0","P22.9","R06.00","R06.02","R09.02","Z03.818","Z11.5","Z11.59","Z20.82","Z20.828","Z99.1","Z99.11")
# concept_set_codes_our_study[["COVID_narrow"]][["READ"]] <- c()
# concept_set_codes_our_study[["COVID_possible"]][["READ"]] <- c("165..","171..","171B.","1739.","1B45.","65...","8721.","872Z.","H062.","H26..","H30..","H5853","H59..","H5y..","R060D","ZV415","ZV461")
concept_set_codes_our_study[["COVID_narrow"]][["READ"]] <- c('A7y00','A795.00','A7951','AyuDC')
concept_set_codes_our_study[["COVID_possible"]][["READ"]] <- c('65PW.','65PW1','1JX..','1JX1.','9N312')
concept_set_codes_our_study_excl[["COVID_possible"]][["READ"]] <- c('A7y00','A795.','A7951','AyuDC')
concept_set_codes_our_study[["COVID_narrow"]][["ICPC"]] <- c()
concept_set_codes_our_study[["COVID_possible"]][["ICPC"]] <- c("A03","R02","R81","A03002","A03006","A99001","F73012","F99029","N16004","N16011","N16012","R02001","R02002","R02004","R02007","R05004","R05006","R05008","R78002","R81012","R81014","R99004","R99011")
concept_set_codes_our_study[["COVID_narrow"]][["SNOMED"]] <- c()
concept_set_codes_our_study[["COVID_possible"]][["SNOMED"]] <- c("D-7705","D-7706","D-7709","D-7721","D-Y000","F-03003","F-10474","F-75010","F-75020","F-75040","F-75860","F-75870","F-83025","M-20020","M-40000","P-7662","11833005","139176003","139179005","139187006","139188001","139190000","139192008","139200001","139201002","139207003","139523002","147541002","150946007","150947003","150950000","155514003","155548002","155552002","155558003","155616009","155627006","157107007","158161008","158191003","158193000","158371003","158379001","158383001","158731006","158734003","161921002","161930005","161931009","161935000","161937008","161945003","161946002","161951008","162254006","16404004","170310008","179260008","182685002","182688000","186747009","186758000","187467005","187587009","1932001","193432007","195742007","195745009","195915000","195936003","195940007","196150004","196154008","196165003","196170005","196186003","196204006","196215001","196258002","205237003","206281003","206762007","206813000","206815007","207057006","207059009","207062007","207066005","207551003","207552005","207555007","230145002","230501005","233604007","248425001","248452006","25638009","263731006","266340001","266354009","266391003","266411000","267036007","270531006","271801002","272039006","274103002","274234009","284523002","301235001","308149007","30869003","316113009","32398004","33879002","367493005","36955009","3774009","386661006","389087006","40617009","409596002","409622000","418393006","44169009","444932008","46627006","46775006","49233005","49727002","50177009","51395007","60363000","64572001","64882008","65710008","67782005","68154008","78563003")


#--------------------------
# SUDDENDEAT
concept_set_codes_our_study[["SUDDENDEAT_narrow"]][["ICD9"]] <- c("798.2")
concept_set_codes_our_study[["SUDDENDEAT_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["SUDDENDEAT_narrow"]][["ICD10"]] <- c("R96.1")
concept_set_codes_our_study[["SUDDENDEAT_possible"]][["ICD10"]] <- c()
concept_set_codes_our_study[["SUDDENDEAT_narrow"]][["READ"]] <- c("R212.","R212z","RyuC1","Ua1q3","22J4.","R212.","R212z","RyuC1")
concept_set_codes_our_study[["SUDDENDEAT_possible"]][["READ"]] <- c()
concept_set_codes_our_study[["SUDDENDEAT_narrow"]][["ICPC"]] <- c("A96006")
concept_set_codes_our_study[["SUDDENDEAT_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["SUDDENDEAT_narrow"]][["SNOMED"]] <- c("F-Y1810","158720003","158723001","207540003","207543001","207672009","26636000","53559009","F-Y1820","49713007")
concept_set_codes_our_study_excl[["SUDDENDEAT_possible"]][["SNOMED"]] <- c("F-Y1810","158720003","158723001","207540003","207543001","207672009","26636000","53559009")


#--------------------------
# GESTDIAB
concept_set_codes_our_study[["GESTDIAB_narrow"]][["ICD9"]] <- c()
concept_set_codes_our_study[["GESTDIAB_possible"]][["ICD9"]] <- c("648.0","648.00","648.8","648.80","648.82","648.83")
concept_set_codes_our_study[["GESTDIAB_narrow"]][["ICD10"]] <- c("O24.4","O24.41","O24.410","O24.414","O24.415","O24.419","O24.425","O24.429","O24.43","O24.435","O24.439")
concept_set_codes_our_study[["GESTDIAB_possible"]][["ICD10"]] <- c("O24","O24.9")
concept_set_codes_our_study_excl[["GESTDIAB_possible"]][["ICD10"]] <- c("O24.4","O24.41","O24.410","O24.414","O24.415","O24.419","O24.425","O24.429","O24.43","O24.435","O24.439")
concept_set_codes_our_study[["GESTDIAB_narrow"]][["READ"]] <- c("L1808")
concept_set_codes_our_study[["GESTDIAB_possible"]][["READ"]] <- c("L180.","L180z")
concept_set_codes_our_study_excl[["GESTDIAB_possible"]][["READ"]] <- c("L1808")
concept_set_codes_our_study[["GESTDIAB_narrow"]][["ICPC"]] <- c("W77004","W85001")
concept_set_codes_our_study[["GESTDIAB_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["GESTDIAB_narrow"]][["SNOMED"]] <- c("D-2403","D-2410","11687002","199232003","237629002","359964007","393568003")
concept_set_codes_our_study[["GESTDIAB_possible"]][["SNOMED"]] <- c("156138000","199223000","199234002","39763004","76751001")
concept_set_codes_our_study_excl[["GESTDIAB_possible"]][["SNOMED"]] <- c("D-2403","D-2410","11687002","199232003","237629002","359964007","393568003")



#--------------------------
# PREECLAMP
concept_set_codes_our_study[["PREECLAMP_narrow"]][["ICD9"]] <- c("642.4","642.5")
concept_set_codes_our_study[["PREECLAMP_possible"]][["ICD9"]] <- c("642.6")
concept_set_codes_our_study_excl[["PREECLAMP_possible"]][["ICD9"]] <- c("642.4","642.5")
concept_set_codes_our_study[["PREECLAMP_narrow"]][["ICD10"]] <- c("O14","O14.0","O14.1","O14.9","O14.90")
concept_set_codes_our_study[["PREECLAMP_possible"]][["ICD10"]] <- c("O14","O14.0","O14.2","O15.0")
concept_set_codes_our_study_excl[["PREECLAMP_possible"]][["ICD10"]] <- c("O14","O14.0","O14.1","O14.9","O14.90")
concept_set_codes_our_study[["PREECLAMP_narrow"]][["READ"]] <- c("L124.","L1240","L1245","L1246","L124z","L125.","L1250","L125z","L12B.")
concept_set_codes_our_study[["PREECLAMP_possible"]][["READ"]] <- c("L1235","L129.","L12A.")
concept_set_codes_our_study_excl[["PREECLAMP_possible"]][["READ"]] <- c("L124.","L1240","L1245","L1246","L124z","L125.","L1250","L125z","L12B.")
concept_set_codes_our_study[["PREECLAMP_narrow"]][["ICPC"]] <- c("W81","W81004","W81005")
concept_set_codes_our_study[["PREECLAMP_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["PREECLAMP_narrow"]][["SNOMED"]] <- c("D-2502","156106005","156108006","156109003","156110008","198972006","198973001","198978005","198979002","198980004","198981000","198982007","198987001","199011002","267200002","267306006","288201007","398254007","41114007","46764007","6758009")
concept_set_codes_our_study[["PREECLAMP_possible"]][["SNOMED"]] <- c("199009006","199010001","237281009","95605009")
concept_set_codes_our_study_excl[["PREECLAMP_possible"]][["SNOMED"]] <- c("D-2502","156106005","156108006","156109003","156110008","198972006","198973001","198978005","198979002","198980004","198981000","198982007","198987001","199011002","267200002","267306006","288201007","398254007","41114007","46764007","6758009")


#--------------------------
# MATERNALDEATH
concept_set_codes_our_study[["MATERNALDEATH_narrow"]][["ICD9"]] <- c("761.6")
concept_set_codes_our_study[["MATERNALDEATH_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["MATERNALDEATH_narrow"]][["ICD10"]] <- c("P01.6")
concept_set_codes_our_study[["MATERNALDEATH_possible"]][["ICD10"]] <- c()
concept_set_codes_our_study[["MATERNALDEATH_narrow"]][["READ"]] <- c("Q016.")
concept_set_codes_our_study[["MATERNALDEATH_possible"]][["READ"]] <- c("13M8.")
concept_set_codes_our_study_excl[["MATERNALDEATH_possible"]][["READ"]] <- c("Q016.")
concept_set_codes_our_study[["MATERNALDEATH_narrow"]][["ICPC"]] <- c()
concept_set_codes_our_study[["MATERNALDEATH_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["MATERNALDEATH_narrow"]][["SNOMED"]] <- c("206051001","268799007","53035006")
concept_set_codes_our_study[["MATERNALDEATH_possible"]][["SNOMED"]] <- c("138279005","160962004")
concept_set_codes_our_study_excl[["MATERNALDEATH_possible"]][["SNOMED"]] <- c("206051001","268799007","53035006")



#--------------------------
# FGR
concept_set_codes_our_study[["FGR_narrow"]][["ICD9"]] <- c("764.9","764.90","764.91","764.92","764.94","764.95","764.97","764.99")
concept_set_codes_our_study[["FGR_possible"]][["ICD9"]] <- c("656.5","656.50","658.0","764")
concept_set_codes_our_study_excl[["FGR_possible"]][["ICD9"]] <- c("764.9","764.90","764.91","764.92","764.94","764.95","764.97","764.99")
concept_set_codes_our_study[["FGR_narrow"]][["ICD10"]] <- c("P05.9")
concept_set_codes_our_study[["FGR_possible"]][["ICD10"]] <- c("O36.5","O41.0","O41.00","O43.89","P05","P05.9")
concept_set_codes_our_study_excl[["FGR_possible"]][["ICD10"]] <- c("P05.9")
concept_set_codes_our_study[["FGR_narrow"]][["READ"]] <- c("Q10z.")
concept_set_codes_our_study[["FGR_possible"]][["READ"]] <- c("5858.","L280.","L2800","L280z","L514.","Q10..")
concept_set_codes_our_study_excl[["FGR_possible"]][["READ"]] <- c("Q10z.")
concept_set_codes_our_study[["FGR_narrow"]][["ICPC"]] <- c("W84015")
concept_set_codes_our_study[["FGR_possible"]][["ICPC"]] <- c("K43003")
concept_set_codes_our_study_excl[["FGR_possible"]][["ICPC"]] <- c("W84015")
concept_set_codes_our_study[["FGR_narrow"]][["SNOMED"]] <- c("F-33710","156185006","206166000","22033007","267337006","268815007")
concept_set_codes_our_study[["FGR_possible"]][["SNOMED"]] <- c("M-29440","156190009","157051001","169246005","18471004","199614006","199652007","199656005","200474004","206162003","252442005","268447006","268814006","276604007","3554000","397949005","398276003","59566000")
concept_set_codes_our_study_excl[["FGR_possible"]][["SNOMED"]] <- c("F-33710","156185006","206166000","22033007","267337006","268815007")


#--------------------------
# SPONTABO
concept_set_codes_our_study[["SPONTABO_narrow"]][["ICD9"]] <- c("634","634.0","634.00","634.01","634.7","634.70","634.9","634.90","634.91")
concept_set_codes_our_study[["SPONTABO_possible"]][["ICD9"]] <- c("632","634.1","634.2","634.20","634.3","634.4","634.40","634.5","634.6","634.8","634.80")
concept_set_codes_our_study_excl[["SPONTABO_possible"]][["ICD9"]] <- c("634","634.0","634.00","634.01","634.7","634.70","634.9","634.90","634.91")
concept_set_codes_our_study[["SPONTABO_narrow"]][["ICD10"]] <- c("O03","O03.9")
concept_set_codes_our_study[["SPONTABO_possible"]][["ICD10"]] <- c("O02.1")
concept_set_codes_our_study_excl[["SPONTABO_possible"]][["ICD10"]] <- c("O03","O03.9")
concept_set_codes_our_study[["SPONTABO_narrow"]][["READ"]] <- c("L04..","L040.","L040w","L040y","L040z","L041y","L04z.")
concept_set_codes_our_study[["SPONTABO_possible"]][["READ"]] <- c("L010.","L011.","L02..","L040x","L264.","L2640","L264z")
concept_set_codes_our_study_excl[["SPONTABO_possible"]][["READ"]] <- c("L04..","L040.","L040w","L040y","L040z","L041y","L04z.")
concept_set_codes_our_study[["SPONTABO_narrow"]][["ICPC"]] <- c("W82","W82001","W82004")
concept_set_codes_our_study[["SPONTABO_possible"]][["ICPC"]] <- c("W82007","W82012")
concept_set_codes_our_study_excl[["SPONTABO_possible"]][["ICPC"]] <- c("W82","W82001","W82004")
concept_set_codes_our_study[["SPONTABO_narrow"]][["SNOMED"]] <- c("F-31600","F-31680","156071003","156074006","17369002","198631006","198640005","198642002","198643007","198653008","198689000","267294003")
concept_set_codes_our_study[["SPONTABO_possible"]][["SNOMED"]] <- c("F-31660","F-35250","M-28020","10697004","13384007","156086009","156087000","156184005","16607004","198616002","198641009","199605001","199606000","199609007","267187007","267299008","276507005","2781009","34270000","34614007","35999006","43306002","58990004","76358005","84122000")
concept_set_codes_our_study_excl[["SPONTABO_possible"]][["SNOMED"]] <- c("F-31600","F-31680","156071003","156074006","17369002","198631006","198640005","198642002","198643007","198653008","198689000","267294003")


#--------------------------
# STILLBIRTH
concept_set_codes_our_study[["STILLBIRTH_narrow"]][["ICD9"]] <- c("V27.1","V27.3","V27.4","V27.7")
concept_set_codes_our_study[["STILLBIRTH_possible"]][["ICD9"]] <- c("656.4")
concept_set_codes_our_study_excl[["STILLBIRTH_possible"]][["ICD9"]] <- c("V27.1","V27.3","V27.4","V27.7")
concept_set_codes_our_study[["STILLBIRTH_narrow"]][["ICD10"]] <- c("P95","Z37.1","Z37.3","Z37.4","Z37.7")
concept_set_codes_our_study[["STILLBIRTH_possible"]][["ICD10"]] <- c("P95")
concept_set_codes_our_study_excl[["STILLBIRTH_possible"]][["ICD10"]] <- c("P95","Z37.1","Z37.3","Z37.4","Z37.7")
concept_set_codes_our_study[["STILLBIRTH_narrow"]][["READ"]] <- c("Q48D.","ZV271","ZV273","ZV274","ZV277","ZVu2C")
concept_set_codes_our_study[["STILLBIRTH_possible"]][["READ"]] <- c("L264.","L2640","L264z","Q4z..")
concept_set_codes_our_study_excl[["STILLBIRTH_possible"]][["READ"]] <- c("Q48D.","ZV271","ZV273","ZV274","ZV277","ZVu2C")
concept_set_codes_our_study[["STILLBIRTH_narrow"]][["ICPC"]] <- c()
concept_set_codes_our_study[["STILLBIRTH_possible"]][["ICPC"]] <- c("A95","A95001")
concept_set_codes_our_study[["STILLBIRTH_narrow"]][["SNOMED"]] <- c("F-35250","147061003","157167009","206581002","237364002","268887007","315959000","315961009","315962002","315965000","316757001","76358005")
concept_set_codes_our_study[["STILLBIRTH_possible"]][["SNOMED"]] <- c("F-35250","10588007","14022007","156184005","157167009","199605001","199606000","199609007","206602000","268887007","276507005","315964001","316756005","399363000","7428005","76358005","84122000")
concept_set_codes_our_study_excl[["STILLBIRTH_possible"]][["SNOMED"]] <- c("F-35250","147061003","157167009","206581002","237364002","268887007","315959000","315961009","315962002","315965000","316757001","76358005")


#--------------------------
# PRETERMBIRTH
concept_set_codes_our_study[["PRETERMBIRTH_narrow"]][["ICD9"]] <- c("644.2","765.1","765.10","765.11")
concept_set_codes_our_study[["PRETERMBIRTH_possible"]][["ICD9"]] <- c("644.20","765.21","765.22","765.23","765.24","765.25","765.26","765.27","765.28","765.29")
concept_set_codes_our_study_excl[["PRETERMBIRTH_possible"]][["ICD9"]] <- c("644.2","765.1","765.10","765.11")
concept_set_codes_our_study[["PRETERMBIRTH_narrow"]][["ICD10"]] <- c("O60","O60.1","O60.10","O60.10X0","O60.10X1","O60.10X2","O60.10X3","O60.10X4","O60.10X5","O60.10X9","O60.13","O60.14","P07.3")
concept_set_codes_our_study[["PRETERMBIRTH_possible"]][["ICD10"]] <- c("O60","P07.1","P07.2","Z3A.0","Z3A.1","Z3A.2","Z3A.3")
concept_set_codes_our_study_excl[["PRETERMBIRTH_possible"]][["ICD10"]] <- c("O60","O60.1","O60.10","O60.10X0","O60.10X1","O60.10X2","O60.10X3","O60.10X4","O60.10X5","O60.10X9","O60.13","O60.14","P07.3")
concept_set_codes_our_study[["PRETERMBIRTH_narrow"]][["READ"]] <- c("6352.","6353.","6356.","6357.","635B.","L142.","L142z","Q11..","Q110.","Q111.","Q116.","Q11z.","Qyu11")
concept_set_codes_our_study[["PRETERMBIRTH_possible"]][["READ"]] <- c("62X0.","62X1.","6351.","6358.","6359.","635A.","L14..","Q11z.")
concept_set_codes_our_study_excl[["PRETERMBIRTH_possible"]][["READ"]] <- c("6352.","6353.","6356.","6357.","635B.","L142.","L142z","Q11..","Q110.","Q111.","Q116.","Q11z.","Qyu11")
concept_set_codes_our_study[["PRETERMBIRTH_narrow"]][["ICPC"]] <- c("A93","A93001","A93002","A93007")
concept_set_codes_our_study[["PRETERMBIRTH_possible"]][["ICPC"]] <- c("W84005")
concept_set_codes_our_study_excl[["PRETERMBIRTH_possible"]][["ICPC"]] <- c("A93","A93001","A93002","A93007")
concept_set_codes_our_study[["PRETERMBIRTH_narrow"]][["SNOMED"]] <- c("F-31570","F-35060","10761191000119104","10761241000119104","147079004","147081002","147082009","147085006","147086007","147090009","157080005","169848003","169850006","169851005","169853008","169854002","169858004","199056009","199059002","206167009","206168004","206169007","206177006","206621008","268817004","270496001","282020008","310523002","310530008","310548004","310661005","367494004","395507008","49550006","65588006","771299009")
concept_set_codes_our_study[["PRETERMBIRTH_possible"]][["SNOMED"]] <- c("F-31400","147035002","147036001","147080001","147087003","147088008","147089000","156118001","156120003","157082002","169806005","169807001","169849006","169855001","169856000","169857009","199046005","206178001","267310009","310527001","310528006","310529003","313178001","313179009","43963002","6383007","69471007")
concept_set_codes_our_study_excl[["PRETERMBIRTH_possible"]][["SNOMED"]] <- c("F-31570","F-35060","10761191000119104","10761241000119104","147079004","147081002","147082009","147085006","147086007","147090009","157080005","169848003","169850006","169851005","169853008","169854002","169858004","199056009","199059002","206167009","206168004","206169007","206177006","206621008","268817004","270496001","282020008","310523002","310530008","310548004","310661005","367494004","395507008","49550006","65588006","771299009")



#--------------------------
# MAJORCA
concept_set_codes_our_study[["MAJORCA_narrow"]][["ICD9"]] <- c("740","740","741","742","743","744","745","746","747","748","749","750","751","752","753","754","755","756","757","758","759","741","742","742.4","742.5","742.59","742.9","743","743.22","743.39","743.43","743.44","743.46","743.47","743.49","743.56","743.57","743.59","743.63","743.64","743.65","743.69","743.8","743.9","744.02","744.09","744.2","744.24","744.29","744.3","744.46","744.49","744.8","744.89","744.9","745","745.19","745.69","745.8","745.9","746","746.09","746.8","746.84","746.89","747","747.2","747.29","747.39","747.49","747.5","747.69","747.8","747.89","747.9","748","748.1","748.3","748.6","748.69","748.8","748.9","749","749.2","749.20","749.25","750","750.1","750.19","750.26","750.29","750.3","750.4","750.6","751","751.8","751.9","752","752.19","752.49","752.6","752.9","753","753.29","753.3","753.4","753.8","753.9","754","754.0","754.2","754.30","754.35","754.59","754.69","754.7","754.79","755","755.5","755.59","755.6","755.69","756","756.3","756.79","756.9","757","757.3","757.39","757.6","757.8","757.9","758","758.5","758.8","758.81","758.89","758.9","759","759.2","759.7","759.8","759.89","759.9")
concept_set_codes_our_study[["MAJORCA_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["MAJORCA_narrow"]][["ICD10"]] <- c("Q00","Q00","Q01","Q02","Q03","Q04","Q05","Q06","Q07","Q05","Q05.9","Q07.9","Q10","Q11","Q12","Q13","Q14","Q15","Q16","Q17","Q18","Q15.9","Q17.9","Q20-Q28","Q20-Q28.9","Q24","Q28","Q28.9","Q30","Q31","Q32","Q33","Q34","Q34.9","Q35","Q36","Q37","Q37.9","Q38","Q39","Q40","Q41","Q42","Q43","Q44","Q45","Q40","Q40.1","Q45","Q45.9","Q50","Q51","Q52","Q53","Q54","Q55","Q56","Q60","Q61","Q62","Q63","Q64","Q64.9","Q65","Q66","Q67","Q68","Q69","Q70","Q71","Q72","Q73","Q74","Q75","Q76","Q77","Q78","Q79","Q68","Q79.9","Q80","Q81","Q83","Q84","Q85","Q86","Q87","Q88","Q89","Q84.9","Q89.9","Q90","Q91","Q92","Q93","Q94","Q95","Q96","Q97","Q98","Q99","Q99.9") #"Q80-Q89.9" "Q90-Q99.9" "Q00-Q07.9" "Q10-Q18.9" "Q30-Q34.9", "Q38-Q45.9" "Q50-Q56.9" "Q60-Q64.9" "Q65-Q79.9"
concept_set_codes_our_study[["MAJORCA_possible"]][["ICD10"]] <- c()
concept_set_codes_our_study[["MAJORCA_narrow"]][["READ"]] <- c("P....","P0...","P0z..","P1...","P1z..","P2...","P24..","P24z.","P25..","P25yz","P2y..","P2yz.","P2z..","P3...","P345.","P345z","P355.","P355z","P356z","P362.","P362z","P3y..","P3z..","P402.","P402z","P42..","P42z.","P42zz","P43..","P443.","P443z","P44y.","P44z.","P4y..","P4yz.","P4z..","P6...","P60z.","P60zz","P6y..","P6yyz","P7...","P72z.","P74zz","P75..","P75z.","P76y.","P7y..","P7z..","P8...","P81..","P83..","P83y.","P83yz","P83z.","P86..","P86y.","P86yz","P8y..","P8yz.","P8z..","P9...","P92..","P920.","P92B.","P92z.","PA...","PA1..","PA1z.","PA6..","PB...","PB6yx","PBy..","PByz.","PBz..","PC...","PC04.","PC1y.","PC1yz","PC4yx","PCyy.","PCyyz","PCz..","PD...","PD4..","PD4z.","PDz..","PE...","PE0z.","PE300","PE32.","PE6y.","PE6yz","PE7..","PE9..","PEz..","PF...","PG...","PG3..","PG3x.","PGz..","PH3..","PH6z.","PHy..","PHz..","PJ...","PJ5..","PJz..","PJzz.","PK...","PK2..","PKy..","PKz..","Py...","Pyu0.","Pyu01","Pyu03","Pyu05","Pyu06","Pyu1.","Pyu10","Pyu11","Pyu12","Pyu13","Pyu14","Pyu15","Pyu16","Pyu17","Pyu18","Pyu19","Pyu1C","Pyu1D","Pyu1E","Pyu1F","Pyu2.","Pyu20","Pyu21","Pyu22","Pyu23","Pyu24","Pyu25","Pyu26","Pyu27","Pyu28","Pyu29","Pyu2A","Pyu2B","Pyu2C","Pyu2E","Pyu2F","Pyu2H","Pyu2K","Pyu3.","Pyu30","Pyu31","Pyu32","Pyu34","Pyu35","Pyu41","Pyu5.","Pyu50","Pyu52","Pyu57","Pyu58","Pyu59","Pyu5A","Pyu5B","Pyu5C","Pyu5D","Pyu5E","Pyu5F","Pyu5G","Pyu6.","Pyu60","Pyu61","Pyu62","Pyu63","Pyu64","Pyu65","Pyu66","Pyu68","Pyu69","Pyu6A","Pyu6B","Pyu7.","Pyu71","Pyu72","Pyu73","Pyu74","Pyu75","Pyu76","Pyu8.","Pyu80","Pyu81","Pyu82","Pyu83","Pyu84","Pyu85","Pyu86","Pyu87","Pyu88","Pyu89","Pyu8A","Pyu8B","Pyu8C","Pyu8D","Pyu8E","Pyu8F","Pyu8G","Pyu8H","Pyu8J","Pyu8K","Pyu8L","Pyu8M","Pyu8P","Pyu8Q","Pyu9.","Pyu90","Pyu91","Pyu92","Pyu93","Pyu94","Pyu95","Pyu96","Pyu98","Pyu99","Pyu9B","Pz...")
concept_set_codes_our_study[["MAJORCA_possible"]][["READ"]] <- c()
concept_set_codes_our_study[["MAJORCA_narrow"]][["ICPC"]] <- c("D81","H80","L82","N85","R89","U85","A90002","A90011","D81005","D81006","F81001","H80004","L82020","N85002","N85004","R89004")
concept_set_codes_our_study[["MAJORCA_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["MAJORCA_narrow"]][["SNOMED"]] <- c("D-5500","D-X250","M-20000","M-21510","NOCODE","U000276","U000277","U000295","U000360","107656002","112635002","118642009","156884008","156888006","156897005","156902006","156903001","156906009","156933008","156939007","156942001","156963004","156971000","156980000","156994004","156998001","157008000","157009008","157017000","157018005","157023005","157028001","157033002","157034008","17021009","19416009","203922009","203930005","204017003","204018008","204066001","204075004","204076003","204077007","204082000","204093003","204096006","204097002","204156006","204163006","204165004","204180005","204182002","204183007","204185000","204199001","204204007","204220002","204222005","204230006","204232003","204249005","204254001","204259006","204261002","204262009","204270004","204273002","204274008","204275009","204282008","204286006","204287002","204335004","204338002","204349008","204353005","204365009","204367001","204389002","204404009","204414000","204420004","204439009","204441005","204462006","204468005","204469002","204471002","204489001","204494001","204496004","204507004","204515001","204527003","204532002","204555004","204565005","204566006","204581000","204583002","204585009","204588006","204591006","204592004","204610002","204611003","204621006","204622004","204624003","204625002","204632006","204684000","204770000","204800009","204801008","204812008","204819004","204820005","204821009","204822002","204833004","204836007","204873005","204874004","204932008","204935005","204937002","204989007","204995008","205028008","205033007","205040008","205048001","205054000","205084008","205086005","205088006","205116003","205117007","205118002","205407005","205459004","205462001","205464000","205520006","205521005","205535007","205559002","205589009","205608008","205609000","205610005","205645002","205724000","205729005","205730000","205747004","205793001","205832003","205839007","205842001","205843006","205845004","205847007","205849005","205851009","205852002","205854001","205855000","205856004","205857008","205858003","205859006","205860001","205861002","205862009","205863004","205864005","205867003","205868008","205869000","205870004","205871000","205872007","205873002","205874008","205875009","205876005","205878006","205879003","205880000","205882008","205883003","205884009","205885005","205886006","205888007","205889004","205891007","205893005","205894004","205895003","205896002","205897006","205899009","205900004","205902007","205904008","205905009","205906005","205908006","205913005","205914004","205915003","205916002","205917006","205918001","205920003","205921004","205922006","205923001","205925008","205926009","205927000","205928005","205929002","205930007","205931006","205933009","205935002","205936001","205937005","205938000","205939008","205941009","205942002","205943007","205944001","205945000","205946004","205947008","205948003","205949006","205950006","205951005","205952003","205953008","205954002","205955001","205956000","205957009","205958004","205959007","205960002","205961003","205962005","205963000","205964006","205965007","205966008","205967004","205968009","205969001","205971001","205972008","205973003","205974009","205975005","205976006","205977002","205978007","205979004","205980001","205982009","205983004","205985006","205999005","21390004","231789000","253210009","253819001","253821006","253859003","253983005","268155007","268161005","268162003","268171007","268183009","268188000","268191000","268192007","268215004","268224008","268238001","268249007","268272009","268281003","268291009","268304007","268310007","268311006","268312004","268314003","268321003","268329001","268336000","268352002","268353007","268354001","268355000","268359006","275259005","275260000","276654001","276655000","302950004","304086001","33543001","38164009","385297003","40674007","409709004","41859001","443341004","47028006","6557001","66091009","66948001","67531005","69518005","73262007","73573004","74345006","77868001","8380000","87868007","88425004")
concept_set_codes_our_study[["MAJORCA_possible"]][["SNOMED"]] <- c()


#--------------------------
# MICROCEPHALY
concept_set_codes_our_study[["MICROCEPHALY_narrow"]][["ICD9"]] <- c("742.1")
concept_set_codes_our_study[["MICROCEPHALY_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["MICROCEPHALY_narrow"]][["ICD10"]] <- c("Q02")
concept_set_codes_our_study[["MICROCEPHALY_possible"]][["ICD10"]] <- c()
concept_set_codes_our_study[["MICROCEPHALY_narrow"]][["READ"]] <- c("P21..","P211.","P21z.")
concept_set_codes_our_study[["MICROCEPHALY_possible"]][["READ"]] <- c("22N5.","584..","584Z.")
concept_set_codes_our_study_excl[["MICROCEPHALY_possible"]][["READ"]] <- c("P21..","P211.","P21z.")
concept_set_codes_our_study[["MICROCEPHALY_narrow"]][["ICPC"]] <- c("N85007")
concept_set_codes_our_study[["MICROCEPHALY_possible"]][["ICPC"]] <- c("W41004")
concept_set_codes_our_study_excl[["MICROCEPHALY_possible"]][["ICPC"]] <- c("N85007")
concept_set_codes_our_study[["MICROCEPHALY_narrow"]][["SNOMED"]] <- c("M-21300","156893009","1829003","204030002","204031003","271572004")
concept_set_codes_our_study[["MICROCEPHALY_possible"]][["SNOMED"]] <- c("146437006","146454003","169219000","169235007","199685004","241491007","248395009","268445003","363812007","44656009")
concept_set_codes_our_study_excl[["MICROCEPHALY_possible"]][["SNOMED"]] <- c("M-21300","156893009","1829003","204030002","204031003","271572004")



#--------------------------
# NEONATALDEATH
concept_set_codes_our_study[["NEONATALDEATH_narrow"]][["ICD9"]] <- c()
concept_set_codes_our_study[["NEONATALDEATH_possible"]][["ICD9"]] <- c("798","798.0")
concept_set_codes_our_study[["NEONATALDEATH_narrow"]][["ICD10"]] <- c()
concept_set_codes_our_study[["NEONATALDEATH_possible"]][["ICD10"]] <- c("R95","R95","R96","R97","R98","R99")
concept_set_codes_our_study[["NEONATALDEATH_narrow"]][["READ"]] <- c("Q4z..")
concept_set_codes_our_study[["NEONATALDEATH_possible"]][["READ"]] <- c("13M2.","13MD.","22J..","22JZ.","Q4z..","R21..","R210.","R2100","R2101","R210z","R21z.","RyuC.")
concept_set_codes_our_study_excl[["NEONATALDEATH_possible"]][["READ"]] <- c("Q4z..")
concept_set_codes_our_study[["NEONATALDEATH_narrow"]][["ICPC"]] <- c("A95002")
concept_set_codes_our_study[["NEONATALDEATH_possible"]][["ICPC"]] <- c("A95003")
concept_set_codes_our_study_excl[["NEONATALDEATH_possible"]][["ICPC"]] <- c("A95002")
concept_set_codes_our_study[["NEONATALDEATH_narrow"]][["SNOMED"]] <- c("157167009","206602000","268887007","276506001","6254007")
concept_set_codes_our_study[["NEONATALDEATH_possible"]][["SNOMED"]] <- c("F-Y1800","F-Y1840","105444006","138274000","138284004","140067002","140074007","157167009","158717006","158718001","158728005","160956009","162851009","162858003","206602000","207533004","207534005","207535006","207536007","207538008","207548005","207670001","207671002","240297000","268887007","268923008","274644002","397709008","399347008","51178009","61626005","90049009")
concept_set_codes_our_study_excl[["NEONATALDEATH_possible"]][["SNOMED"]] <- c("157167009","206602000","268887007","276506001","6254007")


#--------------------------
# TOPFA
concept_set_codes_our_study[["TOPFA_narrow"]][["ICD9"]] <- c()
concept_set_codes_our_study[["TOPFA_possible"]][["ICD9"]] <- c("637","740","740","741","742","743","744","745","746","747","748","749","750","751","752","753","754","755","756","757","758","759","758","758.9","759","759.9","779.6")
concept_set_codes_our_study[["TOPFA_narrow"]][["ICD10"]] <- c()
concept_set_codes_our_study[["TOPFA_possible"]][["ICD10"]] <- c("F89","O00","001","002","003","004","005","006","007","O08","O04","O06","P96.4","Q80","Q81","Q83","Q84","Q85","Q86","Q87","Q88","Q89","Q89.7","Q89.9","Q99.9") #"O00-O08.9", ,"Q80-Q89.9"
concept_set_codes_our_study[["TOPFA_narrow"]][["READ"]] <- c()
concept_set_codes_our_study[["TOPFA_possible"]][["READ"]] <- c("7F02.","E2Fz.","L0...","L05..","L07..","L070z","L0z..","P....","PJ...","PJz..","PJzz.","PK...","PK7..","PKz..","Pyu9.","Pz...")
concept_set_codes_our_study[["TOPFA_narrow"]][["ICPC"]] <- c()
concept_set_codes_our_study[["TOPFA_possible"]][["ICPC"]] <- c("A90","D81","N85","W83","A90002","A90011","W82002","W83003")
concept_set_codes_our_study[["TOPFA_narrow"]][["SNOMED"]] <- c()
concept_set_codes_our_study[["TOPFA_possible"]][["SNOMED"]] <- c("D-5500","D-Y010","F-31600","M-20000","NOCODE","P-1755","U000205","U000276","U000277","U000295","U000360","107656002","112635002","116022009","1321008","149995009","149998006","156070002","156075007","156076008","156079001","156096000","156882007","157009008","157018005","157023005","157028001","157033002","157034008","177094005","192149001","198690009","198768001","198769009","198780009","198805006","198880003","200480007","205724000","205729005","205730000","205784002","205786000","205839007","205842001","205973003","205999005","21390004","240280006","267295002","267296001","267297005","268353007","268359006","276654001","276655000","287955003","302375005","363681007","385297003","386639001","409709004","443341004","444406006","5294002","57797005","66091009","67024003","70186003","70317007","74345006")

#--------------------------
# TRANSMYELITIS
concept_set_codes_our_study[["TRANSMYELITIS_narrow"]][["ICD9"]] <- c("341.2","341.20","323.82")
concept_set_codes_our_study[["TRANSMYELITIS_possible"]][["ICD9"]] <- c()
concept_set_codes_our_study[["TRANSMYELITIS_narrow"]][["ICD10"]] <- c("G37.3")
concept_set_codes_our_study[["TRANSMYELITIS_possible"]][["ICD10"]] <- c()
concept_set_codes_our_study[["TRANSMYELITIS_narrow"]][["READ"]] <- c("F037.","F037.")
concept_set_codes_our_study[["TRANSMYELITIS_possible"]][["READ"]] <- c()
concept_set_codes_our_study[["TRANSMYELITIS_narrow"]][["ICPC"]] <- c()
concept_set_codes_our_study[["TRANSMYELITIS_possible"]][["ICPC"]] <- c()
concept_set_codes_our_study[["TRANSMYELITIS_narrow"]][["SNOMED"]] <- c("D-8X07","16631009","192682002","47000000")
concept_set_codes_our_study[["TRANSMYELITIS_possible"]][["SNOMED"]] <- c()

#--------------------------
# COVCANCER
concept_set_codes_our_study[["COVCANCER"]][["ICD9"]] <- c("151.9","154.0","173.90","174.9","180.9","189.0","192.9","199.1","201.9","208.9","151","151.9","157","157.9","162.9","174","174.9","180","180.9","185","188","188.9","193","199","201","201.0","201.1","201.2","201.9","208","208.9")
concept_set_codes_our_study[["COVCANCER"]][["ICD10"]] <- c("C00","C01","C02","C03","C04","C05","C06","C07","C08","C09",paste0("C",rep(10:97)),"D77")

concept_set_codes_our_study[["COVCANCER"]][["READ"]] <- c("1I20.00","1Z0..00","1Z00.00","1Z01.00","5135.00","5136.00","5137.00","514..00","5141.00","5144.00","5145.00","5146.00","5149.00","514Z.00","515..00","5151.00","5152.00","5153.00","5154.00","5155.00","515Z.00","56B5.00","59...00","5953.00","596..00","5961.00","5962.00","5963.00","597..00","5971.00","5973.00","5974.00","5975.00","597Z.00","59Z..00","5A...00","5A...11","5A1..00","5A1Z.00","5A27.00","5A28.00","5A2Z.00","5A3..00","5A33.00","5A3Z.00","5A4..00","5A4Z.00","5A59.00","5A7..00","5A73.00","5A74.00","5A7Z.00","5A8..00","5A86.00","5A8Z.00","5AB..00","5AC..00","5AZ..00","65N..00","65NZ.00","677H.00","677K.00","67D2.00","67G2.00","7L10200","7L16100","7L16200","7L18200","7L18300","7L19300","7L1Xy00","7L1Y.00","7L1Z.00","7L1Z100","7L1Z300","7L1Z500","7L1Zy00","7L1Zz00","7L1b.00","7L1d.00","7L1d000","7L1dy00","7L1dz00","7L1e.00","7L1ez00","7L1h000","7L1i.00","7M0P.00","7M0P000","7M0P100","7M0P200","7M0P300","7M0P400","7M0P500","7M0Py00","7M0Pz00","7M0Q.00","7M0Q300","7M0c.00","7M0c400","7M0c500","7M0cy00","7M0cz00","7M34400","7M37100","863..00","863..12","863Z.00","8B3p.00","8BA2.00","8BA5.00","8BA5.11","8BAD.00","8BAD000","8BAI.00","8BAJ.00","8BAK.00","8BAL.00","8BAM.00","8BAN.00","8BAO.00","8BAP.00","8BAQ.00","8BAR.00","8BAS.00","8BAT.00","8BAV.00","8BAY.00","8BAa.00","8BAe.00","8BC3.00","8BJ1.00","8CL0.00","8CL1.00","8CM0.00","8CM1.00","8CM1000","8CM1100","8CM1200","8CM1300","8CM1400","8CM3.00","8CM4.00","8CME.00","8CP0.00","8CP1.00","8CR8.00","8CRC.00","8CV1.00","8F83.00","8H2G.00","8H3L.00","8H4G.00","8H67.00","8H6A.00","8H7L.00","8H7g.00","8HB6.00","8HB7.00","8HH6.00","8HH7.00","8HH8.00","8HJG.00","8HVV.00","8Hg0.00","8J...00","8J0..00","8J00.00","9EV3.00","9N0D.00","9N1y800","9N1yC00","9N4S.00","9NNS.00","9NNZ.00","9NX0.00","9NX1.00","9Ng7.00","9Nh0.00","9Nh1.00","9NlJ.00","9Ok0.00","9Ok1.00","9Ok3.00","9Ok5.00","9Ok6.00","9Ok7.00","9OkA.00","9OkC.00","9R59.00","9b9B.00","9b9I.00","9bB0.00","9e00.00","9e02.00","9h8..00","9h81.00","9h82.00","9hB..00","9hB0.00","9hB1.00","9ke..00","B....00","B....11","B0...00","B0...11","B00..00","B00..11","B000.00","B000000","B000100","B000z00","B001.00","B001000","B001100","B002.00","B002100","B002200","B002300","B002z00","B003.00","B003000","B003100","B003200","B003300","B003z00","B004.00","B004000","B004200","B004300","B005.00","B006.00","B007.00","B00z000","B00z100","B00zz00","B01..00","B010.00","B010.11","B010000","B010z00","B011.00","B011z00","B012.00","B013.00","B013100","B013z00","B014.00","B015.00","B016.00","B017.00","B01y.00","B01z.00","B02..00","B020.00","B021.00","B022.00","B02y.00","B02z.00","B03..00","B030.00","B031.00","B03z.00","B04..00","B040.00","B041.00","B042.00","B04y.00","B04z.00","B05..00","B050.00","B050.11","B051000","B051100","B052.00","B053.00","B054.00","B055.00","B055000","B055100","B055z00","B056.00","B057.00","B05y.00","B05z.00","B05z000","B06..00","B060.00","B060000","B060z00","B061.00","B062.00","B062000","B062100","B062200","B062300","B062z00","B063.00","B064.00","B064000","B064100","B064z00","B065.00","B066.00","B067.00","B06y.00","B06yz00","B06z.00","B07..00","B070.00","B071.00","B071000","B071100","B071z00","B072.00","B072000","B073.00","B073200","B073z00","B074.00","B07y.00","B07z.00","B08..00","B080.00","B081.00","B082.00","B083.00","B08y.00","B08z.00","B0z..00","B0z0.00","B0z1.00","B0z2.00","B0zy.00","B0zz.00","B1...00","B1...11","B10..00","B100.00","B101.00","B102.00","B103.00","B104.00","B105.00","B106.00","B107.00","B10y.00","B10z.00","B10z.11","B11..00","B11..11","B110.00","B110000","B110100","B110111","B110z00","B111.00","B111000","B111100","B111z00","B112.00","B113.00","B114.00","B115.00","B116.00","B117.00","B118.00","B119.00","B11y.00","B11y000","B11y100","B11yz00","B11z.","B11z.00","B12..00","B120.00","B121.00","B122.00","B123.00","B124.00","B12y.00","B12z.00","B13..00","B130.00","B131.00","B132.00","B133.00","B134.00","B134.11","B135.00","B136.00","B137.00","B138.00","B13y.00","B13z.00","B13z.11","B14..00","B140.00","B141.00","B141.11","B141.12","B142.00","B142.11","B142000","B143.00","B14y.00","B14z.00","B15..00","B150.00","B150000","B150100","B150200","B150300","B150z00","B151.00","B151000","B151200","B151400","B151z00","B152.00","B153.00","B15z.00","B16..00","B160.00","B160.11","B161.00","B161000","B161100","B161200","B161211","B161z00","B162.00","B163.00","B16y.00","B16z.00","B17..","B17..00","B170.00","B171.00","B172.00","B173.00","B174.00","B175.00","B17y.00","B17y000","B17yz00","B17z.","B17z.00","B18..00","B180.00","B180100","B180200","B180z00","B181.00","B18y.00","B18y100","B18y200","B18y300","B18y400","B18y500","B18y600","B18y700","B18yz00","B18z.00","B1z..00","B1z0.00","B1z0.11","B1z1.00","B1z1z00","B1z2.00","B1zy.00","B1zz.00","B2...00","B2...11","B20..00","B200.00","B200000","B200100","B200200","B200300","B200z00","B201.00","B201100","B201200","B201300","B201z00","B202.00","B203.00","B204.00","B205.00","B206.00","B20y.00","B20z.00","B21..00","B210.00","B211.00","B212.00","B213.00","B213000","B213100","B213300","B213z00","B214.00","B215.00","B21y.00","B21z.00","B22..00","B220.00","B220z00","B221.00","B221000","B221100","B221z00","B222.00","B222.11","B222000","B222100","B222z00","B223.00","B223000","B223100","B223z00","B224.00","B224000","B224100","B224z00","B225.00","B226.00","B22y.00","B22z.00","B22z.11","B23..00","B230.00","B232.00","B23y.00","B23z.00","B24..00","B240.00","B241.00","B241000","B241200","B241300","B241z00","B242.00","B243.00","B24X.00","B24y.00","B24z.00","B25..00","B26..00","B2z..00","B2z0.00","B2zy.00","B2zz.00","B3...00","B3...11","B3...12","B30..00","B30..11","B30..12","B300.00","B300000","B300100","B300200","B300300","B300400","B300500","B300600","B300700","B300800","B300900","B300A00","B300B00","B300C00","B300z00","B301.00","B302.00","B302000","B302100","B302200","B302z00","B303.00","B303000","B303100","B303200","B303300","B303400","B303500","B303z00","B304.00","B304000","B304200","B304300","B304400","B304z00","B305.00","B305.12","B305000","B305100","B305C00","B305D00","B305z00","B306.00","B306000","B306100","B306200","B306300","B306400","B306500","B306z00","B307.00","B307000","B307100","B307200","B307z00","B308100","B308200","B308300","B308800","B308B00","B308D00","B30W.00","B30X.00","B30z.00","B30z000","B31..00","B310.00","B310000","B310100","B310200","B310300","B310400","B310z00","B311.00","B311000","B311100","B311200","B311300","B311400","B311500","B312.00","B312100","B312200","B312300","B312400","B312500","B312z00","B313.00","B313000","B313100","B313200","B313z00","B314.00","B314000","B314100","B314z00","B315.00","B315000","B315100","B315200","B315z00","B316.00","B31y.00","B31z.00","B32..00","B320.00","B321.00","B322.00","B322000","B322z00","B323.00","B323000","B323100","B323200","B323300","B323400","B323500","B323z00","B324.00","B324000","B324100","B324z00","B325.00","B325000","B325100","B325200","B325300","B325500","B325600","B325700","B325800","B325z00","B326.00","B326000","B326100","B326200","B326300","B326400","B326500","B326z00","B327.00","B327000","B327100","B327200","B327300","B327400","B327500","B327600","B327700","B327800","B327900","B327z00","B32y.00","B32y000","B32z.00","B33..00","B33..14","B33..15","B330.00","B331.00","B331000","B331100","B331200","B332.00","B332000","B332100","B332200","B332z00","B333.00","B333000","B333100","B333200","B333300","B333400","B333500","B333z00","B334.00","B334000","B334100","B334z00","B335.00","B335000","B335100","B335200","B335300","B335400","B335500","B335600","B335700","B335800","B335900","B335A00","B335z00","B336.00","B336000","B336100","B336200","B336300","B336400","B336500","B336z00","B337.00","B337000","B337100","B337200","B337300","B337400","B337500","B337700","B337800","B337900","B337z00","B338.00","B33X.00","B33y.00","B33z.","B33z.00","B33z.11","B33z000","B34..","B34..00","B34..11","B340.00","B340000","B340100","B340z00","B341.00","B342.00","B343.00","B344.00","B345.00","B346.00","B347.00","B34y.00","B34y000","B34yz00","B34z.","B34z.00","B35..00","B350.00","B350000","B350100","B35z.00","B35z000","B35zz00","B3y..00","B3z..00","B4...00","B4...11","B40..00","B41..00","B41..11","B410.00","B410000","B410100","B410z00","B411.00","B412.00","B41y.00","B41y000","B41y100","B41yz00","B41z.","B41z.00","B42..00","B420.00","B43..00","B430.00","B430000","B430100","B430200","B430211","B430300","B430z00","B431.00","B431000","B431z00","B432.00","B43y.00","B43z.00","B44..00","B440.00","B440.11","B441.00","B443.00","B44y.00","B44z.00","B45..00","B450.00","B450100","B450z00","B451.00","B451000","B451z00","B452.00","B453.00","B454.00","B454.11","B45X.00","B45y.00","B45y000","B45z.00","B46..","B46..00","B47..00","B470.00","B470200","B470300","B470z00","B471.00","B471000","B471100","B471z00","B47z.00","B47z.11","B47z.12","B48..00","B480.00","B481.00","B482.00","B483.00","B484.00","B485.00","B486.00","B487.00","B48y.","B48y.00","B48y000","B48y100","B48y200","B48yz","B48yz00","B48z.00","B49..","B49..00","B490.00","B491.00","B492.00","B493.00","B494.00","B495.00","B496.00","B497.00","B49y.00","B49y000","B49z.","B49z.00","B4A..00","B4A..11","B4A0.00","B4A0000","B4A1.00","B4A1000","B4A1z00","B4A2.00","B4A3.00","B4A4.00","B4Ay.00","B4Ay000","B4Az.00","B4y..00","B4z..00","B5...00","B5...11","B50..00","B500.00","B500000","B500100","B500z00","B501.00","B501000","B501z00","B502.00","B503.00","B504.00","B505.00","B506.00","B507.00","B507100","B508.00","B50y.00","B50z.00","B51..00","B51..11","B510.00","B510000","B510100","B510300","B510400","B510500","B510z00","B511.00","B512.00","B512000","B512z00","B513.00","B514.00","B515.00","B515000","B516.00","B517.00","B517000","B517100","B517200","B517300","B517z00","B51y.00","B51y000","B51y200","B51yz00","B51z.00","B52..00","B520.00","B520000","B520100","B520200","B520z00","B521.00","B521z00","B522.00","B523.00","B523z00","B524.00","B524000","B524100","B524200","B524300","B524400","B524500","B524600","B525.00","B52W.00","B52X.00","B52y.00","B52z.","B52z.00","B53..","B53..00","B54..00","B540.00","B540.11","B540000","B540100","B540z00","B541.00","B542.00","B542000","B542100","B542z00","B543.00","B544.00","B545.00","B545000","B545100","B545200","B546.00","B54X.00","B54y.00","B54z.00","B55..00","B550.00","B550000","B550100","B550200","B550300","B550400","B550500","B550z00","B551.00","B551000","B551100","B551200","B551z00","B552.00","B553.00","B553000","B553100","B553z00","B554.00","B555.00","B55y.00","B55y000","B55y100","B55y200","B55yz00","B55z.00","B56..00","B56..11","B560.00","B560000","B560100","B560200","B560300","B560400","B560500","B560600","B560700","B560800","B560900","B560z00","B561.00","B561000","B561200","B561300","B561400","B561500","B561600","B561700","B561800","B561900","B561z00","B562.00","B562000","B562100","B562200","B562300","B562400","B562z00","B563.00","B563000","B563100","B563200","B563300","B563z00","B564.00","B564000","B564100","B564z00","B565.00","B565000","B565300","B565z00","B56y.00","B56z.00","B57..00","B57..11","B57..12","B570.00","B571.00","B572.00","B573.00","B574.00","B574000","B574200","B574z00","B575.00","B575000","B575100","B575z00","B576.00","B576000","B576100","B576200","B576z00","B577.00","B577.11","B57y.00","B57z.00","B58..00","B58..11","B580.00","B581.00","B581000","B581100","B581200","B581z00","B582.00","B582000","B582100","B582200","B582300","B582400","B582500","B582600","B582z00","B583.00","B583000","B583100","B583200","B583z00","B584.00","B585.00","B585000","B586.00","B587.00","B58y.00","B58y000","B58y100","B58y200","B58y211","B58y300","B58y400","B58y411","B58y500","B58y600","B58y700","B58y900","B58yz00","B58z.00","B59..","B59..00","B590.00","B590.11","B591.00","B592.00","B592X00","B59z.","B59z.00","B59zX00","B5y..00","B5z..00","B6...00","B6...11","B60..00","B600.00","B600000","B600100","B600300","B600700","B600z00","B601.00","B601000","B601100","B601200","B601300","B601500","B601z00","B602.00","B602100","B602200","B602300","B602500","B602z00","B60y.00","B60z.00","B61..","B61..00","B610.","B610.00","B6100","B610100","B610300","B610z","B611.","B611.00","B6110","B611100","B611z","B612.","B612.00","B6120","B612400","B612z","B613.00","B613000","B613100","B613200","B613300","B613500","B613600","B613z00","B614.00","B614000","B614100","B614200","B614300","B614400","B614800","B614z00","B615.00","B615000","B615100","B615200","B615z00","B616.00","B616000","B616400","B616z00","B61z.","B61z.00","B61z0","B61z000","B61z100","B61z200","B61z400","B61z500","B61z700","B61z800","B61zz00","B62..00","B620.00","B620000","B620100","B620300","B620500","B620800","B620z00","B621.00","B621000","B621300","B621400","B621500","B621800","B621z00","B622.00","B622z00","B623.00","B623000","B623100","B623300","B623z00","B624.00","B624.11","B624.12","B624000","B624300","B624z00","B625.00","B625.11","B625800","B625z00","B626.00","B626500","B626800","B626z00","B627.00","B627000","B627100","B627200","B627300","B627500","B627600","B627700","B627800","B627900","B627911","B627A00","B627B00","B627C00","B627C11","B627D00","B627W00","B627X00","B62x.00","B62x000","B62x100","B62x200","B62x400","B62x500","B62x600","B62xX00","B62y.00","B62y000","B62y100","B62y200","B62y300","B62y400","B62y500","B62y600","B62y700","B62y800","B62yz00","B62z.00","B62z100","B62z200","B62z500","B62z800","B62zz00","B62zz11","B63..00","B630.00","B630.11","B630.12","B630000","B630100","B630200","B630300","B631.00","B63y.00","B63z.00","B64..00","B64..11","B640.00","B641.00","B641.11","B642.00","B64y.00","B64y100","B64y200","B64yz00","B64z.00","B65..00","B650.00","B651.00","B651.11","B651000","B651z00","B652.00","B653.00","B653000","B653100","B65y100","B65yz00","B65z.00","B66..00","B66..12","B660.00","B661.00","B66y.00","B66z.00","B67..00","B670.00","B670.11","B671.00","B671.11","B672.00","B672.11","B673.00","B674.00","B67y.00","B67y000","B67yz00","B67z.00","B68..","B68..00","B680.00","B681.00","B682.00","B68y.00","B68z.","B68z.00","B69..00","B690.00","B691.00","B6y..00","B6y0.00","B6y0.11","B6y1.00","B6z..00","B6z0.00","B8...12","B8...13","B80..11","B805000","B831.12","B831.13","B833311","B833400","B833500","B833600","B834000","B9...00","B90..00","B900.00","B900000","B900011","B900100","B900200","B900z00","B901.00","B901.11","B901.12","B901000","B901100","B901300","B901400","B901500","B901600","B901700","B901800","B901900","B902.00","B902000","B902100","B902200","B902300","B902400","B902500","B903.00","B903.11","B903000","B903200","B903300","B903500","B903700","B904000","B904100","B905000","B905100","B905200","B905300","B905400","B906.00","B906000","B906100","B906200","B906300","B906600","B906800","B906z00","B907000","B907100","B907200","B907z00","B908000","B908100","B908200","B90z.00","B90z000","B90z300","B90z400","B90z500","B90z600","B90z700","B90z800","B91..00","B910.00","B911013","B912.00","B913.00","B913000","B913100","B914.00","B915.00","B916000","B916100","B916200","B916z00","B917.00","B91z.00","B91z.11","B91z100","B91z111","B91z200","B91zz00","B92..00","B920.00","B920000","B920100","B920z00","B921.00","B922.00","B923.00","B923000","B923100","B923300","B923z00","B924000","B924100","B924z00","B925000","B925100","B925300","B926.00","B926000","B927.11","B927.12","B928.00","B929.00","B92z.00","B93..00","B930000","B930z00","B931.00","B932.00","B933.00","B933.11","B934.00","B934.11","B934.12","B935.00","B935.11","B935.12","B936.00","B936.11","B936.12","B937.00","B937.11","B937.12","B937000","B937100","B937200","B937300","B937400","B937411","B937500","B937W00","B937X00","B93X.00","B93y000","B93y100","B93yz00","B93z.00","B9y..00","B9z..00","BA...00","BA0..00","BA00.00","BA01.00","BA02.00","BA02000","BA02200","BA02z00","BA03.00","BA04.00","BA05.00","BA06.00","BA07.00","BA0y.00","BA0z.00","BAz..00","BB...00","BB...11","BB0..00","BB02.","BB02.00","BB03.00","BB03.11","BB03.12","BB03.13","BB04.00","BB07.00","BB08.00","BB09.00","BB0A.00","BB0z.00","BB1..00","BB11.11","BB12.00","BB13.00","BB13.11","BB14.00","BB16.00","BB17.00","BB18.00","BB19.00","BB1A.00","BB1B.00","BB1C.00","BB1D.00","BB1E.00","BB1F.00","BB1G.00","BB1H.00","BB1J.00","BB1J.12","BB1K.00","BB1L.00","BB1M.00","BB1N.00","BB1z.00","BB2..00","BB2..11","BB2..12","BB22.00","BB24.00","BB24.11","BB24.12","BB26.00","BB26.11","BB29.12","BB29.13","BB2A.00","BB2A.11","BB2A.12","BB2A.13","BB2B.00","BB2C.00","BB2C.11","BB2D.00","BB2E.00","BB2F.00","BB2G.00","BB2H.00","BB2J.00","BB2K.00","BB2M.00","BB2N.00","BB2z.00","BB35.00","BB36.00","BB37.00","BB38.00","BB38.12","BB39.00","BB3A.00","BB3B.00","BB3B.11","BB43.00","BB43.11","BB46.00","BB47.00","BB48.00","BB49.00","BB4A.00","BB4B.00","BB5..00","BB5..11","BB5..12","BB50.00","BB50000","BB52.00","BB52000","BB53.00","BB54.00","BB55.00","BB56.00","BB57.00","BB58.00","BB59.00","BB5B.00","BB5B000","BB5B011","BB5B100","BB5B200","BB5B300","BB5B400","BB5B500","BB5B600","BB5Bz00","BB5C.00","BB5C000","BB5C011","BB5C100","BB5Cz00","BB5D.00","BB5D.11","BB5D000","BB5D011","BB5D100","BB5D111","BB5D200","BB5D300","BB5D400","BB5D411","BB5D500","BB5D511","BB5D512","BB5D513","BB5Dz00","BB5E.00","BB5F.00","BB5G.00","BB5H.00","BB5H.11","BB5J.00","BB5J.11","BB5J.12","BB5J.13","BB5K.00","BB5M.00","BB5M000","BB5M100","BB5Mz00","BB5N011","BB5N100","BB5P.00","BB5R.00","BB5R000","BB5R100","BB5R111","BB5R200","BB5R211","BB5R400","BB5R500","BB5R600","BB5R611","BB5R800","BB5R900","BB5RA00","BB5Rz00","BB5S.00","BB5S000","BB5S100","BB5S200","BB5S211","BB5S212","BB5S300","BB5S400","BB5Sz00","BB5T.00","BB5T000","BB5T100","BB5Tz00","BB5U.00","BB5U000","BB5U100","BB5U200","BB5U300","BB5U311","BB5U312","BB5Uz00","BB5V.00","BB5V000","BB5V100","BB5V200","BB5V211","BB5V311","BB5V600","BB5V611","BB5V700","BB5V711","BB5Vz00","BB5W.00","BB5W000","BB5W011","BB5W012","BB5W013","BB5W100","BB5W111","BB5W112","BB5Wz00","BB5X.00","BB5X000","BB5X100","BB5Xz00","BB5Y.00","BB5a.00","BB5a000","BB5a011","BB5a012","BB5az00","BB5b.00","BB5c.00","BB5c000","BB5c100","BB5cz00","BB5e.00","BB5f.00","BB5f000","BB5f100","BB5f111","BB5f200","BB5f300","BB5f400","BB5f500","BB5f511","BB5f600","BB5f700","BB5fz00","BB5g.00","BB5h.00","BB5h000","BB5h100","BB5h400","BB5h600","BB5hz00","BB5j.00","BB5j000","BB5j011","BB5j100","BB5j200","BB5jz00","BB5y.00","BB5y100","BB5y200","BB5y300","BB5y400","BB5z.00","BB6..00","BB60.00","BB60000","BB60100","BB61.00","BB61000","BB61011","BB61012","BB61013","BB61100","BB61200","BB62.00","BB62000","BB62100","BB63.00","BB63.11","BB63.12","BB64.00","BB64.11","BB65.00","BB66.00","BB67.00","BB68.00","BB69.00","BB69000","BB69100","BB69z00","BB6A.00","BB6B.00","BB6z.00","BB7..00","BB70.00","BB71.00","BB7z.00","BB8..00","BB80.00","BB80000","BB80011","BB80100","BB80200","BB80z00","BB81.00","BB81.11","BB81.12","BB81.13","BB81.14","BB81000","BB81100","BB81200","BB81300","BB81400","BB81500","BB81600","BB81800","BB81B00","BB81C00","BB81C11","BB81D00","BB81E00","BB81E11","BB81F00","BB81H00","BB81J00","BB81K00","BB81L00","BB81M00","BB81z00","BB82.00","BB82000","BB82100","BB82111","BB82112","BB82113","BB82114","BB82z00","BB83.00","BB84.00","BB85.00","BB85000","BB85100","BB85111","BB85z00","BB8z.00","BB9..00","BB90.00","BB91.00","BB91.11","BB91000","BB91100","BB92.00","BB93.00","BB94.00","BB94.11","BB95.11","BB97.00","BB9A.11","BB9A.12","BB9B.00","BB9B.11","BB9C.00","BB9D.00","BB9F.00","BB9G.00","BB9H.00","BB9J.00","BB9J.11","BB9K.00","BB9K000","BB9L.00","BB9M.00","BB9z.00","BBA..00","BBA0.00","BBA1.00","BBA2.00","BBAz.00","BBB..00","BBB0.00","BBB1.00","BBB1.11","BBB2.00","BBB2.11","BBB3.00","BBB4.00","BBB5.00","BBB6.00","BBB6100","BBB6z00","BBB7.00","BBC..00","BBC0.00","BBC0.11","BBC0.12","BBC0.13","BBC0000","BBC1.00","BBC1000","BBC1200","BBC3.00","BBC3000","BBC4.00","BBC5.00","BBC6.00","BBC6z11","BBC7.00","BBC9.00","BBC9.11","BBC9.12","BBC9.13","BBC9.14","BBCA.00","BBCB.00","BBCC.00","BBCC100","BBCCz00","BBCCz11","BBCD.00","BBCE.00","BBCF.00","BBCG.00","BBD..00","BBD0.00","BBD1.00","BBD3.00","BBD4.00","BBD4.11","BBD5.00","BBD6.00","BBD7.00","BBD7.11","BBD9.00","BBDA.00","BBDB.00","BBDC.00","BBDD.00","BBDE.00","BBDF.00","BBDz.00","BBE..00","BBE1.00","BBE1.11","BBE1.12","BBE1.13","BBE1.14","BBE1000","BBE1100","BBE2.00","BBE4.00","BBE8.11","BBEA.00","BBED.00","BBEF.00","BBEF.11","BBEG.00","BBEG.11","BBEG000","BBEH.00","BBEN.11","BBEP.00","BBEQ.00","BBES.00","BBET.00","BBEz.00","BBF..00","BBF1.00","BBF2.00","BBF3.00","BBF4.00","BBF4.11","BBF5.00","BBF5.11","BBF6.00","BBFz.00","BBGA.11","BBGA.12","BBGB.11","BBGK.12","BBH..00","BBH0.00","BBH1.00","BBHZ.00","BBHz.00","BBJ..00","BBJ0.00","BBJ1.00","BBJ3.00","BBJ4.11","BBJ5.00","BBJ5.12","BBJ7.00","BBJ8.00","BBJ9.00","BBJ9.11","BBJA.00","BBJB.00","BBJB000","BBJB200","BBJBz00","BBJC.00","BBJD.00","BBJD.11","BBJE.00","BBJF.00","BBJH.00","BBJz.00","BBK..00","BBK0.00","BBK0000","BBK0100","BBK0200","BBK0300","BBK0311","BBK0400","BBK0500","BBK0600","BBK0700","BBK0z00","BBK1.00","BBK1000","BBK1011","BBK1012","BBK1100","BBK1z00","BBK2.00","BBK2000","BBK2100","BBK2z00","BBK3.00","BBK3000","BBK3100","BBK3200","BBK3400","BBK3600","BBK3611","BBK3700","BBK3800","BBK3z00","BBKz.00","BBL..00","BBL0.00","BBL1.00","BBL1.11","BBL2.00","BBL3.00","BBL3.11","BBL3.12","BBL4.00","BBL5.00","BBL6.00","BBL7.00","BBL7.11","BBL7000","BBL7100","BBL7111","BBL7112","BBL7200","BBL8.00","BBL9.00","BBLA.00","BBLA.11","BBLB.00","BBLC.00","BBLC100","BBLCz00","BBLD.00","BBLE.00","BBLF.00","BBLG.00","BBLH.00","BBLJ.00","BBLM.00","BBLz.00","BBM0.00","BBM0000","BBM0100","BBM0z00","BBM8.00","BBM9.00","BBN..00","BBN1.00","BBN1.11","BBN4.00","BBN5.00","BBNz.00","BBP..00","BBP1.00","BBP5.00","BBP7.00","BBP8.00","BBP9.00","BBPX.00","BBPz.00","BBQ..00","BBQ0.00","BBQ1.00","BBQ1000","BBQ1100","BBQ1z00","BBQ2.00","BBQ3.00","BBQ4.00","BBQ4.12","BBQ4.14","BBQ6.00","BBQ7.00","BBQ7011","BBQ7012","BBQ7100","BBQ7200","BBQ7211","BBQ7212","BBQ7213","BBQ7300","BBQ7400","BBQ7500","BBQ7z00","BBQ8.00","BBQ8.11","BBQ9.00","BBQA000","BBQA100","BBQA200","BBQB.00","BBQz.00","BBR..00","BBR1.11","BBR1.12","BBR2.00","BBR3.00","BBR4.00","BBR6.00","BBRz.00","BBS..00","BBS3.00","BBT..00","BBT0.11","BBT0.12","BBT1.00","BBT1.11","BBT7.00","BBT7100","BBT7z00","BBT7z11","BBTA.00","BBTB.00","BBTD100","BBTDz00","BBTF.00","BBTF.11","BBTJ.00","BBTK.00","BBTL.00","BBTz.00","BBU..00","BBU..11","BBU0.00","BBU1.00","BBU2.00","BBU3.00","BBU4.00","BBU4.11","BBU4.12","BBU5.00","BBU6.00","BBU7.00","BBUz.00","BBV..00","BBV..11","BBV..12","BBV0.00","BBV1.00","BBV1.11","BBV1.12","BBV1.13","BBV2.00","BBV4.00","BBV5.00","BBV7.00","BBV8.00","BBV8.11","BBV9.00","BBVA.00","BBVz.00","BBW..00","BBW0.00","BBW0.11","BBW0.12","BBW0.13","BBW1.00","BBW1.11","BBW2.00","BBW2.11","BBW3.00","BBW4.00","BBW5.00","BBW5.11","BBW6.00","BBW7.00","BBW7.11","BBW8.00","BBW9.00","BBWz.00","BBX..00","BBX0.00","BBX0.11","BBX1.00","BBX1.11","BBX1.12","BBX2.00","BBX3.00","BBXz.00","BBY..00","BBY0.00","BBY0.11","BBY1.00","BBY1.11","BBYz.00","BBZ..00","BBZ1.00","BBZ2.00","BBZ2.11","BBZ3.00","BBZ4.00","BBZ7.00","BBZ8.00","BBZ9.00","BBZA.00","BBZC.00","BBZD.00","BBZD.11","BBZE.00","BBZF.00","BBZF.11","BBZG.00","BBZG.11","BBZH.00","BBZJ.00","BBZK.00","BBZP.00","BBZz.00","BBa..00","BBa0.00","BBa0.11","BBa1.00","BBa2.00","BBa3.00","BBa4.00","BBa4.11","BBa4.12","BBa4.13","BBa5.00","BBaz.00","BBb..00","BBb0.00","BBb0.11","BBb0.12","BBb1.00","BBb2.00","BBb2.11","BBb3.00","BBb3.11","BBb3.12","BBb3.13","BBb4.00","BBb7.00","BBb8.00","BBb8.11","BBb9.00","BBbA.00","BBbB.00","BBbB.11","BBbC.00","BBbE.00","BBbG.00","BBbG.11","BBbG.12","BBbK.00","BBbL.00","BBbL.11","BBbM.00","BBbQ.00","BBbR.00","BBbS.00","BBbT.00","BBbU.00","BBbV.00","BBbW.00","BBbZ.00","BBba.00","BBbz.00","BBc..00","BBc0.00","BBc0000","BBc0011","BBc0100","BBc0200","BBc1.00","BBc2.00","BBc4.00","BBc6.00","BBc6.11","BBc7.00","BBc7.11","BBc9.00","BBc9z00","BBcA.00","BBcC.00","BBcC.11","BBcz.00","BBd..00","BBd0.00","BBd1.00","BBd1.11","BBd1.12","BBd2.00","BBd2.11","BBd2.12","BBd3.00","BBd3.11","BBd5.00","BBd6.00","BBd7.00","BBd7.11","BBd8.00","BBd9.00","BBdA.00","BBdz.00","BBe..00","BBe1.12","BBe5.00","BBe5.11","BBe5.12","BBe5.13","BBe6.00","BBe7.00","BBe7.11","BBe8.00","BBe9.00","BBeA.00","BBez.00","BBf..00","BBf0.00","BBf2.00","BBg..00","BBg1.00","BBg1.11","BBg1000","BBg2.00","BBg2.11","BBg3.00","BBg4.00","BBg5.00","BBg6.00","BBg7.00","BBg8.00","BBgA.00","BBgB.00","BBgC.00","BBgC.11","BBgC.12","BBgD.00","BBgE.00","BBgG.00","BBgG.11","BBgG.12","BBgG.13","BBgH.00","BBgJ.00","BBgK.00","BBgL.00","BBgM.00","BBgN.00","BBgP.00","BBgR.00","BBgS.00","BBgT.00","BBgV.00","BBgz.00","BBh0.00","BBh0.11","BBh2.00","BBj..","BBj..00","BBj0.00","BBj0.11","BBj1.00","BBj1000","BBj1100","BBj2.00","BBj6.00","BBj6000","BBj6100","BBj6200","BBj7.00","BBj8.","BBj9.","BBj9.00","BBjA.","BBjz.00","BBk..00","BBk0.00","BBk0.11","BBk0.12","BBk0.13","BBk2.00","BBk5.00","BBk7.00","BBk8.00","BBkz.00","BBl..00","BBl0.00","BBl1.00","BBlz.00","BBm..00","BBm0.00","BBm1.00","BBm1.11","BBm2.00","BBm3.00","BBm3.12","BBm4.00","BBm5.00","BBm6.00","BBm7.00","BBm8.00","BBm9.00","BBmA.00","BBmB.00","BBmC.00","BBmD.00","BBmE.00","BBmF.00","BBmH.00","BBmJ.00","BBmK.00","BBmL.00","BBn..00","BBn0.00","BBn0.11","BBn0.12","BBn0.13","BBn0.14","BBn2.00","BBn2.12","BBn3.00","BBnz.00","BBp..00","BBp0.00","BBp1.00","BBp2.00","BBpz.00","BBr..","BBr..00","BBr0.","BBr0.00","BBr00","BBr0000","BBr0100","BBr0111","BBr0112","BBr0113","BBr0200","BBr0300","BBr0400","BBr0z","BBr0z00","BBr2.00","BBr2000","BBr2011","BBr2100","BBr2300","BBr2500","BBr2600","BBr2700","BBr3.00","BBr4.00","BBr4000","BBr4z00","BBr6.00","BBr6000","BBr6011","BBr6012","BBr6100","BBr6300","BBr6311","BBr6600","BBr6700","BBr6800","BBr6z00","BBr8.00","BBr8000","BBr9000","BBrA.00","BBrA100","BBrA111","BBrA300","BBrA311","BBrA312","BBrA400","BBrA500","BBrz.00","BBs..00","BBs0.00","BBs0.11","BBs1.00","BBs2.00","BBs4.00","BBs5.00","BBsz.00","BBv..00","BBv0.00","BBv2.00","BBy..00","BByz.00","BBz..00","By...00","Byu..00","Byu0.00","Byu1.00","Byu1100","Byu1200","Byu1300","Byu2.00","Byu20","Byu2000","Byu2100","Byu2300","Byu2400","Byu2500","Byu3.00","Byu3100","Byu3200","Byu3300","Byu4.00","Byu4000","Byu4100","Byu4200","Byu43","Byu4300","Byu5.00","Byu5000","Byu5011","Byu5100","Byu5300","Byu5700","Byu5800","Byu5900","Byu5A00","Byu5B00","Byu6.00","Byu7.00","Byu7000","Byu7100","Byu7300","Byu8.00","Byu8000","Byu8200","Byu9.00","Byu9000","ByuA.00","ByuA000","ByuA100","ByuA200","ByuA300","ByuB.00","ByuB100","ByuC.00","ByuC000","ByuC100","ByuC200","ByuC300","ByuC400","ByuC500","ByuC600","ByuC700","ByuC8","ByuC800","ByuD.00","ByuD000","ByuD100","ByuD200","ByuD300","ByuD500","ByuD600","ByuD700","ByuD800","ByuD900","ByuDB00","ByuDC00","ByuDE00","ByuDF00","ByuDF11","ByuE.00","ByuE000","ByuG600","ByuG900","ByuGN00","ByuHD00","Bz...00","C162100","C171100","D201311","D400312","Dyu45","F16y100","F464600","F502100","H4y0.00","H4y0000","H4y1.00","H4y1z00","J08zE00","J430.00","J430000","J430100","J430200","J430300","J430z00","J574E00","K15y100","K26y300","K421300","K562100","SC42.00","SL31.00","SL31z00","SN0..00","SN00.00","SN01.00","SN0z.00","TA32.00","TB12100","TJ31.00","TJ31B00","TJ31C00","TJ31D00","TJ31z00","TJ33.00","U603100","U603300","U603311","U60331J","U613200","U642.00","X78e2","X78ef","X78gA","X78gs","X78iu","X78j7","XE1vR","XE1vc","XE1vi","XE1we","XE1xJ","XE1y5","XE20H","XaC2n","Z172.00","Z1FC600","Z4B3.00","Z6E2.00","Z9J1112","Z9KG500","ZG42.00","ZL13.00","ZL13100","ZL13200","ZL18R00","ZL19400","ZL22700","ZL22800","ZL22F00","ZL54100","ZL54111","ZL5AP00","ZL62800","ZL62F00","ZL93.00","ZL93100","ZL93200","ZL97400","ZL9AR00","ZLA2700","ZLA2800","ZLA2F00","ZLD2400","ZLD2500","ZLD2W00","ZLD3R00","ZLD7D00","ZLE3.00","ZLE3100","ZLE6P00","ZR38.00","ZRVy.00","ZV07200","ZV07300","ZV07311","ZV57C00","ZV58000","ZV58100","ZV58800","ZV66100","ZV66200","ZV67100","ZV67200","ZV67600","ZV67700","ZV67800","ZV67900","ZV67A00","ZV67B00","ZV6B000","ZV6B100","ZVu0D00","ZVu1B00","ZVu3L00","B11z.","B17..","B17z.","B33..","B34..","B34z.","B41z.","B46..","B48y.","B48yz","B49..","B49z.","B4A..","B52z.","B53..","B59..","B59z.","B6100","B6110","B6120","B61z0","B68..","BB02.","BBr..","BBr0z","Byu20","Byu43","ByuC8")
                                                          concept_set_codes_our_study[["COVCANCER"]][["ICPC"]] <- c("B72","B73","B74","D74","D75","D76","D77","F74","H75","K72","N74","R84","R85","S77","T71","T73","U75","U76","U77","W72","X75","X77","Y77","Y78","A79001","B72001","B72003","B72004","B73001","D74001","D76001","H75006","K72004","L71014","R86005","R92003","S77005","T71001","U75002","U76001","X75001","X76001","Y77001")
                                                          concept_set_codes_our_study[["COVCANCER"]][["SNOMED"]] <- c("D-Y033","M-8000","M-8001","M-8002","M-8003","M-9650","M-9651","M-9652","M-9653","M-9660","M-9661","M-9662","M-9663","M-9802","M-9802","U000397","U000401","U000402","118599009","118602004","118605002","118606001","126667002","128516002","14537002","154432008","154433003","154453004","154479008","154540000","154542008","154554008","154577008","154582001","154598008","187597000","187731004","187750004","187800001","187875007","188143008","188146000","188161004","188174005","188186008","188233004","188237003","188248005","188249002","188334007","188475001","188482002","188521005","188522003","188532005","188533000","188542007","188543002","188552006","188595005","188596006","188605006","188762002","188767008","189987006","189991001","189992008","190024009","190025005","190029004","190071003","190092003","190107001","190150006","191445004","254885005","255049003","255080008","269458007","269465004","269509006","269513004","269532005","269556009","269607003","269623003","269626006","269634000","309831004","363228008","363346000","363349007","363354003","363418001","363448003","363455001","363478007","363511009","363518003","363519006","372063002","372064008","372087000","372130007","38807002","399068003","399326009","448708002","46923007","52337003","70600005","721573003","74189002","86049000","87163000","93143009","93689003","93752005","93796005","93849006","93923002","93938001","93974005","94047004","94074003","94098005")
                                                          
                                                          
                                                          
                                                          #--------------------------
                                                          # COVCOPD
                                                          concept_set_codes_our_study[["COVCOPD"]][["ICD9"]] <- c("491.2","491.20","493.2","493.9","496","519.9")
                                                          concept_set_codes_our_study[["COVCOPD"]][["ICD9"]] <- c("490","491","492","493","494","495","496","491","491.2","491.9","492","493","493.2","493.9")
                                                          concept_set_codes_our_study[["COVCOPD"]][["ICD10"]] <- c("J40","J41","J42","J43","J44","J45","J46","J47","J42","J43","J43.9","J44","J44.9","J45","J45.9","J45.90","J45.909","J98.9") #"J40-J47.9",
                                                          concept_set_codes_our_study[["COVCOPD"]][["READ"]] <- c("H3...","H31..","H3121","H312z","H31z.","H32..","H32z.","H33..","H33z.","H3z..","Hyu3.","X101n","XE0YX","j43..","m4m..","H3...","H31..","H3121","H312z","H31z.","H32..","H32z.","H33..","H33z.","H33zz","H3z..","Hyu3.")
                                                          concept_set_codes_our_study[["COVCOPD"]][["ICPC"]] <- c("R95","R96","R79003","R91001","R95001","R95002","R95004","R95006","R95009","R96001")
                                                          concept_set_codes_our_study[["COVCOPD"]][["SNOMED"]] <- c("D-4790","D-7509","D-7651","M-32800","13645005","155565006","155566007","155569000","155572007","155573002","155574008","155579003","155585005","155617000","17097001","185086009","187687003","195935004","195948000","195950008","195952000","195956002","195967001","195979001","195983001","196003006","196229000","21341004","266365004","266395007","266398009","278517007","329981000","332002004","413846005","63480004","71435009","80959009","87433001","96334000")
                                                          
                                                          
                                                          #--------------------------
                                                          # COVHIV
                                                          concept_set_codes_our_study[["COVHIV"]][["ICD9"]] <- c("042","279.3")
                                                          concept_set_codes_our_study[["COVHIV"]][["ICD10"]] <- c("B20","B21","B23","B24","B24","D84.9")
                                                          concept_set_codes_our_study[["COVHIV"]][["READ"]] <- c("A788z","AyuC.","AyuCD","C393.","X20GZ","X70M6","X70O0","XE0RX","A788.","A788z","AyuC.","AyuCD","C393.")
                                                          concept_set_codes_our_study[["COVHIV"]][["ICPC"]] <- c("B90","B90001","B90002","B99011")
                                                          concept_set_codes_our_study[["COVHIV"]][["SNOMED"]] <- c("D-4600","NOCODE","123321001","154368002","186705005","186715004","187438009","187453001","191005003","234532001","234644008","240611008","266201009","62246005","62479008","64431000","86406008")
                                                          
                                                          
                                                          #--------------------------
                                                          # COVCKD
                                                          concept_set_codes_our_study[["COVCKD"]][["ICD9"]] <- c("585.9","585","585.2","585.3","585.4","585.6","585.9")
                                                          concept_set_codes_our_study[["COVCKD"]][["ICD10"]] <- c("N18","N18.0","N18.2","N18.3","N18.4","N18.5","N18.6","N18.9")
                                                          concept_set_codes_our_study[["COVCKD"]][["READ"]] <- c("K0D..","X30In","X30Iz","X30J0","XE0df","1Z1..","K05..","K050.","K0E..")
                                                          concept_set_codes_our_study[["COVCKD"]][["ICPC"]] <- c("U99023")
                                                          concept_set_codes_our_study[["COVCKD"]][["SNOMED"]] <- c("D-6505","D-6512","155856009","197654000","197655004","197755007","236425005","236433006","433146000","46177005","709044004","723190009","90688005")
                                                          
                                                          
                                                          #--------------------------
                                                          # COVDIAB
                                                          concept_set_codes_our_study[["COVDIAB"]][["ICD9"]] <- c("250.0")
                                                          concept_set_codes_our_study[["COVDIAB"]][["ICD9"]] <- c("250","250.0","250.1","250.5","250.6","250.7","250.9")
                                                          concept_set_codes_our_study[["COVDIAB"]][["ICD10"]] <- c("E08","E09","E10","E11","E12","E13","E10","E10.6","E10.69","E11","E11.6","E11.69","E13.6","E13.69","E14","E14.5","E14.8","E14.9")
                                                          concept_set_codes_our_study[["COVDIAB"]][["READ"]] <- c("C10..","C100.","C100z","C101.","C101z","C105.","C105z","C107z","C10y0","C10y1","C10yy","C10z.","C10zz","Cyu20","G73y0","X00Ag","X40J4","X40J5","XE10I","C10..","C100.","C100z","C101.","C101z","C105.","C105z","C106.","C107.","C107z","C108.","C10E.","C10F.","C10y0","C10y1","C10yy","C10z.","C10zz","Cyu20","F372.","G73y0")
                                                          concept_set_codes_our_study[["COVDIAB"]][["ICPC"]] <- c("T90","N94012","T89001","T89002","T89003","T89004","T90002","T90003","T90004","T90005","T90006","T90007","T90008","T90009")
                                                          concept_set_codes_our_study[["COVDIAB"]][["SNOMED"]] <- c("D-2381","D-2386","D-2387","D-2394","D-241X","D-241Y","D-8X52","111552007","127014009","154671004","154672006","154673001","154674007","154678005","154683002","190321005","190322003","190323008","190324002","190328004","190343002","190348006","190349003","190353001","190354007","190361006","190362004","190384004","190418009","190419001","190420007","190422004","190426001","191044006","191045007","193182005","230572002","24927004","25093002","267383000","267467004","267468009","267469001","267471001","267472008","267473003","372069003","420422005","44054006","46635009","73211009","74627003","866003","982001")
                                                          
                                                          #--------------------------
                                                          # COVOBES
                                                          concept_set_codes_our_study[["COVOBES"]][["ICD9"]] <- c("278.00","278.01","278.03","278.0","278.00","278.01","278.03","278.1")
                                                          concept_set_codes_our_study[["COVOBES"]][["ICD10"]] <- c("E65","E65","E67","E68","E66","E66.0","E66.2","E66.9")
                                                          concept_set_codes_our_study[["COVOBES"]][["READ"]] <- c("C38..","C380.","C3800","C3802","C38z.","Cyu7.","X40YQ","X40YR","X40YT","XE2Q3","XaBM0","C38..","C380.","C3800","C3802","C3803","C381.","C38y0","C38z.","C38z0","Cyu7.")
                                                          concept_set_codes_our_study[["COVOBES"]][["ICPC"]] <- c()
                                                          concept_set_codes_our_study[["COVOBES"]][["SNOMED"]] <- c("D-7711","M-71800","M-72550","U000367","11948000","154776002","154777006","190962009","190963004","190964005","190966007","190967003","190972007","190973002","190974008","190975009","191090003","238136002","270486005","308124008","389986000","414915002","414916001","415530009","5476005","78897001","83911000119104")
                                                          
                                                          #--------------------------
                                                          # COVSICKLE
                                                          concept_set_codes_our_study[["COVSICKLE"]][["ICD9"]] <- c("282.40","282.41","282.49","282.60","282.62","282.63","282.4","282.40","282.6","282.60","282.61","282.62","282.63","282.64")
                                                          concept_set_codes_our_study[["COVSICKLE"]][["ICD10"]] <- c("D56","D56.9","D57","D57.0","D57.00","D57.1","D57.2","D57.20","D57.21","D57.219","D57.4","D57.40")
                                                          concept_set_codes_our_study[["COVSICKLE"]][["READ"]] <- c("D106.","D1060","D1062","D1063","D106z","X20Cw","XE13k","XE13n","D104.","D104A","D104z","D106.","D1060","D1062","D1063","D106z")
                                                          concept_set_codes_our_study[["COVSICKLE"]][["ICPC"]] <- c("B78002","B78005")
                                                          concept_set_codes_our_study[["COVSICKLE"]][["SNOMED"]] <- c("D-4141","D-4142","D-4145","D-4160","U000010","127040003","154796005","154798006","191182000","191192008","191193003","191194009","191195005","191197002","191199004","21976009","267521001","267557006","276267006","35434009","36472007","40108008","416180004","417357006","417425009","417517009","72279006","80046004","84188003")
                                                          
                                                          #--------------------------
                                                          # CONTRDIVERTIC
                                                          concept_set_codes_our_study[["CONTRDIVERTIC"]][["ICD9"]] <- c("562.10","562.11","562","562.1","562.10")
                                                          concept_set_codes_our_study[["CONTRDIVERTIC"]][["ICD10"]] <- c("K57.0","K57.1","K57.2","K57.3","K57.30","K57.8","K57.9")
                                                          concept_set_codes_our_study[["CONTRDIVERTIC"]][["READ"]] <- c("J5105","J510y","J510z","J511y","J511z","J51z.","X304P","XE2sf","XaB8Z","J510.","J5105","J510y","J510z","J511y","J511z","J51z.")
                                                          concept_set_codes_our_study[["CONTRDIVERTIC"]][["ICPC"]] <- c()
                                                          concept_set_codes_our_study[["CONTRDIVERTIC"]][["SNOMED"]] <- c("D-6251","M-32710","M-46420","155779000","155781003","18126004","197094004","197095003","197102009","197103004","197116004","271365001","307496006","31113003","398050005","63532004","68047000","733657002","735594002")
                                                          
                                                          #--------------------------
                                                          # CONTRHYPERT
                                                          concept_set_codes_our_study[["CONTRHYPERT"]][["ICD9"]] <- c("403.91","404.92","404.93","416.0","416.8","642","997.91","362.11","401","401","402","403","404","405.99","401.1","401.9","402","402.9","403","403.9","403.91","404","404.9","404.92","404.93","405","405.1","405.19","405.9","405.99","437.2","572.3","642","642.3","796.2","997.91")
                                                          concept_set_codes_our_study[["CONTRHYPERT"]][["ICD10"]] <- c("H35.03","I10","I10","I11","I12","I13","I14","I15.9","I11","I11.0","I11.9","I12","I12.0","I12.9","I13","I13.0","I13.1","I13.2","I13.9","I15","I15.0","I15.1","I15.2","I15.8","I15.9","I27.20","I67.4","K76.6","O13","P29.2","R03.0")
                                                          concept_set_codes_our_study[["CONTRHYPERT"]][["READ"]] <- c("F4211","G2...","G201.","G21..","G21z.","G21z1","G222.","G23..","G232.","G233.","G234.","G23z.","G24..","G241.","G241z","G244.","G24z.","G24z0","G2z..","Gyu2.","Gyu20","Gyu21","J623.","L12..","L1230","L123z","L12z.","L12z0","L12zz","Q492.","R1y2.","X2033","X40Bx","XE0Ub","XE0Uc","XE0Ud","XE0Uf","XE0Ug","XE0VM","XM02V","XM09K","XM1C1","Xa0kX","F4211","F4213","G2...","G201.","G21..","G21z.","G21z1","G222.","G23..","G232.","G233.","G234.","G23z.","G24..","G241.","G241z","G244.","G24z.","G24z0","G2z..","Gyu2.","Gyu20","Gyu21","J623.","L12..","L1230","L1236","L123z","L12z.","L12z0","L12zz","Q492.","R1y2.")
                                                          concept_set_codes_our_study[["CONTRHYPERT"]][["ICPC"]] <- c("D97009","F83003","K85004","K86001","K86002","K86003","K86005","K87001","K87002","K87003","K87007","K87011","K99040")
                                                          concept_set_codes_our_study[["CONTRHYPERT"]][["SNOMED"]] <- c("D-7370","D-7371","D-7372","D-7374","D-7380","D-7381","D-7383","D-7415","D-7442","D-8914","D-X103","F-70603","F-70700","F-70710","F-70720","F-71000","F-71080","104931000119100","10725009","1201005","123799005","155108001","155295004","155296003","155297007","155299005","155300002","155302005","155328008","155408008","155821005","156107001","193356005","193358006","194756002","194757006","194758001","194760004","194769003","194771003","194772005","194773000","194774006","194775007","194776008","194779001","194780003","194781004","194782006","194785008","194787000","194788005","194789002","194790006","194792003","194794002","195225002","195537001","195538006","195539003","198941007","198963003","198964009","198970003","198971004","199012009","199013004","199019000","206596003","207519004","237279007","24184005","266228004","266230002","266287006","266293003","271869003","274722000","30354006","31992008","34742003","371622005","38341003","38481006","421731000","422001004","434421000124101","44111003","50490005","5148006","59621000","59997006","64715009","6962006","70995007","8501000119104","86234004")
                                                          
                                                          #--------------------------
                                                          # DEATH
                                                          concept_set_codes_our_study[["DEATH"]][["ICD9"]] <- c("798.0","798.9","799.9","798","798.0","798.1","798.2","798.9","799.9")
                                                          concept_set_codes_our_study[["DEATH"]][["ICD10"]] <- c("R95","R96","R97","R98","R99")
                                                          concept_set_codes_our_study[["DEATH"]][["READ"]] <- c("22JZ.","R21..","R210.","R2100","R2101","R210z","R211.","R212.","R212z","R213.","R213z","R21z.","RyuC.","Ua1q3","XE1gH","XE1hB","XM01Y","XM09S","XM1AY","XM1Ac","XaCJB")
                                                          concept_set_codes_our_study[["DEATH"]][["READ"]] <- c("22JZ.","R21..","R210.","R2100","R2101","R210z","R211.","R212.","R212z","R213.","R213z","R21z.","RyuC.","Ua1q3","XE1gH","XE1hB","XM01Y","XM09S","XM1AY","XM1Ac","XaCJB","22J..","22J4.","22J8.","22JZ.","R21..","R210.","R2100","R2101","R210z","R211.","R212.","R212z","R213.","R213z","R21z.","R2yz.","RyuC.")
                                                          concept_set_codes_our_study[["DEATH"]][["ICPC"]] <- c("A96","A96006","A96007")
                                                          concept_set_codes_our_study[["DEATH"]][["SNOMED"]] <- c("F-Y1800","F-Y1810","F-Y1840","F-Y1860","140067002","140074007","15355001","158717006","158718001","158719009","158720003","158723001","158724007","158727000","158728005","158729002","162851009","162858003","207533004","207534005","207535006","207536007","207538008","207539000","207540003","207543001","207544007","207547000","207548005","207562003","207670001","207671002","26636000","268889005","268907008","268923008","274641005","274644002","397709008","399347008","419620001","50514002","51178009","53559009","61626005","87309006","90049009")
                                                          
                                                          
                                                          
                                                          
                                                          #--------------------------
                                                          # DP_COVCANCER
                                                          concept_set_codes_our_study[["DP_COVCANCER"]][["ATC"]] <- c("L01A","L01B","L01C","L01D","L01X","L02A","L02B","L03","L04")
                                                          
                                                          
                                                          #--------------------------
                                                          # DP_COVDIAB
                                                          concept_set_codes_our_study[["DP_COVDIAB"]][["ATC"]] <- c("A10B")
                                                          
                                                          
                                                          #--------------------------
                                                          # DP_CVD
                                                          concept_set_codes_our_study[["DP_CVD"]][["ATC"]] <- c("B01A","C01B","C01C","C01D","C01E")
                                                          
                                                          
                                                          # DP_COVHIV
                                                          #--------------------------
                                                          concept_set_codes_our_study[["DP_COVHIV"]][["ATC"]] <- c("J05AE","J05AF","J05AG","J05AR")
                                                          
                                                          
                                                          #--------------------------
                                                          # DP_COVCKD
                                                          concept_set_codes_our_study[["DP_COVCKD"]][["ATC"]] <- c("B03XA01")
                                                          
                                                          
                                                          #--------------------------
                                                          # DP_COVCOPD
                                                          concept_set_codes_our_study[["DP_COVCOPD"]][["ATC"]] <- c("R03","R07AA","R07AB")
                                                          
                                                          
                                                          #--------------------------
                                                          # DP_COVOBES
                                                          concept_set_codes_our_study[["DP_COVOBES"]][["ATC"]] <- c("A08AA","A08AB")
                                                          
                                                          
                                                          #--------------------------
                                                          # DP_COVSICKLE
                                                          concept_set_codes_our_study[["DP_COVSICKLE"]][["ATC"]] <- c("B06AX","L01XX05")
                                                          
                                                          
                                                          #--------------------------
                                                          # IMMUNOSUPPR
                                                          concept_set_codes_our_study[["IMMUNOSUPPR"]][["ATC"]] <- c("H02","L04A")
                                                          
                                                          
                                                          #--------------------------
                                                          # DP_CONTRHYPERT
                                                          concept_set_codes_our_study[["DP_CONTRHYPERT"]][["ATC"]] <- c("C02","C03","C07","C08","C09")
                                                          
                                                          
                                                          