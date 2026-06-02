CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50)
);
CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
product VARCHAR (50),
amount DECIMAL(10,2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'AJAY', 'KOLKATA'),
(2, 'ABHI', 'DELHI'),
(3, 'ANAND', 'NOIDA');
INSERT INTO orders VALUES
(101, 1, 'LAPTOP',50000),
(102, 2, 'MOBILE',20000),
(103, 3, 'MOUSE',1000),
(104, 1, 'EARBUDS',5000);

SELECT * FROM customers;
SELECT * FROM orders
WHERE amount>6000; 
SELECT * FROM orders
ORDER BY amount DESC;
SELECT customer_id,
SUM(amount) AS total_sales
FROM orders
GROUP BY customer_id;
SELECT AVG(amount) AS average_sales
FROM orders;
SELECT c.customer_name,
o.product,
o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
SELECT *
FROM orders
WHERE amount >
(
SELECT AVG(amount)
FROM orders
);
CREATE VIEW sales_view AS
SELECT c.customer_name,
o.product,
o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;
SELECT * FROM sales_view;

CREATE INDEX idx_customer
ON orders(customer_id);


