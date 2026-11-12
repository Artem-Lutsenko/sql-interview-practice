-- Problem: Confirmation Rate
-- Source: leetcode.com SQL 50 exercises, problem #1934
-- Dialect: MySQL 8+
-- Topics: Join, Subquery, Aggregation, NULL handling
-- Approach: Left join `Signups` to `Confirmations`, then use `AVG(action = 'confirmed')` (MySQL boolean trick) with `COALESCE` to compute the confirmation rate per user

SELECT s.user_id,
       ROUND(COALESCE(AVG(c.action = 'confirmed'), 0), 2) AS confirmation_rate
FROM Signups AS s
LEFT JOIN Confirmations AS c
    ON s.user_id = c.user_id
GROUP BY s.user_id


