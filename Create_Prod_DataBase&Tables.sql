CREATE DATABASE ProdDB;
USE ProdDB;

--Main Table Creation
CREATE TABLE production_data (
    production_id INT PRIMARY KEY,
    machine_id VARCHAR(10),
    shift_date DATE,
    shift_type CHAR(1),
    output_kg INT,
    defect_kg INT,
    downtime_min INT
);

-- Staging table for daily upload
CREATE TABLE production_data_staging (
    production_id INT,
    machine_id VARCHAR(10),
    shift_date DATE,
    shift_type CHAR(1),
    output_kg INT,
    defect_kg INT,
    downtime_min INT
);

SELECT * FROM production_data_staging;