WITH grain_groups AS (
  SELECT hud_id, COUNT(*) AS rows_per_id
  FROM `seis-732-project-1.lihtc_2024_dataset.lihtc_2024_table`
  GROUP BY hud_id
)
SELECT
  COALESCE(SUM(rows_per_id), 0) AS source_rows,
  COALESCE(SUM(IF(hud_id IS NULL, rows_per_id, 0)), 0) AS rows_with_null_id,
  COUNTIF(hud_id IS NOT NULL AND rows_per_id > 1) AS repeated_id_groups
FROM grain_groups;

SELECT hud_id, project, proj_st, proj_zip, n_units, li_units, yr_pis, metro
FROM `seis-732-project-1.lihtc_2024_dataset.lihtc_2024_table`
WHERE proj_st = 'MN'
  AND yr_pis > 2000
  AND yr_pis < 3000
LIMIT 10;

SELECT COUNT(hud_id)
FROM `seis-732-project-1.lihtc_2024_dataset.lihtc_2024_table`
WHERE proj_st = 'MN'
  AND yr_pis > 2000
  AND yr_pis < 3000
GROUP BY metro;

#Counts of projects- many appear more than once 
SELECT 
    project, 
    COUNT(*) AS record_count
FROM `seis-732-project-1.lihtc_2024_dataset.lihtc_2024_table`
WHERE project IS NOT NULL
GROUP BY project
HAVING COUNT(*) > 1
ORDER BY record_count DESC;

#In the table, there are more rows than projects. Thus projects is a repeated column.
SELECT COUNT(DISTINCT project) AS Distinct_projects, COUNT(project) AS Total_Projects
FROM `seis-732-project-1.lihtc_2024_dataset.lihtc_2024_table`;

SELECT * 
FROM `seis-732-project-1.lihtc_2024_dataset.lihtc_2024_table`
WHERE project = "MORGAN'S MILL SUBDIVISION"
LIMIT 10;

SELECT 
    project, 
    COUNT(DISTINCT yr_pis) AS distinct_yr_pis_count,
    STRING_AGG(DISTINCT CAST(yr_pis AS STRING), ', ' ORDER BY CAST(yr_pis AS STRING)) AS yr_pis_values,
    COUNT(*) AS total_records
FROM `seis-732-project-1.lihtc_2024_dataset.lihtc_2024_table`
WHERE project IS NOT NULL
GROUP BY project
HAVING COUNT(DISTINCT yr_pis) > 1
ORDER BY distinct_yr_pis_count DESC;

SELECT yr_pis, COUNT(yr_pis)
FROM `seis-732-project-1.lihtc_2024_dataset.lihtc_2024_table`
GROUP BY yr_pis;

