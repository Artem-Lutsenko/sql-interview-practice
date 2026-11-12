-- Problem: Product Sales Analysis I
-- Source: leetcode.com SQL 50 exercises, problem #1068
-- Dialect: MySQL 8+
-- Topics: Joins, INNER JOIN
-- Approach: Join the sales table with the product table on the product_id column to retrieve the product name, year, and price for each sale.

SELECT product_name, year, price
FROM sales
JOIN product
    ON sales.product_id = product.product_id
