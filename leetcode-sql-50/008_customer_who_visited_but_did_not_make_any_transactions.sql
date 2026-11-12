-- Problem: Customer Who Visited but Did Not Make Any Transactions
-- Source: leetcode.com SQL 50 exercises, problem #1581
-- Dialect: MySQL 8+
-- Topics: Join, Aggregation, NULL handling
-- Approach: Left join Visits to Transactions, filter where transaction_id IS NULL (anti-join), then count visits per customer

SELECT customer_id,
       COUNT(1) AS count_no_trans
FROM visits
LEFT JOIN transactions 
    ON visits.visit_id = transactions.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id
