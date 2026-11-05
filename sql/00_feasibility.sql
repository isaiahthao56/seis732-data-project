-- Record the authorized objects and inspect their definitions.
SELECT column_name, data_type, is_nullable
FROM `seis-732-project-1.lihtc_2024_dataset.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'lihtc_2024_table'
ORDER BY ordinal_position;

-- Establish basic scale without exporting row-level data.
SELECT COUNT(*) AS row_count
FROM `seis-732-project-1.lihtc_2024_dataset.lihtc_2024_table`;

-- Test the time coverage and candidate identifier relevant to the idea.
SELECT
    MIN(yr_pis) AS earliest_date,
    MAX(yr_pis) AS latest_date,
    COUNTIF(hud_id IS NULL) AS null_candidate_ids,
    COUNT(DISTINCT hud_id) AS distinct_candidate_ids
FROM `seis-732-project-1.lihtc_2024_dataset.lihtc_2024_table`
WHERE yr_pis IS NOT NULL
  AND yr_pis > 1900
  AND yr_pis < 3000;
--There are rows with year = 9999 and 0.

-- Repeated row count 
SELECT 
    hud_id, 
    COUNT(*) AS record_count
FROM `seis-732-project-1.lihtc_2024_dataset.lihtc_2024_table`
WHERE hud_id IS NOT NULL
GROUP BY hud_id
HAVING COUNT(*) > 1
ORDER BY record_count DESC;
