WITH CT AS
(
   SELECT category, product, SUM(spend) AS total_spend,
   ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS RN
   FROM product_spend
   WHERE DATE_PART('year', transaction_date) = 2022
   GROUP BY category, product
)

SELECT category, product, total_spend 
FROM CT
WHERE RN IN(1, 2)
