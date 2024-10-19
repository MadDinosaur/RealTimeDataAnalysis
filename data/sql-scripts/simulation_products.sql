-- Grant database privileges to debezium
SELECT user, host FROM mysql.user;
GRANT ALL ON olist.* TO debezium;
SHOW GRANTS FOR debezium;

-- Create database and tables
CREATE DATABASE IF NOT EXISTS olist;

DROP TABLE IF EXISTS olist.olist_products;
CREATE TABLE IF NOT EXISTS olist.olist_products (
product_id varchar(255) primary key,
product_category_name varchar(255),
product_name_lenght int,
product_description_lenght int,
product_photos_qty int,
product_weight_g int,
product_length_cm int,
product_height_cm int,
product_width_cm int
);

-- Load data from datasets
INSERT INTO olist.olist_products
SELECT * FROM olist_dataset.olist_products_dataset LIMIT 8, 5;

INSERT INTO olist.olist_products
SELECT * FROM olist_dataset.olist_products_dataset WHERE product_id='';

-- Delete data from table
DELETE FROM olist.olist_products LIMIT 1;
DELETE FROM olist.olist_products WHERE product_id = '00126f27c813603687e6ce486d909d01';

-- Update row from table
UPDATE olist.olist_products
SET product_category_name = 'updated-category'
LIMIT 1;

UPDATE olist.olist_products
SET product_category_name = 'updated-category'
WHERE product_id = '00126f27c813603687e6ce486d909d01';
