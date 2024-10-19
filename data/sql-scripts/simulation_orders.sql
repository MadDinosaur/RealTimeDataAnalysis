-- Grant database privileges to debezium
SELECT user, host FROM mysql.user;
GRANT ALL ON olist.* TO debezium;
SHOW GRANTS FOR debezium;

-- Create database and tables
CREATE DATABASE IF NOT EXISTS olist;

DROP TABLE IF EXISTS olist.olist_orders;
CREATE TABLE IF NOT EXISTS olist.olist_orders (
order_id varchar(255) primary key,
customer_id varchar(255),
order_status varchar(255),
order_purchase_timestamp timestamp,
order_approved_at timestamp,
order_delivered_carrier_date timestamp,
order_delivered_customer_date timestamp,
order_estimated_delivery_date timestamp
);

-- Load data from datasets
INSERT INTO olist.olist_orders
SELECT * FROM olist_dataset.olist_orders_dataset LIMIT 2, 1;

INSERT INTO olist.olist_orders
SELECT * FROM olist_dataset.olist_orders_dataset WHERE order_id='';

-- Delete data from table
DELETE FROM olist.olist_orders LIMIT 1;
DELETE FROM olist.olist_orders WHERE order_id = '';

-- Update row from table
UPDATE olist.olist_orders
SET order_status = 'updated-status'
LIMIT 1;

UPDATE olist.olist_orders
SET order_status = 'updated-status'
WHERE order_id = '';