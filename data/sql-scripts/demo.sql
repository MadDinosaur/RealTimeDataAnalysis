-- Load demo data

-- Sellers
INSERT INTO olist.olist_sellers (seller_id, seller_zip_code_prefix, seller_city, seller_state)
VALUES ('olist', 4249, 'Porto', 'Porto');

-- Products
INSERT INTO olist.olist_products (product_id, product_category_name)
VALUES ('book1', 'Literature');
INSERT INTO olist.olist_products (product_id, product_category_name)
VALUES ('book2', 'Literature');
INSERT INTO olist.olist_products (product_id, product_category_name)
VALUES ('book3', 'Literature');
INSERT INTO olist.olist_products (product_id, product_category_name)
VALUES ('magazine1', 'Literature');
INSERT INTO olist.olist_products (product_id, product_category_name)
VALUES ('dictionary1', 'Literature');

-- Customers
INSERT INTO olist.olist_customers (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
VALUES ('customer1', 'customer1_id', 4785, 'Trofa', 'Porto');
INSERT INTO olist.olist_customers (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
VALUES ('customer2', 'customer2_id', 4249, 'Porto', 'Porto');

-- Orders
INSERT INTO olist.olist_orders (order_id, customer_id, order_status, order_purchase_timestamp)
VALUES ('1', 'customer1', 'delivered', current_timestamp());
INSERT INTO olist.olist_orders (order_id, customer_id, order_status, order_purchase_timestamp)
VALUES ('2', 'customer2', 'delivered', current_timestamp());

-- Order items
INSERT INTO olist.olist_order_items (order_id, order_item_id, product_id, seller_id)
VALUES ('1', 1, 'book1', 'olist');
INSERT INTO olist.olist_order_items (order_id, order_item_id, product_id, seller_id)
VALUES ('1', 2, 'book2', 'olist');
INSERT INTO olist.olist_order_items (order_id, order_item_id, product_id, seller_id)
VALUES ('2', 1, 'book1', 'olist');
INSERT INTO olist.olist_order_items (order_id, order_item_id, product_id, seller_id)
VALUES ('2', 2, 'book2', 'olist');