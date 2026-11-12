-- Problem: Replace Employee ID With The Unique Identifier
-- Source: leetcode.com SQL 50 exercises, problem #1378
-- Dialect: MySQL 8+
-- Topics: Joins, LEFT JOIN
-- Approach: Join the Employees table with the EmployeeUNI table on the id column to retrieve the unique_id and name for each employee.

SELECT unique_id, name
FROM Employees 
LEFT JOIN EmployeeUNI
    ON  Employees.id = EmployeeUNI.id
