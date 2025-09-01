-- Load ratings dataset
ratings = LOAD 'u.data' AS (userID:int, movieID:int, rating:int, ratingTime:int);

-- Load movies names dataset
metadata = LOAD 'u.item' USING PigStorage('|') AS (movieID:int, movieTitle:chararray,
releaseDate:chararray, videoRelease:chararray, imdbLink:chararray);

-- Convert movie release date to timestamp
nameLookup = FOREACH metadata GENERATE movieID, movieTitle, ToUnixTime(ToDate(releaseDate, 'dd-MMM-yyyy')) AS releaseTime;

-- Group ratins by movieID
ratingsByMovie = GROUP ratings BY movieID;

-- Calculate average rating for each movieID
avgRatings = FOREACH ratingsByMovie GENERATE group AS movieID, AVG(ratings.rating) AS avgRating;

-- Filter movies which have avg rating more than 4
fiveStarMovies = FILTER avgRatings BY avgRating > 4.0;

-- Join filtered movies and movies names
fiveStarMoviesNames = JOIN fiveStarMovies BY movieID, nameLookup BY movieID;

-- Sort movies by release time
oldestFiveStarMovies = ORDER fiveStarMoviesNames BY nameLookup::releaseTime;

-- Show results
DUMP oldestFiveStarMovies;

-- DESCRIBE ratings;
-- DESCRIBE avgRatings;
-- DESCRIBE ratingsByMovie;
