SELECT COUNT(DISTINCT t1.company_id) AS co_w_duplicate_jobs
FROM  job_listings t1
JOIN job_listings t2 on t1.company_id = t2.company_id
WHERE t1.title = t2.title AND t1.description = t2.description AND t1.job_id !=t2.job_id