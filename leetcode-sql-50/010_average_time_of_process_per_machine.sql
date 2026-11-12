-- Problem: Average Time Of Process per Machine
-- Source: leetcode.com SQL 50 exercises, problem #1661
-- Dialect: MySQL 8+
-- Topics: CTE, Window function, LAG/LEAD, Subquery, Aggregation
-- Approach: Use LAG() partitioned by machine_id and process_id to get the start timestamp for each end row, compute duration, then average per machine. This relies on the start row sorting ahead of the end row, activity_type ASC puts 'end' first alphabetically, which would invert the subtraction

WITH process_time AS (
    SELECT machine_id,
           process_id,
           timestamp - LAG(timestamp, 1) OVER(
                                PARTITION BY machine_id, process_id ORDER BY activity_type ASC 
                                ) AS execution_time
    FROM activity
)
SELECT machine_id, 
       ROUND(AVG(execution_time),3) AS processing_time
FROM process_time
WHERE execution_time IS NOT NULL    
GROUP BY machine_id


--Alternative: Use conditional aggregation (MAX(CASE WHEN ...)) to pivot start/end timestamps per process, then compute average per machine.

SELECT machine_id,
       ROUND(AVG(end_t - start_t), 3) AS processing_time
FROM (
    SELECT machine_id, process_id,
           MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_t,  #or MIN() instead of MAX() since there is only one row per group
           MAX(CASE WHEN activity_type = 'end'   THEN timestamp END) AS end_t
    FROM activity
    GROUP BY machine_id, process_id
) AS t
GROUP BY machine_id