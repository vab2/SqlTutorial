-- 1 Create a new database
CREATE DATABASE shirt_db;
USE shirt_db;
Select databse(); 

-- 2 Create a new table
CREATE TABLE shirts(
shirt_id INT NOT NULL AUTO_INCREMENT,
article VARCHAR(50),
color VARCHAR(50),
shirt_size VARCHAR(10),
last_worn INT,
PRIMARY KEY (shirt_id)
);

DESC shirts;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| shirt_id   | int(11)     | NO   | PRI | NULL    | auto_increment |
| article    | varchar(50) | YES  |     | NULL    |                |
| color      | varchar(50) | YES  |     | NULL    |                |
| shirt_size | varchar(10) | YES  |     | NULL    |                |
| last_worn  | int(11)     | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+


-- 3 Insert multiple records in shirts table
INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
 
 -- 4 Insert single records
INSERT INTO shirts(color, article, shirt_size, last_worn) 
VALUES('purple', 'polo shirt', 'M', 50);


SELECT * FROM shirts;
/*
+----------+------------+--------+------------+-----------+
| shirt_id | article    | color  | shirt_size | last_worn |
+----------+------------+--------+------------+-----------+
|        1 | t-shirt    | white  | S          |        10 |
|        2 | t-shirt    | green  | S          |       200 |
|        3 | polo shirt | black  | M          |        10 |
|        4 | tank top   | blue   | S          |        50 |
|        5 | t-shirt    | pink   | S          |         0 |
|        6 | polo shirt | red    | M          |         5 |
|        7 | tank top   | white  | S          |       200 |
|        8 | tank top   | blue   | M          |        15 |
|        9 | polo shirt | purple | M     	  |        50 |
+----------+------------+--------+------------+-----------+
*/

-- 5 Select all shirts but only printout article and color
SELECT article, color FROM shirts;

-- 6 Select all medium shirt, print all but not id
SELECT article,color,shirt_size,last_worn FROM shirts WHERE shirt_size='M'; 

-- 7 Update all polo shirt to size of L
SELECT * FROM shirts WHERE article='polo shirt';
UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';

-- 8 Update the shirt that was last worn 15 daya ago to 0
SELECT * FROM shirts WHERE last_worn=15;
UPDATE shirts SET last_worn=0  WHERE last_worn=15;

-- 9 Update all white shirt , change size to XS and colloer to off white
SELECT * FROM shirts WHERE color='white';
UPDATE shirts SET color='off white', shirt_size='XS' WHERE color='white';

-- 10 Delete shirts where last worn is 200 days
SELECT * FROM shirts WHERE last_worn=200;
DELETE FROM shirts WHERE last_worn=200;

-- 11 Delete all tank tops 
SELECT * FROM shirts WHERE article='tank top';
DELETE FROM shirts WHERE article='tank top';

-- 12 Delete the table
DELETE FROM shirts;

-- 13 Drop the table
DROP TABLE  shirts;

-- 15 Drop the database
DROP DATABASE shirt_db;
