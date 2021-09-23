--customers
INSERT INTO customers VALUES (1, 'Maxim', current_timestamp, 'Russia');
INSERT INTO customers VALUES (2, 'Alex', current_timestamp, 'USA');
--products
INSERT INTO products VALUES ('APPL', 'Apple', 'Dioganal 15.6', 399);
INSERT INTO products(id, name, price) VALUES ('TSL', 'Tesla', 15000);
--orders
INSERT INTO orders VALUES (1, 2, 399*15, TRUE);
INSERT INTO orders VALUES (2, 1, 50000, TRUE);
--order_items
INSERT INTO order_items VALUES (1, 'APPL', 15);
INSERT INTO order_items VALUES (2, 'TSL', 3);

UPDATE orders SET total_sum = 60000 WHERE code = 2;
UPDATE orders SET is_paid = FALSE WHERE code = 2;

DELETE FROM order_items WHERE product_id = 'APPL';--deleting from other tables will violate table constraint