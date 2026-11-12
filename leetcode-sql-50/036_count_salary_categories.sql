-- Problem: Count Salary Categories
-- Source: leetcode.com SQL 50 exercises, problem #1907
-- Dialect: MySQL 8+
-- Topics: CTE, Join, Subquery, Aggregation, CASE, Set ops
-- Approach: The three categories exist whether or not any account falls in them, so they must be listed explicitly and left joined to the bucketed accounts, counting the account key rather than rows makes an empty category report zero

WITH categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
categorized AS (
    SELECT account_id,
           CASE WHEN income < 20000  THEN 'Low Salary'
                WHEN income > 50000 THEN 'High Salary'
                ELSE 'Average Salary'
           END AS category
    FROM Accounts
)
SELECT c.category,
       COUNT(ca.account_id) AS accounts_count
FROM categories AS c
LEFT JOIN categorized AS ca
       ON c.category = ca.category
GROUP BY c.category
