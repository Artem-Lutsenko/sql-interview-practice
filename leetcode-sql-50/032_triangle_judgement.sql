-- Problem: Triangle Judgement
-- Source: leetcode.com SQL 50 exercises, problem #610
-- Dialect: MySQL 8+
-- Topics: CASE
-- Approach: Three lengths form a triangle only when every pair sums to strictly more than the third side, so all three inequalities must hold simultaneously

SELECT x,y,z,
       (CASE WHEN (x+y > z) 
                  AND (x+z > y) 
                  AND (y+z > x) 
        THEN "Yes" ELSE "No" END) AS triangle
FROM triangle
