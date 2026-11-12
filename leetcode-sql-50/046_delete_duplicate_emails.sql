-- Problem: Delete Duplicate Emails
-- Source: leetcode.com SQL 50 exercises, problem #196
-- Dialect: MySQL 8+
-- Topics: CTE, Window function, Subquery, Aggregation, DELETE
-- Approach: A row is a duplicate when the same email also exists with a smaller id, so deleting rows that match a lower-id row of the same email leaves exactly one copy per address

DELETE p FROM Person p
JOIN Person p2 
ON p.Email = p2.Email AND p.id > p2.id

-- Alternative: using CTE with a flag, keeps only the minimum id per email and deletes everything else

WITH flagged AS 
(
    SELECT id, email, 
    id!=MIN(id) OVER
    (PARTITION BY email ORDER BY id) AS flag
    FROM person
)

DELETE FROM person
WHERE id IN (SELECT id FROM flagged WHERE flag = 1)


