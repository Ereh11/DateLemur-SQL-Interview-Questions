WITH CTE AS
(
  SELECT searches
  FROM search_frequency
  GROUP BY searches, GENERATE_SERIES(1, num_users)
)

SELECT ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP(ORDER BY searches)::DECIMAL, 1) AS median
FROM CTE;