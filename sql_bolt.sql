-- CREATE TABLE
CREATE TABLE movies
(
    Id             SERIAL,
    Title          VARCHAR(50),
    Director       VARCHAR(50),
    Year           INT,
    Length_minutes INT
);

-- INSERTS

INSERT INTO movies (title, director, year, length_minutes)
VALUES ('Toy Story', 'John Lasseter', 1995, 81),
        ('A Bug''s Life', 'John Lasseter', 1998, 95),
        ('Toy Story 2', 'John Lasseter', 1999, 93),
        ('Monsters, Inc.', 'Pete Docter', 2001, 92),
        ('Finding Nemo', 'Andrew Stanton', 2003, 107),
        ('The Incredibles', 'Brad Bird', 2004, 116),
        ('Cars', 'John Lasseter', 2006, 117),
        ('Ratatouille', 'Brad Bird', 2007, 115),
        ('WALL-E', 'Andrew Stanton', 2008, 104),
        ('Up', 'Pete Docter', 2009, 101),
        ('Toy Story 3', 'Lee Unkrich', 2010, 103),
        ('Cars 2', 'John Lasseter', 2011, 120),
        ('Brave', 'Brenda Chapman', 2012, 102),
        ('Monsters University', 'Dan Scanlon', 2013, 110);


-------------------------
-- EXERCISES LESSON 1
-------------------------

-- 1. Find the title of each film
SELECT title
FROM movies;

-- 2. Find the director of each film
SELECT director
FROM movies;

-- 3. Find the title and director of each film
SELECT title, director
FROM movies;

-- 4. Find the title and year of each film
SELECT title, year
FROM movies;

-- 5. Find all the information about each film
SELECT *
FROM movies;

-------------------------
-- EXERCISES LESSON 2
-------------------------

-- Find the movie with a row id of 6
SELECT *
FROM movies
WHERE id = 6;

-- Find the movies released in the years between 2000 and 2010
SELECT *
FROM movies
WHERE year BETWEEN 2000 AND 2010;

-- Find the movies not released in the years between 2000 and 2010
SELECT *
FROM movies
WHERE NOT (year BETWEEN 2000 AND 2010);

-- Find the first 5 Pixar movies and their year release
SELECT title, year
FROM movies
WHERE id <= 5;

-------------------------
-- EXERCISES LESSON 3
-------------------------

-- 1. Find all the Toy Story movies
SELECT *
FROM movies
WHERE title LIKE 'Toy Story%';

-- 2. Find all the movies directed by John Lasseter
SELECT *
FROM movies
WHERE director = 'John Lasseter';

-- 3. Find all the movies (and director) not directed by John Lasseter
SELECT *
FROM movies
WHERE director != 'John Lasseter';

-- 4. Find all the WALL-* movies
SELECT *
FROM movies
WHERE title LIKE 'WALL-_';

-------------------------
-- EXERCISES LESSON 4
-------------------------

-- 1. List all the directors of Pixar movies (alphabetically) without duplicates

SELECT DISTINCT director
FROM movies
ORDER BY director ASC;

-- 2. List the last four Pixar movies released (ordered from most recent to least)

SELECT title, year
FROM movies
ORDER BY year DESC
LIMIT 4;

-- 3. List the first five Pixar movies sorted alphabetically

SELECT title
FROM movies
ORDER BY title ASC
LIMIT 5;

-- 4. List the next five Pixar movies sorted alphabetically

SELECT title
FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;

-- DROP
DROP TABLE movies;

--------------------------------------------------
-- SQL Review: Simple SELECT Queries
--------------------------------------------------

-- CREATE TABLE
CREATE TABLE north_american_cities
(
    id         SERIAL,
    city       VARCHAR(50),
    country    VARCHAR(50),
    population INT,
    latitude   FLOAT,
    longitude  FLOAT
);

-- INSERTS

INSERT INTO north_american_cities
    (city, country, population, latitude, longitude)
VALUES ('Guadalajara', 'Mexico', 1500800, 20.659699, -103.349609),
        ('Toronto', 'Canada', 2795060, 43.653226, -79.383184),
        ('Houston', 'USA', 2195914, 29.760427, -95.369803),
        ('New York', 'USA', 8405837, 40.712784, -74.005941),
        ('Philadelphia', 'USA', 1553165, 39.952584, -75.165222),
        ('Havana', 'Cuba', 2106146, 23.05407, -82.345189);

-- 1. list all the Canadian cities and their populations

SELECT city, population
FROM north_american_cities
WHERE country = 'Canada';

-- 2. Order all the cities in the USA by their latitude from north to south

SELECT city
FROM north_american_cities
WHERE country = 'USA'
ORDER BY latitude DESC;

-- 3. List all the cities west of Chicago, ordered from west to east

SELECT city, longitude
FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude ASC;

-- 4. List the two largest cities in Mexico (by population)

SELECT city, population
FROM north_american_cities
WHERE country LIKE 'Mexico'
ORDER BY population DESC
LIMIT 2;

-- 5. List the third and fourth largest cities (by population) in the United States and their population

SELECT city, population
FROM north_american_cities
WHERE country LIKE 'USA'
ORDER BY population DESC
LIMIT 2 OFFSET 2;

-------------------------
-- EXERCISES LESSON 6
-------------------------

-- CREATE A EXTRA TABLE
CREATE TABLE boxoffice
(
    movie_id            INT,
    rating              FLOAT,
    domestic_sales      INT,
    international_sales INT
);

-- INSERTS

INSERT INTO boxoffice
    (movie_id, rating, domestic_sales, international_sales)
VALUES (5, 8.2, 380843261, 555900000);

INSERT INTO boxoffice
    (movie_id, rating, domestic_sales, international_sales)
VALUES (9, 7.4, 268492764, 475066843);

INSERT INTO boxoffice
    (movie_id, rating, domestic_sales, international_sales)
VALUES (8, 8, 206445654, 417277164);

INSERT INTO boxoffice
    (movie_id, rating, domestic_sales, international_sales)
VALUES (12, 6.4, 191452396, 368400000);

INSERT INTO boxoffice
    (movie_id, rating, domestic_sales, international_sales)
VALUES (3, 8, 261441092, 370001000);


-- 1. Find the domestic and international sales for each movie

SELECT title, domestic_sales, international_sales
FROM movies
    JOIN boxoffice
        ON movies.id = boxoffice.movie_id;

-- 2. Show the sales numbers for each movie that did better internationally rather than domestically

SELECT title, domestic_sales, international_sales
FROM movies
    JOIN boxoffice
        ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;

-- 3. List all the movies by their ratings in descending order

SELECT title, rating
FROM movies
    JOIN boxoffice
        ON movies.id = boxoffice.movie_id
ORDER BY rating DESC;

-------------------------
-- EXERCISES LESSON 7
-------------------------

-- CREATING TABLES

CREATE TABLE buildings
(
    building_name VARCHAR(25),
    capacity      INT
);

CREATE TABLE employees
(
    role           VARCHAR(50),
    name           VARCHAR(50),
    building       VARCHAR(25),
    years_employed INT
);

-- INSERTS

INSERT INTO buildings
    (building_name, capacity)
VALUES ('1e', 24),
        ('1w', 32),
        ('2e', 16),
        ('2w', 20);

--

INSERT INTO employees (role, name, building, years_employed)
VALUES ('Engineer', 'Becky A.', '1e', 4),
        ('Engineer', 'Dan B.', '1e', 2),
        ('Engineer', 'Sharon F.', '1e', 6),
        ('Engineer', 'Dan M.', '1e', 4),
        ('Engineer', 'Malcom S.', '1e', 1),
        ('Artist', 'Tylar S.', '2w', 2),
        ('Artist', 'Sherman D.', '2w', 8),
        ('Artist', 'Jakob J.', '2w', 6),
        ('Artist', 'Lillia A.', '2w', 7),
        ('Artist', 'Brandon J.', '2w', 7),
        ('Manager', 'Scott K.', '1e', 9),
        ('Manager', 'Shirlee M.', '1e', 3),
        ('Manager', 'Daria O.', '2w', 6);

-- QUERIES

-- 1. Find the list of all buildings that have employees

SELECT DISTINCT building
FROM employees;

-- 2. Find the list of all buildings and their capacity

SELECT *
FROM buildings;

-- 3. Lit all buildings and the distinct employee roles in each building
SELECT DISTINCT building_name, role
FROM buildings
    LEFT JOIN employees
        ON building_name = building
ORDER BY building_name;

-------------------------
-- EXERCISES LESSON 8
-------------------------

-- 1. Find the name and role of all employees who have not been assigned to a building
SELECT name, role
FROM employees
WHERE building = '';

-- 2. Find the names of the buildings that hold no employees

SELECT DISTINCT building_name
FROM buildings
        LEFT JOIN employees
                ON employees.building = building_name
WHERE role IS NULL;

-------------------------
-- EXERCISES LESSON 9
-------------------------

-- 1. List all movies and their combined sales in millions of dollars

SELECT title,
    (domestic_sales + international_sales) / 1000000 AS total_sales
FROM movies
    JOIN boxoffice
        ON movies.Id = boxoffice.movie_id;

-- 2. List all movies and their ratings in percent

SELECT title, rating * 10 AS rating_percent
FROM movies
    JOIN boxoffice
        ON boxoffice.movie_id = movies.Id;

-- 3. List all movies that were released on even number years

SELECT title, year
FROM movies
WHERE year % 2 = 0;

-------------------------
-- EXERCISES LESSON 10
-------------------------

-- 1. Find the longest time that an employee has been at the studio

SELECT MAX(years_employed)
FROM employees;

-- 2. For each role, find the average number of years employed by employees in that role

SELECT role, AVG(years_employed)
FROM employees
GROUP BY role;

-- 3. Find the total number of employee years worked in each building

SELECT building, SUM(years_employed)
FROM employees
GROUP BY building;

-------------------------
-- EXERCISES LESSON 10
-------------------------

-- 1. Find the number of artists in the studio
SELECT role, COUNT(*)
FROM employees
WHERE role = 'Artist'
GROUP BY role;

-- 2. Find the number of employees of each rol in the studio
SELECT role, COUNT(*)
FROM employees
GROUP BY role;

-- 3. Find the total number of years employed by all engineers

SELECT role, SUM(years_employed)
FROM employees
GROUP BY role
HAVING role = 'Engineer';

-------------------------
-- EXERCISES LESSON 12
-------------------------

-- 1. Find the number of movies each director has directed
SELECT director, COUNT(id)
FROM movies
GROUP BY director;

-- 2. Find the total domestic and international sales that can be attributed to each director

SELECT director, SUM(domestic_sales + international_sales)
FROM movies
        INNER JOIN boxoffice
            ON movies.Id = boxoffice.movie_id
GROUP BY director;

-------------------------
-- EXERCISES LESSON 13
-------------------------

-- 1. Add the studios new production, Toy Story 4, to the list of movies

INSERT INTO movies (title, director, year, length_minutes)
VALUES ('Toy Story 4', 'Lee Unkrich', 2015, 81);

-- 2. Toy Story 4 has been released to critical acclaim!
-- It had a rating of 8.7, and made 340 million domestically and
-- 270 million internationally. Add the record to the BoxOffice table.

INSERT INTO boxoffice (movie_id, rating, domestic_sales, international_sales)
VALUES (15, 8.7, 340000000, 270000000);

-------------------------
-- EXERCISES LESSON 14
-------------------------

-- 1. The director for A Bugs Life is incorrect, it was actually directed by John Lasseter

UPDATE movies
SET director = 'John Lasseter'
WHERE title = 'A Bugs Life';

-- 2. The year that Toy Store 2 was released is incorrect, it was actually released in 1999
UPDATE movies
SET year = 1999
WHERE title = 'Toy Story 2';

-- 3. Both the title and director for Toy Story 8 is incorrect, the title should be 'Toy Story 3'
-- and it was directed by Lee Unkrich

UPDATE movies
SET title = 'Toy Story 3',
    director = 'Lee Unkrich'
WHERE title = 'Toy Story 8';

-------------------------
-- EXERCISES LESSON 15
-------------------------

-- 1. This database is getting to big, let's remove all movies that were released before 2005
DELETE FROM movies
WHERE year < 2005;

-- 2. Andrew Stanton has also left the studio, so please remove all movies direct by him
DELETE FROM movies
WHERE director = 'Andrew Stanton';

-------------------------
-- EXERCISES LESSON 16
-------------------------

-- 1. Create a new table name Database with the following columns:
    -- Name, Version, Download_count

CREATE TABLE database
(
    name TEXT,
    version FLOAT,
    download_count INT
);

INSERT INTO database (name, version, download_count)
VALUES ('SQLite', '3.9', 92000000),
        ('MySQL', '5.5', 512000000),
        ('Postgres', '9.4', 384000000);

-------------------------
-- EXERCISES LESSON 17
-------------------------

-- 1. Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio
    -- each movie was released in

ALTER TABLE movies
ADD aspect_ratio FLOAT DEFAULT 2.39;

-- 2. Add another column named Language with a TEXT data type to store the language that the
    -- movie was released in. Ensure that the default for this language is English

ALTER TABLE movies
ADD language TEXT DEFAULT 'english';

-------------------------
-- EXERCISES LESSON 18
-------------------------

-- 1. We've sadly reached the end of our lessons, lets clean up by removing the Movies table

DROP TABLE movies;

-- 2. And drop the BoxOffice table as well

DROP TABLE boxoffice;
