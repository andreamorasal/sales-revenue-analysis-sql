-- Create the database for the sales revenue analysis project.

CREATE DATABASE IF NOT EXISTS sales_revenue_analysis;

USE sales_revenue_analysis;


-- Create customers table 

CREATE TABLE IF NOT EXISTS customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(100),
    signup_date DATE
);


-- Enable local data loading on the MySQL server.
-- Purpose: Enable local CSV file imports in MySQL.
SET GLOBAL local_infile = 1;

-- Verify that local data loading is enabled.
SHOW GLOBAL VARIABLES LIKE 'local_infile';


-- Load customer records, skip the header row, and handle comma-separated values.
    
LOAD DATA LOCAL INFILE '/Users/andreams/sales-revenue-analysis-sql/data/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Check customers table. 

SELECT *
FROM customers
LIMIT 10;


-- Create clickstream table

CREATE TABLE IF NOT EXISTS clickstream (
	event_id INT PRIMARY KEY,
	customer_id INT,
    event_type VARCHAR(50),
    page_url VARCHAR(255),
    event_timestamp DATETIME,
    device_type VARCHAR(50)
);


-- Load clickstream records, skip the header row, and handle comma-separated values.
    
LOAD DATA LOCAL INFILE '/Users/andreams/sales-revenue-analysis-sql/data/clickstream.csv'
INTO TABLE clickstream
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
	
-- Check clickstream table. 

SELECT *
FROM clickstream
LIMIT 10;

DESCRIBE clickstream;

SHOW CREATE TABLE clickstream;

TRUNCATE TABLE clickstream;


-- Create orders table




-- Create products table