SELECT ROUND
       (
          SUM(CASE WHEN signup_action = 'Confirmed' THEN 1.0 ELSE 0.0 END) / 
          COUNT(emails.email_id)
          , 2
       )
FROM texts
LEFT JOIN emails
USING(email_id) 