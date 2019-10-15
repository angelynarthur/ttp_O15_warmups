--Which are the 10 longest R rated movies?

SELECT title, length, rating
FROM film
WHERE rating = 'R'
ORDER BY length DESC
LIMIT 10;


-- What are the NEXT 10 longest R rated movies?
-- hint: google "how to get next 10 records in sql"

SELECT title, length
FROM film
WHERE rating = 'R'
ORDER BY length DESC
OFFSET 10 ROWS
LIMIT 10;

OR

SELECT title, length
FROM film
WHERE rating = 'R'
ORDER BY length DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;


--How many films are as long as the longest film?
-- RETURN an exact number

SELECT COUNT(*) FROM film
WHERE length = (SELECT MAX(length) FROM film);

--Which are the 10 longest R rated movies, SORTED IN ALPHABETICAL ORDER?
-- hint: might need a subquery


SELECT title, length, rating
FROM film
WHERE length = (SELECT length FROM film )
And rating = 'R' LIMIT 10;  (?)

--Which are the 10 kids films with the longest description?
-- G, PG, PG-13
--hint: google "SQL count length of string"

SELECT title, LENGTH(description) AS LongestDescription
FROM film
WHERE rating IN('G','PG','PG-13')
ORDER BY LongestDescription DESC
LIMIT 10;


-- How many unique release_years are there in the dvd rental database?
-- Return an exact number

SELECT COUNT (DISTINCT release_year)
FROM film;