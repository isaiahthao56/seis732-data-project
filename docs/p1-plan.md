  
**1. Establish the question and check the source**

Source row meaning: Each row is a specific low income housing development phase at an allocation year. 

Size: There are 55430 rows and 90 columns in the source table.

Coverage: The data date ranges from 1987 to 2024 and is updated annually. 

Canidate Identifiers: hud_id- an internal unique identifier for each project. 

Data restriction: Many columns contain insignficant information and there are many null values in these fields. These columns add to the complexity without providing useful information. 

Main Question: How has the number and type of LIHTC housing projects changed over the year? 

Repeated Fields: One field of interest is the *project* column. This column provides the name of the project and is not unqiue. It is not clear if projects can have the same name as another however, this is unlikely. Investigating one *project* with multiple hud_ids, we find that rows are essentially "sub-projects" or individual addresses of a larger project. Another reason why the field *project* is repeated is because it is put in service for multiple years. This could be cause by an project expanding it's physical building or change in allocations of low-income units. 

In this analysis, discerning each *project* will require a more detailed approach. The change in count of hud_ids throughout the years would not be an accurate indicator of change in projects because it would count a project "expansions" as a seperate project. 

[SQL Check Code](sql/01_source_profile.sql)  

**2. Define the model and predict a history consequence**

Business Process: Recording low-income projects and it's properties at year they are put in service.

Fact-table Type: Transactional

Grain: One row represents one version of a project at the year they are put in service.

Consequential Modeling Choice: In this analysis, each row will represent a version of a project. This means that rows in the fact table could point to an existing project but, with updated values. This fits the grain because projects can be put in service in multiple years. In addition, projects can change it's values such as the number of low-income units. This preserves history because the tables retain certain versions of projects.

![Model](Images\seis_732_p1_image1.PNG)

Tracing Primary Question: The main question is, How has the count of new projects changed throughout the years? In order to answer this question, the necessary fields are: hud_id, project and initial_yr_pis. This question asks to identify new projects, this matches projects to the version where they first appeared in the data. In the dim_project table, the *initial_yr_pis* is the year that provides this information. Tracing this question, we begin by filtering/grouping projects by *initial_yr_pis* then joining to the *dim_project* to *fact_lihtc* on *hud_id*. Finally, we select the desired count and variables from the fact table. More complex queries such as number of 1 or 2 bedroom units can be simply added in the select.

Tracing History: One slowly changing dimension is the number of low-income units of a project. In context, apartment complexes and buildings in this data provide a certain number of units designated as "low-income". This number is a portion that can vary from 0 to 100 percent depending on how many units out of the total are "low-income". This portion of low-income units can vary for each LIHTC allocation - each version of a single project can have a different proportion in a different year. A type 2 approach is most appropiate because it preserves the history. The date role that preserves history is the *yr_pis* in the fact table. To find the most recent project, it would require filtering projects with the most recent *yr_pis*. For consistency, the *initial_yr_pis* will be used for analysis to only include new projects. One behavior that I intend to test is a simple count of new projects and also analyze the change in fields of a project that has multiple versions. 

**3. Plan the build and its checks**

Raw: The purpose of this table is to store all of the raw unfiltered data that can be used to build/rebuild other tables. 

Curated: This table is used to narrow down the grain; it contains only useful fields and reasonable rows. 

Serving: A summarizing table that contains aggregates and counts of project fields over the years. 

*Risks:* 

One important field that requires additional inspection is *yr_pis*. This column contains the year that a project is placed in service for LIHTC. However, row values range from 1 to 9999 even though these years are impossible for this data. There are 751 rows with 9999, these are likely a placeholder. On the other spectrum, there are rows with values of 1,2 and 59. The planned selection rule for this field is to only include rows between 1987 to 2024 because that is the range from the source (HUD.gov). This risk affects the primary audience because this column should only contain years that are interpretable. The expected result is a filtered table excluding unreasonable dates. 

Another field that provides a risk is the "project" field as stated before. This field affects the grain of the table because rules can vary depending on the purpose of the table. The planned check for this field to is allow duplicates in the fact table and no duplicates in the projects_dim table. In addition it is necessary to filter out actual duplicate rows with exactly the same row values. To accurately identify a project version to a project, it is also necessary to check if it may just be a coincidence of names. Thus if two unqiue rows share the same project name and zipcode, it is likely to be different versions of the same project. Zipcode is adequate because it is specific but address can vary. 

Restricted Fields: There are no resticted fields and the entire dataset is public. 

Remaining Limitation: The most challenging step is going to be implementing the planned selection rules to the *project* field. It would be best to create general rules that identify if a row is a version of another project. There are several reasons why duplicated rows with the same project name exist; identifying additional reasons is the next step. The current scope answers a simple question, future analysis could include more descriptive fields such as income cieling, non-profit and target population.

AI Usage: AI was used in brainstorming and creating the fact-dimension model. The current model image is a rough draft that includes key fields but not all intended fields. 