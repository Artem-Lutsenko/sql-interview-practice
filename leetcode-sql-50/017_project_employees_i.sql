-- Problem: Project Employees I
-- Source: leetcode.com SQL 50 exercises, problem #1075
-- Dialect: MySQL 8+
-- Topics: Join, Aggregation
-- Approach: Join Project to Employee on employee_id, then compute the average experience_years per project rounded to 2 decimals

SELECT project_id, ROUND(AVG(experience_years),2) AS average_years
FROM project AS p
JOIN employee AS e
    ON p.employee_id = e.employee_id
GROUP BY project_id
