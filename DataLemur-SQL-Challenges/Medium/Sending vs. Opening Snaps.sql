WITH GP AS
(
  SELECT age_bucket, 
  SUM(CASE WHEN activity_type = 'open' THEN time_spent END) open,
  SUM(CASE WHEN activity_type = 'send' THEN time_spent END) send
  FROM activities, age_breakdown
  WHERE age_breakdown.user_id = activities.user_id
  GROUP BY age_bucket
)


SELECT GP.age_bucket, 
ROUND( send / (SUM(open) + SUM(send)) * 100.0, 2) AS send_perc,
ROUND( open / (SUM(open) + SUM(send)) * 100.0, 2) AS open_perc
FROM GP
GROUP BY GP.age_bucket, open, send
ORDER BY age_bucket;