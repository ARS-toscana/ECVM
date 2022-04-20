---
title: Final tables MIS
slug: Final_tables_MIS
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
## Attrition diagram 1
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Attrition diagram with exclusion criteria: sex/birth date midding, no observation period, death before study entry and no observation period including study start</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Start population","A_sex_or_birth_date_missing","C_no_observation_period","D_death_before_study_entry","E_no_observation_period_including_study_start","end population"],"Description":[null,null,null,null,null,null],"format":[null,null,null,null,null,null],"vocabulary":[null,null,null,null,null,null],"comments":[null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"format","name":"format","type":"logical"},{"accessor":"vocabulary","name":"vocabulary","type":"logical"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":6,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"bea0da3d79d83799c743f64466bf198c","key":"bea0da3d79d83799c743f64466bf198c"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Attrition diagram 2
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Attrition diagram with exclusion criteria: birth date absurd and insufficient run in</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Start population","B_birth_date_absurd","A_insufficient_run_in","end population"],"Description":[null,null,null,null],"format":[null,null,null,null],"vocabulary":[null,null,null,null],"comments":[null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"format","name":"format","type":"logical"},{"accessor":"vocabulary","name":"vocabulary","type":"logical"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":4,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"2633d3d7a0a95946f8ab9e2ea705508b","key":"2633d3d7a0a95946f8ab9e2ea705508b"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Cohort characteristics at start of study (1-1-2020)
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with descriptive statistics about age, sex and risk factors (with totals) at 01/01/20 for all population</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Name",null,"Study population","Person years of follow-up","Age in years",null,null,null,null,null,"Age in categories",null,null,null,null,null,null,null,null,"Person years across age categories",null,null,null,null,null,null,null,null,"Person years across sex",null,"At risk population at January 1, 2020*",null,null,null,null,null,null,null,null],"Description":["Parameters",null,"N","PY","Min","P25","P50","Mean","P75","Max","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","Male","Female","Cardiovascular disease","Cancer","Chronic lung disease","HIV","Chronic kidney disease","Diabetes","Severe obesity","Sickle cell disease","Use of immunosuppressants"],"format":["DAP","N",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":[null,"%",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":39,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"7be0b4ef517479bcd4c80bec98b66a70","key":"7be0b4ef517479bcd4c80bec98b66a70"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Cohort characteristics at first COVID-19 vaccination
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with descriptive statistics about age, sex, risk factors and month of vaccination (with totals) at date of vaccination for all population</h2>
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[null,"Study population","Person-years of follow-up","Month of first vaccination","December 2020","January 2021","February 2021","March 2021","April 2021","May 2021","June 2021","July 2021","August 2021","September 2021","October 2021","Age in years",null,null,null,null,null,"Age in categories",null,null,null,null,null,null,null,null,"Person years across age categories",null,null,null,null,null,null,null,null,"Person years across sex",null,"At risk population at date of vaccination",null,null,null,null,null,null,null,null],"Parameters":[null,"N","PY",null,"N","N","N","N","N","N","N","N","N","N","N","Min","P25","P50","Mean","P75","Max","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","Male","Female","Cardiovascular disease","Cancer","Chronic lung disease","HIV","Chronic kidney disease","Diabetes","Severe obesity","Sickle cell disease","Use of immunosuppressants"],"Vaccine manufacturer":["N",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Parameters","name":"Parameters","type":"character"},{"accessor":"Vaccine manufacturer","name":"Vaccine manufacturer","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":50,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"28de603b7e621100cd6a778b16c67eb1","key":"28de603b7e621100cd6a778b16c67eb1"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Cohort characteristics at first occurrence of COVID-19 prior to vaccination (cohort c)
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with descriptive statistics about age, sex, risk factors and month of vaccination (with totals) at cohort  c entry for all population</h2>
<div id="htmlwidget-5" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-5">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[null,"Study population","Person-years of follow-up","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Month of first diagnosis","Age in years",null,null,null,null,null,"Age in categories",null,null,null,null,null,null,null,null,"Person years across age categories",null,null,null,null,null,null,null,null,"Person years across sex",null,"At risk population at first covid diagnosis",null,null,null,null,null,null,null,null],"Parameters":[null,"N","PY","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12","2021-01","2021-02","2021-03","2021-04","2021-05","Min","P25","P50","Mean","P75","Max","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","Male","Female","Cardiovascular disease","Cancer","Chronic lung disease","HIV","Chronic kidney disease","Diabetes","Severe obesity","Sickle cell disease","Use of immunosuppressants"],"Vaccine manufacturer":["N",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Parameters","name":"Parameters","type":"character"},{"accessor":"Vaccine manufacturer","name":"Vaccine manufacturer","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":52,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"a1610161942eb5e67d8ea4b84d7fb399","key":"a1610161942eb5e67d8ea4b84d7fb399"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## COVID-19 vaccination by dose and time period between first and second dose (days)
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with number of doses stratified for manufacturer and distance between concordant ones</h2>
<div id="htmlwidget-6" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-6">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[null,"Total population","Pfizer dose 1","Pfizer dose 2","Other vaccine dose 2","Amongst persons with Pfizer dose 2 distance",null,null,null,null,"Moderna dose 1","Moderna dose 2","Other vaccine dose 2","Amongst persons with Moderna dose 2 distance",null,null,null,null,"AstraZeneca dose 1","AstraZeneca dose 2","Other vaccine dose 2","Amongst persons with AZ dose 2 distance",null,null,null,null,"Janssen dose 1"],"Parameters":[null,"persons","Persons","Persons","Persons","Min","P25","P50","P75","Max","Persons","Persons",null,"Min","P25","P50","P75","Max","Persons","Persons","persons","Min","P25","P50","P75","Max","Persons"],"Vaccine manufacturer":["N",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Parameters","name":"Parameters","type":"character"},{"accessor":"Vaccine manufacturer","name":"Vaccine manufacturer","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":27,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"2eddf88082da90e510eaa1be97f72ac9","key":"2eddf88082da90e510eaa1be97f72ac9"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Code counts for narrow definitions (for each event) separately
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with counts stratified by event, coding system, first 4 digit of the code and the meaning of the event</h2>
<div id="htmlwidget-7" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-7">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","Event","Coding system","First 4 digits of code","meaning_of_event","sum"],"Description":[null,null,null,null,null,null],"Format/Vocabulary":[null,null,null,null,null,null],"Comments":[null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"logical"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":6,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"480dcfca9a0f79f7f923e2ef4d0d7a54","key":"480dcfca9a0f79f7f923e2ef4d0d7a54"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Incidence of AESI (narrow) per 100,000 PY by calendar month in 2020
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table stratified by AESI and month with persontime, incidence rate with upper and lower bound for AESI, only narrow</h2>
<div id="htmlwidget-8" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-8">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","AESI","Month in 2020","Person years","IR narrow","LL narrow","UL narrow"],"Description":[null,null,null,null,null,null,null],"format":[null,null,null,null,null,null,null],"vocabulary":[null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"format","name":"format","type":"logical"},{"accessor":"vocabulary","name":"vocabulary","type":"logical"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":7,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"eaa61cf1148858b796a102e6afaf9834","key":"eaa61cf1148858b796a102e6afaf9834"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Incidence of each concept (narrow) per 100,000 PY prior to vaccination and COVID-19
<div align="center">
<div id="htmlwidget-9" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-9">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","AESI","Sex","Age in 2020","Person years","IR narrow","LL narrow","UL narrow"],"Description":[null,null,null,null,null,null,null,null],"format":[null,null,null,null,null,null,null,null],"vocabulary":[null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"format","name":"format","type":"logical"},{"accessor":"vocabulary","name":"vocabulary","type":"logical"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"f7d55903e192012592dd3b7306ef4904","key":"f7d55903e192012592dd3b7306ef4904"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Incidence of each concept (narrow) per 100,000 PY after COVID-19 and prior to vaccination
<div align="center">
<div id="htmlwidget-10" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-10">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","AESI","Sex","Age in 2020","Person years","IR narrow","LL narrow","UL narrow"],"Description":[null,null,null,null,null,null,null,null],"format":[null,null,null,null,null,null,null,null],"vocabulary":[null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"format","name":"format","type":"logical"},{"accessor":"vocabulary","name":"vocabulary","type":"logical"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"f7d55903e192012592dd3b7306ef4904","key":"f7d55903e192012592dd3b7306ef4904"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Incidence of each concept (narrow) per 100,000 PY after vaccination (BRAND)
<div align="center">
<div id="htmlwidget-11" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-11">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","AESI","Sex","Age in 2020","history_covid","Person years","IR narrow","LL narrow","UL narrow"],"Description":[null,null,null,null,null,null,null,null,null],"format":[null,null,null,null,null,null,null,null,null],"vocabulary":[null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"format","name":"format","type":"logical"},{"accessor":"vocabulary","name":"vocabulary","type":"logical"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":9,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"44577c78f99b16c919e8c8bed653e475","key":"44577c78f99b16c919e8c8bed653e475"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
