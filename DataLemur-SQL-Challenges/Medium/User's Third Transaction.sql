SELECT user_id, spend, transaction_date
FROM (
      SELECT *,ROW_NUMBER () OVER (PARTITION BY user_id ORDER BY transaction_date) AS RD
      FROM transactions
     ) AS T
     
WHERE RD = 3