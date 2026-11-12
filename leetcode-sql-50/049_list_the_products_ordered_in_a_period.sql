-- Problem: List the Products Ordered in a Period
-- Source: leetcode.com SQL 50 exercises, problem #1327
-- Dialect: MySQL 8+
-- Topics: CTE, Join, Subquery, Aggregation
-- Approach: Only orders placed in February 2020 count toward the hundred-unit threshold, so the per-product aggregation is restricted to that window first and the product name is attached afterwards

WITH sum_prod AS
(
    SELECT product_id, SUM(unit) AS tot_unit
    FROM orders
    WHERE order_date >= '2020-02-01' 
        AND order_date < '2020-03-01' 
    GROUP BY product_id
    HAVING tot_unit >= 100
)
SELECT product_name, tot_unit AS unit
FROM products AS p
JOIN sum_prod AS sp
    ON p.product_id = sp.product_id
