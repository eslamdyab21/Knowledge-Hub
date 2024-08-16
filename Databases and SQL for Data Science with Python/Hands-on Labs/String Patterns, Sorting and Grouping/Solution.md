
```sql
CREATE DATABASE HR;
USE HR;

CREATE TABLE EMPLOYEES (
	EMP_ID CHAR(9) NOT NULL, 
	F_NAME VARCHAR(15) NOT NULL,
	L_NAME VARCHAR(15) NOT NULL,
	SSN CHAR(9),
	B_DATE DATE,
	SEX CHAR,
	ADDRESS VARCHAR(30),
	JOB_ID CHAR(9),
	SALARY DECIMAL(10,2),
	MANAGER_ID CHAR(9),
	DEP_ID CHAR(9) NOT NULL,
	PRIMARY KEY (EMP_ID));
      
  CREATE TABLE JOB_HISTORY (
	EMPL_ID CHAR(9) NOT NULL, 
	START_DATE DATE,
	JOBS_ID CHAR(9) NOT NULL,
	DEPT_ID CHAR(9),
	PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
	JOB_IDENT CHAR(9) NOT NULL, 
	JOB_TITLE VARCHAR(30),
	MIN_SALARY DECIMAL(10,2),
	MAX_SALARY DECIMAL(10,2),
	PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
	DEPT_ID_DEP CHAR(9) NOT NULL, 
	DEP_NAME VARCHAR(15) ,
	MANAGER_ID CHAR(9),
	LOC_ID CHAR(9),
	PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
	LOCT_ID CHAR(9) NOT NULL,
	DEP_ID_LOC CHAR(9) NOT NULL,
	PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
```


```SQL
mysql> SHOW TABLES;
+--------------+
| Tables_in_HR |
+--------------+
| DEPARTMENTS  |
| EMPLOYEES    |
| JOBS         |
| JOB_HISTORY  |
| LOCATIONS    |
+--------------+
5 rows in set (0.00 sec)

```


The data (loaded with phpmyadmin)
```SQL
mysql> SELECT * FROM DEPARTMENTS LIMIT 3;
+-------------+-----------------+------------+--------+
| DEPT_ID_DEP | DEP_NAME        | MANAGER_ID | LOC_ID |
+-------------+-----------------+------------+--------+
| 2           | Architect Group | 30001      | L0001  |
| 5           | Software Group  | 30002      | L0002  |
| 7           | Design Team     | 30003      | L0003  |
+-------------+-----------------+------------+--------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM EMPLOYEES LIMIT 3;
+--------+--------+--------+--------+------------+------+------------------------+--------+-----------+------------+--------+
| EMP_ID | F_NAME | L_NAME | SSN    | B_DATE     | SEX  | ADDRESS                | JOB_ID | SALARY    | MANAGER_ID | DEP_ID |
+--------+--------+--------+--------+------------+------+------------------------+--------+-----------+------------+--------+
| E1001  | John   | Thomas | 123456 | 1976-09-01 | M    | 5631 Rice, OakPark,IL  | 100    | 100000.00 | 30001      | 2      |
| E1002  | Alice  | James  | 123457 | 1972-07-31 | F    | 980 Berry ln, Elgin,IL | 200    |  80000.00 | 30002      | 5      |
| E1003  | Steve  | Wells  | 123458 | 1980-10-08 | M    | 291 Springs, Gary,IL   | 300    |  50000.00 | 30002      | 5      |
+--------+--------+--------+--------+------------+------+------------------------+--------+-----------+------------+--------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM JOBS LIMIT 3;
+-----------+------------------------+------------+------------+
| JOB_IDENT | JOB_TITLE              | MIN_SALARY | MAX_SALARY |
+-----------+------------------------+------------+------------+
| 100       | Sr. Architect          |   60000.00 |  100000.00 |
| 200       | Sr. Software Developer |   60000.00 |   80000.00 |
| 220       | Sr. Designer           |   70000.00 |   90000.00 |
+-----------+------------------------+------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM JOB_HISTORY LIMIT 3;
+---------+------------+---------+---------+
| EMPL_ID | START_DATE | JOBS_ID | DEPT_ID |
+---------+------------+---------+---------+
| E1001   | 2000-08-01 | 100     | 2       |
| E1002   | 2001-08-01 | 200     | 5       |
| E1003   | 2001-08-16 | 300     | 5       |
+---------+------------+---------+---------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM LOCATIONS LIMIT 3;
+---------+------------+
| LOCT_ID | DEP_ID_LOC |
+---------+------------+
| L0001   | 2          |
| L0002   | 5          |
| L0003   | 7          |
+---------+------------+
3 rows in set (0.00 sec)
```



retrieve the first names `F_NAME` and last names `L_NAME` of all employees who live in `Elgin, IL`.
```sql
mysql> SELECT F_NAME, L_NAME FROM EMPLOYEES WHERE ADDRESS LIKE '%Elgin,IL%';
+--------+--------+
| F_NAME | L_NAME |
+--------+--------+
| Alice  | James  |
| Nancy  | Allen  |
| Ann    | Jacob  |
+--------+--------+
3 rows in set (0.00 sec)

```


identify the employees who were born during the 70s.
```SQL
mysql> SELECT F_NAME, L_NAME  FROM EMPLOYEES WHERE B_DATE LIKE '197%';
+--------+--------+
| F_NAME | L_NAME |
+--------+--------+
| John   | Thomas |
| Alice  | James  |
| Nancy  | Allen  |
| Mary   | Thomas |
+--------+--------+
4 rows in set (0.00 sec)
```


retrieve all employee records in department 5 where salary is between 60000 and 70000.
```SQL
mysql> SELECT F_NAME, L_NAME, SALARY, DEP_ID FROM EMPLOYEES WHERE DEP_ID = 5 AND (SALARY BETWEEN 60000 AND 70000);
+---------+--------+----------+--------+
| F_NAME  | L_NAME | SALARY   | DEP_ID |
+---------+--------+----------+--------+
| Santosh | Kumar  | 60000.00 | 5      |
| Ann     | Jacob  | 70000.00 | 5      |
+---------+--------+----------+--------+
2 rows in set (0.00 sec)
```


retrieve a list of employees ordered by department ID.
```SQL
mysql> SELECT F_NAME, L_NAME, DEP_ID FROM EMPLOYEES ORDER BY DEP_ID;
+---------+---------+--------+
| F_NAME  | L_NAME  | DEP_ID |
+---------+---------+--------+
| John    | Thomas  | 2      |
| Ahmed   | Hussain | 2      |
| Nancy   | Allen   | 2      |
| Alice   | James   | 5      |
| Steve   | Wells   | 5      |
| Santosh | Kumar   | 5      |
| Ann     | Jacob   | 5      |
| Mary    | Thomas  | 7      |
| Bharath | Gupta   | 7      |
| Andrea  | Jones   | 7      |
+---------+---------+--------+
10 rows in set (0.00 sec)

```


get the output of the same query in descending order of department ID, and within each deaprtment, the records should be ordered in descending alphabetical order by last name. For descending order.

```SQL
mysql> SELECT F_NAME, L_NAME, DEP_ID FROM EMPLOYEES ORDER BY DEP_ID DESC, L_NAME DESC;
+---------+---------+--------+
| F_NAME  | L_NAME  | DEP_ID |
+---------+---------+--------+
| Mary    | Thomas  | 7      |
| Andrea  | Jones   | 7      |
| Bharath | Gupta   | 7      |
| Steve   | Wells   | 5      |
| Santosh | Kumar   | 5      |
| Alice   | James   | 5      |
| Ann     | Jacob   | 5      |
| John    | Thomas  | 2      |
| Ahmed   | Hussain | 2      |
| Nancy   | Allen   | 2      |
+---------+---------+--------+
10 rows in set (0.00 sec)

```

retrieve the average salary for all employees in the EMPLOYEES table.

```SQL
mysql> SELECT AVG(SALARY) FROM EMPLOYEES;
+--------------+
| AVG(SALARY)  |
+--------------+
| 72000.000000 |
+--------------+
1 row in set (0.01 sec)
```


retrieve the  average salary for each department 
```sql
mysql> SELECT DEP_ID, AVG(SALARY) FROM EMPLOYEES GROUP BY DEP_ID;
+--------+--------------+
| DEP_ID | AVG(SALARY)  |
+--------+--------------+
| 2      | 86666.666667 |
| 5      | 65000.000000 |
| 7      | 66666.666667 |
+--------+--------------+
3 rows in set (0.00 sec)

```


For each department ID, we wish to retrieve the number of employees in the department.
```sql
mysql> SELECT DEP_ID, COUNT(*)  FROM EMPLOYEES  GROUP BY DEP_ID;
+--------+----------+
| DEP_ID | COUNT(*) |
+--------+----------+
| 2      |        3 |
| 5      |        4 |
| 7      |        3 |
+--------+----------+
3 rows in set (0.00 sec)

```



retrieve the number of employees in the department and the average employee salary in the department. For this, you can use COUNT(*) to retrieve the total count of a column, and AVG() function to compute average salaries, and then GROUP BY.
```SQL
mysql> SELECT DEP_ID, COUNT(*), AVG(SALARY) FROM EMPLOYEES GROUP BY DEP_ID;
+--------+----------+--------------+
| DEP_ID | COUNT(*) | AVG(SALARY)  |
+--------+----------+--------------+
| 2      |        3 | 86666.666667 |
| 5      |        4 | 65000.000000 |
| 7      |        3 | 66666.666667 |
+--------+----------+--------------+
3 rows in set (0.00 sec)
```

with labels
```sql
mysql> SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY" FROM EMPLOYEES GROUP BY DEP_ID;
+--------+---------------+--------------+
| DEP_ID | NUM_EMPLOYEES | AVG_SALARY   |
+--------+---------------+--------------+
| 2      |             3 | 86666.666667 |
| 5      |             4 | 65000.000000 |
| 7      |             3 | 66666.666667 |
+--------+---------------+--------------+
3 rows in set (0.00 sec)

```



You can also combine the usage of GROUP BY and ORDER BY statements to sort the output of each group in accordance with a specific parameter. It is important to note that in such a case, ORDER BY clause muct be used after the GROUP BY clause. For example, we can sort the result of the previous query by average salary.

```SQL
mysql> SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY" FROM EMPLOYEES GROUP BY DEP_ID ORDER BY AVG_SALARY;
+--------+---------------+--------------+
| DEP_ID | NUM_EMPLOYEES | AVG_SALARY   |
+--------+---------------+--------------+
| 5      |             4 | 65000.000000 |
| 7      |             3 | 66666.666667 |
| 2      |             3 | 86666.666667 |
+--------+---------------+--------------+
3 rows in set (0.00 sec)


mysql> SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY" FROM EMPLOYEES GROUP BY DEP_ID ORDER BY AVG_SALARY DESC;
+--------+---------------+--------------+
| DEP_ID | NUM_EMPLOYEES | AVG_SALARY   |
+--------+---------------+--------------+
| 2      |             3 | 86666.666667 |
| 7      |             3 | 66666.666667 |
| 5      |             4 | 65000.000000 |
+--------+---------------+--------------+
3 rows in set (0.00 sec)
```


In case you need to filter a grouped response, you have to use the HAVING clause. In the previous example, if we wish to limit the result to departments with fewer than 4 employees, We will have to use HAVING after the GROUP BY, and use the count() function in the HAVING clause instead of the column label.

```SQL
mysql> SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY" FROM EMPLOYEES GROUP BY DEP_ID HAVING NUM_EMPLOYEES < 4 ORDER BY AVG_SALARY DES
C;
+--------+---------------+--------------+
| DEP_ID | NUM_EMPLOYEES | AVG_SALARY   |
+--------+---------------+--------------+
| 2      |             3 | 86666.666667 |
| 7      |             3 | 66666.666667 |
+--------+---------------+--------------+
2 rows in set (0.00 sec)
```



Retrieve the list of all employees, first and last names, whose first names start with ‘S’.

```sql
mysql> SELECT F_NAME, L_NAME FROM EMPLOYEES WHERE F_NAME LIKE 'S%';
+---------+--------+
| F_NAME  | L_NAME |
+---------+--------+
| Steve   | Wells  |
| Santosh | Kumar  |
+---------+--------+
2 rows in set (0.00 sec)
```


Arrange all the records of the EMPLOYEES table in ascending order of the date of birth.
```SQL
mysql> SELECT F_NAME, L_NAME, B_DATE FROM EMPLOYEES ORDER BY B_DATE;
+---------+---------+------------+
| F_NAME  | L_NAME  | B_DATE     |
+---------+---------+------------+
| Alice   | James   | 1972-07-31 |
| Mary    | Thomas  | 1975-05-05 |
| John    | Thomas  | 1976-09-01 |
| Nancy   | Allen   | 1978-06-02 |
| Steve   | Wells   | 1980-10-08 |
| Ahmed   | Hussain | 1981-04-01 |
| Ann     | Jacob   | 1982-03-30 |
| Bharath | Gupta   | 1985-06-05 |
| Santosh | Kumar   | 1985-07-20 |
| Andrea  | Jones   | 1990-09-07 |
+---------+---------+------------+
10 rows in set (0.00 sec)
```


Group the records in terms of the department IDs and filter them of ones that have average salary more than or equal to 65000. Display the department ID and the average salary.

```SQL
mysql> SELECT DEP_ID, AVG(SALARY) AS 'AVG_SALARY' FROM EMPLOYEES GROUP BY DEP_ID HAVING AVG_SALARY > 65000;
+--------+--------------+
| DEP_ID | AVG_SALARY   |
+--------+--------------+
| 2      | 86666.666667 |
| 7      | 66666.666667 |
+--------+--------------+
2 rows in set (0.00 sec)
```


For the problem above, sort the results for each group in descending order of average salary.

```SQL
mysql> SELECT DEP_ID, AVG(SALARY) AS 'AVG_SALARY' FROM EMPLOYEES GROUP BY DEP_ID HAVING AVG_SALARY > 65000 ORDER BY AVG_SALARY DESC;
+--------+--------------+
| DEP_ID | AVG_SALARY   |
+--------+--------------+
| 2      | 86666.666667 |
| 7      | 66666.666667 |
+--------+--------------+
2 rows in set (0.00 sec)

```

![[Pasted image 20240816110933.png]]