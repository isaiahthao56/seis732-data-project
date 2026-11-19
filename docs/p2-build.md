**1. Establish the input and run ingestion**

The main analytical focus of this work is to identify patterns in the development in low-income housing projects over time. In this document, we will step though the process on importing and curating the raw data. The final result will be reproducable data ingestion steps and a curated table with sucessful acceptance checks.

The source of the Low-Income Housing Tax Credit dataset is a downloadable csv from the US Housing and Urban Development website. This website provides a portal to search and filter for specific fields. This project uses the complete LIHTC dataset CSV with updated to 2024. 

[LITCH Database Access](https://www.huduser.gov/lihtc/ "Dataset Portal Downloads")

An alternative data source is the big query LIHTC public dataset. This is a subset that contains rows up to 2017. This dataset can be queried from big query without any downloads. 

[Big Query Access](https://console.cloud.google.com/marketplace/product/housing-urban-development/lihtc-program?): `bigquery-public-data.sdoh_hud_housing.2017_lihtc_database_hud`

For this project the CSV file was uploaded into a bucket in Google Cloud. From there, Big Query is able to reference the CSV using it's URI. One signficant decision was to load the data with an all STRING data type schema. This avoids errors when auto-detect incorrectly parses data. One example is the `st2020` column that contains 

