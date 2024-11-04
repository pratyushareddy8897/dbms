-- Inserting sample data into Addresses
INSERT INTO Addresses (street, city, state, postal_code, country) VALUES
('123 Elm St', 'Springfield', 'IL', '62701', 'USA'),
('456 Oak St', 'Greenfield', 'CA', '93927', 'USA'),
('789 Maple Ave', 'Lakewood', 'NJ', '08701', 'USA'),
('101 Pine St', 'Riverside', 'CA', '92501', 'USA'),
('202 Birch St', 'Hickory', 'NC', '28601', 'USA'),
('303 Cedar St', 'Fairfield', 'CT', '06824', 'USA'),
('404 Walnut St', 'Bloomfield', 'MI', '48304', 'USA'),
('505 Maple Ave', 'Cedar City', 'UT', '84720', 'USA'),
('606 Oak Ave', 'Boulder', 'CO', '80302', 'USA'),
('707 Pine Ave', 'Dover', 'DE', '19901', 'USA');

-- Inserting sample data into Categories
INSERT INTO Categories (category_name) VALUES
('Electronics'), ('Furniture'), ('Appliances'), ('Clothing'), ('Toys'),
('Books'), ('Beauty'), ('Sports'), ('Home Decor'), ('Grocery');

-- Inserting sample data into Customers
INSERT INTO Customers (name, email, contact, address_id) VALUES
('John Doe', 'john@example.com', '555-1234', 1),
('Jane Smith', 'jane@example.com', '555-5678', 2),
('Alice Johnson', 'alice@example.com', '555-8765', 3),
('Bob Brown', 'bob@example.com', '555-2345', 4),
('Carol White', 'carol@example.com', '555-6789', 5),
('David Black', 'david@example.com', '555-3456', 6),
('Eve Silver', 'eve@example.com', '555-9876', 7),
('Frank Green', 'frank@example.com', '555-4321', 8),
('Grace Blue', 'grace@example.com', '555-8765', 9),
('Hank Red', 'hank@example.com', '555-1234', 10);

-- Inserting sample data into Products
INSERT INTO Products (name, category_id, price, dimensions) VALUES
('Laptop', 1, 999.99, '15x10x1 inches'),
('Desk Chair', 2, 89.99, '30x30x40 inches'),
('Smartphone', 1, 699.99, '6x3x0.3 inches'),
('Bookshelf', 2, 120.00, '60x30x10 inches'),
('Tablet', 1, 299.99, '10x7x0.4 inches'),
('Coffee Table', 2, 150.00, '40x40x20 inches'),
('Headphones', 1, 49.99, '5x5x3 inches'),
('Lamp', 9, 25.00, '15x5x5 inches'),
('Refrigerator', 3, 599.99, '70x30x30 inches'),
('Microwave', 3, 199.99, '15x15x10 inches');

-- Inserting sample data into Sellers
INSERT INTO Sellers (name, contact, address_id) VALUES
('Tech World', '555-0001', 1),
('Home Goods Inc.', '555-0002', 2),
('Appliance Hub', '555-0003', 3),
('Fashion Forward', '555-0004', 4),
('Toy Kingdom', '555-0005', 5),
('Book Haven', '555-0006', 6),
('Beauty Bliss', '555-0007', 7),
('Sports Galore', '555-0008', 8),
('Decor Dreams', '555-0009', 9),
('Fresh Mart', '555-0010', 10);

-- Inserting sample data into Payments
INSERT INTO Payments (amount, payment_date, payment_method) VALUES
(100.00, '2024-10-02', 'Credit Card'),
(200.00, '2024-10-04', 'PayPal'),
(150.00, '2024-10-06', 'Credit Card'),
(175.00, '2024-10-07', 'Bank Transfer'),
(300.00, '2024-10-08', 'Credit Card'),
(50.00, '2024-10-09', 'Cash'),
(25.00, '2024-10-10', 'Credit Card'),
(75.00, '2024-10-11', 'Bank Transfer'),
(500.00, '2024-10-12', 'Credit Card'),
(99.99, '2024-10-13', 'PayPal');

-- Inserting sample data into Orders
INSERT INTO Orders (customer_id, order_date, total, payment_id) VALUES
(1, '2024-10-01', 100.00, 1),
(2, '2024-10-03', 200.00, 2),
(3, '2024-10-05', 150.00, 3),
(4, '2024-10-06', 175.00, 4),
(5, '2024-10-07', 300.00, 5),
(6, '2024-10-08', 50.00, 6),
(7, '2024-10-09', 25.00, 7),
(8, '2024-10-10', 75.00, 8),
(9, '2024-10-11', 500.00, 9),
(10, '2024-10-12', 99.99, 10);

-- Inserting sample data into OrderDetails
INSERT INTO OrderDetails (order_id, product_id, quantity, subtotal) VALUES
(1, 1, 1, 999.99),
(2, 2, 2, 179.98),
(3, 3, 1, 699.99),
(4, 4, 1, 120.00),
(5, 5, 1, 299.99),
(6, 6, 1, 150.00),
(7, 7, 1, 49.99),
(8, 8, 1, 25.00),
(9, 9, 1, 599.99),
(10, 10, 1, 199.99);

-- Inserting sample data into Reviews
INSERT INTO Reviews (order_id, customer_id, rating, comment) VALUES
(1, 1, 5, 'Great product! Highly recommend.'),
(2, 2, 4, 'Satisfied with the purchase.'),
(3, 3, 3, 'Average quality.'),
(4, 4, 5, 'Fantastic! Exceeded expectations.'),
(5, 5, 2, 'Not as expected.'),
(6, 6, 4, 'Good value for money.'),
(7, 7, 3, 'It works, but could be better.'),
(8, 8, 5, 'Loved it! Would buy again.'),
(9, 9, 4, 'Very pleased with the product.'),
(10, 10, 3, 'Okay, but seen better.');

-- Inserting sample data into Inventory
INSERT INTO Inventory (seller_id, product_id, quantity) VALUES
(1, 1, 50),
(1, 3, 30),
(2, 2, 100),
(3, 9, 10),
(4, 4, 20),
(5, 5, 60),
(6, 6, 40),
(7, 7, 80),
(8, 8, 70),
(9, 10, 25);

-- Inserting sample data into Shipping
INSERT INTO Shipping (order_id, shipping_date, tracking_number, status) VALUES
(1, '2024-10-02', 'TRK123456', 'Shipped'),
(2, '2024-10-04', 'TRK123457', 'Shipped'),
(3, '2024-10-06', 'TRK123458', 'Delivered'),
(4, '2024-10-07', 'TRK123459', 'In Transit'),
(5, '2024-10-08', 'TRK123460', 'Delivered'),
(6, '2024-10-09', 'TRK123461', 'Shipped'),
(7, '2024-10-10', 'TRK123462', 'Delivered'),
(8, '2024-10-11', 'TRK123463', 'In Transit'),
(9, '2024-10-12', 'TRK123464', 'Delivered'),
(10, '2024-10-13', 'TRK123465', 'Shipped');