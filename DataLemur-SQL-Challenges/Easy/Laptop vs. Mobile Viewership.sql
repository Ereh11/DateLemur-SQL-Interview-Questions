SELECT COUNT(CASE WHEN device_type = 'laptop' THEN 1 END) laptop_views,
       COUNT(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 END) mobile_views
FROM viewership;