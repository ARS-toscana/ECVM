---
title: Descriptives study population at vaccination
slug: Descriptives_vax
author: ''
date: []
categories:
  - Data Model
tags:
  - D4
weight: 5
---

<script src="{{< blogdown/postref >}}index.en_files/core-js/shim.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/react/react.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/react/react-dom.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/reactwidget/react-tools.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/htmlwidgets/htmlwidgets.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/reactable-binding/reactable.js"></script>
## D4_descriptive_dataset_age_vax1
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Descriptive of age at study_entry_date for all the D3_Vaccin_cohort.</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Datasource","Vax_dose1","Month_vax1","Followup_vax1","Age_P25","Age_P50","Age_p75","Age_mean","Age_min","Age_max"],"Description":[null,"Type vaccine dose 1","Month of date_vax1","Person days of follow-up summed across all subjects in the study population from date_vax1 UNTIL VAX2","Age at date_vax1 25th percentile of distribution","Age at date_vax1, 50th percentile of distribution","Age at date_vax175th percentile of distribution","Age at date_vax1, mean of distribution","Age at date_vax1, minimum of distribution","Age at date_vax1, maximum of distribution"],"Format/Vocabulary":["ARS BIFAP CPRD PHARMO","Pfizer Moderna AstraZeneca Janssen UNK","12=dec 2020, 1=jan 2021, 2=Feb 2021, 3=March 2021, 4=APRIL 2021, 5=MAY 2021, 6=JUNE 2021, 7=JULY 2021, 8=AUGUST 2021, 9=SEPT 2021, 10=OKT 2021","Integer","Integer","Integer","Integer","Integer","Integer","Integer"],"Comments":[null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":10,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"cf722ecd607163b430b6ade01009e43f","key":"cf722ecd607163b430b6ade01009e43f"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_descriptive_dataset_ageband_vax
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Counts of age bands at study_entry_date, for the D3_Vaccin_cohort.</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Datasource","Type_vax1","AgeCat_019","AgeCat_2029","AgeCat_3039","AgeCat_4049","AgeCat_5059","AgeCat_6069","AgeCat_7079","Agecat_80+"],"Description":[null,"Type vaccine dose 1","Number of subjects start vaccination age_vax1 0-19","Number of subjects start vaccination age_vax1 20-29","Number of subjects start vaccination age_vax1 30-39","Number of subjects start vaccination age_vax1 40-49","Number of subjects start vaccination age_vax1 50-59","Number of subjects start vaccination age_vax1 60-69","Number of subjects start vaccination age_vax1 70-79","Number of subjects start vaccination age_vax1 80+"],"Format/Vocabulary":["ARS BIFAP CPRD PHARMO","Pfizer, Moderna, AstraZeneca, J&J, UNK","Integer","Integer","Integer","Integer","Integer","Integer","Integer","Integer"],"Comments":[null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":10,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"fe5e08ce7654195f854102da854f8789","key":"fe5e08ce7654195f854102da854f8789"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_descriptive_dataset_sex_vaccination
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Counts of age bands at January 1, 2020, for the D3_study population.</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Datasource","Type_vax1","Sex_male","Sex_female"],"Description":[null,"Type vaccine dose 1","Number of subjects","Number of subjects"],"Format/Vocabulary":["ARS BIFAP CPRD PHARMO","Pfizer, Moderna, AstraZeneca, J&J, UNK","Number, integer","Number, integer"],"Comments":[null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":4,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"7b4cfa47c39aa0d22943d4e84e8b12ec","key":"7b4cfa47c39aa0d22943d4e84e8b12ec"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_descriptive_dataset_covariate_vax
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Occurrences of covariates at start vaccination, for the D3_vaccin_cohort.</h2>
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Datasource","Type_vax1","risk_factor","immunosuppressants"],"Description":[null,"Type vaccine dose 1","CV Cancer CLD HIV CKD Diabetes Obesity Sicklecell ;","proxy drug prior to date_vax1"],"Format/Vocabulary":["ARS BIFAP CPRD PHARMO","Pfizer, Moderna, AstraZeneca, J&J, UNK","integer","integer"],"Comments":[null,null,"Sum yes","Sum yes"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":4,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"cfc92c8a5fcb68c2e076c46f6fcebf06","key":"cfc92c8a5fcb68c2e076c46f6fcebf06"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_followup_from_vax
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Personyears by age band at start vaccination, for the D3_vaccin_cohort.</h2>
<div id="htmlwidget-5" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-5">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Datasource","Followup_males","Followup_males","Followup_females","Followup_females","Followup_total","Followup_total","Followup_0119","Followup_2029","Followup_3039","Followup_4049","Followup_5059","Followup_6069","Followup_7079","Followup_80","Followup_0119","Followup_2029","Followup_3039","Followup_4049","Followup_5059","Followup_6069","Followup_7079","Followup_80"],"Description":[null,"Follow_up days for males from date_vax1 to vax2","Follow_up days for males from date_vax2","Follow_up days for females from date_vax1 to vax2","Follow_up days for females from date_vax2","Follow_up days total population from date_vax1 to vax2","Follow_up days total population from date_vax2","Follow_up days population 0-19 years of age at January 1st 2020","Follow_up days population 20-29 years of age at January 1st 2020","Follow_up days population 30-39 years of age at January 1st 2020","Follow_up days population 40-49 years of age at January 1st 2020","Follow_up days population 50-59 years of age at January 1st 2020","Follow_up days population 60-69 years of age at January 1st 2020","Follow_up days population 70-79 years of age at January 1st 2020","Follow_up days population 80 years of age and older at January 1st 2020","Follow_up days population 0-19 years of age at January 1st 2020","Follow_up days population 20-29 years of age at January 1st 2020","Follow_up days population 30-39 years of age at January 1st 2020","Follow_up days population 40-49 years of age at January 1st 2020","Follow_up days population 50-59 years of age at January 1st 2020","Follow_up days population 60-69 years of age at January 1st 2020","Follow_up days population 70-79 years of age at January 1st 2020","Follow_up days population 80 years of age and older at January 1st 2020"],"Format/Vocabulary":["ARS BIFAP CPRD PHARMO","Numeric",null,"Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric","Numeric"],"Comments":[null,"Days between date_vax2-date_vax1 for males","Days from vax2","Days between date_vax2-date_vax1 for females","Days from vax2","Days between date_vax2-date_vax1","Days from vax2","Days between date_vax2-date_vax1 age 0-19","Days between date_vax2-date_vax1 age 20-29","Days between date_vax2-date_vax1age 30-39","Days between date_vax2-date_vax1age 40-49","Days between date_vax2-date_vax1 age 50-59","Days between date_vax2-date_vax1 age 60-69","Days between date_vax2-date_vax1age 70-79","Days between date_vax2-date_vax1age 80 and older","Days from vax2age 0-19","Days from vax2age 20-29","Days from vax2age 30-39","Days from vax2age 40-49","Days from vax2age 50-59","Days from vax2age 60-69","Days from vax2age 70-79","Days from vax2age 80 and older"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":23,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"e4db2df85938d6d9ff6f4bdf995e4ba0","key":"e4db2df85938d6d9ff6f4bdf995e4ba0"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_descriptive_dataset_age_vax2
<div align="center">
<div id="htmlwidget-6" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-6">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Datasource","Vax_dose2","Month_vax2","Followup_vax2","Age_P25","Age_P50","Age_p75","Age_mean","Age_min","Age_max"],"Description":[null,"Type vaccine dose 1","Month of date_vax1","Person days of follow-up summed across all subjects in the study population from date_vax1 UNTIL VAX2","Age at date_vax1 25th percentile of distribution","Age at date_vax1, 50th percentile of distribution","Age at date_vax175th percentile of distribution","Age at date_vax1, mean of distribution","Age at date_vax1, minimum of distribution","Age at date_vax1, maximum of distribution"],"format":["ARS BIFAP CPRD PHARMO","Pfizer Moderna AstraZeneca Janssen UNK","12=dec 2020, 1=jan 2021, 2=Feb 2021, 3=March 2021, 4=APRIL 2021, 5=MAY 2021, 6=JUNE 2021, 7=JULY 2021, 8=AUGUST 2021, 9=SEPT 2021, 10=OKT 2021","Integer","Integer","Integer","Integer","Integer","Integer","Integer"],"vocabulary":[null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"logical"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":10,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"2e904540fcaa78b2cafbf60fd2bbf9f7","key":"2e904540fcaa78b2cafbf60fd2bbf9f7"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
