/*-----------------------------------------------------------*/



/*-- Database Triggers --*/
/*-----------------------*/


-- SQL statements that are AUTOMATICALLY RUN when a specific table is changed

CREATE TRIGGER trigger_name 
    trigger_time trigger_event ON table_name FOR EACH ROW
    BEGIN
    ...
    END;
/*
trigger_time = BEFORE/AFTER
trigger_event = INSERT/UPDATE/DELETE
ON table_name = photos/users
*/
        
	
CREATE DATABASE trigger_demo;
USE trigger_demo;

CREATE TABLE users (
	username VARCHAR(100),
	age INT
);
INSERT INTO users (username,age) VALUES("bobby",23);

mysql> SELECT * FROM users;
+----------+------+
| username | age  |
+----------+------+
| bobby    |   23 |
+----------+------+



/*-----------------------------------------------------------*/



/*-- A Simple Validation --*/
/*-------------------------*/

DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;


/*
				MySQL Errors

A numeric error code (1146). This number is MySQL-specific

A five-character SQLSTATE value ('42S02'). 
The values are taken from ANSI SQL and ODBC and are more standardized.

A message string - textual description of the error
*/



/*-----------------------------------------------------------*/



/*-- Preventing Self-Follows --*/
/*-----------------------------*/



mysql> INSERT INTO follows(follower_id, followee_id) VALUES (4,4);
Query OK, 1 row affected (0.00 sec)


-- Writting trigger to prevent 
DELIMITER $$

CREATE TRIGGER prevents_self_follow
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
		IF NEW.follower_id = NEW.followee_id
		THEN
			 SIGNAL SQLSTATE '45000'
			 SET MESSAGE_TEXT = 'You cannot follow yourself!!';
		END IF;
     END;
$$

DELIMITER ;

mysql> INSERT INTO follows(follower_id, followee_id) VALUES (5,5);
ERROR 1644 (45000): You cannot follow yourself!!


/*-----------------------------------------------------------*/



/*-- Logging Unfollows --*/
/*-----------------------*/

CREATE TABLE unfollows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);


mysql> SELECT * FROM unfollows;
Empty set (0.00 sec)



DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
END$$

DELIMITER ;



mysql> SELECT * FROM follows LIMIT 5;
+-------------+-------------+---------------------+
| follower_id | followee_id | created_at          |
+-------------+-------------+---------------------+
|           2 |           1 | 2020-08-12 15:06:42 |
|           2 |           3 | 2020-08-12 15:06:42 |
|           2 |           4 | 2020-08-12 15:06:42 |
|           2 |           5 | 2020-08-12 15:06:42 |
|           2 |           6 | 2020-08-12 15:06:42 |
+-------------+-------------+---------------------+



DELETE FROM follows WHERE follower_id=2 AND followee_id=3;


mysql> SELECT * FROM unfollows;
+-------------+-------------+---------------------+
| follower_id | followee_id | created_at          |
+-------------+-------------+---------------------+
|           2 |           3 | 2020-08-12 15:47:07 |
+-------------+-------------+---------------------+



/*-----------------------------------------------------------*/



/*-- Managing Triggers --*/
/*-----------------------*/

SHOW TRIGGERS;


DROP TRIGGER trigger_name;


