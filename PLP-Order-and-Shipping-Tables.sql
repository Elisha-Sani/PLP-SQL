USE bookstore;

-- Shipping Order Table
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY,
    method_name VARCHAR(100)
);

-- Order Status Table
CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- Customer Order Table
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_status_id INT,
    shipping_method_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id)
);

-- Order Line Table
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Order History Table
CREATE TABLE order_history (
    history_id INT PRIMARY KEY,
    order_id INT,
    status_date DATE,
    status_id INT,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(order_status_id)
);