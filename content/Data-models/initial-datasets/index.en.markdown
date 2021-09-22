---
title: Initial datasets
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
## CONCEPT
<div align="center">
<div id="htmlwidget-1" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","date","end_date_record","codvar","event_record_vocabulary","text_linked_to_event_code","event_free_text","present_on_admission","meaning_of_event","laterality_of_event","origin_of_event","visit_occurrence_id","Col","Table_cdm","so_source_table","so_source_column","so_unit","survey_id","so_origin"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":19,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"a3312fb58b3fc245f89cf685f26d9cd9","key":"a3312fb58b3fc245f89cf685f26d9cd9"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## output_spells_category
<div align="center">
<div id="htmlwidget-2" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-2">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","op_meaning","num_spell","entry_spell_category","exit_spell_category"],"Description":["unique person identifier",null,null,null,null],"format":["character",null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null],"comments":[null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":5,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"bf6be11b86be767f08c2325b40a7ed33","key":"bf6be11b86be767f08c2325b40a7ed33"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_events_DEATH
<div align="center">
<div id="htmlwidget-3" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-3">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","date"],"Description":["unique person identifier",null],"format":["character",null],"vocabulary":["from cdm persons",null],"comments":[null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":2,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"56d06ee865ea4965ade7fb7e12542571","key":"56d06ee865ea4965ade7fb7e12542571"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_PERSONS
<div align="center">
<div id="htmlwidget-4" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-4">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","day_of_birth","month_of_birth","year_of_birth","day_of_death","month_of_death","year_of_death","sex_at_instance_creation","race","country_of_birth","quality","date_birth","date_death"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":13,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"20be995c8561ed430b1b74fc426f3a3a","key":"20be995c8561ed430b1b74fc426f3a3a"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## covid_registry
<div align="center">
<div id="htmlwidget-5" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-5">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","survey_id","survey_meaning","date"],"Description":["unique person identifier",null,null,null],"format":["character",null,null,null],"vocabulary":["from cdm persons",null,null,null],"comments":[null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":4,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"8d8bfdef1155b73a1dd1d8bed6a269e5","key":"8d8bfdef1155b73a1dd1d8bed6a269e5"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_concepts_QC_criteria
<div align="center">
<div id="htmlwidget-6" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-6">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","date","vx_dose","vx_manufacturer","qc_1_date","qc_1_dose","qc_dupl","qc_2_date","qc_2_dose","qc_manufacturer","qc_mult_date_for_dose","qc_mult_dose_for_date","qc_3_date"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":13,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"690bf5fdf8c01a3105a60db57ba4e030","key":"690bf5fdf8c01a3105a60db57ba4e030"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## selected_doses
<div align="center">
<div id="htmlwidget-7" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-7">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","date","vx_dose","vx_manufacturer","qc_1_date","qc_1_dose","qc_dupl","qc_2_date","qc_2_dose","qc_manufacturer","qc_mult_date_for_dose","qc_mult_dose_for_date","qc_3_date","A_qc_dupl","B_qc_1_date","C_qc_2_date","D_qc_1_dose","E_qc_2_dose","F_qc_manufacturer","G_qc_mult_date_for_dose","H_qc_mult_dose_for_date","I_qc_3_date"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":22,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"adcff0d68e8db9ab24653a0f06209c74","key":"adcff0d68e8db9ab24653a0f06209c74"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_selection_criteria
<div align="center">
<div id="htmlwidget-8" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-8">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","sex","date_of_birth","date_of_death","sex_or_birth_date_missing","birth_date_absurd","no_observation_period","study_entry_date","start_follow_up","study_exit_date","death_before_study_entry","insufficient_run_in","no_observation_period_including_study_start"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":13,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"eb25e76ab36d63fc922972868a84d813","key":"eb25e76ab36d63fc922972868a84d813"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_components_OUTCOME
<div align="center">
<div id="htmlwidget-9" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-9">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","study_entry_date","CONCEPT_(narrow/possible)_COMPONENTS_YEAR"],"Description":["unique person identifier",null,null],"format":["character",null,null],"vocabulary":["from cdm persons",null,null],"comments":[null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":3,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"a376e7bfb732ba5b1ded7f322ffb3aba","key":"a376e7bfb732ba5b1ded7f322ffb3aba"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_events_OUTCOME_TYPE
<div align="center">
<div id="htmlwidget-10" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-10">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","date","end_date_record","codvar","event_record_vocabulary","text_linked_to_event_code","event_free_text","present_on_admission","meaning_of_event","laterality_of_event","origin_of_event","visit_occurrence_id","Col","Table_cdm","so_source_table","so_source_column","so_unit","survey_id","so_origin","study_entry_date","CONCEPT_(narrow/possible)_COMPONENTS_YEAR"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":21,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"823cbbedf37865795a1dd89c2d33af2f","key":"823cbbedf37865795a1dd89c2d33af2f"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_eventsSecondary_SECCOMP
<div align="center">
<div id="htmlwidget-11" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-11">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","date","end_date_recordA","codvarA","event_record_vocabularyA","meaning_of_eventA","conceptsetnameA","study_entry_date"],"Description":["unique person identifier",null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":8,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"61c6e886fe10481ee531691346f2e57f","key":"61c6e886fe10481ee531691346f2e57f"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_events_ALL_OUTCOMES
<div align="center">
<div id="htmlwidget-12" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-12">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","name_event","date_event","code_first_event","meaning_of_first_event","coding_system_of_code_first_event"],"Description":["unique person identifier","narrow/broad",null,null,null,null],"format":["character",null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null],"comments":[null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":6,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"fc6bea8684d0a00b08b4677937179e2c","key":"fc6bea8684d0a00b08b4677937179e2c"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_study_population_covariates
<div align="center">
<div id="htmlwidget-13" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-13">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","study_entry_date","CV_at_study_entry","COVCANCER_at_study_entry","COVCOPD_at_study_entry","COVHIV_at_study_entry","COVCKD_at_study_entry","COVDIAB_at_study_entry","COVOBES_at_study_entry","COVSICKLE_at_study_entry"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":10,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"f35edbeab34773907fe84bc93b69fa25","key":"f35edbeab34773907fe84bc93b69fa25"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_study_population_DP
<div align="center">
<div id="htmlwidget-14" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-14">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","study_entry_date","DP_COVCANCER_at_study_entry","DP_COVDIAB_at_study_entry","DP_CVD_at_study_entry","DP_COVHIV_at_study_entry","DP_COVCKD_at_study_entry","DP_COVCOPD_at_study_entry","DP_COVOBES_at_study_entry","DP_COVSICKLE_at_study_entry","IMMUNOSUPPR_at_study_entry","DP_CONTRHYPERT_at_study_entry"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":12,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"2036064d64e0f83aeb988282bd1e453f","key":"2036064d64e0f83aeb988282bd1e453f"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_study_population_cov_ALL
<div align="center">
<div id="htmlwidget-15" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-15">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","date_of_death","start_follow_up","date_of_birth","study_exit_date","sex","age_at_study_entry","year_at_study_entry","age_strata_at_study_entry","CV_at_study_entry","COVCANCER_at_study_entry","COVCOPD_at_study_entry","COVHIV_at_study_entry","COVCKD_at_study_entry","COVDIAB_at_study_entry","COVOBES_at_study_entry","COVSICKLE_at_study_entry","study_entry_date","DP_COVCANCER_at_study_entry","DP_COVDIAB_at_study_entry","DP_CVD_at_study_entry","DP_COVHIV_at_study_entry","DP_COVCKD_at_study_entry","DP_COVCOPD_at_study_entry","DP_COVOBES_at_study_entry","DP_COVSICKLE_at_study_entry","IMMUNOSUPPR_at_study_entry","DP_CONTRHYPERT_at_study_entry","all_covariates_non_CONTR","CV_either_DX_or_DP","COVCANCER_either_DX_or_DP","COVCOPD_either_DX_or_DP","COVHIV_either_DX_or_DP","COVCKD_either_DX_or_DP","COVDIAB_either_DX_or_DP","COVOBES_either_DX_or_DP","COVSICKLE_either_DX_or_DP"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":37,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"81bae02edb82991f4e468316cc4f9a0f","key":"81bae02edb82991f4e468316cc4f9a0f"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_components_covid_severity
<div align="center">
<div id="htmlwidget-16" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-16">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","sex","date_of_birth","date_of_death","study_entry_date","start_follow_up","study_exit_date","first_date_covid_narrow_hosp_discharge","first_date_covid_narrow","first_date_covid_registry","survey_id","so_source_value","covid_registry_symptoms","so_source_column","MechanicalVentilation_within_covid_narrow_date","MechanicalVentilation_within_registry_date","Infection_within_covid_narrow_date","Infection_within_registry_date","Respiratory_within_covid_narrow_date","Respiratory_within_registry_date","death_after_covid_narrow_date","covid_death_discharge","death_after_covid_registry"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":23,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"e49d625346321b363883e79ddffb8101","key":"e49d625346321b363883e79ddffb8101"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_algorithm_covid
<div align="center">
<div id="htmlwidget-17" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-17">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","sex","date_of_birth","date_of_death","study_entry_date","start_follow_up","study_exit_date","first_date_covid_narrow_hosp_discharge","first_date_covid_narrow","first_date_covid_registry","survey_id","so_source_value","covid_registry_symptoms","so_source_column","MechanicalVentilation_within_covid_narrow_date","MechanicalVentilation_within_registry_date","Infection_within_covid_narrow_date","Infection_within_registry_date","Respiratory_within_covid_narrow_date","Respiratory_within_registry_date","death_after_covid_narrow_date","covid_death_discharge","death_after_covid_registry","date_covid","origin_date_covid","severity_level_covid","origin_severity_level_covid"],"Description":["unique person identifier",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"format":["character",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"vocabulary":["from cdm persons",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"comments":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":27,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"767ba5f62f47fa85c1da34b1d5999cf4","key":"767ba5f62f47fa85c1da34b1d5999cf4"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>

## D3_outcomes_covid
<div align="center">
<div id="htmlwidget-18" class="reactable html-widget" style="width:auto;height:300px;"></div>
<script type="application/json" data-for="htmlwidget-18">{"x":{"tag":{"name":"Reactable","attribs":{"data":{"variable":["person_id","name_event","date_event","origin_severity_level_covid"],"Description":["unique person identifier",null,null,null],"format":["character",null,null,null],"vocabulary":["from cdm persons",null,null,null],"comments":[null,null,null,null]},"columns":[{"accessor":"variable","name":"variable","type":"character"},{"accessor":"Description","name":"Description","type":"character"},{"accessor":"format","name":"format","type":"character"},{"accessor":"vocabulary","name":"vocabulary","type":"character"},{"accessor":"comments","name":"comments","type":"logical"}],"sortable":false,"searchable":true,"defaultPageSize":4,"paginationType":"numbers","showPageInfo":true,"minRows":1,"highlight":true,"bordered":true,"striped":true,"style":{"maxWidth":650},"height":"300px","dataKey":"7d891de1cd4f908fe78b9608bcba7c1f","key":"7d891de1cd4f908fe78b9608bcba7c1f"},"children":[]},"class":"reactR_markup"},"evals":[],"jsHooks":[]}</script>
<br/>
<br/>
<br/>
<br/>
</div>
