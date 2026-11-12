-- Problem: Advertiser Status (Inaccurate description of the problem)
-- Source: DataLemur hard SQL exercises (Facebook SQL Interview Question), Hard
-- Dialect: PostgreSQL 14
-- Topics: Join, Subquery, CASE, Set ops
-- Approach: An advertiser's new status depends jointly on their previous status and whether they paid this month, so joining advertisers to payments resolves the EXISTING, RESURRECT, and CHURN cases in one CASE. Advertisers absent from the advertiser table can only be NEW, and a join alone cannot surface rows that do not exist on the left side, so they are produced by a second SELECT and combined with UNION

(SELECT a.user_id, 
       (CASE WHEN paid IS NOT NULL AND status!='CHURN' THEN 'EXISTING'
             WHEN paid IS NOT NULL AND status='CHURN' THEN 'RESURRECT'
             ELSE 'CHURN' END) AS new_status
FROM advertiser AS a
LEFT JOIN daily_pay AS dp
  ON a.user_id = dp.user_id
ORDER BY user_id)
UNION
(SELECT user_id, 'NEW' AS new_status
FROM daily_pay AS dp
WHERE dp.user_id NOT IN (SELECT user_id FROM advertiser))
ORDER BY user_id
