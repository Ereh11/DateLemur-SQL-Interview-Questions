SELECT E.user_id 
FROM texts T INNER JOIN emails E ON E.email_id = T.email_id
WHERE T.signup_action = 'Confirmed' AND DATE(T.action_date) - DATE(E.signup_date) = 1;