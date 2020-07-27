/*-- Recreate a new cats table --*/
/*-------------------------------*/

CREATE TABLE cats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT, 
     PRIMARY KEY (cat_id) 
  ); 
  
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
	   
/*-----------------------------------------------------------*/


  
/*-- Various Simple SELECT statements --*/
/*--------------------------------------*/

SELECT * FROM cats; 
+--------+----------------+------------+------+
| cat_id | name           | breed      | age  |
+--------+----------------+------------+------+
|      1 | Ringo          | Tabby      |    4 |
|      2 | Cindy          | Maine Coon |   10 |
|      3 | Dumbledore     | Maine Coon |   11 |
|      4 | Egg            | Persian    |    4 |
|      5 | Misty          | Tabby      |   13 |
|      6 | George Michael | Ragdoll    |    9 |
|      7 | Jackson        | Sphynx     |    7 |
+--------+----------------+------------+------+

SELECT name FROM cats; 

SELECT age FROM cats; 

SELECT cat_id FROM cats; 

SELECT name, age FROM cats; 

SELECT cat_id, name, age FROM cats; 

SELECT age, breed, name, cat_id FROM cats; 

SELECT cat_id, name, age, breed FROM cats; 


/*-----------------------------------------------------------*/



/*-- Introduction to WHERE --*/
/*---------------------------*/

Select by age:

SELECT * FROM cats WHERE age=4; 

Select by name:

SELECT * FROM cats WHERE name='Egg'; 

-- Notice how it deals with case:
SELECT * FROM cats WHERE name='egG';
-- It will give same result 
/*

+--------+------+---------+------+
| cat_id | name | breed   | age  |
+--------+------+---------+------+
|      4 | Egg  | Persian |    4 |
+--------+------+---------+------+

*/

/*-----------------------------------------------------------*/



/*-- Introduction to Aliases --*/
/*-----------------------------*/

SELECT cat_id AS id, name FROM cats;
 
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;
 
DESC cats;

/*-----------------------------------------------------------*/



/*-- Update Challenges Solution --*/
/*--------------------------------*/

-- Always run select before to see you are updating correct data

-- 1 Change Jackson name to Jack
SELECT * FROM cats WHERE name='Jackson';
UPDATE cats SET name='Jack' WHERE name='Jackson';
 
-- 2 Cahnge Ringo name to British Shorthair
SELECT * FROM cats WHERE name='Ringo';
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
 
-- 3 Update both Maine Coon ages to be 12
SELECT * FROM cats WHERE breed='Maine Coon';
UPDATE cats SET age=12 WHERE breed='Maine Coon';
 
/*-----------------------------------------------------------*/



/*-- DELETING DATA --*/
/*-------------------*/

-- Always run select before, to see you are deleting the correct data

-- 1 Delete cat name with Egg
SELECT * FROM cats WHERE name='Egg';
DELETE FROM cats WHERE name='Egg';
-- or
DELETE FROM cats WHERE name='egg';

-- 2 Delete all rows in table
DELETE FROM cats;

-- 3 Delete complete table from database
DROP TABLE cats

/*
Quick Note :
DELETE ---- means delete
DROP ------ means shift + delete
*/

-------------------------------------------------------------------------------
