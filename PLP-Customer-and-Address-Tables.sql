USE bookstore;

-- Customer Table
CREATE TABLE customer (
	customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

-- Address Status Table
CREATE TABLE address_status (
    address_status_id INT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- Country Table
CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100)
);

-- Address Table
CREATE TABLE address (
    address_id INT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(50),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Customer Address Table
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    address_status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);
