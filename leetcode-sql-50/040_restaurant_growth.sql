-- Problem: Restaurant Growth
-- Source: leetcode.com SQL 50 exercises, problem #1321
-- Dialect: MySQL 8+
-- Topics: Window function, Subquery, Aggregation
-- Approach: Daily totals are computed first, then a seven-row frame ending at the current day produces the moving sum and moving average, the first six days cannot fill a full week and are skipped with an offset using large number trick for limit (18446744073709551615 = 2^64 − 1, the canonical MySQL "no limit" idiom, the biggest LOGNINT)

SELECT visited_on, 
       SUM(amount) OVER (ORDER BY visited_on 
                               ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
       ROUND(AVG(amount) OVER (ORDER BY visited_on 
                               ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount
FROM (
    SELECT visited_on, 
           SUM(amount) AS amount
    FROM customer
    GROUP BY visited_on
) AS grouped_cust
ORDER BY visited_on
LIMIT 18446744073709551615 OFFSET 6 
