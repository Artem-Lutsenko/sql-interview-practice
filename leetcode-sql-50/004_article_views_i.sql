-- Problem: Article Views I
-- Source: leetcode.com SQL 50 exercises, problem #1148
-- Dialect: MySQL 8+
-- Topics: Select, Filtering, DISTINCT
-- Approach: Filter rows where author_id is equal to viewer_id and select distinct author_ids

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id
