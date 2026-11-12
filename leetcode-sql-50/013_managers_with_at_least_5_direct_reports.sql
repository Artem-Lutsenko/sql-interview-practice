-- Problem: Managers With At Least 5 Direct Reports
-- Source: leetcode.com SQL 50 exercises, problem #570
-- Dialect: MySQL 8+
-- Topics: Joins, Self Join, HAVING
-- Approach: Self-join Employee as manager and report, group by manager, and filter with HAVING COUNT(*) >= 5

SELECT e.name
FROM employee AS e
JOIN employee AS m 
    ON e.id = m.managerId
GROUP BY e.id
HAVING COUNT(*) >= 5
