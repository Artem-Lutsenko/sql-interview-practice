-- Problem: Find Customer Referee
-- Source: leetcode.com SQL 50 exercises, problem #584
-- Dialect: MySQL 8+
-- Topics: Select, Filtering, NULL handling
-- Approach: Filter rows where referee_id is not equal to 2 or is NULL

SELECT name
FROM Customer
WHERE referee_id != 2 
      OR referee_id IS NULL
