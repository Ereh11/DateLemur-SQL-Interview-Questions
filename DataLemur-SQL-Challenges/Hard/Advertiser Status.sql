SELECT  COALESCE(advertiser.user_id, daily_pay.user_id) AS user_id,
        CASE 
            WHEN paid IS NULL THEN 'CHURN'
            WHEN (paid IS NOT NULL AND status = 'CHURN') THEN 'RESURRECT'
            WHEN (paid IS NOT NULL AND status IN ('EXISTING', 'NEW', 'RESURRECT')) THEN 'EXISTING'
            WHEN (paid IS NOT NULL AND status IS NULL) THEN 'NEW'
        END AS new_status
FROM advertiser
FULL OUTER JOIN daily_pay
USING(user_id)
ORDER BY user_id;