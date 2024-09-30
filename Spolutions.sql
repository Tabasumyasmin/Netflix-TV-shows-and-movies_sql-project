SELECT COUNT(*) as total_content FROM netflix
SELECT DISTINCT type
	FROM netflix;

	SELECT * FROM netflix

	-- 15 business problems
--1.Count the number of Movies vs TV Shows
SELECT
	type,
	COUNT(*) as total_content
FROM netflix
group by type;


--Find the most common rating for movies and TV shows
SELECT rating, COUNT(*) AS count
FROM netflix
GROUP BY rating
ORDER BY count DESC
LIMIT 1;


-- List all movies released in a specific year (e.g., 2020)
SELECT *
FROM netflix
WHERE type = 'Movie' 
AND
release_year = 2020;

-- Find the top 5 countries with the most content on Netflix
SELECT 
	UNNEST(STRING_TO_ARRAY(country,','))as new_country,
	COUNT (show_id) as total_content
	FROM netflix
	group by 1
	ORDER BY 2 DESC
	LIMIT 5
	
-- Identify the longest movie
SELECT * FROM netflix
WHERE type = 'Movie' 
	AND duration = (SELECT MAX (duration) FROM netflix)

--Find content added in the last 5 years
SELECT * FROM netflix
	WHERE TO_DATE(date_added,'Month DD,YYYY')>= CURRENT_DATE - INTERVAL '5 Years';

--Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT * FROM netflix
where director ILIKE '%Rajiv Chilaka%';

--Count the number of content items in each genre
SELECT
UNNEST(STRING_TO_ARRAY(listed_in,',')) as genre,
COUNT(show_id) as total_content
FROM netflix
GROUP BY 1

--Find each year and the average numbers of content release in India on netflix.
--return top 5 year with highest avg content release!

SELECT 
EXTRACT (YEAR FROM TO_DATE (date_added,'Month DD,YYYY')) as date,
COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY 1



