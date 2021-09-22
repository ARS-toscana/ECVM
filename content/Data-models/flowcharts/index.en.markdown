---
title: Flowcharts
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
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Flowchart of the population with all exclusion criteria except insufficient run in</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["A_ sex_or_birth_date_missing","B_ Birth_date_aabsurd","C_no_observation_period","D_ death_before_study_entry","E_no_observation_period_including_study_start","N"],"Description":[null,null,null,null,null,null],"Format/Vocabulary":["0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included",null],"Comments":[null,null,null,null,null,"number of persons in this combination of the criteria"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":6,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"16022fcee00f8917da7b13fbae8470d5","key":"16022fcee00f8917da7b13fbae8470d5"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Flowchart_exclusion_criteria
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Flowchart of the population with insufficient run in</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["A_ insufficient_run_in","N"],"Description":[null,null],"Format/Vocabulary":["0 = excluded, 1 = included",null],"Comments":[null,"number of person in this combination of the criteria"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"logical"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":2,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"cf4f52b6002b3fbe4f7a06ba87884536","key":"cf4f52b6002b3fbe4f7a06ba87884536"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Flowchart_QC_criteria
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Flowchart of the doses with all quality check(QC) criteria</h2>
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["A_qc_dupl","B_qc_1_date","C_qc_2_date","D_qc_1_dose","E_qc_2_dose","F_qc_manufacturer","G_qc_mult_date_for_dose","H_qc_mult_dose_for_date","I_qc_3_date","N"],"Description":["Records with same person_id, vx_dose, date and vx_manufacturer","Missing both vx_admin_date and vx_record_date","Date before start_COVID_vaccination_date (01_parameters_program)","Missing dose number","Dose number greater than 2","Records with same person_id, vx_dose and date but different manufacturer","Multiple dates for the same dose number","Multiple doses at the same date","Reverse chronological order for dose number","number of persons in this combination of the criteria"],"Format/Vocabulary":["0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included",null],"Comments":[null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":10,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"cba97b50c91727d00289366e704997bb","key":"cba97b50c91727d00289366e704997bb"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## Flowchart_doses
<div align="center">
<h2 style="color:#333;background:#FFFFFF;text-align:left;font-family:-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;margin:20px">Flowchart of the doses with all quality check(QC) criteria and population exclusion criteria</h2>
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["A_qc_dupl","B_qc_1_date","C_qc_2_date","D_qc_1_dose","E_qc_2_dose","F_qc_manufacturer","G_qc_mult_date_for_dose","H_qc_mult_dose_for_date","I_qc_3_date","J_dose_not_in_persons","K_birth_date_absurd","L_no_observation_period","M_death_before_study_entry","N_no_observation_period_including_study_start","O_insufficient_run_in","P_death_before_vax","Q_exit_spell_before_vax","R_study_end_before_vax","N"],"Description":["Records with same person_id, vx_dose, date and vx_manufacturer","Missing both vx_admin_date and vx_record_date","Date before start_COVID_vaccination_date (01_parameters_program)","Missing dose number","Dose number greater than 2","Records with same person_id, vx_dose and date but different manufacturer","Multiple dates for the same dose number","Multiple doses at the same date","Reverse chronological order for dose number","No linkage from VACCINES to D3_Persons",null,null,null,null,null,null,null,null,"number of persons in this combination of the criteria"],"Format/Vocabulary":["0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included","0 = excluded, 1 = included",null],"Comments":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"Format/Vocabulary","name":"Format/Vocabulary","type":"character"},{"accessor":"Comments","name":"Comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":19,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"7d63aee0226ec912fd27a378650597df","key":"7d63aee0226ec912fd27a378650597df"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
