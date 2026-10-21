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


-- Load customers records, skip the header row, and handle comma-separated values.
    
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

-- Create orders table.

CREATE TABLE IF NOT EXISTS orders (
	order_id INT PRIMARY KEY,
	customer_id INT,
	product_id INT,
	order_date DATE,
	quantity INT,
	unit_price DECIMAL(10,2),
	payment_status VARCHAR(50)
);
	
    
-- Load orders records, skip the header row, and handle comma-separated values.
    
LOAD DATA LOCAL INFILE '/Users/andreams/sales-revenue-analysis-sql/data/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Check orders table. 

SELECT *
FROM orders
LIMIT 10;


-- Create products table.

CREATE TABLE IF NOT EXISTS products (
	product_id INT PRIMARY KEY,
	product_name VARCHAR(100),
	category VARCHAR(100),
	supplier_id INT,
	cost_price DECIMAL(10,2),
	selling_price DECIMAL(10,2)
);


-- Load products records, skip the header row, and handle comma-separated values.

LOAD DATA LOCAL INFILE '/Users/andreams/sales-revenue-analysis-sql/data/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Check products table. 

SELECT *
FROM products
LIMIT 10;