-- Problem: Patients With a Condition
-- Source: leetcode.com SQL 50 exercises, problem #1527
-- Dialect: MySQL 8+
-- Topics: String Functions, LIKE, POSITION
-- Approach: A condition code counts when it appears either as the first code or as a later code preceded by a space, so both positions have to be tested rather than searching for the substring anywhere

SELECT patient_id, patient_name, conditions
FROM patients
WHERE POSITION("DIAB1" IN conditions) = 1 
    OR POSITION(" DIAB1" IN conditions) != 0

-- Alternative: using LIKE operator

SELECT patient_id, patient_name, conditions
FROM patients
WHERE conditions LIKE 'DIAB1%' 
    OR conditions LIKE '% DIAB1%'
