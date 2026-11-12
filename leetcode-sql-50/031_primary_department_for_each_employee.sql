-- Problem: Primary Department for Each Employee
-- Source: leetcode.com SQL 50 exercises, problem #1789
-- Dialect: MySQL 8+
-- Topics: Aggregation, CASE, NULL handling
-- Approach: An employee's primary department is the row flagged Y when one exists and their only department otherwise, so the flagged row is preferred and the single-row case acts as the fallback

SELECT employee_id,
       COALESCE(
           MAX(CASE WHEN primary_flag = 'Y' THEN department_id END),
           MAX(department_id)
       ) AS department_id
FROM Employee
GROUP BY employee_id

-- Alternative: clearer vesion using UNION to handle the two cases separately

SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'
UNION
SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(*) = 1
