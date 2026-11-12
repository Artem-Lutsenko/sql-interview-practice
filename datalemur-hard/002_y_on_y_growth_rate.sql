-- Problem: Y-on-Y Growth Rate
-- Source: DataLemur hard SQL exercises (Wayfair SQL Interview Question), Hard
-- Dialect: PostgreSQL 14
-- Topics: CTE, Window function, LAG/LEAD, Subquery, Aggregation, Date logic
-- Approach: Year-on-year growth compares each product's annual spend with the immediately preceding year's, so totals are aggregated per year and product first. LAG reaches back one row within each product's timeline to supply that prior year, and the ratio of the difference to the prior value yields the growth rate

WITH grouped AS 
(
    SELECT EXTRACT(YEAR FROM transaction_date) AS year,
           product_id,
           SUM(spend) AS curr_year_spend
    FROM user_transactions
    GROUP BY EXTRACT(YEAR FROM transaction_date), product_id
),
with_prev AS 
(
    SELECT year,
           product_id,
           curr_year_spend,
           LAG(curr_year_spend) OVER (PARTITION BY product_id ORDER BY year) AS prev_year_spend
    FROM grouped
)
SELECT year,
       product_id,
       curr_year_spend,
       prev_year_spend,
       ROUND((curr_year_spend - prev_year_spend)
             / prev_year_spend * 100, 2) AS yoy_rate
FROM with_prev
