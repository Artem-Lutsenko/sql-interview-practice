-- Problem: Find Users With Valid E-Mails
-- Source: leetcode.com SQL 50 exercises, problem #1517
-- Dialect: MySQL 8+
-- Topics: Regex, String Functions
-- Approach: A valid address starts with a letter, continues with allowed characters only, and ends with the exact lowercase domain, so a single anchored pattern enforces all three rules at once

SELECT user_id, name, mail
FROM Users
WHERE REGEXP_LIKE(mail, '^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$', 'c')
