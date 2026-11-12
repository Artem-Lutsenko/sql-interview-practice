-- Problem: Invalid Tweets
-- Source: leetcode.com SQL 50 exercises, problem #1683
-- Dialect: MySQL 8+
-- Topics: Select, String Functions
-- Approach: Filter rows where the length of the content column is greater than 15 characters

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15
