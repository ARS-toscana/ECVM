---
title: PersonTime monthly
slug: PT_monthly
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
## D4_persontime_risk_month
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, age at 01/01/21, month, year and at_risk_at_study_entry. Contains the persontime and counts for each AESI</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","age_at_study_entry","month","at_risk_at_study_entry","Persontime","Persontime_AESI","AESI_b"],"Description":[null,"age at study entry","year and month",null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","integer","character","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":7,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"8f4176a028dcbeb03b4ed2f531ed25bf","key":"8f4176a028dcbeb03b4ed2f531ed25bf"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D4_persontime_risk_month_RFBC
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, ageband, month, year and at_risk_at_study_entry. Contains the persontime, counts and incidence rate with upper and lower bound for each AESI</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","Ageband","month","at_risk_at_study_entry","Persontime","Persontime_AESI","AESI_b"],"Description":[null,"ageband at 1th january","year and month",null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI"],"Format/Vocabulary":["0 = Female, 1 = Male","integer","character","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":7,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"1e880ebcaeb8dbd3632452faa948b164","key":"1e880ebcaeb8dbd3632452faa948b164"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## RES_IR_week
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Stratified table by sex, ageband, month, year and at_risk_at_study_entry. Contains the persontime, counts and incidence rate with upper and lower bound for each AESI</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["sex","month","year","Ageband","at_risk_at_study_entry","Persontime","Persontime_AESI","AESI_b","IR_AESI","lb_AESI","ub_AESI"],"Description":[null,null,null,"ageband at 1th january",null,"Total persontime","Persontime in population for each AESI","Cases in population for each AESI","incidence rate","lower 95% confidence interval bound for the IR","upper 95% confidence interval bound for the IR"],"Format/Vocabulary":["0 = Female, 1 = Male","character","character","integer","integer","integer","integer","integer","integer","integer","integer"],"Comments":[null,null,null,null,null,null,"AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets","AESI defined in OUTCOMES_conceptssets"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":11,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"daf1a84f12407d5c2f93da9bd8683878","key":"daf1a84f12407d5c2f93da9bd8683878"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
