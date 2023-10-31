SELECT COUNT(*) AS nyc_count
FROM phone_info AS pf
INNER JOIN phone_calls AS pc
ON pf.caller_id = pc.caller_id OR pf.caller_id = pc.receiver_id
WHERE LEFT(phone_number, 6) = '+1-212';