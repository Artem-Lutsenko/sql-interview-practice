-- Problem: Customers Who Bought All Products
-- Source: leetcode.com SQL 50 exercises, problem #1045
-- Dialect: MySQL 8+
-- Topics: Subquery, Aggregation, Distinct
-- Approach: Customer bought the full catalogue when the number of distinct products they purchased equals the total number of products that exist

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product)
