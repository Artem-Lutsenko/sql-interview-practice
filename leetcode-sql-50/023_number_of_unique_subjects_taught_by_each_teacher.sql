-- Problem: Number of Unique Subjects Taught by Each Teacher
-- Source: leetcode.com SQL 50 exercises, problem #2356
-- Dialect: MySQL 8+
-- Topics: Aggregation, Distinct
-- Approach: Group by teacher_id and count distinct subject_id's

SELECT teacher_id, 
       COUNT(DISTINCT subject_id) AS cnt
FROM teacher
GROUP BY teacher_id
