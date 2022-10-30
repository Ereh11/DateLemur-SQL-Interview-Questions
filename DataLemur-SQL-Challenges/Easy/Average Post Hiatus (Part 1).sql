SELECT user_id, DATE_PART('DAY', MAX(post_date) - MIN(post_date)) AS days_between
FROM posts
WHERE DATE_PART('YEAR', post_date) = 2021
GROUP BY user_id
HAVING COUNT(user_id) > 1;