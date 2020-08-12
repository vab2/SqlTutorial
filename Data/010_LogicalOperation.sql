/*-- Table --*/
/*-----------*/

mysql> SELECT * FROM books;
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
| book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
|       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
|       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
|       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
|       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
|       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
|       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
|       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
|       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
|       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
|      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
|      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
|      12 | Where I m Calling From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
|      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
|      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
|      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
|      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
|      17 | 10% Happier                                         | Dan          | Harris         |          2014 |             29 |   256 |
|      18 | fake_book                                           | Freida       | Harris         |          2001 |            287 |   428 |
|      19 | Lincoln In The Bardo                                | George       | Saunders       |          2017 |           1000 |   367 |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+




/*-- NOT EQUAL --*/
/*---------------*/

mysql> SELECT title FROM books WHERE released_year = 2017;
+----------------------+
| title                |
+----------------------+
| Lincoln In The Bardo |
+----------------------+

mysql> SELECT title FROM books WHERE released_year != 2017;
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| The Namesake                                        |
| Norse Mythology                                     |
| American Gods                                       |
| Interpreter of Maladies                             |
| A Hologram for the King: A Novel                    |
| The Circle                                          |
| The Amazing Adventures of Kavalier & Clay           |
| Just Kids                                           |
| A Heartbreaking Work of Staggering Genius           |
| Coraline                                            |
| What We Talk About When We Talk About Love: Stories |
| Where I m Calling From: Selected Stories            |
| White Noise                                         |
| Cannery Row                                         |
| Oblivion: Stories                                   |
| Consider the Lobster                                |
| 10% Happier                                         |
| fake_book                                           |
+-----------------------------------------------------+

mysql> SELECT title, author_lname FROM books WHERE author_lname = 'Harris';
+-------------+--------------+
| title       | author_lname |
+-------------+--------------+
| 10% Happier | Harris       |
| fake_book   | Harris       |
+-------------+--------------+

W
mysql> SELECT title, author_lname FROM books WHERE author_lname != 'Harris';
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| The Namesake                                        | Lahiri         |
| Norse Mythology                                     | Gaiman         |
| American Gods                                       | Gaiman         |
| Interpreter of Maladies                             | Lahiri         |
| A Hologram for the King: A Novel                    | Eggers         |
| The Circle                                          | Eggers         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| Just Kids                                           | Smith          |
| A Heartbreaking Work of Staggering Genius           | Eggers         |
| Coraline                                            | Gaiman         |
| What We Talk About When We Talk About Love: Stories | Carver         |
| Where I m Calling From: Selected Stories            | Carver         |
| White Noise                                         | DeLillo        |
| Cannery Row                                         | Steinbeck      |
| Oblivion: Stories                                   | Foster Wallace |
| Consider the Lobster                                | Foster Wallace |
| Lincoln In The Bardo                                | Saunders       |
+-----------------------------------------------------+----------------+

/*-----------------------------------------------------------*/



/*-- NOT LIKE --*/
/*--------------*/

mysql> SELECT title FROM books WHERE title LIKE 'W%';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| What We Talk About When We Talk About Love: Stories |
| Where I m Calling From: Selected Stories            |
| White Noise                                         |
+-----------------------------------------------------+

mysql> SELECT title FROM books WHERE title NOT LIKE 'W%';
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Namesake                              |
| Norse Mythology                           |
| American Gods                             |
| Interpreter of Maladies                   |
| A Hologram for the King: A Novel          |
| The Circle                                |
| The Amazing Adventures of Kavalier & Clay |
| Just Kids                                 |
| A Heartbreaking Work of Staggering Genius |
| Coraline                                  |
| Cannery Row                               |
| Oblivion: Stories                         |
| Consider the Lobster                      |
| 10% Happier                               |
| fake_book                                 |
| Lincoln In The Bardo                      |
+-------------------------------------------+


/*-----------------------------------------------------------*/


/*-- Greater Than --*/
/*------------------*/

SELECT title, released_year FROM books ORDER BY released_year;
 
SELECT title, released_year FROM books 
WHERE released_year > 2000 ORDER BY released_year;
 
SELECT title, released_year FROM books 
WHERE released_year >= 2000 ORDER BY released_year;
 
SELECT title, stock_quantity FROM books;
 
SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;

-- In Mysql true and false is represented as 0-false 1-true 
SELECT 99 > 1;
-- 1
 
SELECT 99 > 567;
-- 0
 
100 > 5
-- true
 
-15 > 15
-- false
 
9 > -10
-- true
 
1 > 1
-- false
 
'a' > 'b'
-- false
 
'A' > 'a'
-- false
 
'A' >=  'a'
-- true
-- Because its not cace sensetive
SELECT title, author_lname FROM books WHERE author_lname = 'Eggers';
SELECT title, author_lname FROM books WHERE author_lname = 'eggers';
SELECT title, author_lname FROM books WHERE author_lname = 'eGGers';

-- a comes before d
mysql> SELECT 'a' < 'd';
+-----------+
| 'a' < 'd' |
+-----------+
|         1 |
+-----------+

mysql> SELECT 'a' > 'd';
+-----------+
| 'a' > 'd' |
+-----------+
|         0 |
+-----------+

/*-----------------------------------------------------------*/



/*-- Less Than --*/
/*---------------*/

SELECT title, released_year FROM books
WHERE released_year < 2000;
 
SELECT title, released_year FROM books
WHERE released_year <= 2000;
 
SELECT 3 < -10;
-- false
 
SELECT -10 < -9;
-- true
 
SELECT 42 <= 42;
-- true
 
SELECT 'h' < 'p';
-- true
 
SELECT 'Q' <= 'q';
-- true

/*-----------------------------------------------------------*/



/*-- Logical AND --*/
/*-----------------*/

SELECT  
    title, 
    author_lname, 
    released_year FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010;
 
SELECT 1 < 5 AND 7 = 9;
-- false
 
SELECT -10 > -20 AND 0 <= 0;
-- true
 
SELECT -40 <= 0 AND 10 > 40;
--false
 
SELECT 54 <= 54 AND 'a' = 'A';
-- true
 
SELECT * 
FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010 
    AND title LIKE '%novel%';
	
	
/*-----------------------------------------------------------*/



/*-- Logical OR --*/
/*----------------*/


SELECT 
    title, 
    author_lname, 
    released_year 
FROM books
WHERE author_lname='Eggers' || released_year > 2010;
 
 
SELECT 40 <= 100 || -2 > 0;
-- true
 
SELECT 10 > 5 || 5 = 5;
-- true
 
SELECT 'a' = 5 || 3000 > 2000;
-- true
 
SELECT title, 
       author_lname, 
       released_year, 
       stock_quantity 
FROM   books 
WHERE  author_lname = 'Eggers' 
              || released_year > 2010 
OR     stock_quantity > 100;


/*-----------------------------------------------------------*/



/*-- BETWEEN --*/
/*-------------*/

-- Syntax BETWEEN x AND y
-- Here And is paired with between always

SELECT title, released_year FROM books WHERE released_year >= 2004 && released_year <= 2015;
-- The same can be achived with
SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2015;
 
-- NOT BETWEEN
SELECT title, released_year FROM books 
WHERE released_year NOT BETWEEN 2004 AND 2015;
 
SELECT CAST('2017-05-02' AS DATETIME);
 
show databases;
 
use new_testing_db;
 
SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
 
SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);
	
/*-----------------------------------------------------------*/



/*-- In And Not In --*/
/*-------------------*/


SELECT 
    title, 
    author_lname 
FROM books
WHERE author_lname='Carver' OR
      author_lname='Lahiri' OR
      author_lname='Smith';
-- The same cna be achived by using IN
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
 
SELECT title, released_year FROM books
WHERE released_year IN (2017, 1985);
 
SELECT title, released_year FROM books
WHERE released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;
-- The same cna be achived by using NOT IN
SELECT title, released_year FROM books
WHERE released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
 
SELECT title, released_year FROM books
WHERE released_year >= 2000
AND released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
-- Much better solution
SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0;
 
SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0 ORDER BY released_year;



/*-----------------------------------------------------------*/



/*-- Case Statements --*/
/*---------------------*/

-- For only one case
SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books;

-- For more than one case
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;

-- A bit more efficent 
-- note that the when statement is executed one by one in order
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 

/*-----------------------------------------------------------*/



/*-- EXERCISE --*/
/*--------------*/

-- Select all books written before 1980
SELECT title, author_fname, author_lname, released_year
FROM books
WHERE released_year < 1980;
+-------------+--------------+--------------+---------------+
| title       | author_fname | author_lname | released_year |
+-------------+--------------+--------------+---------------+
| Cannery Row | John         | Steinbeck    |          1945 |
+-------------+--------------+--------------+---------------+


-- SELECT all books written by Eggers or Chabon
SELECT title, author_fname, author_lname, released_year
FROM books
WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';
+-------------------------------------------+--------------+--------------+---------------+
| title                                     | author_fname | author_lname | released_year |
+-------------------------------------------+--------------+--------------+---------------+
| A Hologram for the King: A Novel          | Dave         | Eggers       |          2012 |
| The Circle                                | Dave         | Eggers       |          2013 |
| The Amazing Adventures of Kavalier & Clay | Michael      | Chabon       |          2000 |
| A Heartbreaking Work of Staggering Genius | Dave         | Eggers       |          2001 |
+-------------------------------------------+--------------+--------------+---------------+

SELECT title, author_fname, author_lname, released_year
FROM books
WHERE author_lname IN ('Eggers','Chabon');
+-------------------------------------------+--------------+--------------+---------------+
| title                                     | author_fname | author_lname | released_year |
+-------------------------------------------+--------------+--------------+---------------+
| A Hologram for the King: A Novel          | Dave         | Eggers       |          2012 |
| The Circle                                | Dave         | Eggers       |          2013 |
| The Amazing Adventures of Kavalier & Clay | Michael      | Chabon       |          2000 |
| A Heartbreaking Work of Staggering Genius | Dave         | Eggers       |          2001 |
+-------------------------------------------+--------------+--------------+---------------+

-- SELECT all books written by Lahiri and published after 2000
SELECT title, author_fname, author_lname, released_year
FROM books
WHERE author_lname ='Lahiri' AND released_year > 2000;
+--------------+--------------+--------------+---------------+
| title        | author_fname | author_lname | released_year |
+--------------+--------------+--------------+---------------+
| The Namesake | Jhumpa       | Lahiri       |          2003 |
+--------------+--------------+--------------+---------------+

-- SELECT all books page count between 100 and 200
SELECT title, author_fname, author_lname, pages
FROM books
WHERE pages BETWEEN 100 AND 200;
+-----------------------------------------------------+--------------+--------------+-------+
| title                                               | author_fname | author_lname | pages |
+-----------------------------------------------------+--------------+--------------+-------+
| Interpreter of Maladies                             | Jhumpa       | Lahiri       |   198 |
| What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |   176 |
| Cannery Row                                         | John         | Steinbeck    |   181 |
+-----------------------------------------------------+--------------+--------------+-------+
-- SAME
mysql> SELECT title, author_fname, author_lname, pages  FROM books  WHERE pages BETWEEN 176 AND 198;
+-----------------------------------------------------+--------------+--------------+-------+
| title                                               | author_fname | author_lname | pages |
+-----------------------------------------------------+--------------+--------------+-------+
| Interpreter of Maladies                             | Jhumpa       | Lahiri       |   198 |
| What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |   176 |
| Cannery Row                                         | John         | Steinbeck    |   181 |
+-----------------------------------------------------+--------------+--------------+-------+


-- SELECT all books where author lname starts with 'C' or and 'S'
SELECT title, author_fname, author_lname
FROM books
WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%' ORDER BY author_lname;
+-----------------------------------------------------+--------------+--------------+
| title                                               | author_fname | author_lname |
+-----------------------------------------------------+--------------+--------------+
| What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |
| Where I m Calling From: Selected Stories            | Raymond      | Carver       |
| The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon       |
| Lincoln In The Bardo                                | George       | Saunders     |
| Just Kids                                           | Patti        | Smith        |
| Cannery Row                                         | John         | Steinbeck    |
+-----------------------------------------------------+--------------+--------------+
-- This is same
SELECT title, author_lname 
FROM books 
WHERE 
    SUBSTR(author_lname,1,1) = 'C' OR 
    SUBSTR(author_lname,1,1) = 'S';
-- This is same
SELECT title, author_lname FROM books 
WHERE SUBSTR(author_lname,1,1) IN ('C', 'S');


SELECT title, author_lname, 
	CASE  
		WHEN LOCATE('Stories', title) THEN 'Short Stories'
		WHEN LOCATE('Just kids', title) OR LOCATE('Heartbreaking Work',title) THEN 'Memoir'
		ELSE 'Novel'
	END AS 'TYPE'
FROM books;
+-----------------------------------------------------+----------------+---------------+
| title                                               | author_lname   | TYPE          |
+-----------------------------------------------------+----------------+---------------+
| The Namesake                                        | Lahiri         | Novel         |
| Norse Mythology                                     | Gaiman         | Novel         |
| American Gods                                       | Gaiman         | Novel         |
| Interpreter of Maladies                             | Lahiri         | Novel         |
| A Hologram for the King: A Novel                    | Eggers         | Novel         |
| The Circle                                          | Eggers         | Novel         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
| Just Kids                                           | Smith          | Memoir        |
| A Heartbreaking Work of Staggering Genius           | Eggers         | Memoir        |
| Coraline                                            | Gaiman         | Novel         |
| What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
| Where I m Calling From: Selected Stories            | Carver         | Short Stories |
| White Noise                                         | DeLillo        | Novel         |
| Cannery Row                                         | Steinbeck      | Novel         |
| Oblivion: Stories                                   | Foster Wallace | Short Stories |
| Consider the Lobster                                | Foster Wallace | Novel         |
| 10% Happier                                         | Harris         | Novel         |
| fake_book                                           | Harris         | Novel         |
| Lincoln In The Bardo                                | Saunders       | Novel         |
+-----------------------------------------------------+----------------+---------------+
-- SAME 
SELECT 
    title, 
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;


-- Bonus : Make this happen
+-----------------------------------------------------+----------------+---------+
| title                                               | author_lname   | COUNT   |
+-----------------------------------------------------+----------------+---------+
| What We Talk About When We Talk About Love: Stories | Carver         | 2 books |
| The Amazing Adventures of Kavalier & Clay           | Chabon         | 1 book  |
| White Noise                                         | DeLillo        | 1 book  |
| A Hologram for the King: A Novel                    | Eggers         | 3 books |
| Oblivion: Stories                                   | Foster Wallace | 2 books |
| Norse Mythology                                     | Gaiman         | 3 books |
| 10% Happier                                         | Harris         | 1 book  |
| fake_book                                           | Harris         | 1 book  |
| The Namesake                                        | Lahiri         | 2 books |
| Lincoln In The Bardo                                | Saunders       | 1 book  |
| Just Kids                                           | Smith          | 1 book  |
| Cannery Row                                         | Steinbeck      | 1 book  |
+-----------------------------------------------------+----------------+---------+ 
--1st
SELECT title, author_lname, COUNT(*) AS 'COUNT'
FROM books
GROUP BY author_lname, author_fname;
--2nd
SELECT title, author_lname, 
	CASE 
		WHEN COUNT(*) = 1 then CONCAT(COUNT(*),' ','book')
		ELSE CONCAT(COUNT(*),' ','books')
	END AS 'COUNT'
FROM books
GROUP BY author_lname, author_fname;

/*-----------------------------------------------------------*/