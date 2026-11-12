-- Problem: Percentage of Users Attended a Contest
-- Source: leetcode.com SQL 50 exercises, problem #1633
-- Dialect: MySQL 8+
-- Topics: Subquery, Aggregation
-- Approach: Count registrations per contest, divide by the total number of users (via subquery), multiply by 100 to get a percentage, and round to 2 decimals

SELECT contest_id, 
       ROUND(COUNT(1) / (SELECT COUNT(1) FROM users) * 100, 2) AS percentage
FROM register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC
