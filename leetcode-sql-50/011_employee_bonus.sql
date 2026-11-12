-- Problem: Employee Bonus
-- Source: leetcode.com SQL 50 exercises, problem #577
-- Dialect: MySQL 8+
-- Topics: Join, NULL handling
-- Approach: Left join Employee to Bonus on empId, filter for bonus < 1000 OR bonus IS NULL (employees with no bonus)

SELECT name, bonus
FROM employee
LEFT JOIN bonus
    ON employee.empId = bonus.empId
WHERE bonus < 1000 
    OR bonus IS NULL
