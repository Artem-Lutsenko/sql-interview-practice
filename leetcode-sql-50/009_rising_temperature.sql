-- Problem: Rising Temperature
-- Source: leetcode.com SQL 50 exercises, problem #197
-- Dialect: MySQL 8+
-- Topics: Join, Self-join, Date logic
-- Approach: Join the weather table to itself on the condition that the recordDate of the first table is one day after the recordDate of the second table, then filter for rows where the temperature of the first table is greater than that of the second table.

SELECT w.id
FROM weather w
JOIN weather AS prev
  ON w.recordDate - INTERVAL 1 DAY = prev.recordDate
WHERE w.temperature > prev.temperature


