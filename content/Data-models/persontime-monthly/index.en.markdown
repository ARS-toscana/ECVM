---
title: PersonTime monthly
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
## D4_persontime_risk_month
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, age at 01/01/21, month, year and at_risk_at_study_entry. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","age_at_1_jan_2021","month","at_risk_at_study_entry","Persontime","Persontime_AESI","AESI_b"],"Description":[null,"age at 1th january","year and month",null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","integer","character","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":7,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"cac6fd43cc47843693d51499d3212348","key":"cac6fd43cc47843693d51499d3212348"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_month_RFBC
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, ageband, month, year and at_risk_at_study_entry. Contains the persontime, counts and incidence rate with upper and lower bound for each AESI</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Ageband","month","year","at_risk_at_study_entry","Persontime","Persontime_AESI","AESI_b"],"Description":[null,"ageband at 1th january",null,null,null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","integer","character","character","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"d6f476bed59a9e6d984f10526ccd6ab7","key":"d6f476bed59a9e6d984f10526ccd6ab7"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## RES_IR_month
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Stratified table by sex, ageband, month, year and at_risk_at_study_entry. Contains the persontime, counts and incidence rate with upper and lower bound for each AESI</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Ageband","month","year","at_risk_at_study_entry","Persontime","Persontime_AESI","AESI_b","IR_AESI","lb_AESI","ub_AESI"],"Description":[null,"ageband at 1th january",null,null,null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI","incidence rate","lower 95% confidence interval bound for the IR","upper 95% confidence interval bound for the IR"],"Format/Vocabulary":["0 = Female, 1 = Male","integer","character","character","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":11,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"7664da0401125eecda328bc84437f3af","key":"7664da0401125eecda328bc84437f3af"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
