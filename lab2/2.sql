CREATE TABLE products (
    id varchar NOT NULL PRIMARY KEY ,
    name varchar NOT NULL UNIQUE,
    description text,
    price double precision NOT NULL CHECK ( price > 0 )
);
CREATE TABLE customers (
    id int NOT NULL PRIMARY KEY,
    full_name varchar(50) NOT NULL,
    timestamp timestamp NOT NULL,
    delivery_address text NOT NULL
);
CREATE TABLE orders (
    code int NOT NULL PRIMARY KEY,
    customer_id int REFERENCES customers(id),
    total_sum double precision NOT NULL CHECK ( total_sum > 0 ),
    is_paid boolean NOT NULL
);
CREATE TABLE order_items(
    order_code int REFERENCES orders(code),
    product_id varchar REFERENCES products(id),
    quantity int NOT NULL CHECK ( quantity > 0 ),
    PRIMARY KEY (order_code,product_id)
);