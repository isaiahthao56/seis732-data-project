**1. Working Title:** *Longitudinal Analysis of Low-Income Housing in Minnesota*

**2. Audience and need:**

The audience of this project is affordable housing developers and local policy makers. The current problem that the audience faces is identifying ways to ensure housing for low-income and underserved families. The main aim of this project is to identify underserved areas for future development. This project would be useful because it would identify patterns in past trends and predict current housing needs. With this information, affordable housing planners would be able to appropiately invest into areas that would benefit thier users the most.

**3. Dashboard:**
The first option for a product is a dashboard; that provides summarizing predictions on future housing needs. 

 -  Is there a signficant shift from urban to suburban projects in recent years?
 -  Is there a correlation between the number or higher-density multi-family projects and increased housing prices?
 -  What are the impacts of large economic downturns -such as covid- on affordable housing devlopments?

**4. Souce Identification:**
Dataset name: LIHTCPUB

Provider: US Department of Housing and Urban Development

Dataset Source: https://www.huduser.gov/lihtc/ (Whole dataset download)

The LIHTC is a public dataset published and maintained by the US government. The dataset is open to the public and does not contain sensitive information. There are no constraints other than appropiate attribution to the source. 

**5. Quick Source Profile**
One row represents a single recorded LIHTC project or development property. 

Row count: 55,340

Year range: 1987 to 2027 - yr_pis is years placed in service, it includes future and past dates because it is a planned year, not actual. 

Canidate Identifier: hud_id

Relevant Fields: hud_id, yr_pis, yr_alloc (year tax credit is allocated), n_units (total), li_units (low-income units), proj_state, proj_zip, metro (binary), trg (target demographic)

Nulls: There are 90 fields, many of which are nullable and do not contain any rows. 

There are no duplicated rows of hud_id. Data is published yearly and does not require refreshing. These projects are real locations with addresses listed but are made public. 

**6. Need to Source fit**
| Proposed Question | Needed field | Canidate source objects | Why source appears sufficent | Gap or Assumption |
| :--- |:--- |:--- |:--- |:--- |
| Is there a shift from urban to suburban in recent years | Geographic urban vs suburban and date | yr_alloc, metro, proh_zip | There are several geographic levels and date is recorded | Date is recorded yearly and yr_pis is used because it represents the actual time property is in effect. |

**7. Feasibility risks and response**
Static data and yearly grain: The dataset is update annully and it does not contain monthly updates. This means we can only compare by year which broadens the focus of analyzing specific events (covid). 

Unclear fields: This table contains 90 columns, many of which require another document to find descriptions. Many of these fields are not usefull for this project however the large number of nulls may be distracting. 

**8. First P1 decision**
In P-1 the goal is to identify all of the columns that will be useful and create a table without unneccessary fields. 


**9. AI/tool accountability**
AI was used in the process of uploading the table into Big Query. AI was also used to narrow down the topic with the given data. 