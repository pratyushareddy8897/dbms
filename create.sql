-- Create Addresses Table
CREATE TABLE Addresses (
    address_id SERIAL PRIMARY KEY,  -- address_id → street, city, state, postal_code, country
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    country VARCHAR(50)
);

-- Create Categories Table
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,  -- category_id → category_name
    category_name VARCHAR(50) UNIQUE -- category_name → category_id
);

-- Create Customers Table
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,  -- customer_id → name, email, contact, address_id
    name VARCHAR(50),
    email VARCHAR(50) UNIQUE,        -- email → customer_id
    contact VARCHAR(20),
    address_id INT REFERENCES Addresses(address_id) ON DELETE SET NULL
);

-- Create Payments Table
CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,  -- payment_id → amount, payment_date, payment_method
    amount DECIMAL(10, 2),
    payment_date DATE,
    payment_method VARCHAR(20)
);

-- Create Products Table
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,     -- product_id → name, category_id, price, dimensions
    name VARCHAR(50),
    category_id INT REFERENCES Categories(category_id) ON DELETE SET NULL,  -- category_id → category_name
    price DECIMAL(7, 2),
    dimensions VARCHAR(50)
);

-- Create Sellers Table
CREATE TABLE Sellers (
    seller_id SERIAL PRIMARY KEY,  -- seller_id → name, contact, address_id
    name VARCHAR(50),
    contact VARCHAR(20),
    address_id INT REFERENCES Addresses(address_id) ON DELETE SET NULL
);

-- Create Orders Table
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,        -- order_id → customer_id, order_date, total, payment_id
    customer_id INT REFERENCES Customers(customer_id) ON DELETE CASCADE,
    order_date DATE,
    total DECIMAL(10, 2),
    payment_id INT REFERENCES Payments(payment_id) ON DELETE SET NULL
);

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    order_detail_id SERIAL PRIMARY KEY,   -- order_detail_id → order_id, product_id, quantity, subtotal
    order_id INT REFERENCES Orders(order_id) ON DELETE CASCADE,
    product_id INT REFERENCES Products(product_id) ON DELETE CASCADE,
    quantity INT,
    subtotal DECIMAL(10, 2),
    UNIQUE (order_id, product_id)        -- (order_id, product_id) → quantity, subtotal
);

-- Create Reviews Table
CREATE TABLE Reviews (
    review_id SERIAL PRIMARY KEY,         -- review_id → order_id, customer_id, rating, comment
    order_id INT REFERENCES Orders(order_id) ON DELETE CASCADE,
    customer_id INT REFERENCES Customers(customer_id) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    UNIQUE (order_id, customer_id)        -- (order_id, customer_id) → rating, comment
);

-- Create Inventory Table
CREATE TABLE Inventory (
    inventory_id SERIAL PRIMARY KEY,       -- inventory_id → seller_id, product_id, quantity
    seller_id INT REFERENCES Sellers(seller_id) ON DELETE CASCADE,
    product_id INT REFERENCES Products(product_id) ON DELETE CASCADE,
    quantity INT,
    UNIQUE (seller_id, product_id)         -- (seller_id, product_id) → quantity
);

-- Create Shipping Table
CREATE TABLE Shipping (
    shipping_id SERIAL PRIMARY KEY,        -- shipping_id → order_id, shipping_date, tracking_number, status
    order_id INT REFERENCES Orders(order_id) ON DELETE CASCADE,
    shipping_date DATE,
    tracking_number VARCHAR(30),
    status VARCHAR(20)
);