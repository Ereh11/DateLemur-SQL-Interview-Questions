WITH CT AS
(
SELECT user_id, COUNT(tweet_id)  tweet_bucket
FROM tweets
WHERE DATE_PART('YEAR', tweet_date) = 2022
GROUP BY user_id
)

SELECT tweet_bucket, COUNT(user_id) users_num
FROM CT
GROUP BY tweet_bucket;