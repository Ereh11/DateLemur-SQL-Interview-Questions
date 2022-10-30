SELECT P.page_id 
FROM pages P
WHERE P.page_id NOT IN
  (
    SELECT PL.page_id FROM page_likes PL
  );