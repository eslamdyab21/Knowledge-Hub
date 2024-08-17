# Accessing multiple tables with sub-queries

Retrieve only the EMPLOYEES records corresponding to jobs in the JOBS table.
```sql
mysql> SELECT EMP_ID, F_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS);
+--------+---------+--------+
| EMP_ID | F_NAME  | JOB_ID |
+--------+---------+--------+
| E1001  | John    | 100    |
| E1002  | Alice   | 200    |
| E1003  | Steve   | 300    |
| E1004  | Santosh | 400    |
| E1005  | Ahmed   | 500    |
| E1006  | Nancy   | 600    |
| E1007  | Mary    | 650    |
| E1008  | Bharath | 660    |
| E1009  | Andrea  | 234    |
| E1010  | Ann     | 220    |
+--------+---------+--------+
10 rows in set (0.00 sec)
```

<br/>

Retrieve JOB information for employees earning over $70,000.
```SQL
mysql> SELECT * FROM JOBS WHERE JOB_IDENT IN (SELECT JOB_ID FROM EMPLOYEES WHERE SALARY > 70000);
+-----------+------------------------+------------+------------+
| JOB_IDENT | JOB_TITLE              | MIN_SALARY | MAX_SALARY |
+-----------+------------------------+------------+------------+
| 100       | Sr. Architect          |   60000.00 |  100000.00 |
| 200       | Sr. Software Developer |   60000.00 |   80000.00 |
| 600       | Lead Architect         |   70000.00 |  100000.00 |
+-----------+------------------------+------------+------------+
3 rows in set (0.02 sec)
```


<br/>
<br/>
<br/>

# Accessing multiple tables with Implicit Joins

Retrieve only the EMPLOYEES records corresponding to jobs in the JOBS table.
```SQL
mysql> SELECT * FROM EMPLOYEES, JOBS WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;
```
![[Pasted image 20240817185007.png]]

<br/>

Redo the previous query using shorter aliases for table names.
```SQL
mysql> SELECT * FROM EMPLOYEES E, JOBS J WHERE E.JOB_ID = J.JOB_IDENT;
```
![[Pasted image 20240817185123.png]]

<br/>

In the previous query, retrieve only the Employee ID, Name, and Job Title.
```SQL
mysql> SELECT EMP_ID, F_NAME, JOB_TITLE FROM EMPLOYEES E, JOBS J WHERE E.JOB_ID = J.JOB_IDENT;
+--------+---------+------------------------+
| EMP_ID | F_NAME  | JOB_TITLE              |
+--------+---------+------------------------+
| E1001  | John    | Sr. Architect          |
| E1002  | Alice   | Sr. Software Developer |
| E1003  | Steve   | Jr.Software Developer  |
| E1004  | Santosh | Jr.Software Developer  |
| E1005  | Ahmed   | Jr. Architect          |
| E1006  | Nancy   | Lead Architect         |
| E1007  | Mary    | Jr. Designer           |
| E1008  | Bharath | Jr. Designer           |
| E1009  | Andrea  | Sr. Designer           |
| E1010  | Ann     | Sr. Designer           |
+--------+---------+------------------------+
10 rows in set (0.00 sec)
```

<br/>

Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.
```SQL
mysql> SELECT E.EMP_ID, E.F_NAME, J.JOB_TITLE FROM EMPLOYEES E, JOBS J WHERE E.JOB_ID = J.JOB_IDENT;
+--------+---------+------------------------+
| EMP_ID | F_NAME  | JOB_TITLE              |
+--------+---------+------------------------+
| E1001  | John    | Sr. Architect          |
| E1002  | Alice   | Sr. Software Developer |
| E1003  | Steve   | Jr.Software Developer  |
| E1004  | Santosh | Jr.Software Developer  |
| E1005  | Ahmed   | Jr. Architect          |
| E1006  | Nancy   | Lead Architect         |
| E1007  | Mary    | Jr. Designer           |
| E1008  | Bharath | Jr. Designer           |
| E1009  | Andrea  | Sr. Designer           |
| E1010  | Ann     | Sr. Designer           |
+--------+---------+------------------------+
10 rows in set (0.00 sec)
```


<br/>
<br/>
<br/>

# Practice problems
Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
A. Using sub-queries
```SQL
mysql> SELECT EMP_ID, F_NAME FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS WHERE JOB_TITLE = 'Jr. Designer');
+--------+---------+
| EMP_ID | F_NAME  |
+--------+---------+
| E1007  | Mary    |
| E1008  | Bharath |
+--------+---------+
2 rows in set (0.00 sec)
```

<br/>

B. Using Implicit Joins
```SQL
mysql> SELECT EMP_ID, F_NAME FROM EMPLOYEES E, JOBS J WHERE E.JOB_ID = J.JOB_IDENT AND J.JOB_TITLE = 'Jr. Designer';
+--------+---------+
| EMP_ID | F_NAME  |
+--------+---------+
| E1007  | Mary    |
| E1008  | Bharath |
+--------+---------+
2 rows in set (0.02 sec)
```


<br/>

Retrieve JOB information and a list of employees whose birth year is after 1976.
A. Using sub-queries
```SQL
mysql> SELECT * FROM JOBS WHERE JOB_IDENT IN (SELECT JOB_ID FROM EMPLOYEES WHERE YEAR(B_DATE) > 1976);
+-----------+-----------------------+------------+------------+
| JOB_IDENT | JOB_TITLE             | MIN_SALARY | MAX_SALARY |
+-----------+-----------------------+------------+------------+
| 300       | Jr.Software Developer |   40000.00 |   60000.00 |
| 400       | Jr.Software Developer |   40000.00 |   60000.00 |
| 500       | Jr. Architect         |   50000.00 |   70000.00 |
| 600       | Lead Architect        |   70000.00 |  100000.00 |
| 660       | Jr. Designer          |   60000.00 |   70000.00 |
| 234       | Sr. Designer          |   70000.00 |   90000.00 |
| 220       | Sr. Designer          |   70000.00 |   90000.00 |
+-----------+-----------------------+------------+------------+
7 rows in set (0.00 sec)
```


<br/>

B. Using implicit join
```SQL
mysql> SELECT  F_NAME, JOB_IDENT, JOB_TITLE, MIN_SALARY,MAX_SALARY FROM EMPLOYEES E, JOBS J WHERE E.JOB_ID = J.JOB_IDENT AND YEAR(E.B_DATE) > 1976;
+---------+-----------+-----------------------+------------+------------+
| F_NAME  | JOB_IDENT | JOB_TITLE             | MIN_SALARY | MAX_SALARY |
+---------+-----------+-----------------------+------------+------------+
| Steve   | 300       | Jr.Software Developer |   40000.00 |   60000.00 |
| Santosh | 400       | Jr.Software Developer |   40000.00 |   60000.00 |
| Ahmed   | 500       | Jr. Architect         |   50000.00 |   70000.00 |
| Nancy   | 600       | Lead Architect        |   70000.00 |  100000.00 |
| Bharath | 660       | Jr. Designer          |   60000.00 |   70000.00 |
| Andrea  | 234       | Sr. Designer          |   70000.00 |   90000.00 |
| Ann     | 220       | Sr. Designer          |   70000.00 |   90000.00 |
+---------+-----------+-----------------------+------------+------------+
7 rows in set (0.00 sec)

```

