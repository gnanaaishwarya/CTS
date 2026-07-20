CREATE DATABASE ONLINE_RETAIL;
USE ONLINE_RETAIL;
CREATE TABLE product
(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50),
price DECIMAL(10,2)
);
INSERT INTO product (product_id,product_name,category,price) VALUES
(101, 'Laptop Pro', 'Electronics', 95000),
(102, 'Gaming Laptop', 'Electronics', 90000),
(103, 'Smartphone X', 'Electronics', 90000),
(104, 'Tablet', 'Electronics', 45000),
(201, 'Office Chair', 'Furniture', 15000),
(202, 'Wooden Table', 'Furniture', 30000),
(203, 'Luxury Sofa', 'Furniture', 50000),
(204, 'Bookshelf', 'Furniture', 30000),
(301, 'T-Shirt', 'Clothing', 1200),
(302, 'Jeans', 'Clothing', 2500),
(303, 'Jacket', 'Clothing', 5000),
(304, 'Sweater', 'Clothing', 5000);

SELECT * FROM product;
/* Ranking Query */
SELECT * FROM (SELECT product_id,product_name,category,price, row_number() OVER (partition by category order by price DESC) AS row_num,
RANK() OVER ( partition by category order by price DESC) AS rank_num, 
DENSE_RANK() OVER (partition by category order by price DESC) AS dense_rank_num FROM product) ranked_products
WHERE row_num<=3 order by category,row_num;
