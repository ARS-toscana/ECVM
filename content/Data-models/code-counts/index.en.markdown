---
title: Code counts
slug: Code_counts
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
## QC_code_counts_in_study_population_OUTCOME_YYYY
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Based on population in D3_study_population, only count first events. This table allows inspecting the specific diagnostic codes associated to observed occurrences of the outcome.</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["meaning_of_first_event","coding_system_of_code_first_event","code_first_event","count_n"],"Description":[null,null,null,null],"Format/Vocabulary":[null,"ICD9CM, ICD10CM, Read, SNOMED, ICPC, ATC",null,null],"Comments":[null,null,null,null],"Count_n":[null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"},{"accessor":"Count_n","name":"Count_n","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":4,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"823f89538a4390ed749e3e97aad5a2d2","key":"823f89538a4390ed749e3e97aad5a2d2"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## QC_all_components_OUTCOME
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">In this table, all combinations of narrow and meaning in the study population are observed. This allows quantifying to which extent each data bank contributes to the ascertainment of the outcome.</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[0,1,1],"possible_meaning2":[0,0,1],"…":[0,0,0],"narrow_meaning1":[0,0,0],"narrow_meaning2":[0,0,0],"todrop":[0,0,0],"N":[3568303,45,3]},"columns":[{"accessor":"Name","name":"Name","type":"numeric"},{"accessor":"possible_meaning2","name":"possible_meaning2","type":"numeric"},{"accessor":"…","name":"…","type":"numeric"},{"accessor":"narrow_meaning1","name":"narrow_meaning1","type":"numeric"},{"accessor":"narrow_meaning2","name":"narrow_meaning2","type":"numeric"},{"accessor":"todrop","name":"todrop","type":"numeric"},{"accessor":"N","name":"N","type":"numeric"}],"sortable":false,"searchable":true,"defaultPageSize":3,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"145ddfeaa448e0be2fdcdaf4c6582889","key":"145ddfeaa448e0be2fdcdaf4c6582889"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
