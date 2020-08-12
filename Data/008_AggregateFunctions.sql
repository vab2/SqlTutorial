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


/*-- COUNT --*/
/*-----------*/

-- To count total number of records
mysql> SELECT COUNT(*) FROM books;
+----------+
| COUNT(*) |
+----------+
|       19 |
+----------+
 
-- Trying some example -> giving any random integer
mysql> SELECT COUNT(89) FROM books;
+-----------+
| COUNT(89) |
+-----------+
|        19 |
+-----------+
-- Trying some example -> Giving column name
mysql> SELECT COUNT(title) FROM books;
+--------------+
| COUNT(title) |
+--------------+
|           19 |
+--------------+
-- Trying some example -> Giving random albhates
mysql> SELECT COUNT(asd) FROM books;
ERROR 1054 (42S22): Unknown column 'asd' in 'field list'

-- Trying some example -> Giving random albhates as string
mysql> SELECT COUNT('asdv') FROM books;
+---------------+
| COUNT('asdv') |
+---------------+
|            19 |
+---------------+

-- This also work the same way
mysql> SELECT COUNT(author_fname) FROM books;
+---------------------+
| COUNT(author_fname) |
+---------------------+
|                  19 |
+---------------------+

-- To select distinct author fname
mysql> SELECT COUNT(DISTINCT author_fname) FROM books;
+------------------------------+
| COUNT(DISTINCT author_fname) |
+------------------------------+
|                           12 |
+------------------------------+

-- To select distinct author lname
mysql> SELECT COUNT(DISTINCT author_lname) FROM books;
+------------------------------+
| COUNT(DISTINCT author_lname) |
+------------------------------+
|                           11 |
+------------------------------+

-- To Select distinct author fname and lname
mysql> SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
+--------------------------------------------+
| COUNT(DISTINCT author_lname, author_fname) |
+--------------------------------------------+
|                                         12 |
+--------------------------------------------+

-- Select title from book where it contains 'the' and count the rows
-- 1st normal query 
mysql> SELECT title FROM books WHERE title LIKE '%the%';
+-------------------------------------------+
| title                                     |
+-------------------------------------------+
| The Namesake                              |
| A Hologram for the King: A Novel          |
| The Circle                                |
| The Amazing Adventures of Kavalier & Clay |
| Consider the Lobster                      |
| Lincoln In The Bardo                      |
+-------------------------------------------+

-- To count total number of titles contains 'the' in it
mysql> SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
+----------+
| COUNT(*) |
+----------+
|        6 |
+----------+



/*-----------------------------------------------------------*/



/*-- GROUP BY --*/
/*--------------*/

-- GROUP BY summarizes or agregates identical data into single rows

-- let print autor fname and lname
mysql> SELECT author_fname, author_lname FROM books;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Jhumpa       | Lahiri         |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Jhumpa       | Lahiri         |
| Dave         | Eggers         |
| Dave         | Eggers         |
| Michael      | Chabon         |
| Patti        | Smith          |
| Dave         | Eggers         |
| Neil         | Gaiman         |
| Raymond      | Carver         |
| Raymond      | Carver         |
| Don          | DeLillo        |
| John         | Steinbeck      |
| David        | Foster Wallace |
| David        | Foster Wallace |
| Dan          | Harris         |
| Freida       | Harris         |
| George       | Saunders       |
+--------------+----------------+

-- Now apply GROUP BY on lname, observe what its doing is for ming group of lname 
-- example: for Harris its for group of 
-- | Dan          | Harris         |
-- | Freida       | Harris         |
-- and pick the first fname
-- Similarly it forms group on every lname, the group can contain 1 or 2 or 3 etc.values 
-- As in our example it forms the group of  Harris and that group conatin value 2 
mysql> mysql> SELECT author_fname, author_lname FROM books GROUP BY author_lname;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Raymond      | Carver         |
| Michael      | Chabon         |
| Don          | DeLillo        |
| Dave         | Eggers         |
| David        | Foster Wallace |
| Neil         | Gaiman         |
| Dan          | Harris         |
| Jhumpa       | Lahiri         |
| George       | Saunders       |
| Patti        | Smith          |
| John         | Steinbeck      |
+--------------+----------------+

-- If we add the COUNT(*) in our query it will show the count of each group it forms
-- The COUNT will always refer to the GROUP BY cloumnName
mysql> SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;
+--------------+----------------+----------+
| author_fname | author_lname   | COUNT(*) |
+--------------+----------------+----------+
| Raymond      | Carver         |        2 |
| Michael      | Chabon         |        1 |
| Don          | DeLillo        |        1 |
| Dave         | Eggers         |        3 |
| David        | Foster Wallace |        2 |
| Neil         | Gaiman         |        3 |
| Dan          | Harris         |        2 |
| Jhumpa       | Lahiri         |        2 |
| George       | Saunders       |        1 |
| Patti        | Smith          |        1 |
| John         | Steinbeck      |        1 |
+--------------+----------------+----------+

-- But the group is form on the basis of lname which is not unique so we will add fname in GROUP BY
mysql> SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+----------+
| author_fname | author_lname   | COUNT(*) |
+--------------+----------------+----------+
| Raymond      | Carver         |        2 |
| Michael      | Chabon         |        1 |
| Don          | DeLillo        |        1 |
| Dave         | Eggers         |        3 |
| David        | Foster Wallace |        2 |
| Neil         | Gaiman         |        3 |
| Dan          | Harris         |        1 |
| Freida       | Harris         |        1 |
| Jhumpa       | Lahiri         |        2 |
| George       | Saunders       |        1 |
| Patti        | Smith          |        1 |
| John         | Steinbeck      |        1 |
+--------------+----------------+----------+

-- Example with year
mysql> SELECT released_year FROM books;
+---------------+
| released_year |
+---------------+
|          2003 |
|          2016 |
|          2001 |
|          1996 |
|          2012 |
|          2013 |
|          2000 |
|          2010 |
|          2001 |
|          2003 |
|          1981 |
|          1989 |
|          1985 |
|          1945 |
|          2004 |
|          2005 |
|          2014 |
|          2001 |
|          2017 |
+---------------+

-- Adding count and GROUP BY on year
mysql> SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
+---------------+----------+
| released_year | COUNT(*) |
+---------------+----------+
|          1945 |        1 |
|          1981 |        1 |
|          1985 |        1 |
|          1989 |        1 |
|          1996 |        1 |
|          2000 |        1 |
|          2001 |        3 |
|          2003 |        2 |
|          2004 |        1 |
|          2005 |        1 |
|          2010 |        1 |
|          2012 |        1 |
|          2013 |        1 |
|          2014 |        1 |
|          2016 |        1 |
|          2017 |        1 |
+---------------+----------+

-- We can use column name which is not present in select statement
mysql> SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY released_year;
+--------------+----------------+----------+
| author_fname | author_lname   | COUNT(*) |
+--------------+----------------+----------+
| John         | Steinbeck      |        1 |
| Raymond      | Carver         |        1 |
| Don          | DeLillo        |        1 |
| Raymond      | Carver         |        1 |
| Jhumpa       | Lahiri         |        1 |
| Michael      | Chabon         |        1 |
| Neil         | Gaiman         |        3 |
| Jhumpa       | Lahiri         |        2 |
| David        | Foster Wallace |        1 |
| David        | Foster Wallace |        1 |
| Patti        | Smith          |        1 |
| Dave         | Eggers         |        1 |
| Dave         | Eggers         |        1 |
| Dan          | Harris         |        1 |
| Neil         | Gaiman         |        1 |
| George       | Saunders       |        1 |
+--------------+----------------+----------+



/*-----------------------------------------------------------*/



/*-- MIN & MAX --*/
/*---------------*/

-- To Select minimum release_year book.
mysql> SELECT MIN(released_year) FROM books;
+--------------------+
| MIN(released_year) |
+--------------------+
|               1945 |
+--------------------+

-- To Seelct min pages from book.
mysql> SELECT MIN(pages) FROM books;
+------------+
| MIN(pages) |
+------------+
|        176 |
+------------+

-- To Select maximum release_year book.
mysql> SELECT MAX(released_year) FROM books;
+--------------------+
| MAX(released_year) |
+--------------------+
|               2017 |
+--------------------+

-- To Seelct max pages from book.
mysql> SELECT MAX(pages) FROM books;
+------------+
| MAX(pages) |
+------------+
|        634 |
+------------+

-- To Select max pages from book and also show the title of that book.
mysql> SELECT MAX(pages), title FROM books;
+------------+--------------+
| MAX(pages) | title        |
+------------+--------------+
|        634 | The Namesake |
+------------+--------------+
-- The above result is incorrect 
-- 634 is the max number of pages which is present in the table
-- but "The Namesake" is not the title of that book
| The Namesake                                        | 291 |
| The Amazing Adventures of Kavalier & Clay           | 634 |
-- The Query didn't work.

-- One Ponetentail Solution 
-- By sung Sub-query
-- First select max number of pages 
-- Second select title for that max number of pages
mysql> SELECT title, pages FROM books  WHERE pages = (SELECT Max(pages) FROM books);
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+
-- Same with Min
mysql> SELECT title, pages FROM books  WHERE pages = (SELECT MIN(pages) FROM books);
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| What We Talk About When We Talk About Love: Stories |   176 |
+-----------------------------------------------------+-------+
-- But this solution is slow 
-- As it run two query 
-- 1st it will run "SELECT Max(pages) FROM books"
-- 2nd it will run "SELECT title, pages FROM books  WHERE pages =..."

-- Better Solution 
-- By using ORDER BY
-- For MIN
mysql> SELECT title, pages FROM books ORDER BY pages ASC LIMIT 1;
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| What We Talk About When We Talk About Love: Stories |   176 |
+-----------------------------------------------------+-------+
-- For MAX
mysql> SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+


/*-----------------------------------------------------------*/



/*-- Using Min and Max with Group By --*/
/*-------------------------------------*/

-- We want to select author and the there first published book
mysql> SELECT author_fname, author_lname, Min(released_year) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+--------------------+
| author_fname | author_lname   | Min(released_year) |
+--------------+----------------+--------------------+
| Raymond      | Carver         |               1981 |
| Michael      | Chabon         |               2000 |
| Don          | DeLillo        |               1985 |
| Dave         | Eggers         |               2001 |
| David        | Foster Wallace |               2004 |
| Neil         | Gaiman         |               2001 |
| Dan          | Harris         |               2014 |
| Freida       | Harris         |               2001 |
| Jhumpa       | Lahiri         |               1996 |
| George       | Saunders       |               2017 |
| Patti        | Smith          |               2010 |
| John         | Steinbeck      |               1945 |
+--------------+----------------+--------------------+


-- We want to select author and the there last published book
mysql> SELECT author_fname, author_lname, Max(released_year) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+--------------------+
| author_fname | author_lname   | Max(released_year) |
+--------------+----------------+--------------------+
| Raymond      | Carver         |               1989 |
| Michael      | Chabon         |               2000 |
| Don          | DeLillo        |               1985 |
| Dave         | Eggers         |               2013 |
| David        | Foster Wallace |               2005 |
| Neil         | Gaiman         |               2016 |
| Dan          | Harris         |               2014 |
| Freida       | Harris         |               2001 |
| Jhumpa       | Lahiri         |               2003 |
| George       | Saunders       |               2017 |
| Patti        | Smith          |               2010 |
| John         | Steinbeck      |               1945 |
+--------------+----------------+--------------------+


-- Question:: Waht if we also want to print the title of the book
-- It will give me incorrect answer
mysql> SELECT author_fname, author_lname,title, Max(released_year) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+-----------------------------------------------------+--------------------+
| author_fname | author_lname   | title                                               | Max(released_year) |
+--------------+----------------+-----------------------------------------------------+--------------------+
| Raymond      | Carver         | What We Talk About When We Talk About Love: Stories |               1989 |
| Michael      | Chabon         | The Amazing Adventures of Kavalier & Clay           |               2000 |
| Don          | DeLillo        | White Noise                                         |               1985 |
| Dave         | Eggers         | A Hologram for the King: A Novel                    |               2013 |
| David        | Foster Wallace | Oblivion: Stories                                   |               2005 |
| Neil         | Gaiman         | Norse Mythology                                     |               2016 |
| Dan          | Harris         | 10% Happier                                         |               2014 |
| Freida       | Harris         | fake_book                                           |               2001 |
| Jhumpa       | Lahiri         | The Namesake                                        |               2003 |
| George       | Saunders       | Lincoln In The Bardo                                |               2017 |
| Patti        | Smith          | Just Kids                                           |               2010 |
| John         | Steinbeck      | Cannery Row                                         |               1945 |
+--------------+----------------+-----------------------------------------------------+--------------------+
-- Notice title of the book is incorrect
|What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |
|Where I m Calling From: Selected Stories            | Raymond      | Carver         |          1989 |
-- Solution (Little bit complicated)
SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(title) AS 'title',
    MAX(pages)
FROM books
GROUP BY
    author_lname,
    author_fname
ORDER BY MAX(pages)
DESC;

or

SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(title) AS 'title',
    MAX(pages)
FROM books
GROUP BY
    author_lname,
    author_fname
ORDER BY 3
DESC;


/*-----------------------------------------------------------*/



/*-- SUM --*/
/*---------*/


-- To Sum all the pages available in a table
mysql> SELECT SUM(pages) FROM books;
+------------+
| SUM(pages) |
+------------+
|       6623 |
+------------+

-- To Sum all the years available in a table
mysql> SELECT SUM(released_year) FROM books;
+--------------------+
| SUM(released_year) |
+--------------------+
|              37996 |
+--------------------+

mysql> SELECT author_fname,author_lname,Sum(pages) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+------------+
| author_fname | author_lname   | Sum(pages) |
+--------------+----------------+------------+
| Raymond      | Carver         |        702 |
| Michael      | Chabon         |        634 |
| Don          | DeLillo        |        320 |
| Dave         | Eggers         |       1293 |
| David        | Foster Wallace |        672 |
| Neil         | Gaiman         |        977 |
| Dan          | Harris         |        256 |
| Freida       | Harris         |        428 |
| Jhumpa       | Lahiri         |        489 |
| George       | Saunders       |        367 |
| Patti        | Smith          |        304 |
| John         | Steinbeck      |        181 |
+--------------+----------------+------------+


-- Try to Sum string value it will return '0'
mysql> SELECT SUM(author_lname) FROM books;
+-------------------+
| SUM(author_lname) |
+-------------------+
|                 0 |
+-------------------+

/*-----------------------------------------------------------*/



/*-- AVG --*/
/*---------*/

-- To Select AVG pages in table
mysql> SELECT AVG(pages) FROM books;
+------------+
| AVG(pages) |
+------------+
|   348.5789 |
+------------+

-- To Select AVG stock quantity by year 
mysql> SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;
+---------------+---------------------+
| released_year | AVG(stock_quantity) |
+---------------+---------------------+
|          1945 |             95.0000 |
|          1981 |             23.0000 |
|          1985 |             49.0000 |
|          1989 |             12.0000 |
|          1996 |             97.0000 |
|          2000 |             68.0000 |
|          2001 |            134.3333 |
|          2003 |             66.0000 |
|          2004 |            172.0000 |
|          2005 |             92.0000 |
|          2010 |             55.0000 |
|          2012 |            154.0000 |
|          2013 |             26.0000 |
|          2014 |             29.0000 |
|          2016 |             43.0000 |
|          2017 |           1000.0000 |
+---------------+---------------------+

-- To select AVG pages by each author 
mysql> SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+------------+
| author_fname | author_lname   | AVG(pages) |
+--------------+----------------+------------+
| Raymond      | Carver         |   351.0000 |
| Michael      | Chabon         |   634.0000 |
| Don          | DeLillo        |   320.0000 |
| Dave         | Eggers         |   431.0000 |
| David        | Foster Wallace |   336.0000 |
| Neil         | Gaiman         |   325.6667 |
| Dan          | Harris         |   256.0000 |
| Freida       | Harris         |   428.0000 |
| Jhumpa       | Lahiri         |   244.5000 |
| George       | Saunders       |   367.0000 |
| Patti        | Smith          |   304.0000 |
| John         | Steinbeck      |   181.0000 |
+--------------+----------------+------------+



/*-----------------------------------------------------------*/



/*-- EXERCISE --*/
/*--------------*/


-- To Print the number of book in a database
mysql> SELECT COUNT(*) AS 'Number of book' FROM books;
+----------------+
| Number of book |
+----------------+
|             19 |
+----------------+

-- Print how may books release in each year
mysql> SELECT released_year, COUNT(*) from books GROUP BY released_year;
+---------------+----------+
| released_year | COUNT(*) |
+---------------+----------+
|          1945 |        1 |
|          1981 |        1 |
|          1985 |        1 |
|          1989 |        1 |
|          1996 |        1 |
|          2000 |        1 |
|          2001 |        3 |
|          2003 |        2 |
|          2004 |        1 |
|          2005 |        1 |
|          2010 |        1 |
|          2012 |        1 |
|          2013 |        1 |
|          2014 |        1 |
|          2016 |        1 |
|          2017 |        1 |
+---------------+----------+

-- Print out the total number of books in stocks 
mysql> SELECT SUM(stock_quantity) FROM books;
+---------------------+
| SUM(stock_quantity) |
+---------------------+
|                2450 |
+---------------------+

-- Print out the total number of books in stocks by year
mysql> SELECT released_year, SUM(stock_quantity) FROM books GROUP BY released_year;
+---------------+---------------------+
| released_year | SUM(stock_quantity) |
+---------------+---------------------+
|          1945 |                  95 |
|          1981 |                  23 |
|          1985 |                  49 |
|          1989 |                  12 |
|          1996 |                  97 |
|          2000 |                  68 |
|          2001 |                 403 |
|          2003 |                 132 |
|          2004 |                 172 |
|          2005 |                  92 |
|          2010 |                  55 |
|          2012 |                 154 |
|          2013 |                  26 |
|          2014 |                  29 |
|          2016 |                  43 |
|          2017 |                1000 |
+---------------+---------------------+

-- Find the average release year of each author 
mysql> SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+--------------------+
| author_fname | author_lname   | AVG(released_year) |
+--------------+----------------+--------------------+
| Raymond      | Carver         |          1985.0000 |
| Michael      | Chabon         |          2000.0000 |
| Don          | DeLillo        |          1985.0000 |
| Dave         | Eggers         |          2008.6667 |
| David        | Foster Wallace |          2004.5000 |
| Neil         | Gaiman         |          2006.6667 |
| Dan          | Harris         |          2014.0000 |
| Freida       | Harris         |          2001.0000 |
| Jhumpa       | Lahiri         |          1999.5000 |
| George       | Saunders       |          2017.0000 |
| Patti        | Smith          |          2010.0000 |
| John         | Steinbeck      |          1945.0000 |
+--------------+----------------+--------------------+

-- Find the average stock_quantity of each author
mysql> SELECT author_fname, author_lname, AVG(stock_quantity) FROM books GROUP BY author_lname, author_fname;
+--------------+----------------+---------------------+
| author_fname | author_lname   | AVG(stock_quantity) |
+--------------+----------------+---------------------+
| Raymond      | Carver         |             17.5000 |
| Michael      | Chabon         |             68.0000 |
| Don          | DeLillo        |             49.0000 |
| Dave         | Eggers         |             94.6667 |
| David        | Foster Wallace |            132.0000 |
| Neil         | Gaiman         |             51.6667 |
| Dan          | Harris         |             29.0000 |
| Freida       | Harris         |            287.0000 |
| Jhumpa       | Lahiri         |             64.5000 |
| George       | Saunders       |           1000.0000 |
| Patti        | Smith          |             55.0000 |
| John         | Steinbeck      |             95.0000 |
+--------------+----------------+---------------------+

-- Find the Full name of author who wrote the longest book
mysql> SELECT CONCAT( author_fname," ",author_lname), pages FROM books ORDER BY pages DESC LIMIT 1;
+----------------------------------------+-------+
| CONCAT( author_fname," ",author_lname) | pages |
+----------------------------------------+-------+
| Michael Chabon                         |   634 |
+----------------------------------------+-------+

-- Print [Year, books, avg pages]
mysql> SELECT released_year AS Year, COUNT(*) AS '# pages', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year;
+------+---------+-----------+
| Year | # pages | avg pages |
+------+---------+-----------+
| 1945 |       1 |  181.0000 |
| 1981 |       1 |  176.0000 |
| 1985 |       1 |  320.0000 |
| 1989 |       1 |  526.0000 |
| 1996 |       1 |  198.0000 |
| 2000 |       1 |  634.0000 |
| 2001 |       3 |  443.3333 |
| 2003 |       2 |  249.5000 |
| 2004 |       1 |  329.0000 |
| 2005 |       1 |  343.0000 |
| 2010 |       1 |  304.0000 |
| 2012 |       1 |  352.0000 |
| 2013 |       1 |  504.0000 |
| 2014 |       1 |  256.0000 |
| 2016 |       1 |  304.0000 |
| 2017 |       1 |  367.0000 |
+------+---------+-----------+