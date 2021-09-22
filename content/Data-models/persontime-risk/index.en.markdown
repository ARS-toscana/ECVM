---
title: PersonTime risk
author: ''
date: []
slug: []
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
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, birth cohort, dose, type vax, calendar week and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Birthcohort_persons","Dose","type_vax","riskfactors","week","Persontime","Persontime_AESI","AESI_b"],"Description":[null,null,null,"type of vaccine","Cases in population for each risk factor",null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","<1940, 1940-1949, 1950-1959, 1960-1969, 1970-1979, 1980-1989, 1990+, all_birth cohorts: any age","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","0, 1","integer","integer","integer","integer"],"Comments":[null,null,null,null,"riskfactors defined in ???",null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":9,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"9a04d168492a0f19ee6d148b2dec62bd","key":"9a04d168492a0f19ee6d148b2dec62bd"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_year
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, birth cohort, dose, type vax, week of followup and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Birthcohort_persons","Dose","type_vax","week_fup","riskfactors","Persontime","Persontime_AESI","AESI_b"],"Description":[null,null,null,"type of vaccine",null,"Cases in population for each risk factor","Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","<1940, 1940-1949, 1950-1959, 1960-1969, 1970-1979, 1980-1989, 1990+, all_birth cohorts: any age","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","0, 1","integer","integer","integer"],"Comments":[null,null,null,null,null,"riskfactors defined in ???",null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":9,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"5d05cc6494453e0a4e35b4f657dbfc2d","key":"5d05cc6494453e0a4e35b4f657dbfc2d"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_week_BC
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, birth cohort, dose, type vax, calendar week and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Birthcohort_persons","Dose","type_vax","week","Persontime","Persontime_AESI","AESI_b"],"Description":[null,null,null,"type of vaccine",null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","<1940, 1940-1949, 1950-1959, 1960-1969, 1970-1979, 1980-1989, 1990+, all_birth cohorts: any age","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"9955dfb91201cfbb80cb0bbc1120478b","key":"9955dfb91201cfbb80cb0bbc1120478b"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_year_BC
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, birth cohort, dose, type vax, week of followup and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Birthcohort_persons","Dose","type_vax","week_fup","year","Persontime","Persontime_AESI","AESI_b"],"Description":[null,null,null,"type of vaccine",null,null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","<1940, 1940-1949, 1950-1959, 1960-1969, 1970-1979, 1980-1989, 1990+, all_birth cohorts: any age","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":9,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"5b6afda4d093258093ea26f3767677f9","key":"5b6afda4d093258093ea26f3767677f9"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_week_RF
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, dose, type vax, calendar week and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-5" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-5">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Dose","type_vax","riskfactor","week","Persontime","Persontime_AESI","AESI_b"],"Description":[null,null,"type of vaccine",null,null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","riskfactors","integer","integer","integer","integer"],"Comments":[null,null,null,"riskfactors defined in ???",null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"a61fbe133d7a15194eca9bb731b92920","key":"a61fbe133d7a15194eca9bb731b92920"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_year_RF
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, dose, type vax, week of followup and risk factors. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-6" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-6">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Dose","type_vax","week_fup","riskfactor","Persontime","Persontime_AESI","AESI_b"],"Description":[null,null,"type of vaccine",null,null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","riskfactors","integer","integer","integer"],"Comments":[null,null,null,null,"riskfactors defined in ???",null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"a84a9b94a7f79b9471bf3c0b2aa963bd","key":"a84a9b94a7f79b9471bf3c0b2aa963bd"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
