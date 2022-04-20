---
title: PersonTime benefits
slug: PT_benefits
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
## D4_persontime_benefit_week
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, birth cohort, dose, type vax, calendar week and risk factors. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","ageband_at_study_entry","Dose","type_vax","riskfactors","week","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","Persontime_COVID_L5plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b","COVID_L5plus_b"],"Description":[null,null,null,"type of vaccine","Cases in population for each risk factor and any_risk_factors",null,null,null,null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = Female, 1 = Male","0-4, 5-11, 12-17, 18-24, 25-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80+","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","0, 1","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,null,null,"riskfactors defined in ???",null,null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU to COVID-19","L5 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU to COVID-19","L5 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":17,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"d577e82a2aeb2cc047f2fb52b7bb05de","key":"d577e82a2aeb2cc047f2fb52b7bb05de"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_benefit_year
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, birth cohort, dose, type vax, week of followup and risk factors. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Dose","sex","ageband_at_study_entry","type_vax","week_fup","riskfactors","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","Persontime_COVID_L5plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b","COVID_L5plus_b"],"Description":[null,null,null,"type of vaccine",null,"Cases in population for each risk factor and any_risk_factors",null,null,null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = no dose, 1= dose 1, 2= dose 2","0 = Female, 1 = Male","0-4, 5-11, 12-17, 18-24, 25-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80+","Pfizer, Moderna, AstraZeneca, J&J","integer","0, 1","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,"riskfactors defined in ???",null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU to COVID-19","L5 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU to COVID-19","L5 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":17,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"520d7f967a91991cbebeb08011bf6554","key":"520d7f967a91991cbebeb08011bf6554"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_benefit_week_BC
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, birth cohort, dose, type vax and calendar week. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","ageband_at_study_entry","Dose","type_vax","week","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","Persontime_COVID_L5plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b","COVID_L5plus_b"],"Description":[null,"ageband at study_entry_date",null,"type of vaccine",null,null,null,null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = Female, 1 = Male","character","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,"0-4, 5-11, 12-17, 18-24, 25-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80+",null,null,null,null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU due to COVID-19","L5 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU due to COVID-19","L5 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":16,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"9fec8418ebd499c10ed8976f9a6d5f1b","key":"9fec8418ebd499c10ed8976f9a6d5f1b"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_benefit_year_BC
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, birth cohort, dose, type vax and week of followup. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","ageband_at_study_entry","Dose","type_vax","week_fup","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","Persontime_COVID_L5plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b","COVID_L5plus_b"],"Description":[null,"ageband at study_entry_date",null,"type of vaccine",null,null,null,null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = Female, 1 = Male","character","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,"0-4, 5-11, 12-17, 18-24, 25-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80+",null,null,null,null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU due to COVID-19","L5 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU due to COVID-19","L5 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":16,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"7505a20dc2e475f18007109157a83d42","key":"7505a20dc2e475f18007109157a83d42"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_benefit_week_RF
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, dose, type vax, calendar week and risk factors. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-5" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-5">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Dose","type_vax","week","riskfactor","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","Persontime_COVID_L5plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b","COVID_L5plus_b"],"Description":[null,null,"type of vaccine",null,null,null,null,null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = Female, 1 = Male","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","riskfactors = \"COVCANCER\": cancer, \"COVCOPD\": Chronic obstructive pulmonary disease, \"COVHIV\": HIV, \"COVCKD\": chronic kidney disease, \"COVDIAB\": diabetes, \"COVOBES\": severe obesity, \"COVSICKLE\": Sickle disease","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU due to COVID-19","L5 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU due to COVID-19","L5 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":16,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"85def4b4372a8739ae242f2656a8fb36","key":"85def4b4372a8739ae242f2656a8fb36"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_benefit_year_RF
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, dose, type vax, week of followup and risk factors. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-6" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-6">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Dose","type_vax","week_fup","riskfactor","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","Persontime_COVID_L5plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b","COVID_L5plus_b"],"Description":[null,null,"type of vaccine",null,null,null,null,null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = Female, 1 = Male","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","riskfactors = \"COVCANCER\": cancer, \"COVCOPD\": Chronic obstructive pulmonary disease, \"COVHIV\": HIV, \"COVCKD\": chronic kidney disease, \"COVDIAB\": diabetes, \"COVOBES\": severe obesity, \"COVSICKLE\": Sickle disease","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU due to COVID-19","L5 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = ICU due to COVID-19","L5 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":16,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"d9c3b1695cd658bd1dd419370549f9e8","key":"d9c3b1695cd658bd1dd419370549f9e8"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
