-- Grant database privileges to debezium
SELECT user, host FROM mysql.user;
GRANT ALL ON olist.* TO debezium;
SHOW GRANTS FOR debezium;

-- Create database and tables
CREATE DATABASE IF NOT EXISTS olist;

DROP TABLE IF EXISTS olist.olist_sellers;
CREATE TABLE IF NOT EXISTS olist.olist_sellers (
seller_id varchar(255) primary key,
seller_zip_code_prefix int,
seller_city varchar(255),
seller_state varchar(255)
);

-- Load data from datasets
INSERT INTO olist.olist_sellers
SELECT * FROM olist_dataset.olist_sellers_dataset LIMIT 44, 1;

INSERT INTO olist.olist_sellers
SELECT * FROM olist_dataset.olist_sellers_dataset WHERE seller_id='038b75b729c8a9a04b0d07cba7eabe86';

-- Delete data from table
DELETE FROM olist.olist_sellers LIMIT 1;
DELETE FROM olist.olist_sellers WHERE seller_id = '039e6ad9dae79614493083e241147386';

-- Update row from table
UPDATE olist.olist_sellers
SET seller_city = 'updated-city'
LIMIT 1;

UPDATE olist.olist_sellers
SET seller_city = 'updated-city'
WHERE seller_id = '0336182e1b3e92f029d5354832045fdf';
