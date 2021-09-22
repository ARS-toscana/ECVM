---
title: PersonTime benefits
author: ''
date: []
slug: []
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
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, birth cohort, dose, type vax, calendar week and risk factors. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Birthcohort_persons","Dose","riskfactors","type_vax","week","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b"],"Description":[null,null,null,"Cases in population for each risk factor","type of vaccine",null,null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = Female, 1 = Male","<1940, 1940-1949, 1950-1959, 1960-1969, 1970-1979, 1980-1989, 1990+, all_birth cohorts: any age","0 = no dose, 1= dose 1, 2= dose 2","0, 1","Pfizer, Moderna, AstraZeneca, J&J","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,null,"riskfactors defined in ???",null,null,null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":15,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"0ff06e431af7229cc49ddb349b26618b","key":"0ff06e431af7229cc49ddb349b26618b"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_benefit_year
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, birth cohort, dose, type vax, week of followup and risk factors. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Dose","sex","Birthcohort_persons","type_vax","week_fup","riskfactors","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b"],"Description":[null,null,null,"type of vaccine",null,"Cases in population for each risk factor",null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = no dose, 1= dose 1, 2= dose 2","0 = Female, 1 = Male","<1940, 1940-1949, 1950-1959, 1960-1969, 1970-1979, 1980-1989, 1990+, all_birth cohorts: any age","Pfizer, Moderna, AstraZeneca, J&J","integer","0, 1","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,"riskfactors defined in ???",null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":15,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"913a601fe4b73c5406e3f344c5552937","key":"913a601fe4b73c5406e3f344c5552937"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_benefit_week_BC
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, birth cohort, dose, type vax and calendar week. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Birthcohort_persons","Dose","type_vax","week","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b"],"Description":[null,null,null,"type of vaccine",null,null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = Female, 1 = Male","<1940, 1940-1949, 1950-1959, 1960-1969, 1970-1979, 1980-1989, 1990+, all_birth cohorts: any age","0 = no dose, 1= dose 1, 2= dose 2","Pfizer, Moderna, AstraZeneca, J&J","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":14,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"1ddb9d685aff321bec87f2f8d3b1bbc8","key":"1ddb9d685aff321bec87f2f8d3b1bbc8"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_benefit_year_BC
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, birth cohort, dose, type vax and week of followup. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Dose","sex","Birthcohort_persons","type_vax","week_fup","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b"],"Description":[null,null,null,"type of vaccine",null,null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = no dose, 1= dose 1, 2= dose 2","0 = Female, 1 = Male","<1940, 1940-1949, 1950-1959, 1960-1969, 1970-1979, 1980-1989, 1990+, all_birth cohorts: any age","Pfizer, Moderna, AstraZeneca, J&J","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":14,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"0884a7a8ff181a2f939067d87ee5f160","key":"0884a7a8ff181a2f939067d87ee5f160"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_benefit_week_RF
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, dose, type vax, calendar week and risk factors. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-5" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-5">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Dose","riskfactors","type_vax","week","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b"],"Description":[null,null,"Cases in population for each risk factor","type of vaccine",null,null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = Female, 1 = Male","0 = no dose, 1= dose 1, 2= dose 2","0, 1","Pfizer, Moderna, AstraZeneca, J&J","integer","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,"riskfactors defined in ???",null,null,null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":14,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"89265a833bbd4debaefaa5bf9a5dbbe0","key":"89265a833bbd4debaefaa5bf9a5dbbe0"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_benefit_year_RF
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, dose, type vax, week of followup and risk factors. Contains the persontime and counts for each covid severity</h2>
<div id="htmlwidget-6" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-6">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Dose","sex","type_vax","week_fup","riskfactors","Persontime","Persontime_COVID_L1plus","Persontime_COVID_L2plus","Persontime_COVID_L3plus","Persontime_COVID_L4plus","COVID_L1plus_b","COVID_L2plus_b","COVID_L3plus_b","COVID_L4plus_b"],"Description":[null,null,"type of vaccine",null,"Cases in population for each risk factor",null,null,null,null,null,null,null,null,null],"Format/Vocabulary":["0 = no dose, 1= dose 1, 2= dose 2","0 = Female, 1 = Male","Pfizer, Moderna, AstraZeneca, J&J","integer","0, 1","integer","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,null,null,"riskfactors defined in ???",null,"L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19","L1 = any recording of COVID-19","L2 = any recording in COVID - registry","L3 = hospitalisation for COVID-19","L4 = death due to COVID-19"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":14,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"c63549c9a3466061a08ca24293d4f519","key":"c63549c9a3466061a08ca24293d4f519"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
