SELECT SUM(CASE WHEN  review_stars >= 4 THEN 1 ELSE 0 END) AS business_count, 
SUM(CASE WHEN  review_stars >= 4 THEN 1 ELSE 0 END) * 100 / COUNT(*) AS  top_rated_pct
FROM reviews
