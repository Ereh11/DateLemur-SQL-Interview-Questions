WITH CTE AS
(
  SELECT DATE_PART('year', transaction_date) AS year,
         product_id,
         spend AS curr_year_spend,
         LAG(spend) OVER(PARTITION BY product_id ORDER BY transaction_date) AS prev_year_spend

  FROM user_transactions
)

SELECT *, ROUND( (curr_year_spend - prev_year_spend) / prev_year_spend * 100, 2) AS yoy_rate
FROM CTE