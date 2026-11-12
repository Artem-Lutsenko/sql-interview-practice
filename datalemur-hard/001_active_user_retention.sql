-- Problem: Active User Retention
-- Source: DataLemur hard SQL exercises (Facebook SQL Interview Question), Hard
-- Dialect: PostgreSQL 14
-- Topics: CTE, Subquery, Aggregation, Date logic, Distinct
-- Approach: MAU here means users active in both July and the preceding June, so this is an intersection rather than a July-only count. Restricting to the two-month span keeps both months visible per user, and a HAVING clause requiring two distinct months then leaves exactly the users present in both

WITH active_users AS
(
SELECT user_id
    FROM user_actions
    WHERE event_date >= '2022-06-01'
      AND event_date <  '2022-08-01'
    GROUP BY user_id
    HAVING COUNT(DISTINCT EXTRACT(MONTH FROM event_date)) = 2
)

SELECT 7 AS month,
       COUNT(*) AS monthly_active_users
FROM active_users
