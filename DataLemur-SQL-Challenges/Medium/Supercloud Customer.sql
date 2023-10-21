WITH SuperCloud AS
(

  SELECT customer_id, 
         COUNT(DISTINCT products.product_category) AS NumberOfProducts
  FROM customer_contracts
  RIGHT JOIN products
  ON customer_contracts.product_id = products.product_id
  GROUP BY customer_id
)

SELECT customer_id
FROM SuperCloud
WHERE NumberOfProducts = 
        (
          SELECT COUNT(DISTINCT product_category) 
          FROM products
        )