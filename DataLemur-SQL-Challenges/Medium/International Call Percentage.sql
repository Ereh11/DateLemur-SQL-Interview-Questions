WITH International_Call AS 
(
  SELECT SUM(
              CASE WHEN caller.country_id !=  receiver.country_id THEN 1.0
              ELSE 0.0 END
            ) AS Number_internationals
  FROM phone_calls AS pc
  INNER JOIN phone_info AS caller
  ON pc.caller_id = caller.caller_id
  INNER JOIN phone_info AS receiver
  ON pc.receiver_id = receiver.caller_id
)


SELECT ROUND(
               (Number_internationals * 100 / (SELECT COUNT(*) FROM phone_calls))
               , 1
            )
FROM International_Call