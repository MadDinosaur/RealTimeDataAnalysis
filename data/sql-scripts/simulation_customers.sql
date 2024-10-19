-- Grant database privileges to debezium
SELECT user, host FROM mysql.user;
GRANT ALL ON olist.* TO debezium;
SHOW GRANTS FOR debezium;

-- Create database and tables
CREATE DATABASE IF NOT EXISTS olist;

DROP TABLE IF EXISTS olist.olist_customers;
CREATE TABLE IF NOT EXISTS olist.olist_customers (
customer_id varchar(255) primary key,
customer_unique_id varchar(255),
customer_zip_code_prefix int,
customer_city varchar(255),
customer_state varchar(255)
);

-- Load data from datasets
INSERT INTO olist.olist_customers
SELECT * FROM olist_dataset.olist_customers_dataset LIMIT 2, 1;

INSERT INTO olist.olist_customers
SELECT * FROM olist_dataset.olist_customers_dataset WHERE customer_unique_id='';

-- Delete data from table
DELETE FROM olist.olist_customers LIMIT 1;
DELETE FROM olist.olist_customers WHERE customer_id = '00012a2ce6f8dcda20d059ce98491703';

-- Update row from table
UPDATE olist.olist_customers
SET customer_city = 'updated-city'
LIMIT 1;

UPDATE olist.olist_customers
SET customer_city = 'updated-city'
WHERE customer_unique_id = '';