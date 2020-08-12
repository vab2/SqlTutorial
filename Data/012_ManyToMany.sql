/*-- Creating Our DB and Tables --*/
/*--------------------------------*/

CREATE DATABASE tv_app;
USE tv_app;

-- CREATING THE REVIEWERS TABLE
CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

-- CREATING THE SERIES TABLE
CREATE TABLE series(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4),
    genre VARCHAR(100)
);

-- CREATING THE REVIEWS TABLE
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);

-- INSERTING A BUNCH OF DATA
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);


mysql> SELECT * FROM series;
+----+-----------------------+---------------+-----------+
| id | title                 | released_year | genre     |
+----+-----------------------+---------------+-----------+
|  1 | Archer                |          2009 | Animation |
|  2 | Arrested Development  |          2003 | Comedy    |
|  3 | Bob s Burgers         |          2011 | Animation |
|  4 | Bojack Horseman       |          2014 | Animation |
|  5 | Breaking Bad          |          2008 | Drama     |
|  6 | Curb Your Enthusiasm  |          2000 | Comedy    |
|  7 | Fargo                 |          2014 | Drama     |
|  8 | Freaks and Geeks      |          1999 | Comedy    |
|  9 | General Hospital      |          1963 | Drama     |
| 10 | Halt and Catch Fire   |          2014 | Drama     |
| 11 | Malcolm In The Middle |          2000 | Comedy    |
| 12 | Pushing Daisies       |          2007 | Comedy    |
| 13 | Seinfeld              |          1989 | Comedy    |
| 14 | Stranger Things       |          2016 | Drama     |
+----+-----------------------+---------------+-----------+

mysql> SELECT * FROM reviewers;
+----+------------+-----------+
| id | first_name | last_name |
+----+------------+-----------+
|  1 | Thomas     | Stoneman  |
|  2 | Wyatt      | Skaggs    |
|  3 | Kimbra     | Masters   |
|  4 | Domingo    | Cortes    |
|  5 | Colt       | Steele    |
|  6 | Pinkie     | Petit     |
|  7 | Marlon     | Crafford  |
+----+------------+-----------+

mysql> SELECT * FROM reviews;
+----+--------+-----------+-------------+
| id | rating | series_id | reviewer_id |
+----+--------+-----------+-------------+
|  1 |    8.0 |         1 |           1 |
|  2 |    7.5 |         1 |           2 |
|  3 |    8.5 |         1 |           3 |
|  4 |    7.7 |         1 |           4 |
|  5 |    8.9 |         1 |           5 |
|  6 |    8.1 |         2 |           1 |
|  7 |    6.0 |         2 |           4 |
|  8 |    8.0 |         2 |           3 |
|  9 |    8.4 |         2 |           6 |
| 10 |    9.9 |         2 |           5 |
| 11 |    7.0 |         3 |           1 |
| 12 |    7.5 |         3 |           6 |
| 13 |    8.0 |         3 |           4 |
| 14 |    7.1 |         3 |           3 |
| 15 |    8.0 |         3 |           5 |
| 16 |    7.5 |         4 |           1 |
| 17 |    7.8 |         4 |           3 |
| 18 |    8.3 |         4 |           4 |
| 19 |    7.6 |         4 |           2 |
| 20 |    8.5 |         4 |           5 |
| 21 |    9.5 |         5 |           1 |
| 22 |    9.0 |         5 |           3 |
| 23 |    9.1 |         5 |           4 |
| 24 |    9.3 |         5 |           2 |
| 25 |    9.9 |         5 |           5 |
| 26 |    6.5 |         6 |           2 |
| 27 |    7.8 |         6 |           3 |
| 28 |    8.8 |         6 |           4 |
| 29 |    8.4 |         6 |           2 |
| 30 |    9.1 |         6 |           5 |
| 31 |    9.1 |         7 |           2 |
| 32 |    9.7 |         7 |           5 |
| 33 |    8.5 |         8 |           4 |
| 34 |    7.8 |         8 |           2 |
| 35 |    8.8 |         8 |           6 |
| 36 |    9.3 |         8 |           5 |
| 37 |    5.5 |         9 |           2 |
| 38 |    6.8 |         9 |           3 |
| 39 |    5.8 |         9 |           4 |
| 40 |    4.3 |         9 |           6 |
| 41 |    4.5 |         9 |           5 |
| 42 |    9.9 |        10 |           5 |
| 43 |    8.0 |        13 |           3 |
| 44 |    7.2 |        13 |           4 |
| 45 |    8.5 |        14 |           2 |
| 46 |    8.9 |        14 |           3 |
| 47 |    8.9 |        14 |           4 |
+----+--------+-----------+-------------+



/*-----------------------------------------------------------*/



/*-- Chalanges --*/
/*---------------*/

-- 1st Select title and rating 
SELECT title, rating 
FROM series
JOIN reviews
    ON series.id = reviews.series_id;
+----------------------+--------+
| title                | rating |
+----------------------+--------+
| Archer               |    8.0 |
| Archer               |    7.5 |
| Archer               |    8.5 |
| Archer               |    7.7 |
| Archer               |    8.9 |
| Arrested Development |    8.1 |
| Arrested Development |    6.0 |
| Arrested Development |    8.0 |
| Arrested Development |    8.4 |
| Arrested Development |    9.9 |
| Bob s Burgers        |    7.0 |
| Bob s Burgers        |    7.5 |
| Bob s Burgers        |    8.0 |
| Bob s Burgers        |    7.1 |
| Bob s Burgers        |    8.0 |
| Bojack Horseman      |    7.5 |
| Bojack Horseman      |    7.8 |
| Bojack Horseman      |    8.3 |
| Bojack Horseman      |    7.6 |
| Bojack Horseman      |    8.5 |
| Breaking Bad         |    9.5 |
| Breaking Bad         |    9.0 |
| Breaking Bad         |    9.1 |
| Breaking Bad         |    9.3 |
| Breaking Bad         |    9.9 |
| Curb Your Enthusiasm |    6.5 |
| Curb Your Enthusiasm |    7.8 |
| Curb Your Enthusiasm |    8.8 |
| Curb Your Enthusiasm |    8.4 |
| Curb Your Enthusiasm |    9.1 |
| Fargo                |    9.1 |
| Fargo                |    9.7 |
| Freaks and Geeks     |    8.5 |
| Freaks and Geeks     |    7.8 |
| Freaks and Geeks     |    8.8 |
| Freaks and Geeks     |    9.3 |
| General Hospital     |    5.5 |
| General Hospital     |    6.8 |
| General Hospital     |    5.8 |
| General Hospital     |    4.3 |
| General Hospital     |    4.5 |
| Halt and Catch Fire  |    9.9 |
| Seinfeld             |    8.0 |
| Seinfeld             |    7.2 |
| Stranger Things      |    8.5 |
| Stranger Things      |    8.9 |
| Stranger Things      |    8.9 |
+----------------------+--------+
47 rows in set (0.00 sec)


-- 2nd avg rating 
SELECT title, avg(rating) AS average_rating
FROM series
JOIN reviews
    ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY average_rating;
+----------------------+----------------+
| title                | average_rating |
+----------------------+----------------+
| General Hospital     |        5.38000 |
| Bob s Burgers        |        7.52000 |
| Seinfeld             |        7.60000 |
| Bojack Horseman      |        7.94000 |
| Arrested Development |        8.08000 |
| Archer               |        8.12000 |
| Curb Your Enthusiasm |        8.12000 |
| Freaks and Geeks     |        8.60000 |
| Stranger Things      |        8.76667 |
| Breaking Bad         |        9.36000 |
| Fargo                |        9.40000 |
| Halt and Catch Fire  |        9.90000 |
+----------------------+----------------+


-- 3rd reviewers name and rating
SELECT first_name,last_name, rating
FROM reviews
INNER JOIN reviewers
    ON reviewers.id = reviews.reviewer_id;
+------------+-----------+--------+
| first_name | last_name | rating |
+------------+-----------+--------+
| Thomas     | Stoneman  |    8.0 |
| Thomas     | Stoneman  |    8.1 |
| Thomas     | Stoneman  |    7.0 |
| Thomas     | Stoneman  |    7.5 |
| Thomas     | Stoneman  |    9.5 |
| Wyatt      | Skaggs    |    7.5 |
| Wyatt      | Skaggs    |    7.6 |
| Wyatt      | Skaggs    |    9.3 |
............................................
............................................continue


-- 4th unreviewed series
SELECT title AS 'unreivied series'
FROM series
LEFT JOIN reviews
	ON series.id = reviews.series_id
	WHERE reviews.series_id IS NULL;
+-----------------------+
| unreivied series      |
+-----------------------+
| Malcolm In The Middle |
| Pushing Daisies       |
+-----------------------+


-- 5th genre and avg_rating
SELECT genre, 
	AVG(rating) AS 'avg_rating'
FROM series
INNER JOIN reviews
	ON series.id = reviews.series_id
GROUP BY genre
ORDER BY avg_rating;
+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Animation |    7.86000 |
| Drama     |    8.04375 |
| Comedy    |    8.16250 |
+-----------+------------+

SELECT genre, 
	ROUND(AVG(rating),2) AS 'avg_rating'
FROM series
INNER JOIN reviews
	ON series.id = reviews.series_id
GROUP BY genre
ORDER BY avg_rating;
+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Animation |       7.86 |
| Drama     |       8.04 |
| Comedy    |       8.16 |
+-----------+------------+


-- 6th name, count min, max, AVG, Status
SELECT first_name, last_name, 
		COUNT(rating) AS 'COUNT',
		IFNULL(MIN(rating),0) AS 'MIN', 
		IFNULL(MAX(rating),0) AS 'MAX',
		IFNULL(AVG(rating),0) AS 'AVG',
		CASE
			WHEN COUNT(*) <=1 THEN 'INACTIVE'
			ELSE 'ACTIVE'
		END AS 'Status'
FROM reviewers
LEFT JOIN reviews
	ON reviewers.id= reviews.reviewer_id
GROUP BY reviewers.id;
+------------+-----------+-------+-----+-----+---------+----------+
| first_name | last_name | COUNT | MIN | MAX | AVG     | Status   |
+------------+-----------+-------+-----+-----+---------+----------+
| Thomas     | Stoneman  |     5 | 7.0 | 9.5 | 8.02000 | ACTIVE   |
| Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | 7.80000 | ACTIVE   |
| Kimbra     | Masters   |     9 | 6.8 | 9.0 | 7.98889 | ACTIVE   |
| Domingo    | Cortes    |    10 | 5.8 | 9.1 | 7.83000 | ACTIVE   |
| Colt       | Steele    |    10 | 4.5 | 9.9 | 8.77000 | ACTIVE   |
| Pinkie     | Petit     |     4 | 4.3 | 8.8 | 7.25000 | ACTIVE   |
| Marlon     | Crafford  |     0 | 0.0 | 0.0 | 0.00000 | INACTIVE |
+------------+-----------+-------+-----+-----+---------+----------+

-- Same with if
SELECT first_name, 
       last_name, 
       Count(rating)                               AS COUNT, 
       Ifnull(Min(rating), 0)                      AS MIN, 
       Ifnull(Max(rating), 0)                      AS MAX, 
       Round(Ifnull(Avg(rating), 0), 2)            AS AVG, 
       IF(Count(rating) > 0, 'ACTIVE', 'INACTIVE') AS STATUS 
FROM   reviewers 
       LEFT JOIN reviews 
              ON reviewers.id = reviews.reviewer_id 
GROUP  BY reviewers.id; 



-- 7th three table
-- join  reviewers and reviews
SELECT  rating, first_name, last_name
FROM reviewers
INNER JOIN reviews
	ON reviewers.id = reviews.reviewer_id;
+--------+------------+-----------+
| rating | first_name | last_name |
+--------+------------+-----------+
|    8.0 | Thomas     | Stoneman  |
|    8.1 | Thomas     | Stoneman  |
|    7.0 | Thomas     | Stoneman  |
|    7.5 | Thomas     | Stoneman  |
|    9.5 | Thomas     | Stoneman  |
|    7.5 | Wyatt      | Skaggs    |
|    7.6 | Wyatt      | Skaggs    |
............................................
............................................continue

-- join reviews with reviews AND reviews with series
SELECT title, rating, first_name, last_name
FROM reviewers
INNER JOIN reviews
	ON reviewers.id = reviews.reviewer_id
INNER JOIN series
	ON reviews.series_id = series.id;
+----------------------+--------+------------+-----------+
| title                | rating | first_name | last_name |
+----------------------+--------+------------+-----------+
| Archer               |    8.0 | Thomas     | Stoneman  |
| Arrested Development |    8.1 | Thomas     | Stoneman  |
| Bob s Burgers        |    7.0 | Thomas     | Stoneman  |
| Bojack Horseman      |    7.5 | Thomas     | Stoneman  |
| Breaking Bad         |    9.5 | Thomas     | Stoneman  |
| Archer               |    7.5 | Wyatt      | Skaggs    |
| Bojack Horseman      |    7.6 | Wyatt      | Skaggs    |
| Breaking Bad         |    9.3 | Wyatt      | Skaggs    |
...........................................................
.............................................................continue

-- Final query
SELECT title, rating, CONCAT(first_name,' ',last_name) AS 'Reviewer'
FROM reviewers
INNER JOIN reviews
	ON reviewers.id = reviews.reviewer_id
INNER JOIN series
	ON reviews.series_id = series.id
ORDER BY title;
+----------------------+--------+-----------------+
| title                | rating | Reviewer        |
+----------------------+--------+-----------------+
| Archer               |    8.0 | Thomas Stoneman |
| Archer               |    7.7 | Domingo Cortes  |
| Archer               |    8.5 | Kimbra Masters  |
| Archer               |    7.5 | Wyatt Skaggs    |
| Archer               |    8.9 | Colt Steele     |
| Arrested Development |    8.1 | Thomas Stoneman |
| Arrested Development |    6.0 | Domingo Cortes  |
| Arrested Development |    8.0 | Kimbra Masters  |
...........................................................
.............................................................continue



/*-----------------------------------------------------------*/