WITH CT AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS RN
FROM user_transactions
)

SELECT COUNT(user_id) AS users
FROM CT
WHERE RN = 1 AND spend >= 50;
