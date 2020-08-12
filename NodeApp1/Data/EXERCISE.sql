-- Challenge 1

SELECT DATE_FORMAT(MIN(created_at), "%M %D %Y") as earliest_date FROM users;
+------------------+
| earliest_date    |
+------------------+
| August 15th 2019 |
+------------------+



-- Challenge 2

SELECT * FROM users 
WHERE  created_at = (SELECT Min(created_at) FROM   users); 
+--------------------------+---------------------+
| email                    | created_at          |
+--------------------------+---------------------+
| Jewell_Bogan28@gmail.com | 2019-08-15 08:42:29 |
+--------------------------+---------------------+




-- Challenge 3

SELECT Monthname(created_at) AS month, 
       Count(*)              AS count 
FROM   users 
GROUP  BY month 
ORDER  BY count DESC; 
+-----------+-------+
| month     | count |
+-----------+-------+
| May       |    53 |
| September |    52 |
| November  |    52 |
| March     |    51 |
| October   |    48 |
| February  |    45 |
| August    |    43 |
| June      |    40 |
| December  |    37 |
| April     |    36 |
| July      |    36 |
| January   |    32 |
+-----------+-------+



-- Challenge 4

SELECT Count(*) AS yahoo_users 
FROM   users 
WHERE  email LIKE '%@yahoo.com'; 
+-------------+
| yahoo_users |
+-------------+
|         178 |
+-------------+


-- Challenge 5

SELECT CASE 
         WHEN email LIKE '%@gmail.com' THEN 'gmail' 
         WHEN email LIKE '%@yahoo.com' THEN 'yahoo' 
         WHEN email LIKE '%@hotmail.com' THEN 'hotmail' 
         ELSE 'other' 
       end      AS provider, 
       Count(*) AS total_users 
FROM   users 
GROUP  BY provider 
ORDER  BY total_users DESC;
+----------+-------------+
| provider | total_users |
+----------+-------------+
| yahoo    |         178 |
| gmail    |         176 |
| hotmail  |         171 |
+----------+-------------+
