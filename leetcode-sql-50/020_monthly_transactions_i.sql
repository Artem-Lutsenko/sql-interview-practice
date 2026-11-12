-- Problem: Monthly Transactions I
-- Source: leetcode.com SQL 50 exercises, problem #1193
-- Dialect: MySQL 8+
-- Topics: Aggregation, Date logic
-- Approach: Group by month (using DATE_FORMAT) and country, then compute total counts/amounts and approved counts/amounts using conditional SUM

SELECT DATE_FORMAT(trans_date, '%Y-%m') AS "month",
       country, 
       COUNT(1) AS trans_count, 
       SUM(state = "approved") AS approved_count, 
       SUM(amount) AS trans_total_amount,
       SUM((state = "approved") * amount) AS approved_total_amount
FROM transactions
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country
