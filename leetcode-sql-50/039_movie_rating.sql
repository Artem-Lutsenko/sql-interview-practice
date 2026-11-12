-- Problem: Movie Rating
-- Source: leetcode.com SQL 50 exercises, problem #1341
-- Dialect: MySQL 8+
-- Topics: Join, Subquery, Aggregation, Set ops
-- Approach: Two independent rankings are required, one for the user who rated most and one for the best-rated movie in February 2020, each resolved by ordering and keeping the first row, then combined into a single output

(
    SELECT u.name AS results
    FROM users AS u
    JOIN (SELECT user_id, COUNT(1) AS num_rates
          FROM movierating
          GROUP BY user_id) AS r
        ON u.user_id = r.user_id
    GROUP BY u.user_id, u.name
    ORDER BY num_rates DESC, u.name ASC
    LIMIT 1
)
UNION ALL
(

    SELECT title AS results
    FROM movies AS m
    JOIN (SELECT movie_id, AVG(rating) AS avg_rating
          FROM movierating
          WHERE created_at >= "2020-02-01" 
          AND created_at < "2020-03-01"
          GROUP BY movie_id) AS r
        ON m.movie_id = r.movie_id
    ORDER BY avg_rating DESC, title ASC
    LIMIT 1
)
