-- Grant database privileges to debezium
SELECT user, host FROM mysql.user;
GRANT ALL ON olist.* TO debezium;
SHOW GRANTS FOR debezium;

-- Create database and tables
CREATE DATABASE IF NOT EXISTS olist;

DROP TABLE IF EXISTS olist.olist_order_items;
CREATE TABLE IF NOT EXISTS olist.olist_order_items (
order_id varchar(255),
order_item_id int,
product_id varchar(255),
seller_id varchar(255),
shipping_limit_date timestamp,
price float,
freight_value float
);
ALTER TABLE olist.olist_order_items
ADD CONSTRAINT pk_order_items PRIMARY KEY (order_id, order_item_id);

-- Load data from datasets
INSERT INTO olist.olist_order_items
SELECT * FROM olist_dataset.olist_order_items_dataset LIMIT 1, 1;

INSERT INTO olist.olist_order_items
SELECT * FROM olist_dataset.olist_order_items_dataset WHERE order_id='' AND order_item_id=0;

-- Delete data from table
DELETE FROM olist.olist_order_items LIMIT 7;
DELETE FROM olist.olist_order_items WHERE order_id='' AND order_item_id=0;