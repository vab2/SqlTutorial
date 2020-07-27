/*-- Inserting Data --*/
/*--------------------*/

-- Syantax for inserting data:
INSERT INTO table_name(column_name) VALUES (data);

-- Example:
INSERT INTO cats(name, age) VALUES ('Jetson', 7);

/*-----------------------------------------------------------*/



/*-- Multiple Insert --*/
/*---------------------*/

-- Syantax
INSERT INTO table_name 
            (column_name, column_name) 
VALUES      (value, value), 
            (value, value), 
            (value, value);

-- Example
INSERT INTO cats(name, age)
VALUES          ('Blue',1), 
                ('Draco',11), 
                ('Penut',2),
                ('Butter',4), 
                ('Jelly',7);
				
/*-----------------------------------------------------------*/



/*-- Another Example --*/
/*---------------------*/

CREATE TABLE people
  (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
  );

INSERT INTO people  (first_name, last_name, age)
VALUES              ('Tina', 'Belcher', 13);

INSERT INTO people  (age, last_name, first_name)
VALUES              (42, 'Belcher', 'Bob');

INSERT INTO people  (first_name, last_name, age)
VALUES              ('Linda', 'Belcher', 45)
                    ,('Phillip', 'Frond', 38)
                    ,('Calvin', 'Fischoeder', 70);

/*-----------------------------------------------------------*/




/*-- Using quotes inside of inserted values --*/
/*--------------------------------------------*/

/*

 You can do it a couple of ways:

Escape the quotes with a backslash: 
    "This text has \"quotes\" in it" 
        or 
    'This text has \'quotes\' in it'

Alternate single and double quotes: 
    "This text has 'quotes' in it" 
        or 
    'This text has "quotes" in it'
	
*/

/*-----------------------------------------------------------*/



/*-- MySQL Warnings --*/
/*--------------------*/

-- Try Inserting a cat with a super long name:
INSERT INTO cats(name, age)
VALUES('This is some text blah blah blah blah blah text text text something about cats lalalalal meowwwwwwwwwww', 10);
-- Then view the warning with below command:
SHOW WARNINGS; 

/*
	Output
	Level	Code	Message
	Error	1406	Data too long for column 'name' at row 1
*/


-- Try inserting a cat with incorrect data types:
INSERT INTO cats(name, age) VALUES('Lima', 'dsfasdfdas'); 
-- Then view the warning:
SHOW WARNINGS;

/*
	Output
	Level	Code	Message
	Error	1366	Incorrect integer value: 'dsfasdfdas' for column 'age' at row 1
*/ 

	
/*-----------------------------------------------------------*/


/*-- Primary Keys --*/
/*------------------*/

-- Define a table with a PRIMARY KEY constraint:
CREATE TABLE unique_cats
  (
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
  );
  
DESC unique_cats; 
/*
	Field	Type			Null 	Key		Default		Extra
	---------------------------------------------------------
	cat_id	int(11)			NO		PRI		
	name	varchar(100)	YES			
	age		int(11)			YES			
*/


-- Insert some new cats data:
INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'Fred', 23);
INSERT INTO unique_cats(cat_id, name, age) VALUES(2, 'Louise', 3);
INSERT INTO unique_cats(cat_id, name, age) VALUES(1, 'James', 3);
-- Notice what happens:
/*
	Level	Code	Message
	Error	1062	Duplicate entry '1' for key 'PRIMARY'
*/

SELECT * FROM unique_cats; 

/*-----------------------------------------------------------*/



/*-- Adding in AUTO_INCREMENT --*/
/*------------------------------*/

CREATE TABLE unique_cats2 (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);


--INSERT a couple new cats:
INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Jiff', 3);
INSERT INTO unique_cats2(name, age) VALUES('Skippy', 4);

-- Notice the difference:
SELECT * FROM unique_cats2; 
/*
	cat_id	name	age
	1		Skippy	4
	2		Jiff	3
	3		Jiff	3
	4		Jiff	3
	5		Skippy	4
*/

--Other examples
CREATE TABLE employees(
     id INT NOT NULL AUTO_INCREMENT,
     last_name VARCHAR(50) NOT NULL,
     first_name VARCHAR(50) NOT NULL,
     middle_name VARCHAR(50),
     age INT NOT NULL,
     current_status VARCHAR(50) NOT NULL DEFAULT 'employed',
     PRIMARY KEY (id)
     );
     
     
	 
-- Another way of defining a primary key
CREATE TABLE employees (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed'
);

/*-----------------------------------------------------------*/