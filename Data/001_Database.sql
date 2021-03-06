/*--  Creating Databases --*/
/*-------------------------*/



/*List all available databases:*/
SHOW databases; 

/*The general command for creating a database*/
CREATE DATABASE database_name; 

/*A specific example*/
CREATE DATABASE soap_store;

/*-----------------------------------------------------------*/



/*---DROPING DATABASE---*/
/*----------------------*/

/*To drop a database*/
DROP DATABASE database_name; 

/*For Example*/
DROP DATABASE hello_world_db; 

/*
Remember to be careful with this command! Once you drop a database, it's gone!
*/

/*-----------------------------------------------------------*/



/*---Using Databases---*/
/*---------------------*/

/* To USe a data base */
USE <database name>;
 
/*For Example*/
USE dog_walking_app;
 

SELECT database();

/*-----------------------------------------------------------*/
