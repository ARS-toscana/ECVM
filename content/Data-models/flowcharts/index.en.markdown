---
title: Flowcharts
slug: Flowcharts
author: ''
date: []
categories:
  - Data Model
weight: 5
---

<script src="{{< blogdown/postref >}}index.en_files/core-js/shim.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/react/react.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/react/react-dom.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/reactwidget/react-tools.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/htmlwidgets/htmlwidgets.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/reactable-binding/reactable.js"></script>
## Flowchart_basic_exclusion_criteria
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Flowchart of the population with all exclusion criteria except insufficient run in</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["A_ sex_or_birth_date_missing","B_ Birth_date_aabsurd","C_no_observation_period","D_ death_before_study_entry","E_no_observation_period_including_study_start","N"],"Description":[null,null,null,null,null,null],"Format/Vocabulary":["0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included",null],"Comments":[null,null,null,null,null,"number of persons in this combination of the criteria"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":6,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"16022fcee00f8917da7b13fbae8470d5","key":"16022fcee00f8917da7b13fbae8470d5"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Flowchart_exclusion_criteria
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Flowchart of the population with insufficient run in</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["A_ insufficient_run_in","N"],"Description":[null,null],"Format/Vocabulary":["0 = excluded, 1 = included",null],"Comments":[null,"number of person in this combination of the criteria"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":2,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"cf4f52b6002b3fbe4f7a06ba87884536","key":"cf4f52b6002b3fbe4f7a06ba87884536"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Flowchart_QC_criteria
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Flowchart of the doses with all quality check(QC) criteria</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["A_duplicated_records","B_missing_date","C_date_before_start_vax","D_distance_btw_1_2_doses","E_distance_btw_2_3_doses","F_dose_after_3","G_dose_after_2","N"],"Description":["Records with same person_id, vx_dose, date and vx_manufacturer","Missing both vx_admin_date and vx_record_date","Date before start vaccination campaign (start_COVID_vaccination_date in 01_parameters_program)","Distance between first and second doses less than 14 days","Distance between second and third doses less than 90 days","Doses after third","Doses after second","number of persons in this combination of the criteria"],"Format/Vocabulary":["0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included",null],"Comments":[null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"13743a168df3d6d73765efb9c3998fd5","key":"13743a168df3d6d73765efb9c3998fd5"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Flowchart_doses
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Flowchart of the doses with all quality check(QC) criteria and population exclusion criteria</h2>
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["A_duplicated_records","B_missing_date","C_date_before_start_vax","D_distance_btw_1_2_doses","E_distance_btw_2_3_doses","F_dose_after_3","G_dose_after_2","H_dose_not_in_persons","I_birth_date_absurd","J_no_observation_period","K_death_before_study_entry","L_no_observation_period_including_study_start","M_insufficient_run_in","N_death_before_vax","O_exit_spell_before_vax","P_study_end_before_vax","N"],"Description":["Records with same person_id, vx_dose, date and vx_manufacturer","Missing both vx_admin_date and vx_record_date","Date before start vaccination campaign (start_COVID_vaccination_date in 01_parameters_program)","Distance between first and second doses less than 14 days","Distance between second and third doses less than 90 days","Doses after third","Doses after second","No linkage from VACCINES to D3_Persons",null,null,null,null,null,null,null,null,"number of persons in this combination of the criteria"],"Format/Vocabulary":["0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included",null],"Comments":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":17,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"0a6e70db2a775e4481b56e7a3df62821","key":"0a6e70db2a775e4481b56e7a3df62821"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
