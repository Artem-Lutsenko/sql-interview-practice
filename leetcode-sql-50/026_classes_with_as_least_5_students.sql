-- Problem: Classes Wih as Least 5 Students
-- Source: leetcode.com SQL 50 exercises, problem #596
-- Dialect: MySQL 8+
-- Topics: Aggregation, HAVING
-- Approach: Group by class and filter with HAVING COUNT(*) >= 5

SELECT class
FROM courses
GROUP BY class
HAVING COUNT(1) > 4
