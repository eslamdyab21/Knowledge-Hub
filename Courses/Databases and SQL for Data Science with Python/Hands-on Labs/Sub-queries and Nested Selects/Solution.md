retrieve all employee records whose salary is lower than the average salary.
```sql
mysql> SELECT * FROM EMPLOYEES WHERE SALARY < AVG(SALARY);
ERROR 1111 (HY000): Invalid use of group function
```

However, this query will generate an error stating, "Illegal use of group function." Here, the group function is `AVG` and cannot be used directly in the condition since it has not been retrieved from the data. Therefore, the condition will use a sub-query to retrieve the average salary information to compare the existing salary. The modified query would become:

```SQL
mysql> SELECT F_NAME, L_NAME, SALARY FROM EMPLOYEES WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);
+---------+---------+----------+
| F_NAME  | L_NAME  | SALARY   |
+---------+---------+----------+
| Steve   | Wells   | 50000.00 |
| Santosh | Kumar   | 60000.00 |
| Ahmed   | Hussain | 70000.00 |
| Mary    | Thomas  | 65000.00 |
| Bharath | Gupta   | 65000.00 |
| Andrea  | Jones   | 70000.00 |
| Ann     | Jacob   | 70000.00 |
+---------+---------+----------+
7 rows in set (0.00 sec) 
```


<br/>

Now, consider executing a query that retrieves all employee records with EMP_ID, SALARY, and maximum salary as MAX_SALARY in every row
```SQL
mysql> SELECT EMP_ID, SALARY, MAX(SALARY) AS MAX_SALARY FROM EMPLOYEES;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'HR.EMPLOYEES.EMP_ID'; this is incompatible with sql_mode=only_full_group_by
```

```SQL
mysql> SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY FROM EMPLOYEES;
+--------+-----------+------------+
| EMP_ID | SALARY    | MAX_SALARY |
+--------+-----------+------------+
| E1001  | 100000.00 |  100000.00 |
| E1002  |  80000.00 |  100000.00 |
| E1003  |  50000.00 |  100000.00 |
| E1004  |  60000.00 |  100000.00 |
| E1005  |  70000.00 |  100000.00 |
| E1006  |  90000.00 |  100000.00 |
| E1007  |  65000.00 |  100000.00 |
| E1008  |  65000.00 |  100000.00 |
| E1009  |  70000.00 |  100000.00 |
| E1010  |  70000.00 |  100000.00 |
+--------+-----------+------------+
10 rows in set (0.00 sec)
```

<br/>

extract the first and last names of the oldest employee
```SQL
mysql> SELECT F_NAME, L_NAME FROM EMPLOYEES WHERE B_DATE = MIN(B_DATE);
ERROR 1111 (HY000): Invalid use of group function
```

```SQL
mysql> SELECT F_NAME, L_NAME, B_DATE FROM EMPLOYEES WHERE B_DATE = (SELECT MIN(B_DATE) FROM EMPLOYEES);
+--------+--------+------------+
| F_NAME | L_NAME | B_DATE     |
+--------+--------+------------+
| Alice  | James  | 1972-07-31 |
+--------+--------+------------+
1 row in set (0.00 sec)
```

<br/>

you want to know the average salary of the top 5 earners in the company.

```SQL
mysql> SELECT AVG(SALARY) FROM (SELECT SALARY FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 5) AS SALARY_TABLE;
+--------------+
| AVG(SALARY)  |
+--------------+
| 82000.000000 |
+--------------+
1 row in set (0.00 sec)
```

<br/>
<br/>
# Practice Problems
Write a query to find the average salary of the five least-earning employees.
```SQL
mysql> SELECT AVG(SALARY) FROM (SELECT SALARY FROM EMPLOYEES ORDER BY SALARY LIMIT 5) AS SALARY_TABLE;
+--------------+
| AVG(SALARY)  |
+--------------+
| 62000.000000 |
+--------------+
1 row in set (0.00 sec)
```


<br/>

Write a query to find the records of employees older than the average age of all employees.

```SQL
mysql> SELECT F_NAME, L_NAME, B_DATE FROM EMPLOYEES WHERE (YEAR(CURRENT_DATE) - YEAR(B_DATE))  > ( SELECT AVG(YEAR(CURRENT_DATE) - YEAR(B_DATE)) FROM EMPLOYEES );
+--------+--------+------------+
| F_NAME | L_NAME | B_DATE     |
+--------+--------+------------+
| John   | Thomas | 1976-09-01 |
| Alice  | James  | 1972-07-31 |
| Steve  | Wells  | 1980-10-08 |
| Nancy  | Allen  | 1978-06-02 |
| Mary   | Thomas | 1975-05-05 |
+--------+--------+------------+
5 rows in set (0.00 sec)

```


```SQL
mysql> SELECT F_NAME, L_NAME, B_DATE, (YEAR(CURRENT_DATE) - YEAR(B_DATE)) AS 'DATE_YEAR', 
(SELECT AVG((YEAR(CURRENT_DATE) - YEAR(B_DATE))) FROM EMPLOYEES) AS 'DATE_YEAR_AVG' 
FROM EMPLOYEES 
WHERE (YEAR(CURRENT_DATE) - YEAR(B_DATE))  > ( SELECT AVG(YEAR(CURRENT_DATE) - YEAR(B_DATE)) FROM EMPLOYEES );
+--------+--------+------------+-----------+---------------+
| F_NAME | L_NAME | B_DATE     | DATE_YEAR | DATE_YEAR_AVG |
+--------+--------+------------+-----------+---------------+
| John   | Thomas | 1976-09-01 |        48 |       43.6000 |
| Alice  | James  | 1972-07-31 |        52 |       43.6000 |
| Steve  | Wells  | 1980-10-08 |        44 |       43.6000 |
| Nancy  | Allen  | 1978-06-02 |        46 |       43.6000 |
| Mary   | Thomas | 1975-05-05 |        49 |       43.6000 |
+--------+--------+------------+-----------+---------------+
5 rows in set (0.00 sec)
```


<br/>

From the Job_History table, display the list of Employee IDs, years of service, and average years of service for all entries.
```SQL
mysql> SELECT EMPL_ID, START_DATE, 
(YEAR(CURRENT_DATE) - YEAR(START_DATE)) AS YEARS_OF_SERVICE, (SELECT AVG((YEAR(CURRENT_DATE) - YEAR(START_DATE))) FROM JOB_HISTORY) AS 'AVG_YEARS_OF_SERVICE' FROM JOB_HISTORY;
+---------+------------+------------------+----------------------+
| EMPL_ID | START_DATE | YEARS_OF_SERVICE | AVG_YEARS_OF_SERVICE |
+---------+------------+------------------+----------------------+
| E1001   | 2000-08-01 |               24 |              19.3000 |
| E1002   | 2001-08-01 |               23 |              19.3000 |
| E1003   | 2001-08-16 |               23 |              19.3000 |
| E1004   | 2000-08-16 |               24 |              19.3000 |
| E1005   | 2000-05-30 |               24 |              19.3000 |
| E1006   | 2001-08-16 |               23 |              19.3000 |
| E1007   | 2002-05-30 |               22 |              19.3000 |
| E1008   | 2010-05-06 |               14 |              19.3000 |
| E1009   | 2016-08-16 |                8 |              19.3000 |
| E1010   | 2016-08-16 |                8 |              19.3000 |
+---------+------------+------------------+----------------------+
10 rows in set (0.00 sec)
```



