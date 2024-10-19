SET @@time_zone = '+00:00';

CREATE DATABASE IF NOT EXISTS olist_dataset;

SHOW variables LIKE 'secure_file_priv';

## ORDERS
DROP TABLE IF EXISTS olist_dataset.olist_orders_dataset;
CREATE TABLE IF NOT EXISTS olist_dataset.olist_orders_dataset (
order_id varchar(255) primary key,
customer_id varchar(255),
order_status varchar(255),
order_purchase_timestamp timestamp,
order_approved_at timestamp,
order_delivered_carrier_date timestamp,
order_delivered_customer_date timestamp,
order_estimated_delivery_date timestamp
);

LOAD DATA INFILE "/var/lib/mysql-files/dataset/olist_orders_dataset.csv" 
INTO TABLE olist_dataset.olist_orders_dataset
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_status, @order_purchase_timestamp, @order_approved_at, @order_delivered_carrier_date, @order_delivered_customer_date, @order_estimated_delivery_date)
SET
order_purchase_timestamp = NULLIF(@order_purchase_timestamp, ''),
order_approved_at = NULLIF(@order_approved_at, ''),
order_delivered_carrier_date = NULLIF(@order_delivered_carrier_date, ''),
order_delivered_customer_date = NULLIF(@order_delivered_customer_date, ''),
order_estimated_delivery_date = NULLIF(@order_estimated_delivery_date, '')
;

## ORDER ITEMS
DROP TABLE IF EXISTS olist_dataset.olist_order_items_dataset;
CREATE TABLE IF NOT EXISTS olist_dataset.olist_order_items_dataset (
order_id varchar(255),
order_item_id int,
product_id varchar(255),
seller_id varchar(255),
shipping_limit_date timestamp,
price float,
freight_value float
);

LOAD DATA INFILE "/var/lib/mysql-files/dataset/olist_order_items_dataset.csv" 
INTO TABLE olist_dataset.olist_order_items_dataset
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, order_item_id, product_id, seller_id, @shipping_limit_date, price, freight_value)
SET
shipping_limit_date = NULLIF(@shipping_limit_date, '');

## CUSTOMERS
DROP TABLE IF EXISTS olist_dataset.olist_customers_dataset;
CREATE TABLE IF NOT EXISTS olist_dataset.olist_customers_dataset (
customer_id varchar(255) primary key,
customer_unique_id varchar(255),
customer_zip_code_prefix int,
customer_city varchar(255),
customer_state varchar(255)
);

LOAD DATA INFILE "/var/lib/mysql-files/dataset/olist_customers_dataset.csv" 
INTO TABLE olist_dataset.olist_customers_dataset
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

## PRODUCTS
DROP TABLE IF EXISTS olist_dataset.olist_products_dataset;
CREATE TABLE IF NOT EXISTS olist_dataset.olist_products_dataset (
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

LOAD DATA INFILE "/var/lib/mysql-files/dataset/olist_products_dataset.csv" 
INTO TABLE olist_dataset.olist_products_dataset
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_category_name, @product_name_lenght, @product_description_lenght, @product_photos_qty, @product_weight_g, @product_length_cm, @product_height_cm, @product_width_cm)
SET
product_name_lenght = NULLIF(@product_name_lenght, ''),
product_description_lenght = NULLIF(@product_description_lenght, ''),
product_photos_qty = NULLIF(@product_photos_qty, ''),
product_weight_g = NULLIF(@product_weight_g, ''),
product_length_cm = NULLIF(@product_length_cm, ''),
product_height_cm = NULLIF(@product_height_cm, ''),
product_width_cm = NULLIF(@product_width_cm, '')
;

## SELLERS
DROP TABLE IF EXISTS olist_dataset.olist_sellers_dataset;
CREATE TABLE IF NOT EXISTS olist_dataset.olist_sellers_dataset (
seller_id varchar(255) primary key,
seller_zip_code_prefix int,
seller_city varchar(255),
seller_state varchar(255)
);

LOAD DATA INFILE "/var/lib/mysql-files/dataset/olist_sellers_dataset.csv" 
INTO TABLE olist_dataset.olist_sellers_dataset
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;