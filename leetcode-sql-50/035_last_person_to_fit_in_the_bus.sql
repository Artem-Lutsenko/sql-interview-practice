-- Problem: Last Person to Fit in the Bus
-- Source: leetcode.com SQL 50 exercises, problem #1204
-- Dialect: MySQL 8+
-- Topics: CTE, Window function, Subquery, Aggregation
-- Approach: People board in turn order, so the running total of weight by turn shows exactly when the capacity is crossed, the last person whose cumulative weight stays within 1000 is the answer

WITH sum_weight AS
(
    SELECT person_name, 
           SUM(weight) OVER (ORDER BY turn) AS tot_weight
    FROM queue
)
SELECT person_name
FROM sum_weight
WHERE tot_weight <= 1000
ORDER BY tot_weight DESC
LIMIT 1
