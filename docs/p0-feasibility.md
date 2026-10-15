**1. Working Title:** *Evaluating the geographical and demographic program reach of SNAP.*

**2. Audience and need:**
- Audience: SNAP operates under a Federal-State level control; state agencies have the most control over who and where SNAP programs operate. 
- User groups: Counties that contain large portions of elidgible households that are not enrolled. Spread awarness to areas in the US that could benefit the most from SNAP and similar programs.
-This project would analyze the effictiveness of the current SNAP market penetration. It could also test whether there are certain geographical/demographic barriers that restrict enrollment. 
- If sucessful, this project could be used to implement policies or outreaches for communities with the largest service gaps.

**3. Dashboard:**
    a. What is the portion of low-income households enrolled SNAP by county/state?
    b. What are key demographic identifiers that may explain SNAP enrollment gaps?
    c. Which counties in the US could benefit the most from SNAP enrollment?
    d. How has SNAP enrollment changed over time?

**4. Souce Identification:**
Dataset: "SNAP Enrollment"
Source: US Department of Agriculture
BigQuery Table ID: bigquery-public-data.sdoh_snap_enrollment.snap_enrollment
Source is approved from bigquery-public-data and accessible 
No visibile redistribution constrains - public government data

**5. Quick Source Profile**
- One row represents a specific geogrpahical area (ZIP code ot county) during a specific time period (month or year) and counts of households enrolled in Public Assistance programs (SNAP/EBT). 
- Current row count: 40310
- Possible ID: FIPS (geographical key)
- No NULL dates or IDs
- Fields likely to support proposed questions: FIPS, Date, SNAP_All_Participation_Persons, SNAP_All_Participation_Households, SNAP_All_Issuance
- Historical dataset that is not updated regularly. Dates range from 2012 to 2019

**6. Need to Source fit**
| Proposed Question | Needed field | Canidate source objects | Why source appears sufficent | Gap or Assumption |
| :--- |:--- |:--- |:--- |:--- |
| What is the portion of low-income households enrolled SNAP by county/state? | Household income, household SNAP enrollment, geography | state_fips, snap_participating_households, total_households | The source contains aggregated counts of households enrolled by geographic regions | The smallest grain level is county, we can't analyze questions about how SNAP is being utilized |
| What are key demographic identifiers that may explain SNAP enrollment gaps? | - | - | - | - |

**7. Feasibility risks and response**
- insufficient grain, identifiers, date coverage, or descriptive context:

One limitation of this dataset is that it does not provide information on the effectiveness of the SNAP program itself. The data only provides information of specific welfare program enrollment at the country and state grain. This project will focus on the reach of SNAP with the assumption that SNAP enrollment increases quality of life for households. 

- static data that will require a later change case: This data set only contains historical data only up to 2019. Unfortunately this means that we cannot analyze the impact of recent political changes and the Covid-pandemic. Applying the historical findings to current/future forecasts would require a large amount of evidence because the socioeconomic states are very different. 

**8. First P1 decision**
One of the first issues that I expect to resolve in P1 is identifying which other data tables I will join to the SNAP enrollment table. I have identified the US Census table: `bigquery-public-data.census_bureau_usa` as a necessary component to include to answer the proposed questions about demographics. With additional tables, I will be able to analyze various features that affect enrollment not included in the SNAP table.


**9. AI/tool accountability**
Google Gemini was used in the project topic exploration stage. Gemini was also used to identify additional relevant public datasets such as the US census. These datasets were verified to be accessible on the `biqquery-public-data project`.