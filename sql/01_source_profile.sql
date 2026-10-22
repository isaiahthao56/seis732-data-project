FROM 
    `bigquery-public-data.sdoh_snap_enrollment.snap_enrollment` AS t1
INNER JOIN 
    `bigquery-public-data.census_bureau_acs.county_2020_5yr` AS t2 
    ON t1.FIPS = t2.geo_id
GROUP BY 
    t1.FIPS
ORDER BY 
    avg_snap_enrollment DESC;

SELECT * FROM `bigquery-public-data.census_bureau_acs.county_2020_5yr` LIMIT 1;
SELECT * FROM `bigquery-public-data.sdoh_snap_enrollment.snap_enrollment` LIMIT 10;

