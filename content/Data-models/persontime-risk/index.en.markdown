---
title: PersonTime risk
slug: PT_risk
author: ''
date: []
categories:
  - Data Model
tags: []
weight: 5
---

<script src="{{< blogdown/postref >}}index.en_files/core-js/shim.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/react/react.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/react/react-dom.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/reactwidget/react-tools.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/htmlwidgets/htmlwidgets.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/reactable-binding/reactable.js"></script>
## D4_persontime_risk_week
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, birth cohort, dose, type vax, calendar week and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","ageband_at_study_entry","Dose","type_vax","riskfactors","week","Persontime","Persontime_AESI","AESI_b"],"Description":[null,null,null,"type of vaccine","Cases in population for each risk factor and any_risk_factors",null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","0-4, 5-11, 12-17, 18-24, 25-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80+","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","0, 1","integer","integer","integer","integer"],"Comments":[null,null,null,null,"riskfactors defined in ???",null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":9,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"5303b0157ac779975b4e7df3a5371f3c","key":"5303b0157ac779975b4e7df3a5371f3c"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_year
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, birth cohort, dose, type vax, week of followup and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","ageband_at_study_entry","Dose","type_vax","week_fup","riskfactors","Persontime","Persontime_AESI","AESI_b"],"Description":[null,null,null,"type of vaccine",null,"Cases in population for each risk factor and any_risk_factors","Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","0-4, 5-11, 12-17, 18-24, 25-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80+","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","0, 1","integer","integer","integer"],"Comments":[null,null,null,null,null,"riskfactors defined in ???",null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":9,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"b5911217baa8aeb961acf06e3b1392db","key":"b5911217baa8aeb961acf06e3b1392db"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_week_BC
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, birth cohort, dose, type vax, calendar week and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","ageband_at_study_entry","Dose","type_vax","week","Persontime","Persontime_AESI","AESI_b"],"Description":[null,"ageband at study_entry_date",null,"type of vaccine",null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","character","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","integer","integer","integer"],"Comments":[null,"0-4, 5-11, 12-17, 18-24, 25-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80+",null,null,null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"e26b69520d1144c634f76106a8443ff8","key":"e26b69520d1144c634f76106a8443ff8"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_year_BC
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, birth cohort, dose, type vax, week of followup and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Dose","type_vax","week_fup","sex","ageband_at_study_entry","Persontime","Persontime_AESI","AESI_b"],"Description":[null,"type of vaccine",null,null,"ageband at study_entry_date","Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","0 = Female, 1 = Male","character","integer","integer","integer"],"Comments":[null,null,null,null,"0-4, 5-11, 12-17, 18-24, 25-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80+",null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"93f745033d87e2c9ee180b55402355dd","key":"93f745033d87e2c9ee180b55402355dd"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_week_RF
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, dose, type vax, calendar week and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-5" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-5">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Dose","type_vax","week","riskfactor","Persontime","Persontime_AESI","AESI_b"],"Description":[null,null,"type of vaccine",null,null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","riskfactors = \"COVCANCER\": cancer, \"COVCOPD\": Chronic obstructive pulmonary disease, \"COVHIV\": HIV, \"COVCKD\": chronic kidney disease, \"COVDIAB\": diabetes, \"COVOBES\": severe obesity, \"COVSICKLE\": Sickle disease","integer","integer","integer"],"Comments":[null,null,null,null,"riskfactors defined in ???",null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"3238512cf1d72a1f8ba96388dd3734f2","key":"3238512cf1d72a1f8ba96388dd3734f2"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_year_RF
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, dose, type vax, week of followup and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-6" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-6">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Dose","type_vax","week_fup","sex","riskfactor","Persontime","Persontime_AESI","AESI_b"],"Description":[null,"type of vaccine",null,null,null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","0 = Female, 1 = Male","riskfactors = \"COVCANCER\": cancer, \"COVCOPD\": Chronic obstructive pulmonary disease, \"COVHIV\": HIV, \"COVCKD\": chronic kidney disease, \"COVDIAB\": diabetes, \"COVOBES\": severe obesity, \"COVSICKLE\": Sickle disease","integer","integer","integer"],"Comments":[null,null,null,null,"riskfactors defined in ???",null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"e1081b03e985799151b7c02916009995","key":"e1081b03e985799151b7c02916009995"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
