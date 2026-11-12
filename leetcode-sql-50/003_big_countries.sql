-- Problem: Big Countries
-- Source: leetcode.com SQL 50 exercises, problem #595
-- Dialect: MySQL 8+
-- Topics: Select, Filtering
-- Approach: Filter rows where either area is greater than or equal to 3,000,000 or population is greater than or equal to 25,000,000 using `OR`

SELECT name, population, area
FROM World
WHERE area >= 3000000
      OR population >= 25000000
