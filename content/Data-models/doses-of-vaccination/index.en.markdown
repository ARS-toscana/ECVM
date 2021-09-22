---
title: Doses of vaccination
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
## table_QC_dose_derived
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Table comparing first and second doses, missing, discordant and concordant.</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Datasource","N or %","Number of doses","Missing first doses","Missing second doses","Discordant first to second","Discordant second to first","Concordant first doses","Concordant second doses"],"Description":["Datasource of the data","Integer or percentage w.r.t. total","Total number of doses","Missing -> Derived Dose 1","Missing -> Derived Dose 2","Dose 1 -> Derived Dose 2","Dose 2 -> Derived Dose 1","Dose 1 -> Derived Dose 1","Dose 2 -> Derived Dose 2"],"Format/Vocabulary":[null,null,null,null,null,null,null,null,null],"Comments":[null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"logical"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":9,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"b7a1dcc76c7ef6142b816de5878ba834","key":"b7a1dcc76c7ef6142b816de5878ba834"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_doses_weeks
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">From D3_vaxweeks. Stratified table by datasource, year, weeknumber, birthcat, sex, at_risk, dose, type_vax1, type_vax2, with sum of persons and sum of doses. Risk factors measured at date of first vaccination (for now at study entry).</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Datasource","year","Week number","Birthcohort persons","Sex","At_Risk","Dose","Type_vax1","Type_vax2"],"Description":[null,null,null,null,null,null,"dose number","Type vaccine dose 1","Type vaccine dose 2"],"Format/Vocabulary":["ARS, BIFAP, CPRD, PHARMO","2020, 2021","\"01-01-2020\" , \"08-01-2020\", …","<1940, 1940-1949, 1950-1959, 1960-1969, 1970-1979, 1980-1989, 1990+","0 = Female, 1 = Male","0 = no, 1 = yes","0= no dose, 1=dose1, 2=dose2, UNK=unknown","Pfizer, Moderna, AZ, Janssen, Unknown","Pfizer, Moderna, AZ, Janssen, Unknown"],"Comments":[null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":9,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"c744ccffa8d7eb22abf0c998f0edb1a7","key":"c744ccffa8d7eb22abf0c998f0edb1a7"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_distance_doses
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">From D3_vaccin_cohort. Quartile of distance between concordant doses.</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Datasource","Distance_P25_Pfizer1_2","Distance_P50_Pfizer1_2","Distance_P75_ Pfizer1_2","Distance_P25_Moderna1_2","Distance_P50_Moderna1_2","Distance_P75_Moderna1_2","Distance_P25_AZ_2","Distance_P50_AZ_1","Distance_P75_AZ_1"],"Description":[null,"Distance between 1st and second dose (date_vax2_date_vax1) for typ_vax1=pfizer and type_vax2 Pfizer for not empty(date_vax2) and 25th percentile of distribution","Distance between 1st and second dose (date_vax2_date_vax1) for typ_vax1=pfizer and type_vax2 Pfizer for not empty(date_vax2) and 50th percentile of distribution","Distance between 1st and second dose (date_vax2_date_vax1) for typ_vax1=pfizer and type_vax2 Pfizer for not empty(date_vax2) and 75th percentile of distribution","Distance between 1st and second dose (date_vax2_date_vax1) for typ_vax1=Moderna and type_vax2 Moderna for not empty(date_vax2) and 25th percentile of distribution","Distance between 1st and second dose (date_vax2_date_vax1) for typ_vax1=Moderna and type_vax2 Moderna for not empty(date_vax2) and 50th percentile of distribution","Distance between 1st and second dose (date_vax2_date_vax1) for typ_vax1=Moderna and type_vax2 Moderna for not empty(date_vax2) and 75th percentile of distribution","Distance between 1st and second dose (date_vax2_date_vax1) for typ_vax1=Astrazeneca and type_vax2 Astrazeneca for not empty(date_vax2) and 25th percentile of distribution","Distance between 1st and second dose (date_vax2_date_vax1) for typ_vax1= Astrazeneca and type_vax2 Astrazeneca for not empty(date_vax2) and 50th percentile of distribution","Distance between 1st and second dose (date_vax2_date_vax1) for typ_vax1= Astrazeneca and type_vax2 Astrazeneca for not empty(date_vax2) and 75th percentile of distribution"],"Format/Vocabulary":["ARS BIFAP CPRD PHARMO","Integer","Integer","Integer","Integer","Integer","Integer","Integer","Integer","Integer"],"Comments":[null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":10,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"bca84f5fcc1ab9ae2a755593e25ec790","key":"bca84f5fcc1ab9ae2a755593e25ec790"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
