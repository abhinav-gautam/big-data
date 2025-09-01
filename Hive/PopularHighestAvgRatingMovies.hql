CREATE VIEW IF NOT EXISTS movieAvgRatingCount AS 
SELECT movieID, AVG(rating) AS avgRating, COUNT(movieID) AS ratingsCount
FROM movieRatings
GROUP BY movieID
ORDER BY avgRating DESC;

SELECT n.title AS movieName, a.avgRating AS avgRating
FROM movieAvgRatingCount a JOIN movieNames n ON n.movieID = a.movieID
WHERE a.ratingsCount >= 10;