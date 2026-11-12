-- Problem: Queries Quality and Percentage
-- Source: leetcode.com SQL 50 exercises, problem #1211
-- Dialect: MySQL 8+
-- Topics: Aggregation
-- Approach: Group by query_name, compute the average of rating/position as quality, and the percentage of rows where rating < 3 as poor_query_percentage

SELECT query_name,
        ROUND(AVG(rating/position), 2) AS quality,
        ROUND(SUM(rating<3) / COUNT(1) * 100, 2) AS poor_query_percentage
FROM queries
GROUP BY query_name
