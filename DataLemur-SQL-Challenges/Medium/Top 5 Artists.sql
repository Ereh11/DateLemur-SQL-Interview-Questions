WITH CTE AS
(
  
  SELECT artist_name,
         COUNT(GSR.song_id) AS count_songs
         
  FROM global_song_rank AS GSR
  INNER JOIN songs
  ON songs.song_id = GSR.song_id
  INNER JOIN artists
  ON songs.artist_id = artists.artist_id
  
  WHERE rank <= 10
  GROUP BY artist_name
)

SELECT *
FROM 
(
  SELECT artist_name, 
        DENSE_RANK() OVER(ORDER BY count_songs DESC) AS artist_rank
  FROM CTE
) AS TP

WHERE artist_rank <= 5




