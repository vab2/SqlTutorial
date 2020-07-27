/*-- String functios --*/
/*---------------------*/

-- Create database book shop
CREATE DATABASE book_shop;
USE book_shop;

-- Create table books
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

-- 3 Insert data in table
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


mysql> DESC books;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| book_id        | int(11)      | NO   | PRI | NULL    | auto_increment |
| title          | varchar(100) | YES  |     | NULL    |                |
| author_fname   | varchar(100) | YES  |     | NULL    |                |
| author_lname   | varchar(100) | YES  |     | NULL    |                |
| released_year  | int(11)      | YES  |     | NULL    |                |
| stock_quantity | int(11)      | YES  |     | NULL    |                |
| pages          | int(11)      | YES  |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+


mysql> SELECt * FROM books;
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
+---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+

/*-----------------------------------------------------------*/

/*

For more informaton about my Sql string function 

refer below website

*** https://dev.mysql.com/doc/refman/8.0/en/string-functions.html ****

*/

/*-----------------------------------------------------------*/

/*-- CONCAT --*/
/*------------*/

--	Return concatenated string

-- 1 )
SELECT
  CONCAT(author_fname, ' ', author_lname)
FROM books;
+-----------------------------------------+
| CONCAT(author_fname, ' ', author_lname) |
+-----------------------------------------+
| Jhumpa Lahiri                           |
| Neil Gaiman                             |
| Neil Gaiman                             |
| Jhumpa Lahiri                           |
| Dave Eggers                             |
| Dave Eggers                             |
| Michael Chabon                          |
| Patti Smith                             |
| Dave Eggers                             |
| Neil Gaiman                             |
| Raymond Carver                          |
| Raymond Carver                          |
| Don DeLillo                             |
| John Steinbeck                          |
| David Foster Wallace                    |
| David Foster Wallace                    |
+-----------------------------------------+

SELECT
  CONCAT(author_fname, ' ', author_lname) AS 'full name'
FROM books;


/*-- CONCAT with seprator --*/
/*--------------------------*/

-- seprating title and name with '-' seprator
SELECT CONCAT(title, '-', author_fname, '-', author_lname) FROM books;

-- if you want to add a common seprator like above,
-- we can use the CONCAT_WS i.e. with seprator 
SELECT 
    CONCAT_WS(' - ', title, author_fname, author_lname) 
FROM books;

+------------------------------------------------------------------------+
| CONCAT_WS(' - ', title, author_fname, author_lname)                    |
+------------------------------------------------------------------------+
| The Namesake - Jhumpa - Lahiri                                         |
| Norse Mythology - Neil - Gaiman                                        |
| American Gods - Neil - Gaiman                                          |
...
+------------------------------------------------------------------------+

/*-----------------------------------------------------------*/



/*-- SUBSTRING --*/
/*---------------*/

/*
	In SQL index start from 1 (one)
*/

-- syntax : SUBSTRING(String,start,end)
mysql> SELECT SUBSTRING('Hello  World',1,4);
+-------------------------------+
| SUBSTRING('Hello  World',1,4) |
+-------------------------------+
| Hell                          |
+-------------------------------+

mysql> SELECT SUBSTRING('Hello World', 3, 8);
+--------------------------------+
| SUBSTRING('Hello World', 3, 8) |
+--------------------------------+
| llo Worl                       |
+--------------------------------+

-- syntax : SUBSTRING(String, currentIndexToLast)
mysql> SELECT SUBSTRING('Hello World', 4);
+-----------------------------+
| SUBSTRING('Hello World', 4) |
+-----------------------------+
| lo World                    |
+-----------------------------+

-- syntax : SUBSTRING(String, - lastToSpecivedValueCount)
mysql> SELECT SUBSTRING('Hello World', -3);
+------------------------------+
| SUBSTRING('Hello World', -3) |
+------------------------------+
| rld                          |
+------------------------------+


mysql> SELECT SUBSTRING('Hello World', -7);
+------------------------------+
| SUBSTRING('Hello World', -7) |
+------------------------------+
| o World                      |
+------------------------------+

-- Shortcut for SUBSTRING is SUBSTR
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;
+-------------+
| short title |
+-------------+
| The Namesa  |
| Norse Myth  |
| American G  |
| Interprete  |
| A Hologram  |
| The Circle  |
| The Amazin  |
| Just Kids   |
| A Heartbre  |
| Coraline    |
| What We Ta  |
| Where I m   |
| White Nois  |
| Cannery Ro  |
| Oblivion:   |
| Consider t  |
+-------------+


SELECT CONCAT(SUBSTRING(title, 1, 10),'...') AS 'short title' FROM books;
+---------------+
| short title   |
+---------------+
| The Namesa... |
| Norse Myth... |
| American G... |
| Interprete... |
| A Hologram... |
| The Circle... |
| The Amazin... |
| Just Kids...  |
| A Heartbre... |
| Coraline...   |
| What We Ta... |
| Where I m ... |
| White Nois... |
| Cannery Ro... |
| Oblivion: ... |
| Consider t... |
+---------------+

/*-----------------------------------------------------------*/



/*-- REPLACE --*/
/*-------------*/

-- This command is case sensitive with string value
-- Also string values are accpected in quotes
-- and intiger will work withot quotes
-- Example - this works 
mysql> SELECT REPLACE('Hello World', 'Hell', '%$#@');
+----------------------------------------+
| REPLACE('Hello World', 'Hell', '%$#@') |
+----------------------------------------+
| %$#@o World                            |
+----------------------------------------+
-- But this not 
mysql> SELECT REPLACE('Hello World', 'hell', '%$#@');
+----------------------------------------+
| REPLACE('Hello World', 'hell', '%$#@') |
+----------------------------------------+
| Hello World                            |
+----------------------------------------+

-- replace l with 7
mysql> SELECT REPLACE('Hello World', 'l', '7');
+----------------------------------+
| REPLACE('Hello World', 'l', '7') |
+----------------------------------+
| He77o Wor7d                      |
+----------------------------------+

-- replace o with 0
mysql> SELECT REPLACE('Hello World', 'o', '0');
+----------------------------------+
| REPLACE('Hello World', 'o', '0') |
+----------------------------------+
| Hell0 W0rld                      |
+----------------------------------+

-- replace o with *
mysql> SELECT REPLACE('HellO World', 'o', '*');
+----------------------------------+
| REPLACE('HellO World', 'o', '*') |
+----------------------------------+
| HellO W*rld                      |
+----------------------------------+

-- works with integer 
mysql> SELECT REPLACE('Hello World 987', 87, 66);
+------------------------------------+
| REPLACE('Hello World 987', 87, 66) |
+------------------------------------+
| Hello World 966                    |
+------------------------------------+

-- String value without quotes
mysql> SELECT REPLACE('Hello World 987', 9, k);
ERROR 1054 (42S22): Unknown column 'k' in 'field list'

-- replace 'e ' with '3' form title
SELECT REPLACE(title, 'e ', '3') FROM books;
 
-- Substring title from 1 to 10
SELECT CONCAT(SUBSTRING(title,1,10),'...') AS 'short tittle' FROM books;
+---------------+
| short tittle  |
+---------------+
| The Namesa... |
| Norse Myth... |
| American G... |
| Interprete... |
| A Hologram... |
| The Circle... |
| The Amazin... |
| Just Kids...  |
| A Heartbre... |
| Coraline...   |
| What We Ta... |
| Where I m ... |
| White Nois... |
| Cannery Ro... |
| Oblivion: ... |
| Consider t... |
+---------------+

-- Substring title and replace e with 3
mysql> SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string' FROM books;
+--------------+
| weird string |
+--------------+
| Th3 Nam3sa   |
| Nors3 Myth   |
| Am3rican G   |
| Int3rpr3t3   |
| A Hologram   |
| Th3 Circl3   |
| Th3 Amazin   |
| Just Kids    |
| A H3artbr3   |
| Coralin3     |
| What W3 Ta   |
| Wh3r3 I m    |
| Whit3 Nois   |
| Cann3ry Ro   |
| Oblivion:    |
| Consid3r t   |
+--------------+

-- Substring title and replace e with 3 and concat title with ...
mysql> SELECT CONCAT(SUBSTRING(REPLACE(title,'e','V'),1,10),'...') AS 'weired string...' FROM books;
+------------------+
| weired string... |
+------------------+
| ThV NamVsa...    |
| NorsV Myth...    |
| AmVrican G...    |
| IntVrprVtV...    |
| A Hologram...    |
| ThV CirclV...    |
| ThV Amazin...    |
| Just Kids...     |
| A HVartbrV...    |
| CoralinV...      |
| What WV Ta...    |
| WhVrV Im ...     |
| WhitV Nois...    |
| CannVry Ro...    |
| Oblivion: ...    |
| ConsidVr t...    |
+------------------+


/*-----------------------------------------------------------*/



/*-- REVERSE --*/
/*-------------*/


SELECT REVERSE('Hello World');
+------------------------+
| REVERSE('Hello World') |
+------------------------+
| dlroW olleH            |
+------------------------+
 
SELECT REVERSE(author_fname) FROM books;
 
SELECT CONCAT('woof', REVERSE('woof'));
 
SELECT CONCAT(author_fname, ' ', REVERSE(author_fname)) FROM books;


/*-----------------------------------------------------------*/



/*-- CHAR_LENGTH --*/
/*-----------------*/

-- select firstName is 'length' character long 
SELECT 
	CONCAT(author_fname,' ','is ',CHAR_LENGTH(author_fname),' character long') 
FROM books;
+----------------------------------------------------------------------------+
| CONCAT(author_fname,' ','is ',CHAR_LENGTH(author_fname),' character long') |
+----------------------------------------------------------------------------+
| Jhumpa is 6 character long                                                 |
| Neil is 4 character long                                                   |
| Neil is 4 character long                                                   |
| Jhumpa is 6 character long                                                 |
| Dave is 4 character long                                                   |
| Dave is 4 character long                                                   |
| Michael is 7 character long                                                |
| Patti is 5 character long                                                  |
| Dave is 4 character long                                                   |
| Neil is 4 character long                                                   |
| Raymond is 7 character long                                                |
| Raymond is 7 character long                                                |
| Don is 3 character long                                                    |
| John is 4 character long                                                   |
| David is 5 character long                                                  |
| David is 5 character long                                                  |
+----------------------------------------------------------------------------+


/*-----------------------------------------------------------*/



/*-- UPPER and LOWER --*/
/*---------------------*/


SELECT UPPER('Hello World');
 
SELECT LOWER('Hello World');
 
SELECT UPPER(title) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

-- Tried with integer but no error
mysql> SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(pages)) FROM books;
+----------------------------------------------+
| CONCAT('MY FAVORITE BOOK IS ', UPPER(pages)) |
+----------------------------------------------+
| MY FAVORITE BOOK IS 291                      |
| MY FAVORITE BOOK IS 304                      |
| MY FAVORITE BOOK IS 465                      |
| MY FAVORITE BOOK IS 198                      |
| MY FAVORITE BOOK IS 352                      |
| MY FAVORITE BOOK IS 504                      |
| MY FAVORITE BOOK IS 634                      |
| MY FAVORITE BOOK IS 304                      |
| MY FAVORITE BOOK IS 437                      |
| MY FAVORITE BOOK IS 208                      |
| MY FAVORITE BOOK IS 176                      |
| MY FAVORITE BOOK IS 526                      |
| MY FAVORITE BOOK IS 320                      |
| MY FAVORITE BOOK IS 181                      |
| MY FAVORITE BOOK IS 329                      |
| MY FAVORITE BOOK IS 343                      |
+----------------------------------------------+


/*-----------------------------------------------------------*/

/*

Order is important when dealing with combining/wrapping certain string functions.

*/


-- For example:
-- This works:
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps"
FROM books;
While this does not:
-- But this not
SELECT CONCAT(UPPER(author_fname, ' ', author_lname)) AS "full name in caps" 
FROM books;
-- Beacuse UPPER only takes one argument and CONCAT takes two or more arguments, 
-- so they cant be switched in that way.

-- You could do it this way, however:
SELECT CONCAT(UPPER(author_fname), ' ', UPPER(author_lname)) AS "full name in caps" 
FROM books;

/*-----------------------------------------------------------*/

