/*-- Selections --*/
/*----------------*/

-- Insert new data in books table
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
 
-- Table values
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
|      12 | Where Im Calling From: Selected Stories             | Raymond      | Carver         |          1989 |             12 |   526 |
|      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
|      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
|      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
|      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
|      17 | 10% Happier                                         | Dan          | Harris         |          2014 |             29 |   256 |
|      18 | fake_book                                           | Freida       | Harris         |          2001 |            287 |   428 |
|      19 | Lincoln In The Bardo                                | George       | Saunders       |          2017 |           1000 |   367 |
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+

-- Select only title
SELECT title FROM books;
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
| Lincoln In The Bardo                                |
+-----------------------------------------------------+

/*-----------------------------------------------------------*/



/*-- DISTINCT --*/
/*--------------*/

/*
Note : DISTICT is used only after SELECT
*/

-- Select only autor name; observe repeted values
mysql> SELECT author_lname FROM books;
+----------------+
| author_lname   |
+----------------+
| Lahiri         |
| Gaiman         |
| Gaiman         |
| Lahiri         |
| Eggers         |
| Eggers         |
| Chabon         |
| Smith          |
| Eggers         |
| Gaiman         |
| Carver         |
| Carver         |
| DeLillo        |
| Steinbeck      |
| Foster Wallace |
| Foster Wallace |
| Harris         |
| Harris         |
| Saunders       |
+----------------+

-- Select with DISTINCT; no repeted value
mysql> SELECT DISTINCT author_lname FROM books;
+----------------+
| author_lname   |
+----------------+
| Lahiri         |
| Gaiman         |
| Eggers         |
| Chabon         |
| Smith          |
| Carver         |
| DeLillo        |
| Steinbeck      |
| Foster Wallace |
| Harris         |
| Saunders       |
+----------------+

-- Select fname and lname; observe repeted values
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

-- Select DISTINCT with CONCAT fname and laname; observe no repeted values
-- Dan Harris and Freida Harris, appear sepratly
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
+----------------------------------------+
| CONCAT(author_fname,' ', author_lname) |
+----------------------------------------+
| Jhumpa Lahiri                          |
| Neil Gaiman                            |
| Dave Eggers                            |
| Michael Chabon                         |
| Patti Smith                            |
| Raymond Carver                         |
| Don DeLillo                            |
| John Steinbeck                         |
| David Foster Wallace                   |
| Dan Harris                             |
| Freida Harris                          |
| George Saunders                        |
+----------------------------------------+

-- Select DISTINCT with CONCAT lname and faname; observe no repeted values
-- Harris Dan & Harris Freida, appear sepratly
SELECT DISTINCT CONCAT(author_lname,' ', author_fname) FROM books;
+----------------------------------------+
| CONCAT(author_lname,' ', author_fname) |
+----------------------------------------+
| Lahiri Jhumpa                          |
| Gaiman Neil                            |
| Eggers Dave                            |
| Chabon Michael                         |
| Smith Patti                            |
| Carver Raymond                         |
| DeLillo Don                            |
| Steinbeck John                         |
| Foster Wallace David                   |
| Harris Dan                             |
| Harris Freida                          |
| Saunders George                        |
+----------------------------------------+

-- Using DISTINCT without CONCAT -- first parameter is fname;
-- Observe Harris is repiting in lname as it has different fname
SELECT DISTINCT author_fname, author_lname FROM books;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Jhumpa       | Lahiri         |
| Neil         | Gaiman         |
| Dave         | Eggers         |
| Michael      | Chabon         |
| Patti        | Smith          |
| Raymond      | Carver         |
| Don          | DeLillo        |
| John         | Steinbeck      |
| David        | Foster Wallace |
| Dan          | Harris         |
| Freida       | Harris         |
| George       | Saunders       |
+--------------+----------------+

-- Using DISTINCT without CONCAT -- first parameter is lname;
-- Observe Harris is repiting in lname as it has different fname
-- It gives the same result, conclution oder of column does not matter 
mysql> SELECT DISTINCT author_lname, author_fname FROM books;                                                       
+----------------+--------------+
| author_lname   | author_fname |
+----------------+--------------+
| Lahiri         | Jhumpa       |
| Gaiman         | Neil         |
| Eggers         | Dave         |
| Chabon         | Michael      |
| Smith          | Patti        |
| Carver         | Raymond      |
| DeLillo        | Don          |
| Steinbeck      | John         |
| Foster Wallace | David        |
| Harris         | Dan          |
| Harris         | Freida       |
| Saunders       | George       |
+----------------+--------------+


/*-----------------------------------------------------------*/



/*-- ORDER BY --*/
/*--------------*/

/*

Note : When we use ORDER By it is ascending by default.

*/

-- Select lname and sort in ascending order by lname
-- It is ascending order by default
mysql> SELECT author_lname FROM books ORDER BY author_lname;
+----------------+
| author_lname   |
+----------------+
| Carver         |
| Carver         |
| Chabon         |
| DeLillo        |
| Eggers         |
| Eggers         |
| Eggers         |
| Foster Wallace |
| Foster Wallace |
| Gaiman         |
| Gaiman         |
| Gaiman         |
| Harris         |
| Harris         |
| Lahiri         |
| Lahiri         |
| Saunders       |
| Smith          |
| Steinbeck      |
+----------------+


-- Select lname and ort it by lname in decending order
mysql> SELECT author_lname FROM books ORDER BY author_lname DESC;
+----------------+
| author_lname   |
+----------------+
| Steinbeck      |
| Smith          |
| Saunders       |
| Lahiri         |
| Lahiri         |
| Harris         |
| Harris         |
| Gaiman         |
| Gaiman         |
| Gaiman         |
| Foster Wallace |
| Foster Wallace |
| Eggers         |
| Eggers         |
| Eggers         |
| DeLillo        |
| Chabon         |
| Carver         |
| Carver         |
+----------------+

-- Select title and sort in decending order by title 
mysql> SELECT title FROM books ORDER BY title DESC;                                                                
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| White Noise                                         |
| Where I m Calling From: Selected Stories            |
| What We Talk About When We Talk About Love: Stories |
| The Namesake                                        |
| The Circle                                          |
| The Amazing Adventures of Kavalier & Clay           |
| Oblivion: Stories                                   |
| Norse Mythology                                     |
| Lincoln In The Bardo                                |
| Just Kids                                           |
| Interpreter of Maladies                             |
| fake_book                                           |
| Coraline                                            |
| Consider the Lobster                                |
| Cannery Row                                         |
| American Gods                                       |
| A Hologram for the King: A Novel                    |
| A Heartbreaking Work of Staggering Genius           |
| 10% Happier                                         |
+-----------------------------------------------------+

-- Select released_year and sort in ascending order by released_year
mysql> SELECT released_year FROM books ORDER BY released_year ASC;
+---------------+
| released_year |
+---------------+
|          1945 |
|          1981 |
|          1985 |
|          1989 |
|          1996 |
|          2000 |
|          2001 |
|          2001 |
|          2001 |
|          2003 |
|          2003 |
|          2004 |
|          2005 |
|          2010 |
|          2012 |
|          2013 |
|          2014 |
|          2016 |
|          2017 |
+---------------+

-- released_year is present in select and order by clause
mysql> SELECT title, released_year, pages FROM books ORDER BY released_year;
+-----------------------------------------------------+---------------+-------+
| title                                               | released_year | pages |
+-----------------------------------------------------+---------------+-------+
| Cannery Row                                         |          1945 |   181 |
| What We Talk About When We Talk About Love: Stories |          1981 |   176 |
| White Noise                                         |          1985 |   320 |
| Where I m Calling From: Selected Stories            |          1989 |   526 |
| Interpreter of Maladies                             |          1996 |   198 |
| The Amazing Adventures of Kavalier & Clay           |          2000 |   634 |
| American Gods                                       |          2001 |   465 |
| fake_book                                           |          2001 |   428 |
| A Heartbreaking Work of Staggering Genius           |          2001 |   437 |
| The Namesake                                        |          2003 |   291 |
| Coraline                                            |          2003 |   208 |
| Oblivion: Stories                                   |          2004 |   329 |
| Consider the Lobster                                |          2005 |   343 |
| Just Kids                                           |          2010 |   304 |
| A Hologram for the King: A Novel                    |          2012 |   352 |
| The Circle                                          |          2013 |   504 |
| 10% Happier                                         |          2014 |   256 |
| Norse Mythology                                     |          2016 |   304 |
| Lincoln In The Bardo                                |          2017 |   367 |
+-----------------------------------------------------+---------------+-------+

-- released_year is not present in select but present in order by clause
mysql> SELECT title, pages FROM books ORDER BY released_year;
+-----------------------------------------------------+-------+
| title                                               | pages |
+-----------------------------------------------------+-------+
| Cannery Row                                         |   181 |
| What We Talk About When We Talk About Love: Stories |   176 |
| White Noise                                         |   320 |
| Where I m Calling From: Selected Stories            |   526 |
| Interpreter of Maladies                             |   198 |
| The Amazing Adventures of Kavalier & Clay           |   634 |
| American Gods                                       |   465 |
| fake_book                                           |   428 |
| A Heartbreaking Work of Staggering Genius           |   437 |
| The Namesake                                        |   291 |
| Coraline                                            |   208 |
| Oblivion: Stories                                   |   329 |
| Consider the Lobster                                |   343 |
| Just Kids                                           |   304 |
| A Hologram for the King: A Novel                    |   352 |
| The Circle                                          |   504 |
| 10% Happier                                         |   256 |
| Norse Mythology                                     |   304 |
| Lincoln In The Bardo                                |   367 |
+-----------------------------------------------------+-------+

-- We can also specify numeric value in ORDER BY Clause
-- the number represent the index of SELECT clause column
-- in this example it is author_fname
-- the bleow table is sorted by author_fname
mysql> SELECT title, author_fname, author_lname  FROM books ORDER BY 2;
+-----------------------------------------------------+--------------+----------------+
| title                                               | author_fname | author_lname   |
+-----------------------------------------------------+--------------+----------------+
| 10% Happier                                         | Dan          | Harris         |
| A Hologram for the King: A Novel                    | Dave         | Eggers         |
| The Circle                                          | Dave         | Eggers         |
| A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |
| Consider the Lobster                                | David        | Foster Wallace |
| Oblivion: Stories                                   | David        | Foster Wallace |
| White Noise                                         | Don          | DeLillo        |
| fake_book                                           | Freida       | Harris         |
| Lincoln In The Bardo                                | George       | Saunders       |
| The Namesake                                        | Jhumpa       | Lahiri         |
| Interpreter of Maladies                             | Jhumpa       | Lahiri         |
| Cannery Row                                         | John         | Steinbeck      |
| The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |
| American Gods                                       | Neil         | Gaiman         |
| Norse Mythology                                     | Neil         | Gaiman         |
| Coraline                                            | Neil         | Gaiman         |
| Just Kids                                           | Patti        | Smith          |
| What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |
| Where I m Calling From: Selected Stories            | Raymond      | Carver         |
+-----------------------------------------------------+--------------+----------------+

-- When we try to provide an index which is not present in select clause it will give error
mysql> SELECT title, author_fname, author_lname  FROM books ORDER BY 7;
ERROR 1054 (42S22): Unknown column '7' in 'order clause'


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

-- Select author_fname & author_lname, ORDER BY author_fname
mysql> SELECT author_fname, author_lname FROM books ORDER BY author_fname;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Dan          | Harris         |
| Dave         | Eggers         |
| Dave         | Eggers         |
| Dave         | Eggers         |
| David        | Foster Wallace |
| David        | Foster Wallace |
| Don          | DeLillo        |
| Freida       | Harris         |
| George       | Saunders       |
| Jhumpa       | Lahiri         |
| Jhumpa       | Lahiri         |
| John         | Steinbeck      |
| Michael      | Chabon         |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Patti        | Smith          |
| Raymond      | Carver         |
| Raymond      | Carver         |
+--------------+----------------+

-- Select author_fname & author_lname, ORDER BY author_lname
-- it sort it on author_lname but for Harris it does not work with last name ( fname F comes before D) 
mysql> SELECT author_fname, author_lname FROM books ORDER BY author_lname;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Raymond      | Carver         |
| Raymond      | Carver         |
| Michael      | Chabon         |
| Don          | DeLillo        |
| Dave         | Eggers         |
| Dave         | Eggers         |
| Dave         | Eggers         |
| David        | Foster Wallace |
| David        | Foster Wallace |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Freida       | Harris         |
| Dan          | Harris         |
| Jhumpa       | Lahiri         |
| Jhumpa       | Lahiri         |
| George       | Saunders       |
| Patti        | Smith          |
| John         | Steinbeck      |
+--------------+----------------+

-- The above problem can be solve as 
-- notice for Harris first name D is coming befor F
mysql> SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;
+--------------+----------------+
| author_fname | author_lname   |
+--------------+----------------+
| Raymond      | Carver         |
| Raymond      | Carver         |
| Michael      | Chabon         |
| Don          | DeLillo        |
| Dave         | Eggers         |
| Dave         | Eggers         |
| Dave         | Eggers         |
| David        | Foster Wallace |
| David        | Foster Wallace |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Neil         | Gaiman         |
| Dan          | Harris         |
| Freida       | Harris         |
| Jhumpa       | Lahiri         |
| Jhumpa       | Lahiri         |
| George       | Saunders       |
| Patti        | Smith          |
| John         | Steinbeck      |
+--------------+----------------+

/*-----------------------------------------------------------*/



/*-- LIMIT --*/
/*-----------*/

-- LIMIT topThisIndex
-- it will show only top 3 rows
mysql> SELECT title FROM books LIMIT 3;                                                                             
+-----------------+
| title           |
+-----------------+
| The Namesake    |
| Norse Mythology |
| American Gods   |
+-----------------+

-- LIMIT index, toThisIndex
-- Below query will show only top 5 rows
mysql> SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 5;

-- We can select the range also like in below example
-- Here 0 represent row index and 5 represent count after the index
mysql> SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 0,5; 
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Lincoln In The Bardo             |          2017 |
| Norse Mythology                  |          2016 |
| 10% Happier                      |          2014 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+

-- Some Examples

mysql> SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 0,1;
+----------------------+---------------+
| title                | released_year |
+----------------------+---------------+
| Lincoln In The Bardo |          2017 |
+----------------------+---------------+

mysql> SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 1,1;
+-----------------+---------------+
| title           | released_year |
+-----------------+---------------+
| Norse Mythology |          2016 |
+-----------------+---------------+

mysql> SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 2,1;
+-------------+---------------+
| title       | released_year |
+-------------+---------------+
| 10% Happier |          2014 |
+-------------+---------------+

-- To select all books after an index
mysql> SELECT title FROM books LIMIT 5, 123219476457;
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
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
| Lincoln In The Bardo                                |
+-----------------------------------------------------+



/*-----------------------------------------------------------*/



/*-- LIKE --*/
/*-----------*/

-- Select author fname where fname contain "da"
mysql> SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
+-------------------------------------------+--------------+
| title                                     | author_fname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Dave         |
| The Circle                                | Dave         |
| A Heartbreaking Work of Staggering Genius | Dave         |
| Oblivion: Stories                         | David        |
| Consider the Lobster                      | David        |
| 10% Happier                               | Dan          |
| fake_book                                 | Freida       |
+-------------------------------------------+--------------+

-- Select author fname where fname ends with "da"
mysql> SELECT title, author_fname FROM books WHERE author_fname LIKE '%da';
+-----------+--------------+
| title     | author_fname |
+-----------+--------------+
| fake_book | Freida       |
+-----------+--------------+

-- Select author fname where fname starts with "da"
mysql> SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
+-------------------------------------------+--------------+
| title                                     | author_fname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Dave         |
| The Circle                                | Dave         |
| A Heartbreaking Work of Staggering Genius | Dave         |
| Oblivion: Stories                         | David        |
| Consider the Lobster                      | David        |
| 10% Happier                               | Dan          |
+-------------------------------------------+--------------+

/*-----------------------------------------------------------*/



/*-- WILDCARD --*/
/*--------------*/

-- "_" represent 1 charcter

-- Normal query
mysql> SELECT title, stock_quantity FROM books;
+-----------------------------------------------------+----------------+
| title                                               | stock_quantity |
+-----------------------------------------------------+----------------+
| The Namesake                                        |             32 |
| Norse Mythology                                     |             43 |
| American Gods                                       |             12 |
| Interpreter of Maladies                             |             97 |
| A Hologram for the King: A Novel                    |            154 |
| The Circle                                          |             26 |
| The Amazing Adventures of Kavalier & Clay           |             68 |
| Just Kids                                           |             55 |
| A Heartbreaking Work of Staggering Genius           |            104 |
| Coraline                                            |            100 |
| What We Talk About When We Talk About Love: Stories |             23 |
| Where I m Calling From: Selected Stories            |             12 |
| White Noise                                         |             49 |
| Cannery Row                                         |             95 |
| Oblivion: Stories                                   |            172 |
| Consider the Lobster                                |             92 |
| 10% Happier                                         |             29 |
| fake_book                                           |            287 |
| Lincoln In The Bardo                                |           1000 |
+-----------------------------------------------------+----------------+

-- Select stock quantity where it of 4 digits 
mysql> SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';                                 
+----------------------+----------------+
| title                | stock_quantity |
+----------------------+----------------+
| Lincoln In The Bardo |           1000 |
+----------------------+----------------+

-- Select stock quantity where it of 3 digits 
mysql> SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '___';
+-------------------------------------------+----------------+
| title                                     | stock_quantity |
+-------------------------------------------+----------------+
| A Hologram for the King: A Novel          |            154 |
| A Heartbreaking Work of Staggering Genius |            104 |
| Coraline                                  |            100 |
| Oblivion: Stories                         |            172 |
| fake_book                                 |            287 |
+-------------------------------------------+----------------+

-- To search a special caracter in LIKE use "\specialCharacter" backward slach eg: '\%';
-- Select a title where title has '%' symbol
mysql> SELECT title, stock_quantity FROM books WHERE title LIKE '%\%%';                                                 
+-------------+----------------+
| title       | stock_quantity |
+-------------+----------------+
| 10% Happier |             29 |
+-------------+----------------+

-- Select a title where title has '_' symbol
mysql> SELECT title, stock_quantity FROM books WHERE title LIKE '%\_%';                                       
+-----------+----------------+
| title     | stock_quantity |
+-----------+----------------+
| fake_book |            287 |
+-----------+----------------+

-- Select where author fname contans 'da' and two character at the end of the string  
mysql> SELECT title, author_fname FROM books WHERE author_fname LIKE '%da__';
+-------------------------------------------+--------------+
| title                                     | author_fname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Dave         |
| The Circle                                | Dave         |
| A Heartbreaking Work of Staggering Genius | Dave         |
+-------------------------------------------+--------------+


/*-----------------------------------------------------------*/



/*-- EXERCISE --*/
/*--------------*/

-- Select where title has 'stories' in it 
mysql> SELECT title FROM books WHERE title LIKE '%stories%';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| What We Talk About When We Talk About Love: Stories |
| Where I m Calling From: Selected Stories            |
| Oblivion: Stories                                   |
+-----------------------------------------------------+

-- Select where you have to limit the output in decending by order to top one row
mysql> SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
mysql> SELECT title, pages FROM books ORDER BY pages DESC LIMIT 0,1;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+

-- Select where you have to limit the output in decending by order to top three row
mysql> SELECT CONCAT(title,' - ',released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;
mysql> SELECT CONCAT(title,' - ',released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 0,3;
+-----------------------------+
| summary                     |
+-----------------------------+
| Lincoln In The Bardo - 2017 |
| Norse Mythology - 2016      |
| 10% Happier - 2014          |
+-----------------------------+

-- Select where auther laname contain space
mysql> SELECT title, author_lname FROM books WHERE author_lname LIKE '%\ %';
mysql> SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';                                           
+----------------------+----------------+
| title                | author_lname   |
+----------------------+----------------+
| Oblivion: Stories    | Foster Wallace |
| Consider the Lobster | Foster Wallace |
+----------------------+----------------+

-- Select where you have to order by ascending and select top 3 rows
mysql> SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;                          
+-----------------------------------------------------+---------------+----------------+
| title                                               | released_year | stock_quantity |
+-----------------------------------------------------+---------------+----------------+
| American Gods                                       |          2001 |             12 |
| Where I m Calling From: Selected Stories            |          1989 |             12 |
| What We Talk About When We Talk About Love: Stories |          1981 |             23 |
+-----------------------------------------------------+---------------+----------------+

-- Select and order by auther lname first and then after title
mysql> SELECT title, author_lname FROM books ORDER BY author_lname, title;
mysql> SELECT title, author_lname FROM books ORDER BY 2,1;
+-----------------------------------------------------+----------------+
| title                                               | author_lname   |
+-----------------------------------------------------+----------------+
| What We Talk About When We Talk About Love: Stories | Carver         |
| Where I m Calling From: Selected Stories            | Carver         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         |
| White Noise                                         | DeLillo        |
| A Heartbreaking Work of Staggering Genius           | Eggers         |
| A Hologram for the King: A Novel                    | Eggers         |
| The Circle                                          | Eggers         |
| Consider the Lobster                                | Foster Wallace |
| Oblivion: Stories                                   | Foster Wallace |
| American Gods                                       | Gaiman         |
| Coraline                                            | Gaiman         |
| Norse Mythology                                     | Gaiman         |
| 10% Happier                                         | Harris         |
| fake_book                                           | Harris         |
| Interpreter of Maladies                             | Lahiri         |
| The Namesake                                        | Lahiri         |
| Lincoln In The Bardo                                | Saunders       |
| Just Kids                                           | Smith          |
| Cannery Row                                         | Steinbeck      |
+-----------------------------------------------------+----------------+

-- Displya output in ascending order of auther lname and output mut be as "MY FAVORITE AUTHOR IS 'fname lname'!" under 'yell' column
mysql> SELECT CONCAT('MY FAVORITE AUTHOR IS ',author_fname,' ',author_lname,'!') AS 'yell' FROM books ORDER BY author_lname;
+---------------------------------------------+
| yell                                        |
+---------------------------------------------+
| MY FAVORITE AUTHOR IS Raymond Carver!       |
| MY FAVORITE AUTHOR IS Raymond Carver!       |
| MY FAVORITE AUTHOR IS Michael Chabon!       |
| MY FAVORITE AUTHOR IS Don DeLillo!          |
| MY FAVORITE AUTHOR IS Dave Eggers!          |
| MY FAVORITE AUTHOR IS Dave Eggers!          |
| MY FAVORITE AUTHOR IS Dave Eggers!          |
| MY FAVORITE AUTHOR IS David Foster Wallace! |
| MY FAVORITE AUTHOR IS David Foster Wallace! |
| MY FAVORITE AUTHOR IS Neil Gaiman!          |
| MY FAVORITE AUTHOR IS Neil Gaiman!          |
| MY FAVORITE AUTHOR IS Neil Gaiman!          |
| MY FAVORITE AUTHOR IS Freida Harris!        |
| MY FAVORITE AUTHOR IS Dan Harris!           |
| MY FAVORITE AUTHOR IS Jhumpa Lahiri!        |
| MY FAVORITE AUTHOR IS Jhumpa Lahiri!        |
| MY FAVORITE AUTHOR IS George Saunders!      |
| MY FAVORITE AUTHOR IS Patti Smith!          |
| MY FAVORITE AUTHOR IS John Steinbeck!       |
+---------------------------------------------+














