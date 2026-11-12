-- Problem: Recyclable and Low Fat Products
-- Source: leetcode.com SQL 50 exercises, problem #1757
-- Dialect: MySQL 8+
-- Topics: Select, Filtering
-- Approach: Filter rows where both `low_fats` and `recyclable` are `'Y'` using `AND`

SELECT product_id
FROM Products
WHERE low_fats = 'Y' 
      AND recyclable = 'Y'
