-- CREATE Operations
-- 1. Add a new customer
INSERT INTO Customers (name, email, contact, address_id)
VALUES ('Liam King', 'liam.king@example.com', '555-3210', 3);

-- 2. Add a new product to the Products table
INSERT INTO Products (name, category_id, price, dimensions)
VALUES ('Gaming Console', 1, 499.99, '12x10x2 inches');


-- READ Operations
-- 1. Retrieve all customers and their respective addresses
SELECT Customers.name, Customers.email, Addresses.street, Addresses.city, Addresses.state, Addresses.postal_code, Addresses.country
FROM Customers
JOIN Addresses ON Customers.address_id = Addresses.address_id;

-- 2. Get details of all orders placed by a specific customer
SELECT Orders.order_id, Orders.order_date, Orders.total, Payments.payment_method
FROM Orders
JOIN Payments ON Orders.payment_id = Payments.payment_id
WHERE Orders.customer_id = 1;


-- UPDATE Operations
-- 1. Update the price of a specific product
UPDATE Products
SET price = 799.99
WHERE name = 'Laptop';

-- 2. Change the shipping status of a specific order
UPDATE Shipping
SET status = 'Delivered'
WHERE tracking_number = 'TRK123459';


-- DELETE Operations
-- 1. Delete a review
DELETE FROM Reviews
WHERE review_id = 10;

-- 2. Remove a product from the inventory
DELETE FROM Inventory
WHERE seller_id = 1 AND product_id = 1;