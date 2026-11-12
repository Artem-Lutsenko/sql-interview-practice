-- Problem: Find Followers Count
-- Source: leetcode.com SQL 50 exercises, problem #1729
-- Dialect: MySQL 8+
-- Topics: Aggregation
-- Approach: Group by user_id and count followers, ordered by user_id

SELECT user_id, 
       COUNT(1) AS followers_count
FROM followers
GROUP BY user_id
ORDER BY user_id
