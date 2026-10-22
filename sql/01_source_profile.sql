SELECT 
    t1.FIPS,
    
    -- SNAP enrollment metrics
    AVG(t1.SNAP_All_Participation_Persons) AS avg_snap_enrollment,
    
    -- Census ACS demographic & economic features
    AVG(t2.total_pop) AS avg_total_population,
    AVG(t2.poverty) AS avg_poverty_population,
    AVG(t2.median_income) AS avg_median_household_income

FROM 
    `bigquery-public-data.sdoh_snap_enrollment.snap_enrollment` AS t1
INNER JOIN 
    `bigquery-public-data.census_bureau_acs.county_2020_5yr` AS t2 
    ON t1.FIPS = t2.geo_id
GROUP BY 
    t1.FIPS
ORDER BY 
    avg_snap_enrollment DESC;