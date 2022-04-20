---
title: Final tables report
slug: Final_tables_report
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
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Attrition diagram with exclusion criteria: Persons in the instance of the data source, Sex or birth date missing or absurd,  Death before study start, Exit from the data source before study start, Less than 365 days history at 1//1/2020</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Persons in the instance of the data source","Sex or birth date missing or absurd, no dates of entry or exit","Death before study start","Exit from the data source before study start","Persons in the data source at study start","Less than 365 days history at 1//1/2020","Study population"],"Italy-ARS":[null,null,null,null,null,null,null],"NL-PHARMO":[null,null,null,null,null,null,null],"UK-CPRD":[null,null,null,null,null,null,null],"ES-BIFAP":[null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Italy-ARS","name":"Italy-ARS","type":"logical"},{"accessor":"NL-PHARMO","name":"NL-PHARMO","type":"logical"},{"accessor":"UK-CPRD","name":"UK-CPRD","type":"logical"},{"accessor":"ES-BIFAP","name":"ES-BIFAP","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":7,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"23aa948445ec4faa34cb3c6e1d257b41","key":"23aa948445ec4faa34cb3c6e1d257b41"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Cohort characteristics at start of study (1-1-2020)
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with descriptive statistics about age, sex and risk factors (with totals) at 01/01/20 for all population</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[null,"Study population","Person years of follow-up","Age in years",null,null,null,null,null,"Age in categories",null,null,null,null,null,null,null,null,"Person years across age categories",null,null,null,null,null,null,null,null,"Person years across sex",null,"At risk population at January 1, 2020*",null,null,null,null,null,null,null,null],"Parameters":[null,"N","PY","Min","P25","P50","Mean","P75","Max","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","Male","Female","Cardiovascular disease","Cancer","Chronic lung disease","HIV","Chronic kidney disease","Diabetes","Severe obesity","Sickle cell disease","Use of immunosuppressants"],"DAP":["N",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Parameters","name":"Parameters","type":"character"},{"accessor":"DAP","name":"DAP","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":38,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"741ef3a66e1387509f881d17ed71aa1d","key":"741ef3a66e1387509f881d17ed71aa1d"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Cohort characteristics at first dose of COVID-19 vaccine
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with descriptive statistics about age, sex, risk factors and month of vaccination (with totals) at date of first vaccination for all population</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[null,"Study population","Person-years of follow-up","Month of first vaccination","December 2020","January 2021","February 2021","March 2021","April 2021","May 2021","June 2021","July 2021","August 2021","September 2021","October 2021","Age in years",null,null,null,null,null,"Age in categories",null,null,null,null,null,null,null,null,"Person years across age categories",null,null,null,null,null,null,null,null,"Person years across sex",null,"At risk population at date of vaccination",null,null,null,null,null,null,null,null],"Parameters":[null,"N","PY",null,"N","N","N","N","N","N","N","N","N","N","N","Min","P25","P50","Mean","P75","Max","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60","Male","Female","Cardiovascular disease","Cancer","Chronic lung disease","HIV","Chronic kidney disease","Diabetes","Severe obesity","Sickle cell disease","Use of immunosuppressants"],"Vaccine manufacturer":["N",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Parameters","name":"Parameters","type":"character"},{"accessor":"Vaccine manufacturer","name":"Vaccine manufacturer","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":50,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"28de603b7e621100cd6a778b16c67eb1","key":"28de603b7e621100cd6a778b16c67eb1"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Cohort characteristics at second dose of COVID-19 vaccine
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with descriptive statistics about age, sex,  and month of vaccination (with totals) at date of second vaccination for all population</h2>
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Person-years of follow-up","Age in years",null,null,null,null,null,"Age in categories",null,null,null,null,null,null,null,null],"Description":["PY","Min","P25","P50","Mean","P75","Max","0-19","20-29","30-39","40-49","50-59","60-69","70-79",">=80",">=60"],"format":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"logical"},{"accessor":"vocabulary","name":"vocabulary","type":"logical"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":16,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"e7eab4712a4e96444d0593032946ea28","key":"e7eab4712a4e96444d0593032946ea28"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## COVID-19 vaccination by dose and time period between first and second dose (days)
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Table with number of doses stratified for manufacturer and distance between concordant ones</h2>
<div id="htmlwidget-5" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-5">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[null,"Total population","Pfizer dose 1","Pfizer dose 2","Other vaccine dose 2","Amongst persons with Pfizer dose 2 distance",null,null,null,null,"Moderna dose 1","Moderna dose 2","Other vaccine dose 2","Amongst persons with Moderna dose 2 distance",null,null,null,null,"AstraZeneca dose 1","AstraZeneca dose 2","Other vaccine dose 2","Amongst persons with AZ dose 2 distance",null,null,null,null,"Janssen dose 1"],"Parameters":[null,"persons","Persons","Persons","Persons","Min","P25","P50","P75","Max","Persons","Persons",null,"Min","P25","P50","P75","Max","Persons","Persons","persons","Min","P25","P50","P75","Max","Persons"],"Vaccine manufacturer":["N",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Parameters","name":"Parameters","type":"character"},{"accessor":"Vaccine manufacturer","name":"Vaccine manufacturer","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":27,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"2eddf88082da90e510eaa1be97f72ac9","key":"2eddf88082da90e510eaa1be97f72ac9"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Number of incident cases entire study period
<div align="center">
<div id="htmlwidget-6" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-6">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[null,"OUTCOME_events","2020","2021"],"Vaccine manufacturer":["Narrow",null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Vaccine manufacturer","name":"Vaccine manufacturer","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":4,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"a89445ae010aa2d10994c2dcadde0969","key":"a89445ae010aa2d10994c2dcadde0969"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Incidence rates of AESI by vaccine and datasource
<div align="center">
<div id="htmlwidget-7" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-7">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Event","Vaccination","Cases-DAP","IR-DAP","lb-DAP","ubDAP"],"Description":[null,null,null,null,null,null],"format":[null,null,null,null,null,null],"vocabulary":[null,null,null,null,null,null],"comments":[null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"format","name":"format","type":"logical"},{"accessor":"vocabulary","name":"vocabulary","type":"logical"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":6,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"821f466b165c52db9d529aaba3934d57","key":"821f466b165c52db9d529aaba3934d57"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
