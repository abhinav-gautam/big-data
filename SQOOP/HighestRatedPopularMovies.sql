SELECT movies.title, AVG(ratings.rating) AS avgRating, COUNT(ratings.movie_id) AS ratingsCount
FROM movies 
INNER JOIN ratings ON movies.id = ratings.movie_id
GROUP BY movies.title
HAVING ratingsCount > 10
ORDER BY avgRating DESC
LIMIT 10;

