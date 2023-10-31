WITH Oredered_Product_Selling AS
(
  SELECT category_name,
         product_name,
         DENSE_RANK() 
         OVER(PARTITION BY category_name ORDER BY sales_quantity DESC, rating DESC)AS Rank
  FROM products
  INNER JOIN product_sales
  USING(product_id)
)


SELECT category_name,
       product_name
FROM Oredered_Product_Selling
WHERE Rank = 1
ORDER BY category_name, product_name;

