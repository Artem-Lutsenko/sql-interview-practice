-- Problem: Department Top Three Salaries
-- Source: leetcode.com SQL 50 exercises, problem #185
-- Dialect: MySQL 8+
-- Topics: CTE, Window function, Ranking, Join, Subquery
-- Approach: The question is about the top three distinct salaries per department, so dense ranking preserves ties among equal salaries and keeping ranks up to three returns every employee earning one of those salaries

WITH top_salary AS (
    SELECT name, salary, departmentId,
           DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS den_rank
    FROM employee
)
SELECT d.name AS Department, 
       ts.name AS Employee, 
       salary AS Salary
FROM (SELECT name, salary, departmentId 
      FROM top_salary
      WHERE den_rank < 4) AS ts
JOIN department as d
    ON ts.departmentId = d.id
