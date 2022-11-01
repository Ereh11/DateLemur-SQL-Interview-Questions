WITH CT AS
(

SELECT measurement_id, CAST(measurement_time AS DATE) AS measurement_day, measurement_value, 
ROW_NUMBER() OVER(PARTITION BY(CAST(measurement_time AS DATE)) ORDER BY measurement_id) AS RN
FROM measurements
)

SELECT measurement_day,
SUM(CASE WHEN RN % 2 != 0 THEN measurement_value END) AS odd_sum,
SUM(CASE WHEN RN % 2 = 0 THEN measurement_value END) AS even_sum
FROM CT
GROUP BY measurement_day;