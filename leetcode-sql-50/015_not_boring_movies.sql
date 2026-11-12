-- Problem: Not Boring Movies
-- Source: leetcode.com SQL 50 exercises, problem #620
-- Dialect: MySQL 8+
-- Topics: Select, Filtering, Modulo
-- Approach: Filter for odd id using id % 2 != 0 and exclude 'boring' descriptions, then order by rating descending

SELECT *
FROM cinema
WHERE id%2!=0
    AND description != "boring"
ORDER BY rating DESC
