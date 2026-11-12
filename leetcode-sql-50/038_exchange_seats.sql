-- Problem: Exchange Seats
-- Source: leetcode.com SQL 50 exercises, problem #626
-- Dialect: MySQL 8+
-- Topics: Window function, LAG/LEAD, CASE, NULL handling
-- Approach: Seats swap in pairs, so each odd id takes the following student's place and each even id takes the preceding one, the final row of an odd-length table has no successor and therefore keeps its own student

SELECT CASE WHEN id%2=1 THEN COALESCE(LEAD(id, 1) OVER (ORDER BY id), id) 
                        ELSE LAG(id,1) OVER (ORDER BY id) END AS id,
        student
FROM seat
ORDER BY id
