---
title: Code counts
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
## code_counts_in_CDMinstance
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Based on population in PERSONS. This table allows inspecting the specific code associated to study variables defined in the CDM instance.</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Conceptset","Code","Coding system","Meaning","Count_n"],"Description":[null,null,null,null,null],"Format/Vocabulary":[null,null,"ICD9CM, ICD10CM, Read, SNOMED, ICPC, ATC",null,null],"Comments":[null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":5,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"2e47149845ff1a47e777e397f79a7028","key":"2e47149845ff1a47e777e397f79a7028"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## QC_code_counts_in_study_population_OUTCOME_YYYY
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Based on population in D3_study_population, only count first events. This table allows inspecting the specific diagnostic codes associated to observed occurrences of the outcome.</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["Conceptset","Code","Coding system","Meaning of_event","Count_n"],"Description":[null,null,null,null,null],"Format/Vocabulary":[null,null,"ICD9CM, ICD10CM, Read, SNOMED, ICPC, ATC",null,null],"Comments":[null,null,null,null,null],"Count_n":[null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"},{"accessor":"Count_n","name":"Count_n","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":5,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"25b05f07fa932d5aacdeb0d046b91aa3","key":"25b05f07fa932d5aacdeb0d046b91aa3"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## QC_all_components_OUTCOME
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">In this table, all combinations of narrow and meaning in the study population are observed. This allows quantifying to which extent each data bank contributes to the ascertainment of the outcome.</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":[0,1,1],"possible_meaning2":[0,0,1],"…":[0,0,0],"narrow_meaning1":[0,0,0],"narrow_meaning2":[0,0,0],"todrop":[0,0,0],"N":[3568303,45,3]},"columns":[{"accessor":"Name","name":"Name","type":"numeric"},{"accessor":"possible_meaning2","name":"possible_meaning2","type":"numeric"},{"accessor":"…","name":"…","type":"numeric"},{"accessor":"narrow_meaning1","name":"narrow_meaning1","type":"numeric"},{"accessor":"narrow_meaning2","name":"narrow_meaning2","type":"numeric"},{"accessor":"todrop","name":"todrop","type":"numeric"},{"accessor":"N","name":"N","type":"numeric"}],"sortable":false,"searchable":true,"defaultPageSize":3,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"145ddfeaa448e0be2fdcdaf4c6582889","key":"145ddfeaa448e0be2fdcdaf4c6582889"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
