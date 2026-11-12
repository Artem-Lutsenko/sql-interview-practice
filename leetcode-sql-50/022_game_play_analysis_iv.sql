-- Problem: Game Play Analysis IV
-- Source: leetcode.com SQL 50 exercises, problem #550
-- Dialect: MySQL 8+
-- Topics: CTE, Join, Subquery, Aggregation, Date logic
-- Approach: Find each player's first login date, then left join back to Activity to check if they logged in again exactly one day later, compute the fraction

WITH first_login AS (
    SELECT player_id,
           MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(COUNT(a.player_id) / COUNT(*), 2) AS fraction
FROM first_login AS f
LEFT JOIN Activity AS a
       ON a.player_id = f.player_id
      AND a.event_date = f.first_date + INTERVAL 1 DAY
