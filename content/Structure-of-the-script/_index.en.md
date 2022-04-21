---
title: "Structure of the script"
slug: structure_of_the_script
date: "[]"
chapter: yes
pre: <b>3. </b>
weight: 6
---

# Structure of the script

A ConcePTION script is composed by 

* the file to_run.R, that is to be run to execute the script
* the folder p_parameters, including parameters that are useful for the script
* the folder p_macro, including functions developed by the ConcePTION Project and collaborators. The functions are sourced in the script, but are available as a package [at this link](https://github.com/IMI-ConcePTION/ConceptionTools)
* the folder p_steps, including the sequence of steps that execute the script.

Each step is a short R program, that has some input datasets and parameters, and some output datasets. The input datasets of a step are either tables of the CDM, or output datasets from previous steps.

[Diagram of the structure](https://ars-toscana.github.io/ECVM/data/ECVM.html)
