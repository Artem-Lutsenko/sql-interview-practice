-- Problem: Average Selling Price
-- Source: leetcode.com SQL 50 exercises, problem #1251
-- Dialect: MySQL 8+
-- Topics: CTE, Join, Subquery, Aggregation, NULL handling
-- Approach: Left join Prices to UnitsSold on product and date range, compute the weighted average SUM(units * price) / SUM(units), and use COALESCE to return 0 for products with no sales

WITH units_table AS 
(
    SELECT product_id, purchase_date, SUM(units) AS total_units
    FROM unitssold
    GROUP BY product_id, purchase_date
),
price_unit AS
(
SELECT p.product_id, u.total_units, u.total_units*p.price AS price_units
FROM prices AS p
LEFT JOIN units_table AS u
    ON u.product_id = p.product_id 
    AND u.purchase_date >= p.start_date
    AND u.purchase_date <= p.end_date
)
SELECT product_id, 
       COALESCE(ROUND(SUM(price_units)/SUM(total_units),2),0) AS average_price
FROM price_unit
GROUP BY product_id
