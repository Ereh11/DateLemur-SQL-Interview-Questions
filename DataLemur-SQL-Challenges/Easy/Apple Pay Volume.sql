SELECT merchant_id, 
SUM(CASE WHEN LOWER(payment_method) = 'apple pay' THEN transaction_amount ELSE 0 END) total_transaction
FROM transactions
GROUP BY merchant_id
ORDER BY total_transaction DESC;