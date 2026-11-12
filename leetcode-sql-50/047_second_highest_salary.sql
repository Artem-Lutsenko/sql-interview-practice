-- Problem: Second Highest Salary
-- Source: leetcode.com SQL 50 exercises, problem #176
-- Dialect: MySQL 8+
-- Topics: CTE, Window function, Ranking, Join, Subquery, Distinct
-- Approach: The second highest salary is the second distinct value when salaries are sorted descending; wrapping it in a scalar subquery makes the case with no second value return NULL instead of an empty result

SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary

-- Alternative: using DENSE_RANK() window function to rank salaries and then joining to a table with a single row to select the second rank

WITH ranked_emp AS
(
    SELECT DISTINCT salary, 
           DENSE_RANK() OVER (ORDER BY salary DESC) AS dens_rank
    FROM employee
) 
SELECT re.salary AS SecondHighestSalary
FROM (SELECT 2 AS id) AS t
LEFT JOIN ranked_emp as re
    on t.id = re.dens_rank
