-- Problem: Friend Requests II: Who Has the Most Friends
-- Source: leetcode.com SQL 50 exercises, problem #602
-- Dialect: MySQL 8+
-- Topics: CTE, Subquery, Aggregation, Set ops, UNION ALL
-- Approach: Each friendship appears in exactly one of the two id columns, so stacking requesters and accepters yields every friend edge once, and counting per person gives their friend total

WITH full_list AS (
    SELECT requester_id AS id
    FROM requestaccepted
    UNION ALL
    SELECT accepter_id AS id
    FROM requestaccepted
)
SELECT id, 
       COUNT(1) AS num
FROM full_list
GROUP BY id
ORDER BY num DESC
LIMIT 1
