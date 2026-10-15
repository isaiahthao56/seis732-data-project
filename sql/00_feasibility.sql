-- SQL Code for Feasibility

-- Record the authorized objects and inspect their definitions.
SELECT 
    column_name, 
    data_type, 
    is_nullable 
FROM 
    `bigquery-public-data.sdoh_snap_enrollment.INFORMATION_SCHEMA.COLUMNS` 
WHERE 
    table_name = 'snap_enrollment' 
ORDER BY 
    ordinal_position;

-- Establish basic scale without exporting row-level data.
SELECT COUNT(*) AS row_count
FROM `bigquery-public-data.sdoh_snap_enrollment.snap_enrollment`;

-- Test the time coverage and candidate identifier relevant to the idea.
SELECT    
    MIN(Date) AS earliest_date, 
    MAX(Date) AS latest_date,    
    COUNTIF(FIPS IS NULL) AS null_candidate_ids,    
    COUNT(DISTINCT FIPS) AS distinct_candidate_ids 
FROM 
    `bigquery-public-data.sdoh_snap_enrollment.snap_enrollment`;

SELECT 
  COUNTIF(FIPS IS NULL) AS fips_nulls,
  COUNTIF(Date IS NULL) AS date_nulls,
  -- Add any other specific columns you want to spot-check quickly
FROM 
  `bigquery-public-data.sdoh_snap_enrollment.snap_enrollment`;