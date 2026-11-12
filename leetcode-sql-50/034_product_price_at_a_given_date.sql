-- Problem: Product Price at a Given Date
-- Source: leetcode.com SQL 50 exercises, problem #1164
-- Dialect: MySQL 8+
-- Topics: CTE, Window function, Ranking, Join, Subquery, NULL handling, Distinct
-- Approach: The price on a given date is the most recent change on or before it, so ranking changes per product by date descending and keeping the top row identifies it, products with no prior change fall back to the starting price of ten

WITH latest AS (
    SELECT product_id,
           new_price,
           ROW_NUMBER() OVER 
           (PARTITION BY product_id ORDER BY change_date DESC) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT p.product_id,
       COALESCE(l.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) AS p
LEFT JOIN latest l
       ON l.product_id = p.product_id
      AND l.rn = 1
