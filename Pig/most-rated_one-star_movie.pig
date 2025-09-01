-- Load ratings dataset
ratings = LOAD 'u.data' AS (userID:int, movieID:int, rating:int, ratingTime:int);

-- Load movies names dataset
metadata = LOAD 'u.item' USING PigStorage('|') AS (movieID:int, movieTitle:chararray,
releaseDate:chararray, videoRelease:chararray, imdbLink:chararray);

-- Group movies by ratings
ratingsByMovie = GROUP ratings BY movieID;

-- Calculate average rating and count of ratings for each movie
avgRatingsByCount = FOREACH ratingsByMovie GENERATE group AS movieID, AVG(ratings.rating) AS avgRating, COUNT(ratings) AS ratingsCount;

-- Filter movies which have avg rating less than 2
lowRatedMovies = FILTER avgRatingsByCount BY avgRating < 2.0;

-- Join filitered movies and movie names
lowRatedMoviesNames = JOIN lowRatedMovies by movieID, metadata BY movieID;

-- Sort movies by ratings count
mostLowRatedMovies = ORDER lowRatedMoviesNames BY ratingsCount DESC;

-- Show results
DUMP mostLowRatedMovies;

-- DESCRIBE avgRatingsByCount;
