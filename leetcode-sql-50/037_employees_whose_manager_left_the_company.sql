-- Problem: Employees Whose Manager Left the Company
-- Source: leetcode.com SQL 50 exercises, problem #1978
-- Dialect: MySQL 8+
-- Topics: CTE, Join, Subquery, NULL handling
-- Approach: A manager has left when their id no longer exists in the employee table, which is exactly the unmatched side of a left join against the full table. To optimize JOIN we pre-select in CTE only rows we need

WITH low_salary AS 
(
    SELECT employee_id, manager_id
    FROM employees
    WHERE salary < 30000
        AND manager_id IS NOT NULL
)

SELECT ls.employee_id
FROM low_salary AS ls
LEFT JOIN employees AS e
    ON ls.manager_id = e.employee_id
WHERE e.employee_id IS NULL
ORDER BY ls.employee_id
