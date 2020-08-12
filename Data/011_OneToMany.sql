/*-- Working With Foreign Keys --*/
/*-------------------------------*/
CREATE DATABASE onlineShop;

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
	   
-- This INSERT fails because of our fk constraint.  No user with id: 98
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98);
/*
ERROR 1452 (23000): Cannot add or update a child row: 
a foreign key constraint fails (`onlineShop`.`orders`, CONSTRAINT `orders_ibfk_1`
FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`))
*/

mysql> SELECT * from customers;
+----+------------+-----------+------------------+
| id | first_name | last_name | email            |
+----+------------+-----------+------------------+
|  1 | Boy        | George    | george@gmail.com |
|  2 | George     | Michael   | gm@gmail.com     |
|  3 | David      | Bowie     | david@gmail.com  |
|  4 | Blue       | Steele    | blue@gmail.com   |
|  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+-----------+------------------+

mysql> SELECT * from orders;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+--------+-------------+



/*-----------------------------------------------------------*/



/*-- Cross Joins --*/
/*-----------------*/


-- To find the order placed by boy George

-- 1st => Finding Orders Placed By George: 2 Step Process
SELECT id FROM customers WHERE last_name='George';
+----+
| id |
+----+
|  1 |
+----+

SELECT * FROM orders WHERE customer_id = 1;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
+----+------------+--------+-------------+


-- 2nd => Finding Orders Placed By George: Using a subquery
SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name='George'
    );
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
+----+------------+--------+-------------+

-- Cross Join Craziness (Use very less)
-- Map all posible combination 
SELECT * FROM customers, orders; 
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  1 | 2016-02-10 |  99.99 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  1 | 2016-02-10 |  99.99 |           1 |
|  5 | Bette      | Davis     | bette@aol.com    |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  2 | 2017-11-11 |  35.50 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  2 | 2017-11-11 |  35.50 |           1 |
|  4 | Blue       | Steele    | blue@gmail.com   |  2 | 2017-11-11 |  35.50 |           1 |
|  5 | Bette      | Davis     | bette@aol.com    |  2 | 2017-11-11 |  35.50 |           1 |
|  1 | Boy        | George    | george@gmail.com |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  3 | 2014-12-12 | 800.67 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  3 | 2014-12-12 | 800.67 |           2 |
|  1 | Boy        | George    | george@gmail.com |  4 | 2015-01-03 |  12.50 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  3 | David      | Bowie     | david@gmail.com  |  4 | 2015-01-03 |  12.50 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  4 | 2015-01-03 |  12.50 |           2 |
|  1 | Boy        | George    | george@gmail.com |  5 | 1999-04-11 | 450.25 |           5 |
|  2 | George     | Michael   | gm@gmail.com     |  5 | 1999-04-11 | 450.25 |           5 |
|  3 | David      | Bowie     | david@gmail.com  |  5 | 1999-04-11 | 450.25 |           5 |
|  4 | Blue       | Steele    | blue@gmail.com   |  5 | 1999-04-11 | 450.25 |           5 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+



/*-----------------------------------------------------------*/



/*-- Inner Joins --*/
/*-----------------*/


/*
Select all that matches only in between A and B
*/

-- IMPLICIT INNER JOIN
-- It is called implicit because there is no keyword 'JOIN' we are using
SELECT * FROM customers, orders 
WHERE customers.id = orders.customer_id;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+
-- Also note that the order of table also matters to display the informatio 
-- otherwise the mapping is same

-- It is same as above with fied name
SELECT first_name, last_name, order_date, amount
FROM customers, orders 
    WHERE customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+
-- We are joining the two tables with WHERE condistion
-- i.e customer_primary_key = order_foreign_key or vice versa.
    
	
-- EXPLICIT INNER JOINS
SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+
    
SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+

-- PROPER SYNTEX
SELECT first_name, last_name, order_date, amount 
FROM customers
INNER JOIN orders
    ON customers.id = orders.customer_id;
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+


-- ARBITRARY JOIN - meaningless, but still possible 
SELECT * FROM customers
JOIN orders ON customers.id = orders.id;
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  2 | 2017-11-11 |  35.50 |           1 |
|  3 | David      | Bowie     | david@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
|  4 | Blue       | Steele    | blue@gmail.com   |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+
-- Here the join condition is customer_primary_key = order_priary_key
-- The data in the table is meaningless but still we can run the query


-- Back to our requirement : To find the order placed by boy George
SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id 
	AND first_name='boy' AND last_name='George';
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
+------------+-----------+------------+--------+

-- Group by customer and sum all amount
SELECT 
    first_name, last_name, SUM(amount) AS total_spent
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
GROUP BY orders.customer_id
ORDER BY total_spent DESC;
+------------+-----------+-------------+
| first_name | last_name | total_spent |
+------------+-----------+-------------+
| George     | Michael   |      813.17 |
| Bette      | Davis     |      450.25 |
| Boy        | George    |      135.49 |
+------------+-----------+-------------+


/*-----------------------------------------------------------*/



/*-- LEFT Joins --*/
/*----------------*/

/*
Select all that matches between A and B & All part of A
*/


SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
+----+------------+-----------+------------------+------+------------+--------+-------------+
| id | first_name | last_name | email            | id   | order_date | amount | customer_id |
+----+------------+-----------+------------------+------+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |    1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |    2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |    3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |    4 | 2015-01-03 |  12.50 |           2 |
|  3 | David      | Bowie     | david@gmail.com  | NULL | NULL       |   NULL |        NULL |
|  4 | Blue       | Steele    | blue@gmail.com   | NULL | NULL       |   NULL |        NULL |
|  5 | Bette      | Davis     | bette@aol.com    |    5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+------+------------+--------+-------------+


SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id; 
+------------+-----------+------------+--------+
| first_name | last_name | order_date | amount |
+------------+-----------+------------+--------+
| Boy        | George    | 2016-02-10 |  99.99 |
| Boy        | George    | 2017-11-11 |  35.50 |
| George     | Michael   | 2014-12-12 | 800.67 |
| George     | Michael   | 2015-01-03 |  12.50 |
| David      | Bowie     | NULL       |   NULL |
| Blue       | Steele    | NULL       |   NULL |
| Bette      | Davis     | 1999-04-11 | 450.25 |
+------------+-----------+------------+--------+

-- Select customer and their total amount 
-- Here IFNULL work as, if SUM(amount) is null replace it witn '0' otherwise as it is.
SELECT first_name, last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;




/*-----------------------------------------------------------*/



/*-- RIGHT Joins --*/
/*-----------------*/

/*
Select all that matches only in between A and B & All part of B
*/

CREATE TABLE customers_2(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders_2(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT
);

INSERT INTO customers_2 (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders_2 (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5),
	   ('1998/04/11', 456.25, 107),
	   ('1997/08/11', 987.25, 309);

mysql> select * from customers_2;
+----+------------+-----------+------------------+
| id | first_name | last_name | email            |
+----+------------+-----------+------------------+
|  1 | Boy        | George    | george@gmail.com |
|  2 | George     | Michael   | gm@gmail.com     |
|  3 | David      | Bowie     | david@gmail.com  |
|  4 | Blue       | Steele    | blue@gmail.com   |
|  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+-----------+------------------+

mysql> select * from orders_2;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
|  6 | 1998-04-11 | 456.25 |         107 |
|  7 | 1997-08-11 | 987.25 |         309 |
+----+------------+--------+-------------+


	   
SELECT * FROM customers_2
RIGHT JOIN orders_2
    ON customers_2.id = orders_2.customer_id;
+------+------------+-----------+------------------+----+------------+--------+-------------+
| id   | first_name | last_name | email            | id | order_date | amount | customer_id |
+------+------------+-----------+------------------+----+------------+--------+-------------+
|    1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|    1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|    2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|    2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|    5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
| NULL | NULL       | NULL      | NULL             |  6 | 1998-04-11 | 456.25 |         107 |
| NULL | NULL       | NULL      | NULL             |  7 | 1997-08-11 | 987.25 |         309 |
+------+------------+-----------+------------------+----+------------+--------+-------------+
	
-- RIGHT jpin to see all sum of aount by user
SELECT 
    IFNULL(first_name,'MISSING') AS first, IFNULL(last_name,'USER') as last, 
    order_date, amount, SUM(amount)
FROM customers_2
RIGHT JOIN orders_2
    ON customers_2.id = orders_2.customer_id
GROUP BY first_name, last_name;
+---------+---------+------------+--------+-------------+
| first   | last    | order_date | amount | SUM(amount) |
+---------+---------+------------+--------+-------------+
| MISSING | USER    | 1998-04-11 | 456.25 |     1443.50 |
| Bette   | Davis   | 1999-04-11 | 450.25 |      450.25 |
| Boy     | George  | 2016-02-10 |  99.99 |      135.49 |
| George  | Michael | 2014-12-12 | 800.67 |      813.17 |
+---------+---------+------------+--------+-------------+



/*-----------------------------------------------------------*/



/*-- ON DELETE CASCADE --*/
/*-----------------------*/

CREATE TABLE customers_3(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
 
CREATE TABLE orders_3(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) 
        REFERENCES customers_3(id)
        ON DELETE CASCADE
);

INSERT INTO customers_3 (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders_3 (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
	   
mysql> select * from customers_3;
+----+------------+-----------+------------------+
| id | first_name | last_name | email            |
+----+------------+-----------+------------------+
|  1 | Boy        | George    | george@gmail.com |
|  2 | George     | Michael   | gm@gmail.com     |
|  3 | David      | Bowie     | david@gmail.com  |
|  4 | Blue       | Steele    | blue@gmail.com   |
|  5 | Bette      | Davis     | bette@aol.com    |
+----+------------+-----------+------------------+

mysql> select * from orders_3;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  1 | 2016-02-10 |  99.99 |           1 |
|  2 | 2017-11-11 |  35.50 |           1 |
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+--------+-------------+

mysql> DELETE FROM customers_3 WHERE email='george@gmail.com';
Query OK, 1 row affected (0.08 sec)

mysql> select * from customers_3;
+----+------------+-----------+-----------------+
| id | first_name | last_name | email           |
+----+------------+-----------+-----------------+
|  2 | George     | Michael   | gm@gmail.com    |
|  3 | David      | Bowie     | david@gmail.com |
|  4 | Blue       | Steele    | blue@gmail.com  |
|  5 | Bette      | Davis     | bette@aol.com   |
+----+------------+-----------+-----------------+

mysql> select * from orders_3;
+----+------------+--------+-------------+
| id | order_date | amount | customer_id |
+----+------------+--------+-------------+
|  3 | 2014-12-12 | 800.67 |           2 |
|  4 | 2015-01-03 |  12.50 |           2 |
|  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+--------+-------------+



/*-----------------------------------------------------------*/



/*-- Right and Left Joins --*/
/*--------------------------*/

--1) Left join
SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
--2) Right join
SELECT * FROM orders
RIGHT JOIN customers
    ON customers.id = orders.customer_id;    
-- Both are same 
	
	
--3) 
SELECT * FROM orders
LEFT JOIN customers
    ON customers.id = orders.customer_id;    
--4) 
SELECT * FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;
-- Both are same 

-- ALSO LEFT JOIN & LEFT OUTER JOIN are same
SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
--
SELECT * FROM customers
LEFT OUTER JOIN orders
    ON customers.id = orders.customer_id;
	
-- ALSO RIGHT JOIN & RIGHT OUTER JOIN are same
SELECT * FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;

SELECT * FROM customers
RIGHT OUTER JOIN orders
    ON customers.id = orders.customer_id;
	
-- NOTE there is noting like LEFT INNER JOIN or RIGHT INNER JOIN
	
	
	
/*-----------------------------------------------------------*/

	
	
/* 
------------------------------------------
               All Joins
------------------------------------------
Considering table customers_2 and orders_2
*/

-- 1st INNER join (contains intersection of A and B)
SELECT * FROM customers_2
INNER JOIN orders_2
    ON customers_2.id = orders_2.customer_id;
-- A.key = B.key (generally foreign key)
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+


-- 2nd LEFT JOIN or LEFT OUTER JOIN or LEFT Inclusive
-- (contains all of A and intersection of B) 
SELECT * FROM customers_2
LEFT JOIN orders_2
    ON customers_2.id = orders_2.customer_id;
-- A.key = B.key (generally foreign key)
+----+------------+-----------+------------------+------+------------+--------+-------------+
| id | first_name | last_name | email            | id   | order_date | amount | customer_id |
+----+------------+-----------+------------------+------+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |    1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |    2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |    3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |    4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |    5 | 1999-04-11 | 450.25 |           5 |
|  3 | David      | Bowie     | david@gmail.com  | NULL | NULL       |   NULL |        NULL |
|  4 | Blue       | Steele    | blue@gmail.com   | NULL | NULL       |   NULL |        NULL |
+----+------------+-----------+------------------+------+------------+--------+-------------+


-- 3rd RIGHT JOIN or RIGHT OUTER JOIN or RIGHT Inclusive
-- (contains all of B and intersection of A) 
SELECT * FROM customers_2
RIGHT JOIN orders_2
    ON customers_2.id = orders_2.customer_id;
-- A.key = B.key (generally foreign key)
+------+------------+-----------+------------------+----+------------+--------+-------------+
| id   | first_name | last_name | email            | id | order_date | amount | customer_id |
+------+------------+-----------+------------------+----+------------+--------+-------------+
|    1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|    1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|    2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|    2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|    5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
| NULL | NULL       | NULL      | NULL             |  6 | 1998-04-11 | 456.25 |         107 |
| NULL | NULL       | NULL      | NULL             |  7 | 1997-08-11 | 987.25 |         309 |
+------+------------+-----------+------------------+----+------------+--------+-------------+


-- 4th LEFT Exclusive (contains only A and does not contain intersection of A & B) 
SELECT * FROM customers_2
LEFT JOIN orders_2
    ON customers_2.id = orders_2.customer_id
	WHERE orders_2.customer_id IS NULL;
-- A.key = B.key (generally foreign key)
-- And B.key is null
+----+------------+-----------+-----------------+------+------------+--------+-------------+
| id | first_name | last_name | email           | id   | order_date | amount | customer_id |
+----+------------+-----------+-----------------+------+------------+--------+-------------+
|  3 | David      | Bowie     | david@gmail.com | NULL | NULL       |   NULL |        NULL |
|  4 | Blue       | Steele    | blue@gmail.com  | NULL | NULL       |   NULL |        NULL |
+----+------------+-----------+-----------------+------+------------+--------+-------------+


-- 5th RIGHT Exclusive (contains only B and does not contain intersection of A & B)
SELECT * FROM customers_2
RIGHT JOIN orders_2
    ON customers_2.id = orders_2.customer_id
	WHERE customers_2.id IS NULL;
-- A.key = B.key (generally foreign key)
-- And B.key is null
+------+------------+-----------+-------+----+------------+--------+-------------+
| id   | first_name | last_name | email | id | order_date | amount | customer_id |
+------+------------+-----------+-------+----+------------+--------+-------------+
| NULL | NULL       | NULL      | NULL  |  6 | 1998-04-11 | 456.25 |         107 |
| NULL | NULL       | NULL      | NULL  |  7 | 1997-08-11 | 987.25 |         309 |
+------+------------+-----------+-------+----+------------+--------+-------------+


-- 6th FULL OUTER JOIN or FULL OUTER Inclusive JOIN
-- (contains all of A & B and intersection of A & B) 
/*
-- Will not work for MySQL
SELECT * FROM customers_2
FULL OUTER JOIN orders_2
	ON customers_2.id = orders_2.customer_id;
-- A.key = B.key (generally foreign key)
*/
SELECT * FROM customers_2
LEFT JOIN orders_2
    ON customers_2.id = orders_2.customer_id
UNION
SELECT * FROM customers_2
RIGHT JOIN orders_2
    ON customers_2.id = orders_2.customer_id;
-- A.key = B.key (generally foreign key)
+------+------------+-----------+------------------+------+------------+--------+-------------+
| id   | first_name | last_name | email            | id   | order_date | amount | customer_id |
+------+------------+-----------+------------------+------+------------+--------+-------------+
|    1 | Boy        | George    | george@gmail.com |    1 | 2016-02-10 |  99.99 |           1 |
|    1 | Boy        | George    | george@gmail.com |    2 | 2017-11-11 |  35.50 |           1 |
|    2 | George     | Michael   | gm@gmail.com     |    3 | 2014-12-12 | 800.67 |           2 |
|    2 | George     | Michael   | gm@gmail.com     |    4 | 2015-01-03 |  12.50 |           2 |
|    5 | Bette      | Davis     | bette@aol.com    |    5 | 1999-04-11 | 450.25 |           5 |
|    3 | David      | Bowie     | david@gmail.com  | NULL | NULL       |   NULL |        NULL |
|    4 | Blue       | Steele    | blue@gmail.com   | NULL | NULL       |   NULL |        NULL |
| NULL | NULL       | NULL      | NULL             |    6 | 1998-04-11 | 456.25 |         107 |
| NULL | NULL       | NULL      | NULL             |    7 | 1997-08-11 | 987.25 |         309 |
+------+------------+-----------+------------------+------+------------+--------+-------------+


-- 7th FULL OUTER Exclusive JOIN (contains all of A & B and exclude intersection of A & B) 
/*
-- Will not work for MySQL
SELECT * FROM customers_2
FULL OUTER JOIN orders_2
	ON customers_2.id = orders_2.customer_id
	WHERE customers_2.id IS NULL
		OR orders_2.customer_id IS NULL;
-- A.key = B.key (generally foreign key)
and A.key IS NULL or B.key IS  NULL
*/
SELECT * FROM customers_2
LEFT JOIN orders_2
    ON customers_2.id = orders_2.customer_id
	WHERE orders_2.customer_id IS NULL
UNION
SELECT * FROM customers_2
RIGHT JOIN orders_2
    ON customers_2.id = orders_2.customer_id
	WHERE customers_2.id IS NULL;
+------+------------+-----------+-----------------+------+------------+--------+-------------+
| id   | first_name | last_name | email           | id   | order_date | amount | customer_id |
+------+------------+-----------+-----------------+------+------------+--------+-------------+
|    3 | David      | Bowie     | david@gmail.com | NULL | NULL       |   NULL |        NULL |
|    4 | Blue       | Steele    | blue@gmail.com  | NULL | NULL       |   NULL |        NULL |
| NULL | NULL       | NULL      | NULL            |    6 | 1998-04-11 | 456.25 |         107 |
| NULL | NULL       | NULL      | NULL            |    7 | 1997-08-11 | 987.25 |         309 |
+------+------------+-----------+-----------------+------+------------+--------+-------------+
	
	

/*-----------------------------------------------------------*/



/*-- EXERCISE --*/
/*--------------*/


CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);
 
 
CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) 
        REFERENCES students(id)
        ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


mysql> SELECT * FROM students;
+----+------------+
| id | first_name |
+----+------------+
|  1 | Caleb      |
|  2 | Samantha   |
|  3 | Raj        |
|  4 | Carlos     |
|  5 | Lisa       |
+----+------------+

mysql> SELECT * FROM papers;
+---------------------------------------+-------+------------+
| title                                 | grade | student_id |
+---------------------------------------+-------+------------+
| My First Book Report                  |    60 |          1 |
| My Second Book Report                 |    75 |          1 |
| Russian Lit Through The Ages          |    94 |          2 |
| De Montaigne and The Art of The Essay |    98 |          2 |
| Borges and Magical Realism            |    89 |          4 |
+---------------------------------------+-------+------------+



-- Print This first name, title and grade
+------------+---------------------------------------+-------+
| first_name | title                                 | grade |
+------------+---------------------------------------+-------+
| Samantha   | De Montaigne and The Art of The Essay |    98 |
| Samantha   | Russian Lit Through The Ages          |    94 |
| Carlos     | Borges and Magical Realism            |    89 |
| Caleb      | My Second Book Report                 |    75 |
| Caleb      | My First Book Report                  |    60 |
+------------+---------------------------------------+-------+
SELECT first_name, title, grade
FROM students
INNER JOIN papers
WHERE students.id = papers.student_id
ORDER BY grade DESC;


-- Print This first name, title and grade
+------------+---------------------------------------+-------+
| first_name | title                                 | grade |
+------------+---------------------------------------+-------+
| Caleb      | My First Book Report                  |    60 |
| Caleb      | My Second Book Report                 |    75 |
| Samantha   | Russian Lit Through The Ages          |    94 |
| Samantha   | De Montaigne and The Art of The Essay |    98 |
| Raj        | NULL                                  |  NULL |
| Carlos     | Borges and Magical Realism            |    89 |
| Lisa       | NULL                                  |  NULL |
+------------+---------------------------------------+-------+
SELECT first_name, title, grade
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;


-- Print This first name, title and grade
+------------+---------------------------------------+-----------------+
| first_name | IFNULL(title,'MISSING')               | IFNULL(grade,0) |
+------------+---------------------------------------+-----------------+
| Caleb      | My First Book Report                  |              60 |
| Caleb      | My Second Book Report                 |              75 |
| Samantha   | Russian Lit Through The Ages          |              94 |
| Samantha   | De Montaigne and The Art of The Essay |              98 |
| Raj        | MISSING                               |               0 |
| Carlos     | Borges and Magical Realism            |              89 |
| Lisa       | MISSING                               |               0 |
+------------+---------------------------------------+-----------------+
SELECT first_name, IFNULL(title,'MISSING'), IFNULL(grade,0)
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;


-- Print this first name, average
+------------+---------+
| first_name | average |
+------------+---------+
| Samantha   | 96.0000 |
| Carlos     | 89.0000 |
| Caleb      | 67.5000 |
| Raj        |  0.0000 |
| Lisa       |  0.0000 |
+------------+---------+
SELECT first_name , IFNULL(AVG(grade),0) AS average
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY id
ORDER BY average DESC;


-- Print this first name, average, passing status of 75
+------------+---------+----------------+
| first_name | average | passing_status |
+------------+---------+----------------+
| Samantha   | 96.0000 | PASSING        |
| Carlos     | 89.0000 | PASSING        |
| Caleb      | 67.5000 | FAILING        |
| Lisa       |  0.0000 | FAILING        |
| Raj        |  0.0000 | FAILING        |
+------------+---------+----------------+
SELECT first_name , IFNULL(AVG(grade),0) AS average,
	CASE 
		WHEN Avg(grade) IS NULL THEN 'FAILING' 
		WHEN IFNULL(AVG(grade),0) >= 75 THEN 'PASSING'
		ELSE 'FAILING'
	END AS 'passing_status'
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY id
ORDER BY average DESC;

-- We added Avg(grade) IS NULL because when we run it it returns null
mysql> SELECT NULL >=75;
+-----------+
| NULL >=75 |
+-----------+
|      NULL |
+-----------+

/*-----------------------------------------------------------*/