INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
 
 
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




DISTINCT
==================

DISTICT is used only after SELECT

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


SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
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
SAME



ORDER BY
================

Ascending by default.

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
Sort  by lastname first then by first name.

LIMIT
==========

mysql> SELECT title FROM books LIMIT 3;                                                                             
+-----------------+
| title           |
+-----------------+
| The Namesake    |
| Norse Mythology |
| American Gods   |
+-----------------+

mysql> SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 5;
mysql> SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 0,5; 
--Here 0 represent row index and 5 represent count after the index
+----------------------------------+---------------+
| title                            | released_year |
+----------------------------------+---------------+
| Lincoln In The Bardo             |          2017 |
| Norse Mythology                  |          2016 |
| 10% Happier                      |          2014 |
| The Circle                       |          2013 |
| A Hologram for the King: A Novel |          2012 |
+----------------------------------+---------------+

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

mysql> SELECT title FROM books LIMIT 5, 123219476457;--To select all books
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



LIKE
===========

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

mysql> SELECT title, author_fname FROM books WHERE author_fname LIKE '%da';
+-----------+--------------+
| title     | author_fname |
+-----------+--------------+
| fake_book | Freida       |
+-----------+--------------+

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

WILDCARD
========
_ -> 1 charcter

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

mysql> SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____'; --4                                 
+----------------------+----------------+
| title                | stock_quantity |
+----------------------+----------------+
| Lincoln In The Bardo |           1000 |
+----------------------+----------------+

mysql> SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '___'; --3
+-------------------------------------------+----------------+
| title                                     | stock_quantity |
+-------------------------------------------+----------------+
| A Hologram for the King: A Novel          |            154 |
| A Heartbreaking Work of Staggering Genius |            104 |
| Coraline                                  |            100 |
| Oblivion: Stories                         |            172 |
| fake_book                                 |            287 |
+-------------------------------------------+----------------+

To search a special caracter in LIKE use "\-backward slach";

mysql> SELECT title, stock_quantity FROM books WHERE title LIKE '%\%%';                                                 
+-------------+----------------+
| title       | stock_quantity |
+-------------+----------------+
| 10% Happier |             29 |
+-------------+----------------+

mysql> SELECT title, stock_quantity FROM books WHERE title LIKE '%\_%';                                       
+-----------+----------------+
| title     | stock_quantity |
+-----------+----------------+
| fake_book |            287 |
+-----------+----------------+

mysql> SELECT title, author_fname FROM books WHERE author_fname LIKE '%da__';
+-------------------------------------------+--------------+
| title                                     | author_fname |
+-------------------------------------------+--------------+
| A Hologram for the King: A Novel          | Dave         |
| The Circle                                | Dave         |
| A Heartbreaking Work of Staggering Genius | Dave         |
+-------------------------------------------+--------------+



EXERCISE---
========================

mysql> SELECT title FROM books WHERE title LIKE '%stories%';
+-----------------------------------------------------+
| title                                               |
+-----------------------------------------------------+
| What We Talk About When We Talk About Love: Stories |
| Where I m Calling From: Selected Stories            |
| Oblivion: Stories                                   |
+-----------------------------------------------------+

mysql> SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
mysql> SELECT title, pages FROM books ORDER BY pages DESC LIMIT 0,1;
+-------------------------------------------+-------+
| title                                     | pages |
+-------------------------------------------+-------+
| The Amazing Adventures of Kavalier & Clay |   634 |
+-------------------------------------------+-------+

mysql> SELECT CONCAT(title,' - ',released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 0,3;
+-----------------------------+
| summary                     |
+-----------------------------+
| Lincoln In The Bardo - 2017 |
| Norse Mythology - 2016      |
| 10% Happier - 2014          |
+-----------------------------+

mysql> SELECT title, author_lname FROM books WHERE author_lname LIKE '%\ %';
mysql> SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';                                           
+----------------------+----------------+
| title                | author_lname   |
+----------------------+----------------+
| Oblivion: Stories    | Foster Wallace |
| Consider the Lobster | Foster Wallace |
+----------------------+----------------+

mysql> SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;                          
+-----------------------------------------------------+---------------+----------------+
| title                                               | released_year | stock_quantity |
+-----------------------------------------------------+---------------+----------------+
| American Gods                                       |          2001 |             12 |
| Where I m Calling From: Selected Stories            |          1989 |             12 |
| What We Talk About When We Talk About Love: Stories |          1981 |             23 |
+-----------------------------------------------------+---------------+----------------+

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














