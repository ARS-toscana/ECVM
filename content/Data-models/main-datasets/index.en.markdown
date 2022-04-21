---
title: Main datasets
slug: Main_datasets
author: ''
date: []
categories:
  - Data Model
tags: []
weight: 2
---

<script src="{{< blogdown/postref >}}index.en_files/core-js/shim.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/react/react.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/react/react-dom.min.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/reactwidget/react-tools.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/htmlwidgets/htmlwidgets.js"></script>
<script src="{{< blogdown/postref >}}index.en_files/reactable-binding/reactable.js"></script>
## D4_study_population
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">The unit of observation of this table is all the persons that have passed all the exclusion criteria. The table contains basic demographic variables and period inside the study.</h2>
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["person_id","sex","date_of_birth","date_of_death","study_entry_date","start_follow_up (start_lookback)","study_exit_date"],"Description":["unique person identifier","sex at instance creation","date of birth","date of death","date at which subject enters the study, maximum(01-01-2020, date_of_birth, op_start_date) periods, and inclusion criteria (for all 01-01-2020)","study_entry_date – 365 days","minimum between exit_spell_category ( overlapping spell), date of death, end of study period, and recommended end date or date_creation (both in cdm_source)"],"format":["character","character","date","date","date","date","date"],"vocabulary":["from cdm persons","from cdm persons","yyyymmdd","yyyymmdd","yyyymmdd","yyyymmdd","yyyymmdd"],"comments":[null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":7,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"8936026cdf0e10e81990c8d760b6d255","key":"8936026cdf0e10e81990c8d760b6d255"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_vaxweeks_including_not_vaccinated
<div align="center">
<h2 style="color:#000;background:#FFFFFF;text-align:left;font-size:18px;font-style:normal;font-weight:bold;text-decoration:;letter-spacing:px;word-spacing:px;text-transform:;text-shadow:;margin-top:20px;margin-right:0px;margin-bottom:0px;margin-left:0px">Unit of observation: persons in D3 study_population. Observations: one per week from date_vax_1 to study_exit_date (including partial weeks, if any), one week for not vaccinated. In addition with respect to D3_vaxweeks, this table contains birth cohort and if the person has any risk factors</h2>
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["person_id","start_date_of_period","end_date_of_period","Dose","week_fup","sex","type_vax","ageband_at_study_entry","riskfactor"],"Description":["unique person identifier","first date of this period of observation","last date of this period of observation, included",null,"Length in weeks of period",null,"type of vaccine","ageband at study_entry_date",null],"format":[null,"date","date","0 = no dose, 1= dose 1, 2= dose 2","integer","0 = Female, 1 = Male","Pfizer, Moderna, AstraZeneca, J&J","character","riskfactors + any_risk_factors"],"vocabulary":["from cdm persons",null,null,null,"<1 =’0-1’ <2 >1=’1-2’ etc",null,null,"0-4, 5-11, 12-17, 18-24, 25-29, 30-39, 40-49, 50-59, 60-69, 70-79, 80+",null],"comments":[null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":9,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"22da324b49243e88a2b119aee5a6fb93","key":"22da324b49243e88a2b119aee5a6fb93"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## CONCEPT
<div align="center">
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["person_id","date","end_date_record","codvar","event_record_vocabulary","text_linked_to_event_code","event_free_text","present_on_admission","meaning_of_event","laterality_of_event","origin_of_event","visit_occurrence_id","Col","Table_cdm"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":14,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"81aefbccbd114048a29bfb87d9993242","key":"81aefbccbd114048a29bfb87d9993242"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_events_ALL_OUTCOMES
<div align="center">
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["person_id","name_event","date_event","code_first_event","meaning_of_first_event","coding_system_of_code_first_event"],"Description":["unique person identifier","narrow/broad",null,null,null,null],"format":["character",null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null],"comments":[null,null,null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":6,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"83caa57b43bec652befec9e515339525","key":"83caa57b43bec652befec9e515339525"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_study_population_cov_ALL
<div align="center">
<div id="htmlwidget-5" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-5">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["person_id","date_of_death","start_follow_up","date_of_birth","study_exit_date","sex","age_at_study_entry","year_at_study_entry","age_strata_at_study_entry","RISK_FACTOR_at_study_entry","study_entry_date","DP_RISK_FACTOR_at_study_entry","all_covariates_non_CONTR","RISK_FACTOR_either_DX_or_DP"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,"For every risk factors excluding IMMUNOSUPPR and CONTRHYPERT",null,null,null,"For every risk factors excluding IMMUNOSUPPR and CONTRHYPERT"]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"character"}],"sortable":false,"searchable":true,"defaultPageSize":14,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"355cceec5fd1bb94d812b0efded6b70a","key":"355cceec5fd1bb94d812b0efded6b70a"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_outcomes_covid
<div align="center">
<div id="htmlwidget-6" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-6">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"Name":["person_id","name_event","date_event","origin_severity_level_covid"],"Description":["unique person identifier",null,null,null],"format":["character",null,null,null],"vocabulary":["from cdm persons",null,null,null],"comments":[null,null,null,null]},"columns":[{"accessor":"Name","name":"Name","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":4,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"f0912473707c9fab1ab8822e5b195720","key":"f0912473707c9fab1ab8822e5b195720"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
