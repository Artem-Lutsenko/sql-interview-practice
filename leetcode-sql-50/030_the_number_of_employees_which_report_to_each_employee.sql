-- Problem: The Number of Employees Which Report to Each Employee
-- Source: leetcode.com SQL 50 exercises, problem #1731
-- Dialect: MySQL 8+
-- Topics: CTE, Join, Subquery, Aggregation
-- Approach: Managers are employees who appear in someone else's reports_to column, grouping the reports by their manager yields the report count and average age, which are then attached back to the manager's own row

WITH count_emp AS
(
    SELECT reports_to,
           COUNT(1) AS reports_count,
           ROUND(AVG(age)) AS average_age
    FROM employees
    GROUP BY reports_to
)
SELECT employee_id, name, reports_count, average_age
FROM employees AS e
JOIN count_emp AS c
    ON e.employee_id = c.reports_to
ORDER BY employee_id
