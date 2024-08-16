
# LOAD DATA
```SQL

drop table if exists PETRESCUE;

create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);

insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;
```

<br/>
<br/>

Write a query that calculates the total cost of all animal rescues in the PETRESCUE table.

```sql
mysql> SELECT SUM(COST) FROM PETRESCUE;
+-----------+
| SUM(COST) |
+-----------+
|   1718.24 |
+-----------+
1 row in set (0.00 sec)

```

<br/>

We can assign a label to it
```sql
mysql> SELECT SUM(COST) AS SUM_OF_COST FROM PETRESCUE;
+-------------+
| SUM_OF_COST |
+-------------+
|     1718.24 |
+-------------+
1 row in set (0.00 sec)
```

<br/>
<br/>

Write a query that displays the maximum quantity of animals rescued (of any kind).
```sql
mysql> SELECT MAX(QUANTITY) FROM PETRESCUE;
+---------------+
| MAX(QUANTITY) |
+---------------+
|            24 |
+---------------+
1 row in set (0.02 sec)

```

<br/>
<br/>
# Scalar Functions and String Functions
Write a query that displays the rounded integral cost of each rescue.

```SQL
mysql> SELECT ROUND(COST,1) FROM PETRESCUE;
+---------------+
| ROUND(COST,1) |
+---------------+
|         450.1 |
|         666.7 |
|         100.0 |
|          50.0 |
|          75.8 |
|          60.6 |
|          44.4 |
|          48.5 |
|         222.2 |
+---------------+
9 rows in set (0.00 sec)


mysql> SELECT ROUND(COST,2) FROM PETRESCUE;
+---------------+
| ROUND(COST,2) |
+---------------+
|        450.09 |
|        666.66 |
|        100.00 |
|         50.00 |
|         75.75 |
|         60.60 |
|         44.44 |
|         48.48 |
|        222.22 |
+---------------+
9 rows in set (0.00 sec)
```

<br/>

Write a query that displays the length of each animal name.
```SQL
mysql> SELECT ANIMAL, LENGTH(ANIMAL) FROM PETRESCUE;
+----------+----------------+
| ANIMAL   | LENGTH(ANIMAL) |
+----------+----------------+
| Cat      |              3 |
| Dog      |              3 |
| Dog      |              3 |
| Parrot   |              6 |
| Dog      |              3 |
| Hamster  |              7 |
| Cat      |              3 |
| Goldfish |              8 |
| Dog      |              3 |
+----------+----------------+
9 rows in set (0.00 sec)

```


Write a query that displays the animal name in each rescue in uppercase.
```SQL
mysql> SELECT ANIMAL, UCASE(ANIMAL) FROM PETRESCUE;
+----------+---------------+
| ANIMAL   | UCASE(ANIMAL) |
+----------+---------------+
| Cat      | CAT           |
| Dog      | DOG           |
| Dog      | DOG           |
| Parrot   | PARROT        |
| Dog      | DOG           |
| Hamster  | HAMSTER       |
| Cat      | CAT           |
| Goldfish | GOLDFISH      |
| Dog      | DOG           |
+----------+---------------+
9 rows in set (0.01 sec)


mysql> SELECT ANIMAL, LCASE(ANIMAL) FROM PETRESCUE;
+----------+---------------+
| ANIMAL   | LCASE(ANIMAL) |
+----------+---------------+
| Cat      | cat           |
| Dog      | dog           |
| Dog      | dog           |
| Parrot   | parrot        |
| Dog      | dog           |
| Hamster  | hamster       |
| Cat      | cat           |
| Goldfish | goldfish      |
| Dog      | dog           |
+----------+---------------+
9 rows in set (0.01 sec)
```

<br/>
<br/>
# Date Functions

<br/>

Write a query that displays the rescue date.
```SQL
mysql> SELECT RESCUEDATE, DAY(RESCUEDATE), MONTH(RESCUEDATE), YEAR(RESCUEDATE) FROM PETRESCUE;
+------------+-----------------+-------------------+------------------+
| RESCUEDATE | DAY(RESCUEDATE) | MONTH(RESCUEDATE) | YEAR(RESCUEDATE) |
+------------+-----------------+-------------------+------------------+
| 2018-05-29 |              29 |                 5 |             2018 |
| 2018-06-01 |               1 |                 6 |             2018 |
| 2018-06-04 |               4 |                 6 |             2018 |
| 2018-06-04 |               4 |                 6 |             2018 |
| 2018-06-10 |              10 |                 6 |             2018 |
| 2018-06-11 |              11 |                 6 |             2018 |
| 2018-06-11 |              11 |                 6 |             2018 |
| 2018-06-14 |              14 |                 6 |             2018 |
| 2018-06-15 |              15 |                 6 |             2018 |
+------------+-----------------+-------------------+------------------+
9 rows in set (0.00 sec)

```

<br/>

Animals rescued should see the vet within three days of arrival. Write a query that displays the third day of each rescue.

```SQL
mysql> SELECT DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;
+--------------------------------------+
| DATE_ADD(RESCUEDATE, INTERVAL 3 DAY) |
+--------------------------------------+
| 2018-06-01                           |
| 2018-06-04                           |
| 2018-06-07                           |
| 2018-06-07                           |
| 2018-06-13                           |
| 2018-06-14                           |
| 2018-06-14                           |
| 2018-06-17                           |
| 2018-06-18                           |
+--------------------------------------+
9 rows in set (0.00 sec)

mysql> SELECT RESCUEDATE, DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH) FROM PETRESCUE;
+------------+----------------------------------------+
| RESCUEDATE | DATE_ADD(RESCUEDATE, INTERVAL 2 MONTH) |
+------------+----------------------------------------+
| 2018-05-29 | 2018-07-29                             |
| 2018-06-01 | 2018-08-01                             |
| 2018-06-04 | 2018-08-04                             |
| 2018-06-04 | 2018-08-04                             |
| 2018-06-10 | 2018-08-10                             |
| 2018-06-11 | 2018-08-11                             |
| 2018-06-11 | 2018-08-11                             |
| 2018-06-14 | 2018-08-14                             |
| 2018-06-15 | 2018-08-15                             |
+------------+----------------------------------------+
9 rows in set (0.00 sec)


mysql> SELECT RESCUEDATE, DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;
+------------+--------------------------------------+
| RESCUEDATE | DATE_SUB(RESCUEDATE, INTERVAL 3 DAY) |
+------------+--------------------------------------+
| 2018-05-29 | 2018-05-26                           |
| 2018-06-01 | 2018-05-29                           |
| 2018-06-04 | 2018-06-01                           |
| 2018-06-04 | 2018-06-01                           |
| 2018-06-10 | 2018-06-07                           |
| 2018-06-11 | 2018-06-08                           |
| 2018-06-11 | 2018-06-08                           |
| 2018-06-14 | 2018-06-11                           |
| 2018-06-15 | 2018-06-12                           |
+------------+--------------------------------------+
9 rows in set (0.00 sec)

```



<br/>

Write a query that displays the length of time the animals have been rescued, for example, the difference between the current date and the rescue date.

<br/>

For this query, we will use the function `DATEDIFF(Date_1, Date_2)`. This function calculates the difference between the two given dates and gives the output in number of days. For the given question, the query would be:

<br/>

To present the output in a YYYY-MM-DD format, another function `FROM_DAYS(number_of_days)`can be used. This function takes a number of days and returns the required formatted output

```SQL
mysql> SELECT CURRENT_DATE, RESCUEDATE, DATEDIFF(CURRENT_DATE, RESCUEDATE) FROM PETRESCUE;
+--------------+------------+------------------------------------+
| CURRENT_DATE | RESCUEDATE | DATEDIFF(CURRENT_DATE, RESCUEDATE) |
+--------------+------------+------------------------------------+
| 2024-08-16   | 2018-05-29 |                               2271 |
| 2024-08-16   | 2018-06-01 |                               2268 |
| 2024-08-16   | 2018-06-04 |                               2265 |
| 2024-08-16   | 2018-06-04 |                               2265 |
| 2024-08-16   | 2018-06-10 |                               2259 |
| 2024-08-16   | 2018-06-11 |                               2258 |
| 2024-08-16   | 2018-06-11 |                               2258 |
| 2024-08-16   | 2018-06-14 |                               2255 |
| 2024-08-16   | 2018-06-15 |                               2254 |
+--------------+------------+------------------------------------+
9 rows in set (0.00 sec)



mysql> SELECT CURRENT_DATE, RESCUEDATE, FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE)) FROM PETRESCUE;
+--------------+------------+-----------------------------------------------+
| CURRENT_DATE | RESCUEDATE | FROM_DAYS(DATEDIFF(CURRENT_DATE, RESCUEDATE)) |
+--------------+------------+-----------------------------------------------+
| 2024-08-16   | 2018-05-29 | 0006-03-21                                    |
| 2024-08-16   | 2018-06-01 | 0006-03-18                                    |
| 2024-08-16   | 2018-06-04 | 0006-03-15                                    |
| 2024-08-16   | 2018-06-04 | 0006-03-15                                    |
| 2024-08-16   | 2018-06-10 | 0006-03-09                                    |
| 2024-08-16   | 2018-06-11 | 0006-03-08                                    |
| 2024-08-16   | 2018-06-11 | 0006-03-08                                    |
| 2024-08-16   | 2018-06-14 | 0006-03-05                                    |
| 2024-08-16   | 2018-06-15 | 0006-03-04                                    |
+--------------+------------+-----------------------------------------------+
9 rows in set (0.00 sec)
```


<br/>
<br/>

# Practice Problems

Write a query that displays the average cost of rescuing a single dog. Note that the cost per dog would not be the same in different instances.

```SQL
mysql> SELECT ANIMAL, AVG(COST) FROM PETRESCUE GROUP BY ANIMAL;
+----------+------------+
| ANIMAL   | AVG(COST)  |
+----------+------------+
| Cat      | 247.265000 |
| Dog      | 266.157500 |
| Parrot   |  50.000000 |
| Hamster  |  60.600000 |
| Goldfish |  48.480000 |
+----------+------------+
5 rows in set (0.01 sec)
```

a hint For such a problem, you must use the `AVG` function on `COST/QUANTITY`, for example, cost per unit quantity.
```SQL
mysql> SELECT ANIMAL, AVG(COST/QUANTITY) FROM PETRESCUE GROUP BY ANIMAL;
+----------+--------------------+
| ANIMAL   | AVG(COST/QUANTITY) |
+----------+--------------------+
| Cat      |      47.2250000000 |
| Dog      |     127.2700000000 |
| Parrot   |      25.0000000000 |
| Hamster  |      10.1000000000 |
| Goldfish |       2.0200000000 |
+----------+--------------------+
5 rows in set (0.00 sec)


mysql> SELECT ANIMAL, AVG(COST/QUANTITY) FROM PETRESCUE WHERE ANIMAL = "Dog";
+--------+--------------------+
| ANIMAL | AVG(COST/QUANTITY) |
+--------+--------------------+
| Dog    |     127.2700000000 |
+--------+--------------------+
1 row in set (0.01 sec)
```

<br/>

Write a query that displays the animal name in each rescue in uppercase without duplications.
```sql
mysql> SELECT DISTINCT(UCASE(ANIMAL)) FROM PETRESCUE;
+-----------------+
| (UCASE(ANIMAL)) |
+-----------------+
| CAT             |
| DOG             |
| PARROT          |
| HAMSTER         |
| GOLDFISH        |
+-----------------+
5 rows in set (0.01 sec)


mysql> SELECT DISTINCT UCASE(ANIMAL) FROM PETRESCUE;
+---------------+
| UCASE(ANIMAL) |
+---------------+
| CAT           |
| DOG           |
| PARROT        |
| HAMSTER       |
| GOLDFISH      |
+---------------+
5 rows in set (0.00 sec)

```

<br/>

Write a query that displays all the columns from the PETRESCUE table where the animal(s) rescued are cats. Use **cat** in lowercase in the query.
```sql
mysql> SELECT * FROM PETRESCUE WHERE LCASE(ANIMAL) = 'cat';
+----+--------+----------+--------+------------+
| ID | ANIMAL | QUANTITY | COST   | RESCUEDATE |
+----+--------+----------+--------+------------+
|  1 | Cat    |        9 | 450.09 | 2018-05-29 |
|  7 | Cat    |        1 |  44.44 | 2018-06-11 |
+----+--------+----------+--------+------------+
2 rows in set (0.00 sec)
```

<br/>

Write a query that displays the number of rescues in the 5th month.
```sql
mysql> SELECT SUM(QUANTITY) FROM PETRESCUE WHERE MONTH(RESCUEDATE) = '05';
+---------------+
| SUM(QUANTITY) |
+---------------+
|             9 |
+---------------+
1 row in set (0.00 sec)
```

<br/>

The rescue shelter is supposed to find good homes for all animals within 1 year of their rescue. Write a query that displays the ID and the target date.
```SQL
mysql> SELECT ID, DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) FROM PETRESCUE;
+----+---------------------------------------+
| ID | DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) |
+----+---------------------------------------+
|  1 | 2019-05-29                            |
|  2 | 2019-06-01                            |
|  3 | 2019-06-04                            |
|  4 | 2019-06-04                            |
|  5 | 2019-06-10                            |
|  6 | 2019-06-11                            |
|  7 | 2019-06-11                            |
|  8 | 2019-06-14                            |
|  9 | 2019-06-15                            |
+----+---------------------------------------+
9 rows in set (0.00 sec)
```