CREATE VIEW IF NOT EXISTS topMovieID AS 
SELECT movieID, count(movieID) AS ratingsCount
FROM movieRatings
GROUP BY movieID
ORDER BY ratingsCount DESC;

SELECT n.title AS movieName, t.ratingsCount AS ratingsCount
FROM movieNames n JOIN topMovieID t ON n.movieID = t.movieID;