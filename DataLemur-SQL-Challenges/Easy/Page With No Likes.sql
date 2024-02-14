SELECT P.page_id 
FROM pages P
WHERE P.page_id NOT IN
  (
    SELECT PL.page_id FROM page_likes PL
  );

-- Another Solution
SELECT page_id
FROM pages
EXCEPT
SELECT page_id
FROM page_likes
ORDER BY page_id
