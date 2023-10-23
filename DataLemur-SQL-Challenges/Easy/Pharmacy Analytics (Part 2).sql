SELECT manufacturer,
       COUNT(drug) AS drug_count,
       ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales <= cogs
GROUP BY manufacturer
ORDER BY total_loss DESC
  