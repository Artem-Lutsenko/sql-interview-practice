-- Problem: Group Sold Products By The Date
-- Source: leetcode.com SQL 50 exercises, problem #1484
-- Dialect: MySQL 8+
-- Topics: Aggregation, GROUP_CONCAT, DISTINCT
-- Approach: For each date the products must be deduplicated, counted, and joined into one alphabetically ordered string, which distinct string aggregation performs in a single pass

SELECT sell_date,
       COUNT(DISTINCT product) AS num_sold,
       GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM activities
GROUP BY sell_date
ORDER BY sell_date
