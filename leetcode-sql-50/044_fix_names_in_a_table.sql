-- Problem: Fix Names in a Table
-- Source: leetcode.com SQL 50 exercises, problem #1667
-- Dialect: MySQL 8+
-- Topics: String Functions
-- Approach: Fixing the casing means uppercasing only the first character and lowercasing everything after it, which slicing the string into a leading character and a remainder makes explicit

SELECT user_id,
       CONCAT(UPPER(LEFT(name,1)), LOWER(RIGHT(name, (LENGTH(name)-1)))) AS name
FROM users
ORDER BY user_id
