SELECT user_id, COUNT(product_id) AS product_num
FROM user_transactions
GROUP BY user_id
HAVING SUM(spend) >= 1000
ORDER BY COUNT(product_id) DESC, SUM(spend) DESC 
LIMIT 3;