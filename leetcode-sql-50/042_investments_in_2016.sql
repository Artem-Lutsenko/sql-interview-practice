-- Problem: Investments in 2016
-- Source: leetcode.com SQL 50 exercises, problem #585
-- Dialect: MySQL 8+
-- Topics: CTE, Window function, Subquery, Aggregation
-- Approach: Both criteria are facts about the whole table rather than about a single row, so counting how many rows share each 2015 value and each city pair lets the query keep the rows whose 2015 value is shared but whose city is not
WITH flagged AS (
    SELECT pid,
           tiv_2016,
           COUNT(*) OVER (PARTITION BY tiv_2015) AS tiv_count,
           COUNT(*) OVER (PARTITION BY lat, lon) AS city_count
    FROM insurance
)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM flagged
WHERE tiv_count   > 1
  AND city_count  = 1
