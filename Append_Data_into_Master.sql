--What This Does:
	--Checks if the production_id already exists in production_data
	--If not, inserts the new record from production_data_staging
	--Prevents duplicates!

MERGE production_data AS target
USING production_data_staging AS source
ON target.production_id = source.production_id

WHEN NOT MATCHED BY TARGET THEN
INSERT (
  production_id,
  machine_id,
  shift_date,
  shift_type,
  output_kg,
  defect_kg,
  downtime_min
)
VALUES (
  source.production_id,
  source.machine_id,
  source.shift_date,
  source.shift_type,
  source.output_kg,
  source.defect_kg,
  source.downtime_min
)
OUTPUT
    inserted.production_id, GETDATE()
INTO merge_log(production_id, merge_time);

SELECT * FROM production_data;

TRUNCATE TABLE production_data_staging;