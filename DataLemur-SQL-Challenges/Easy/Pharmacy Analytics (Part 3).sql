
SELECT manufacturer,
       CONCAT('$', total_result, ' million') AS sale
FROM
(
  SELECT manufacturer,
         ROUND( SUM(total_sales) / 1000000) AS total_result
  FROM pharmacy_sales
  GROUP BY manufacturer
  ORDER BY SUM(total_sales) DESC, manufacturer
) AS TP
