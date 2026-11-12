-- Problem: Biggest Single Number
-- Source: leetcode.com SQL 50 exercises, problem #619
-- Dialect: MySQL 8+
-- Topics: Subquery, Aggregation
-- Approach: Subquery filters numbers appearing exactly once (HAVING COUNT(*) = 1), then MAX() returns the largest single number (or NULL if none)

SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM mynumbers
    GROUP BY num
    HAVING COUNT(1) < 2
) AS single_num
