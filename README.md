# SQL_PROJECTS
REPO FOR INTERNAL SQL PROJECT NAMED **PROD_DATA_PROJECT**

**Step 1: Raw Data Structure**
* Recieve daily .csv data from plant with following columns:
***production_id, machine_id, shift_date, shift_type, output_kg, defect_kg, downtime_min***

**Step 2: Initial SQL Setup** --PURPOSE: Buffer zone for validating daily records
* Created database: ProdDB
* Created table: production_data
* Created staging table: production_data_staging

**Step 3: Importing Data**
* Used SQL Server Import Wizard to load daily **.csv** into production_data_staging
* Ensured correct column mapping and datatype handling

**Step 4: Merge + Logging**
* Wrote MERGE script to:
    -Insert new records from staging to master table
    -Avoid duplicates
* Created merge_log table to:
    -Auto-log imported rows with timestamp for audit trail

**Step 5: SQL Views for Aggregation**
* To avoid heavy aggregations in ***Power BI*** I created VIEWS named as *daily_yield* and *high_downtime*

**Step 6: Connected to Power BI**
* Imported all 3 objects:
    -production_data
    -daily_yield
    -high_downtime
* Built visualizations:
    -KPI cards, Bar/Column charts, Tables

**Step 7: Relationship Handling**
* Views were pre-aggregated, so:
    -No relationships required (unless cross-slicing needed)
    -Views treated as independent for reporting
