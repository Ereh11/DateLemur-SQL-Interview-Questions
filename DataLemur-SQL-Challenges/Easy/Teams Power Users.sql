SELECT sender_id, COUNT(DISTINCT receiver_id)  AS message_count
FROM messages  m1
WHERE DATE_PART('year', sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;