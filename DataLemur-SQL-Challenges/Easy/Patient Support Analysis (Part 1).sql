SELECT COUNT(cnt) AS member_count
FROM 
(
  SELECT COUNT(policy_holder_id) AS cnt
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(policy_holder_id) >= 3
) AS TEMP