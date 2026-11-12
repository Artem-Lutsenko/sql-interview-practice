-- Problem: User Acivity for the Past 30 Days I
-- Source: leetcode.com SQL 50 exercises, problem #1141
-- Dialect: MySQL 8+
-- Topics: Aggregation, Date logic, Distinct
-- Approach: Filter activity_date to the 30-day window ending 2019-07-27, group by date, and count distinct active users per day

SELECT activity_date AS day,
       COUNT(DISTINCT user_id) AS active_users
FROM activity
GROUP BY activity_date
HAVING activity_date BETWEEN DATE('2019-07-28') - INTERVAL 30 DAY AND DATE('2019-07-27')
