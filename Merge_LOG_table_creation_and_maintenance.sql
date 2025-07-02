USE ProdDB;
CREATE TABLE merge_log (
    log_id INT IDENTITY(1,1) PRIMARY KEY,
    production_id VARCHAR(50),
    merge_time DATETIME DEFAULT GETDATE()
);
SELECT * FROM merge_log ORDER BY merge_time DESC;