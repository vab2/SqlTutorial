/*-- SELF JOIN --*/
/*-----------------*/

/*
SELF JOIN(Join A with A) 

1) To perform a self join, you must use table aliases to not repeat the same table name 
twice in a single query. Note that referencing a table twice or more in a query 
without using table aliases will cause an error.
*/

source SelfJoin/mysqlsampledatabase.sql

mysql> SELECT * FROM employees;
+----------------+-----------+-----------+-----------+---------------------------------+------------+-----------+----------------------+
| employeeNumber | lastName  | firstName | extension | email                           | officeCode | reportsTo | jobTitle             |
+----------------+-----------+-----------+-----------+---------------------------------+------------+-----------+----------------------+
|           1002 | Murphy    | Diane     | x5800     | dmurphy@classicmodelcars.com    | 1          |      NULL | President            |
|           1056 | Patterson | Mary      | x4611     | mpatterso@classicmodelcars.com  | 1          |      1002 | VP Sales             |
|           1076 | Firrelli  | Jeff      | x9273     | jfirrelli@classicmodelcars.com  | 1          |      1002 | VP Marketing         |
|           1088 | Patterson | William   | x4871     | wpatterson@classicmodelcars.com | 6          |      1056 | Sales Manager (APAC) |
|           1102 | Bondur    | Gerard    | x5408     | gbondur@classicmodelcars.com    | 4          |      1056 | Sale Manager (EMEA)  |
|           1143 | Bow       | Anthony   | x5428     | abow@classicmodelcars.com       | 1          |      1056 | Sales Manager (NA)   |
|           1165 | Jennings  | Leslie    | x3291     | ljennings@classicmodelcars.com  | 1          |      1143 | Sales Rep            |
|           1166 | Thompson  | Leslie    | x4065     | lthompson@classicmodelcars.com  | 1          |      1143 | Sales Rep            |
|           1188 | Firrelli  | Julie     | x2173     | jfirrelli@classicmodelcars.com  | 2          |      1143 | Sales Rep            |
|           1216 | Patterson | Steve     | x4334     | spatterson@classicmodelcars.com | 2          |      1143 | Sales Rep            |
|           1286 | Tseng     | Foon Yue  | x2248     | ftseng@classicmodelcars.com     | 3          |      1143 | Sales Rep            |
|           1323 | Vanauf    | George    | x4102     | gvanauf@classicmodelcars.com    | 3          |      1143 | Sales Rep            |
|           1337 | Bondur    | Loui      | x6493     | lbondur@classicmodelcars.com    | 4          |      1102 | Sales Rep            |
|           1370 | Hernandez | Gerard    | x2028     | ghernande@classicmodelcars.com  | 4          |      1102 | Sales Rep            |
|           1401 | Castillo  | Pamela    | x2759     | pcastillo@classicmodelcars.com  | 4          |      1102 | Sales Rep            |
|           1501 | Bott      | Larry     | x2311     | lbott@classicmodelcars.com      | 7          |      1102 | Sales Rep            |
|           1504 | Jones     | Barry     | x102      | bjones@classicmodelcars.com     | 7          |      1102 | Sales Rep            |
|           1611 | Fixter    | Andy      | x101      | afixter@classicmodelcars.com    | 6          |      1088 | Sales Rep            |
|           1612 | Marsh     | Peter     | x102      | pmarsh@classicmodelcars.com     | 6          |      1088 | Sales Rep            |
|           1619 | King      | Tom       | x103      | tking@classicmodelcars.com      | 6          |      1088 | Sales Rep            |
|           1621 | Nishi     | Mami      | x101      | mnishi@classicmodelcars.com     | 5          |      1056 | Sales Rep            |
|           1625 | Kato      | Yoshimi   | x102      | ykato@classicmodelcars.com      | 5          |      1621 | Sales Rep            |
|           1702 | Gerard    | Martin    | x2312     | mgerard@classicmodelcars.com    | 4          |      1102 | Sales Rep            |
+----------------+-----------+-----------+-----------+---------------------------------+------------+-----------+----------------------+



/*
To get the whole organization structure, you can join the employees table to itself 
using the employeeNumber and reportsTo columns. The table employees has two roles: 
one is the Manager and the other is Direct Reports.
*/
SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;
+--------------------+--------------------+
| Manager            | Direct report      |
+--------------------+--------------------+
| Bondur, Gerard     | Castillo, Pamela   |
| Bondur, Gerard     | Hernandez, Gerard  |
| Bondur, Gerard     | Bondur, Loui       |
| Bondur, Gerard     | Gerard, Martin     |
| Bondur, Gerard     | Jones, Barry       |
| Bondur, Gerard     | Bott, Larry        |
| Bow, Anthony       | Firrelli, Julie    |
| Bow, Anthony       | Thompson, Leslie   |
| Bow, Anthony       | Jennings, Leslie   |
| Bow, Anthony       | Vanauf, George     |
| Bow, Anthony       | Tseng, Foon Yue    |
| Bow, Anthony       | Patterson, Steve   |
| Murphy, Diane      | Firrelli, Jeff     |
| Murphy, Diane      | Patterson, Mary    |
| Nishi, Mami        | Kato, Yoshimi      |
| Patterson, Mary    | Patterson, William |
| Patterson, Mary    | Bow, Anthony       |
| Patterson, Mary    | Bondur, Gerard     |
| Patterson, Mary    | Nishi, Mami        |
| Patterson, William | King, Tom          |
| Patterson, William | Marsh, Peter       |
| Patterson, William | Fixter, Andy       |
+--------------------+--------------------+


/*
2) MySQL self join using LEFT JOIN clause
The President is the employee who does not have any manager or the value in the reportsTo column is NULL .

The following statement uses the LEFT JOIN clause instead of INNER JOIN to include the President:
*/
SELECT 
    IFNULL(CONCAT(m.lastname, ', ', m.firstname),
            'Top Manager') AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM
    employees e
LEFT JOIN employees m ON 
    m.employeeNumber = e.reportsto
ORDER BY 
    manager DESC;
+--------------------+--------------------+
| Manager            | Direct report      |
+--------------------+--------------------+
| Top Manager        | Murphy, Diane      |
| Patterson, William | King, Tom          |
| Patterson, William | Marsh, Peter       |
| Patterson, William | Fixter, Andy       |
| Patterson, Mary    | Patterson, William |
| Patterson, Mary    | Bow, Anthony       |
| Patterson, Mary    | Bondur, Gerard     |
| Patterson, Mary    | Nishi, Mami        |
| Nishi, Mami        | Kato, Yoshimi      |
| Murphy, Diane      | Firrelli, Jeff     |
| Murphy, Diane      | Patterson, Mary    |
| Bow, Anthony       | Firrelli, Julie    |
| Bow, Anthony       | Thompson, Leslie   |
| Bow, Anthony       | Jennings, Leslie   |
| Bow, Anthony       | Vanauf, George     |
| Bow, Anthony       | Tseng, Foon Yue    |
| Bow, Anthony       | Patterson, Steve   |
| Bondur, Gerard     | Hernandez, Gerard  |
| Bondur, Gerard     | Bondur, Loui       |
| Bondur, Gerard     | Gerard, Martin     |
| Bondur, Gerard     | Jones, Barry       |
| Bondur, Gerard     | Bott, Larry        |
| Bondur, Gerard     | Castillo, Pamela   |
+--------------------+--------------------+	



/*
3) Using MySQL self join to compare successive rows
By using the MySQL self join, you can display a list of customers 
who locate in the same city by joining the customers table to itself.
*/
SELECT 
    c1.city, 
    c1.customerName, 
    c2.customerName
FROM
    customers c1
INNER JOIN customers c2 ON 
    c1.city = c2.city
    AND c1.customername > c2.customerName
ORDER BY 
    c1.city;
+---------------+------------------------------+--------------------------------+
| city          | customerName                 | customerName                   |
+---------------+------------------------------+--------------------------------+
| Auckland      | GiftsForHim.com              | Down Under Souveniers, Inc     |
| Auckland      | Kelly's Gift Shop            | GiftsForHim.com                |
| Auckland      | Kelly's Gift Shop            | Down Under Souveniers, Inc     |
| Boston        | Gifts4AllAges.com            | Diecast Collectables           |
| Brickhaven    | Collectables For Less Inc.   | Auto-Moto Classics Inc.        |
..................................................................................
Continue
..................................................................................










