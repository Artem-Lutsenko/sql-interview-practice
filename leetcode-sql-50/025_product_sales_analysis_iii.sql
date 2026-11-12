-- Problem: Product Sales Analysis III
-- Source: leetcode.com SQL 50 exercises, problem #1070
-- Dialect: MySQL 8+
-- Topics: Join, Subquery, Aggregation
-- Approach: Join Sales to a subquery that finds the first year (MIN(year)) per product, matching on both product_id and year to get the first-year sales details

SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales AS s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) AS f
    ON s.product_id = f.product_id
    AND s.year = f.first_year
