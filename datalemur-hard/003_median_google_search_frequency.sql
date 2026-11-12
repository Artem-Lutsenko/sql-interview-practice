-- Problem: Median Google Search Frequency
-- Source: DataLemur hard SQL exercises (Google SQL Interview Question), Hard
-- Dialect: PostgreSQL 14
-- Topics: The table stores frequencies rather than individual values, so expanding it into trillions of rows is infeasible. Cumulative user counts instead map each search count to a range of global positions, and averaging the values whose ranges contain the middle position (or the two middle positions when the total is even) yields the median

WITH cum AS (
    SELECT searches,
           SUM(num_users) OVER 
           (ORDER BY searches) AS cum_users,
           COALESCE(SUM(num_users) OVER 
           (ORDER BY searches ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING), 0
           ) AS prev_cum
    FROM search_frequency
),
tot AS (
    SELECT SUM(num_users) AS n FROM search_frequency
),
positions AS (
    SELECT FLOOR((n + 1) / 2.0) AS pos FROM tot
    UNION
    SELECT CEIL((n + 1) / 2.0)  AS pos FROM tot
)
SELECT ROUND(AVG(c.searches), 1) AS median
FROM cum c
JOIN positions p
  ON p.pos > c.prev_cum
 AND p.pos <= c.cum_users
