WITH CTE AS
(
  SELECT order_id,
  item,
  LAG(item, 1) OVER(ORDER BY order_id) AS prevItem,
  LEAD(item, 1) OVER(ORDER BY order_id) AS nextItem
  FROM orders
)

SELECT order_id AS corrected_order_id,
       CASE 
         WHEN (order_id % 2) = 1 THEN COALESCE(nextItem, item)
         ELSE prevItem
       END
FROM CTE