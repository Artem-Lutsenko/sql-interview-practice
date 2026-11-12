-- Problem: Immediate Food Delivery II
-- Source: leetcode.com SQL 50 exercises, problem #1174
-- Dialect: MySQL 8+
-- Topics: CTE, Subquery, Aggregation
-- Approach: Use a CTE to find each customer's first order (minimum order date), then compute the percentage of first orders that were immediate (order_date = customer_pref_delivery_date)

WITH first_delivety AS
(
    SELECT customer_id,
     MIN(order_date) AS first_oredr_date,
     MIN(customer_pref_delivery_date) as first_delivery_date
    FROM delivery
    GROUP BY customer_id
)
SELECT ROUND(SUM(first_oredr_date = first_delivery_date)/COUNT(1)*100,2) AS immediate_percentage
FROM first_delivety
