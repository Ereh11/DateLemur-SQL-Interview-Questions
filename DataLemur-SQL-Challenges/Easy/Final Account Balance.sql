SELECT account_id, 
SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE -amount END) AS final_balance
FROM transactions
GROUP BY account_id;