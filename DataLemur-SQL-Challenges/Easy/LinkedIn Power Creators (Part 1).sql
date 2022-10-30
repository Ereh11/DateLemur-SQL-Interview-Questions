SELECT profile_id
FROM personal_profiles pf 
INNER JOIN company_pages  cp ON  pf.employer_id =  cp.company_id
WHERE pf.followers > cp.followers
ORDER BY profile_id;