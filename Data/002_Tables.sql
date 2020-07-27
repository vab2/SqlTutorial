/*-- Creating Your Own Tables --*/
/*------------------------------*/

-- Syntax for creating table
CREATE TABLE tablename
  (
    column_name data_type,
    column_name data_type
  );
  
-- Example   
CREATE TABLE cats
  (
    name VARCHAR(100),
    age INT
  );
  
/*-----------------------------------------------------------*/



/*-- Show Tables --*/
/*-----------------*/

SHOW TABLES;

SHOW COLUMNS FROM tablename;

DESC tablename;

/*-----------------------------------------------------------*/



/*-- Dropping Tables --*/
/*---------------------*/

-- Command for Dropping Tables
DROP TABLE <tablename>; 

-- Example:
DROP TABLE cats; 

-- Be careful with this command!

/*-----------------------------------------------------------*/
