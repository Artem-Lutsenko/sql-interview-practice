-- Problem: Consecutive Numbers
-- Source: leetcode.com SQL 50 exercises, problem #180
-- Dialect: MySQL 8+
-- Topics: CTE, Window function, Ranking, Subquery, Aggregation, Distinct
-- Approach: Equal consecutive values form runs, subtracting a per-value row number from id stays constant inside a run and changes at every break, so grouping on that derived key and counting rows reveals runs of at least three

WITH grouped AS (
    SELECT num,
           id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS grp
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM grouped
GROUP BY num, grp
HAVING COUNT(*) > 2
