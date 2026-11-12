-- Problem: Students and Examinations
-- Source: leetcode.com SQL 50 exercises, problem #1280
-- Dialect: MySQL 8+
-- Topics: CTE, Join, Subquery, Aggregation, NULL handling
-- Approach: Cross join students and subjects to create the full grid, left join examinations, then count attendance per student-subject pair with `COALESCE` to show 0

WITH exams AS (
    SELECT student_id, subject_name,
           COUNT(1) AS attended_times
    FROM examinations
    GROUP BY student_id, subject_name
),
student_exams AS (
    SELECT student_id, student_name, subject_name
    FROM students 
    CROSS JOIN subjects
)
SELECT se.student_id, se.student_name, se.subject_name, 
       COALESCE(attended_times, 0) AS attended_exams
FROM student_exams AS se
LEFT JOIN exams 
    ON se.student_id = exams.student_id AND se.subject_name = exams.subject_name
ORDER BY student_id, subject_name
