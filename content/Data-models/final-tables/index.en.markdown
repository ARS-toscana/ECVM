---
title: Final tables
slug: Final_tables
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
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Start population","A_sex_or_birth_date_missing","C_no_observation_period","D_death_before_study_entry","E_no_observation_period_including_study_start","end population"],"Italy-ARS":[null,null,null,null,null,null],"NL-PHARMO":[null,null,null,null,null,null],"UK-CPRD":[null,null,null,null,null,null],"ES-BIFAP":[null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Italy-ARS","name":"Italy-ARS","type":"logical"},{"accessor":"NL-PHARMO","name":"NL-PHARMO","type":"logical"},{"accessor":"UK-CPRD","name":"UK-CPRD","type":"logical"},{"accessor":"ES-BIFAP","name":"ES-BIFAP","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":6,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"a7d886aaad69c180bf123c414bd1bb94","key":"a7d886aaad69c180bf123c414bd1bb94"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Attrition diagram 2
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Attrition diagram with exclusion criteria: birth date absurd and insufficient run in</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Start population","B_birth_date_absurd","A_insufficient_run_in","end population"],"Italy-ARS":[null,null,null,null],"NL-PHARMO":[null,null,null,null],"UK-CPRD":[null,null,null,null],"ES-BIFAP":[null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Italy-ARS","name":"Italy-ARS","type":"logical"},{"accessor":"NL-PHARMO","name":"NL-PHARMO","type":"logical"},{"accessor":"UK-CPRD","name":"UK-CPRD","type":"logical"},{"accessor":"ES-BIFAP","name":"ES-BIFAP","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":4,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"e0569e2bbae7902223df7526737b6eb4","key":"e0569e2bbae7902223df7526737b6eb4"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Cohort characteristic at start of study (1-1-2020)
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with descriptive statistics about age, sex and risk factors (with totals) at 01/01/20 for all population</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[null,"Study population","Person years of follow-up","Age in years",null,null,null,null,null,"Age in categories",null,null,null,null,null,null,null,null,"Person years across age categories",null,null,null,null,null,null,null,null,"Person years across sex",null,"At risk population at January 1, 2020*",null,null,null,null,null,null,null,null],"Parameters":[null,"N","PY","Min","P25","P50","Mean","P75","Max","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","Male","Female","Cardiovascular disease","Cancer","Chronic lung disease","HIV","Chronic kidney disease","Diabetes","Severe obesity","Sickle cell disease","Use of immunosuppressants"],"DAP":["N",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Parameters","name":"Parameters","type":"character"},{"accessor":"DAP","name":"DAP","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":38,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"741ef3a66e1387509f881d17ed71aa1d","key":"741ef3a66e1387509f881d17ed71aa1d"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Cohort characteristic at first COVID-19 vaccination
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with descriptive statistics about age, sex, risk factors and month of vaccination (with totals) at date of vaccination for all population</h2>
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[null,"Study population","Person-years of follow-up","Month of first vaccination","December 2020","January 2021","February 2021","March 2021","April 2021","May 2021","June 2021","July 2021","August 2021","September 2021","October 2021","Age in years",null,null,null,null,null,"Age in categories",null,null,null,null,null,null,null,null,"Person years across age categories",null,null,null,null,null,null,null,null,"Person years across sex",null,"At risk population at date of vaccination",null,null,null,null,null,null,null,null],"Parameters":[null,"N","PY",null,"N","N","N","N","N","N","N","N","N","N","N","Min","P25","P50","Mean","P75","Max","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","Male","Female","Cardiovascular disease","Cancer","Chronic lung disease","HIV","Chronic kidney disease","Diabetes","Severe obesity","Sickle cell disease","Use of immunosuppressants"],"Vaccine manufacturer":["N",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Parameters","name":"Parameters","type":"character"},{"accessor":"Vaccine manufacturer","name":"Vaccine manufacturer","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":50,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"28de603b7e621100cd6a778b16c67eb1","key":"28de603b7e621100cd6a778b16c67eb1"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Doses of COVID-19 vaccines and distance between first and second dose
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with number of doses stratified for manufacturer and distance between concordant ones</h2>
<div id="htmlwidget-5" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-5">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[null,"Total population","Pfizer dose 1","Pfizer dose 2","Other vaccine dose 2","Amongst persons with Pfizer dose 2 distance",null,null,null,null,"Moderna dose 1","Moderna dose 2","Other vaccine dose 2","Amongst persons with Moderna dose 2 distance",null,null,null,null,"AstraZeneca dose 1","AstraZeneca dose 2","Other vaccine dose 2","Amongst persons with AZ dose 2 distance",null,null,null,null,"Janssen dose 1",null,null],"Parameters":[null,"persons","Persons","Persons","Persons","Min","P25","P50","P75","Max","Persons","Persons",null,"Min","P25","P50","P75","Max","Persons","Persons","persons","Min","P25","P50","P75","Max","Persons",null,null],"Vaccine manufacturer":["N",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Parameters","name":"Parameters","type":"character"},{"accessor":"Vaccine manufacturer","name":"Vaccine manufacturer","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":29,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"39ae41a5e58309cabd52e9b605200ac3","key":"39ae41a5e58309cabd52e9b605200ac3"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Number of incident cases entire study period
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with number of incident AESI divided by year and narrow/broad</h2>
<div id="htmlwidget-6" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-6">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[null,"OUTCOME_events","2020","2021"],"Vaccine manufacturer":["Narrow",null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Vaccine manufacturer","name":"Vaccine manufacturer","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":4,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"a89445ae010aa2d10994c2dcadde0969","key":"a89445ae010aa2d10994c2dcadde0969"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
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
<script type="application/json" data-for="htmlwidget-8">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","AESI","Month in 2020","Person years","IR narrow","LL narrow","UL narrow"],"Description":[null,null,null,null,null,null,null],"Format/Vocabulary":[null,null,null,null,null,null,null],"Comments":[null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"logical"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":7,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"67a681a1bc4613eca92e2fc02f52af6e","key":"67a681a1bc4613eca92e2fc02f52af6e"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Incidence of AESI (narrow) per 100,000 PY by age in 2020
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table stratified by AESI and ageband at 01/01/20 with persontime, incidence rate with upper and lower bound for AESI, only narrow</h2>
<div id="htmlwidget-9" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-9">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","AESI","Age in 2020","Person years","IR narrow","LL narrow","UL narrow"],"Description":[null,null,null,null,null,null,null],"Format/Vocabulary":[null,null,null,null,null,null,null],"Comments":[null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"logical"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":7,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"3b7a33ed1f70f885f1d0305d548a5abe","key":"3b7a33ed1f70f885f1d0305d548a5abe"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Incidence of AESI (narrow) per 100,000 PY by age & sex in 2020
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table stratified by AESI, ageband at 01/01/20 and sex with persontime, incidence rate with upper and lower bound for AESI, only narrow. Calculated on the entire population</h2>
<div id="htmlwidget-10" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-10">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","AESI","Age in 2020","Sex","Person years","IR narrow","LL narrow","UL narrow"],"Description":[null,null,null,null,null,null,null,null],"Format/Vocabulary":[null,null,null,null,null,null,null,null],"Comments":[null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"logical"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"33ddac74be108f3c012af7d363005d3c","key":"33ddac74be108f3c012af7d363005d3c"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Incidence of AESI (narrow) per 100,000 PY by age & sex in 2020 in at risk population
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table stratified by AESI, ageband at 01/01/20 and sex with persontime, incidence rate with upper and lower bound for AESI, only narrow. Calculated only in at risk population</h2>
<div id="htmlwidget-11" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-11">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","AESI","Age in 2020","Sex","Person years","IR narrow","LL narrow","UL narrow"],"Description":[null,null,null,null,null,null,null,null],"Format/Vocabulary":[null,null,null,null,null,null,null,null],"Comments":[null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"logical"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"33ddac74be108f3c012af7d363005d3c","key":"33ddac74be108f3c012af7d363005d3c"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Incidence of AESI (narrow) per 100,000 PY by month in 2021 (non-vaccinated)
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table stratified by AESI and month with persontime, incidence rate with upper and lower bound for AESI, only narrow. Calculated only in not vaccinated population</h2>
<div id="htmlwidget-12" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-12">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","AESI","Month in 2021","Person years","IR narrow","LL narrow","UL narrow"],"Description":[null,null,null,null,null,null,null],"Format/Vocabulary":[null,null,null,null,null,null,null],"Comments":[null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"logical"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":7,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"fb1486216103a97bef5cf6e78de0fc05","key":"fb1486216103a97bef5cf6e78de0fc05"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Incidence of AESI (narrow) per 100,000 PY by week since vaccination
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table stratified by AESI, vaccine &amp; dose, week since vaccination, ageband and sex. Contains the count, persontime and incidence rate with upper and lower bound for AESI, only narrow. Calculated only in not vaccinated population</h2>
<div id="htmlwidget-13" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-13">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","AESI","Vaccine & dose","Days since vaccination","Age","Sex","Cases","Person days","IR narrow","LL narrow","UL narrow"],"Description":[null,null,null,null,null,null,null,null,null,null,null],"Format/Vocabulary":[null,null,null,"0-6, 7-13, …",null,null,null,null,null,null,null],"Comments":[null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":11,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"6e21cc9e42e8d47c3006558e58896d5c","key":"6e21cc9e42e8d47c3006558e58896d5c"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Doses of COVID-19 vaccine over calendar time
<div align="center">
<div id="htmlwidget-14" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-14">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["DAP","Vaccine brand","Year","Week","Number of doses","Number vaccinate","Number present","Coverage"],"Description":[null,null,null,null,null,null,null,null],"format":[null,null,null,null,null,null,null,null],"vocabulary":[null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"format","name":"format","type":"logical"},{"accessor":"vocabulary","name":"vocabulary","type":"logical"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"065e3c81e7c4c73551e1bf08ff31cba1","key":"065e3c81e7c4c73551e1bf08ff31cba1"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
