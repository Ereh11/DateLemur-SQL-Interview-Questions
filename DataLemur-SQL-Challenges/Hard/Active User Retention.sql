WITH CTE AS 
(
    SELECT user_id, 
           SUM(
                CASE WHEN DATE_PART('MONTH', event_date) = 6 AND DATE_PART('YEAR', event_date) = 2022 THEN 1
                ELSE 0 END
              ) AS jun,
           SUM(
                CASE WHEN DATE_PART('MONTH', event_date) = 7 AND DATE_PART('YEAR', event_date) = 2022 THEN 1
                ELSE 0 END
              ) AS jul
              
    FROM user_actions
    GROUP BY user_id
)

SELECT '7' AS month,
       COUNT(user_id) AS monthly_active_users
FROM CTE
WHERE jun > 0 AND jul > 0;