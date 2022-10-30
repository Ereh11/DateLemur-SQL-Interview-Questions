SELECT DATE_PART('MONTH', submit_date) mth, product_id, ROUND(AVG(stars), 2)
FROM reviews
GROUP BY DATE_PART('MONTH', submit_date), product_id
ORDER BY DATE_PART('MONTH', submit_date), product_id;