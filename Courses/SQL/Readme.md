
# SELECT

<br/>

We can select all `*` all columns or a part of them.
```sql
mysql> select * from employee_demographics;
+-------------+------------+--------------+------+--------+------------+
| employee_id | first_name | last_name    | age  | gender | birth_date |
+-------------+------------+--------------+------+--------+------------+
|           1 | Leslie     | Knope        |   44 | Female | 1979-09-25 |
|           3 | Tom        | Haverford    |   36 | Male   | 1987-03-04 |
|           4 | April      | Ludgate      |   29 | Female | 1994-03-27 |
|           5 | Jerry      | Gergich      |   61 | Male   | 1962-08-28 |
|           6 | Donna      | Meagle       |   46 | Female | 1977-07-30 |
|           7 | Ann        | Perkins      |   35 | Female | 1988-12-01 |
|           8 | Chris      | Traeger      |   43 | Male   | 1980-11-11 |
|           9 | Ben        | Wyatt        |   38 | Male   | 1985-07-26 |
|          10 | Andy       | Dwyer        |   34 | Male   | 1989-03-25 |
|          11 | Mark       | Brendanawicz |   40 | Male   | 1983-06-14 |
|          12 | Craig      | Middlebrooks |   37 | Male   | 1986-07-27 |
+-------------+------------+--------------+------+--------+------------+
11 rows in set (0.01 sec)
```

```sql
mysql> select first_name, last_name from employee_demographics;
+------------+--------------+
| first_name | last_name    |
+------------+--------------+
| Leslie     | Knope        |
| Tom        | Haverford    |
| April      | Ludgate      |
| Jerry      | Gergich      |
| Donna      | Meagle       |
| Ann        | Perkins      |
| Chris      | Traeger      |
| Ben        | Wyatt        |
| Andy       | Dwyer        |
| Mark       | Brendanawicz |
| Craig      | Middlebrooks |
+------------+--------------+
11 rows in set (0.00 sec)
```

<br/>

We can separate each column in line and do calculations on them.
```sql
mysql> select first_name,                                                        
              last_name,                                                         
              age,                                                               
              (age + 10) * 2 + 10                                                
    -> from employee_demographics;

+------------+--------------+------+---------------------+
| first_name | last_name    | age  | (age + 10) * 2 + 10 |
+------------+--------------+------+---------------------+
| Leslie     | Knope        |   44 |                 118 |
| Tom        | Haverford    |   36 |                 102 |
| April      | Ludgate      |   29 |                  88 |
| Jerry      | Gergich      |   61 |                 152 |
| Donna      | Meagle       |   46 |                 122 |
| Ann        | Perkins      |   35 |                 100 |
| Chris      | Traeger      |   43 |                 116 |
| Ben        | Wyatt        |   38 |                 106 |
| Andy       | Dwyer        |   34 |                  98 |
| Mark       | Brendanawicz |   40 |                 110 |
| Craig      | Middlebrooks |   37 |                 104 |
+------------+--------------+------+---------------------+
11 rows in set (0.00 sec)
```

<br/>
<br/>

# DISTINCT

it gets the unique values of a given column
```sql
mysql> select distinct gender from employee_demographics;
+--------+
| gender |
+--------+
| Female |
| Male   |
+--------+
2 rows in set (0.09 sec)
```

<br/>

if multiple columns are given, it gets the unique combination of them. 
```SQL
mysql> select distinct first_name, gender from employee_demographics;
+------------+--------+
| first_name | gender |
+------------+--------+
| Leslie     | Female |
| Tom        | Male   |
| April      | Female |
| Jerry      | Male   |
| Donna      | Female |
| Ann        | Female |
| Chris      | Male   |
| Ben        | Male   |
| Andy       | Male   |
| Mark       | Male   |
| Craig      | Male   |
+------------+--------+
11 rows in set (0.00 sec)
```


<br/>
<br/>

# WHERE Clause
The WHERE clause is used to filter records (rows of data)

- with numbers
```sql
mysql> SELECT first_name, last_name, salary 
    -> FROM employee_salary 
    -> WHERE salary > 50000;
+------------+--------------+--------+
| first_name | last_name    | salary |
+------------+--------------+--------+
| Leslie     | Knope        |  75000 |
| Ron        | Swanson      |  70000 |
| Donna      | Meagle       |  60000 |
| Ann        | Perkins      |  55000 |
| Chris      | Traeger      |  90000 |
| Ben        | Wyatt        |  70000 |
| Mark       | Brendanawicz |  57000 |
| Craig      | Middlebrooks |  65000 |
+------------+--------------+--------+
8 rows in set (0.01 sec)
```


```sql
mysql> SELECT first_name, last_name, salary 
    -> FROM employee_salary 
    -> WHERE salary >= 50000;
+------------+--------------+--------+
| first_name | last_name    | salary |
+------------+--------------+--------+
| Leslie     | Knope        |  75000 |
| Ron        | Swanson      |  70000 |
| Tom        | Haverford    |  50000 |
| Jerry      | Gergich      |  50000 |
| Donna      | Meagle       |  60000 |
| Ann        | Perkins      |  55000 |
| Chris      | Traeger      |  90000 |
| Ben        | Wyatt        |  70000 |
| Mark       | Brendanawicz |  57000 |
| Craig      | Middlebrooks |  65000 |
+------------+--------------+--------+
10 rows in set (0.00 sec)
```

<br/>

- with strings
```sql
mysql> SELECT *
    -> FROM employee_demographics
    -> WHERE gender = 'Female';
+-------------+------------+-----------+------+--------+------------+
| employee_id | first_name | last_name | age  | gender | birth_date |
+-------------+------------+-----------+------+--------+------------+
|           1 | Leslie     | Knope     |   44 | Female | 1979-09-25 |
|           4 | April      | Ludgate   |   29 | Female | 1994-03-27 |
|           6 | Donna      | Meagle    |   46 | Female | 1977-07-30 |
|           7 | Ann        | Perkins   |   35 | Female | 1988-12-01 |
+-------------+------------+-----------+------+--------+------------+
4 rows in set (0.00 sec)
```

```sql
mysql> SELECT *
    -> FROM employee_demographics
    -> WHERE gender != 'Female';
+-------------+------------+--------------+------+--------+------------+
| employee_id | first_name | last_name    | age  | gender | birth_date |
+-------------+------------+--------------+------+--------+------------+
|           3 | Tom        | Haverford    |   36 | Male   | 1987-03-04 |
|           5 | Jerry      | Gergich      |   61 | Male   | 1962-08-28 |
|           8 | Chris      | Traeger      |   43 | Male   | 1980-11-11 |
|           9 | Ben        | Wyatt        |   38 | Male   | 1985-07-26 |
|          10 | Andy       | Dwyer        |   34 | Male   | 1989-03-25 |
|          11 | Mark       | Brendanawicz |   40 | Male   | 1983-06-14 |
|          12 | Craig      | Middlebrooks |   37 | Male   | 1986-07-27 |
+-------------+------------+--------------+------+--------+------------+
7 rows in set (0.00 sec)
```

<br/>

- with date
```sql
mysql> SELECT *
    -> FROM employee_demographics
    -> WHERE birth_date > '1985-01-01';
+-------------+------------+--------------+------+--------+------------+
| employee_id | first_name | last_name    | age  | gender | birth_date |
+-------------+------------+--------------+------+--------+------------+
|           3 | Tom        | Haverford    |   36 | Male   | 1987-03-04 |
|           4 | April      | Ludgate      |   29 | Female | 1994-03-27 |
|           7 | Ann        | Perkins      |   35 | Female | 1988-12-01 |
|           9 | Ben        | Wyatt        |   38 | Male   | 1985-07-26 |
|          10 | Andy       | Dwyer        |   34 | Male   | 1989-03-25 |
|          12 | Craig      | Middlebrooks |   37 | Male   | 1986-07-27 |
+-------------+------------+--------------+------+--------+------------+
6 rows in set (0.00 sec)
```

```sql
mysql> select * 
	-> from employee_demographics 
	-> where birth_date > '1985-01-01' 
	-> and gender = 'Male';
+-------------+------------+--------------+------+--------+------------+
| employee_id | first_name | last_name    | age  | gender | birth_date |
+-------------+------------+--------------+------+--------+------------+
|           3 | Tom        | Haverford    |   36 | Male   | 1987-03-04 |
|           9 | Ben        | Wyatt        |   38 | Male   | 1985-07-26 |
|          10 | Andy       | Dwyer        |   34 | Male   | 1989-03-25 |
|          12 | Craig      | Middlebrooks |   37 | Male   | 1986-07-27 |
+-------------+------------+--------------+------+--------+------------+
4 rows in set (0.00 sec)
```

```sql
mysql> select * 
	-> from employee_demographics 
	-> where birth_date > '1985-01-01' 
	-> and not gender = 'Male';
+-------------+------------+-----------+------+--------+------------+
| employee_id | first_name | last_name | age  | gender | birth_date |
+-------------+------------+-----------+------+--------+------------+
|           4 | April      | Ludgate   |   29 | Female | 1994-03-27 |
|           7 | Ann        | Perkins   |   35 | Female | 1988-12-01 |
+-------------+------------+-----------+------+--------+------------+
2 rows in set (0.00 sec)
```

```sql
mysql> select * 
    -> from employee_demographics
    -> where (first_name = 'Leslie' and age = 44) or age > 55;
+-------------+------------+-----------+------+--------+------------+
| employee_id | first_name | last_name | age  | gender | birth_date |
+-------------+------------+-----------+------+--------+------------+
|           1 | Leslie     | Knope     |   44 | Female | 1979-09-25 |
|           5 | Jerry      | Gergich   |   61 | Male   | 1962-08-28 |
+-------------+------------+-----------+------+--------+------------+
2 rows in set (0.00 sec)
```

<br/>
<br/>

# LIKE STATEMENT
two special characters a `%` and a `_`

<br/>

-- % means anything

```sql
mysql> select *
    -> from employee_demographics
    -> where first_name like 'A%';
+-------------+------------+-----------+------+--------+------------+
| employee_id | first_name | last_name | age  | gender | birth_date |
+-------------+------------+-----------+------+--------+------------+
|           4 | April      | Ludgate   |   29 | Female | 1994-03-27 |
|           7 | Ann        | Perkins   |   35 | Female | 1988-12-01 |
|          10 | Andy       | Dwyer     |   34 | Male   | 1989-03-25 |
+-------------+------------+-----------+------+--------+------------+
3 rows in set (0.00 sec)
```

<br/>

-- _ means a specific value

here `first_name` starts with `A` and has exactly 3 charters after the `A`
```sql
mysql> select *
    -> from employee_demographics
    -> where first_name like 'A___';
+-------------+------------+-----------+------+--------+------------+
| employee_id | first_name | last_name | age  | gender | birth_date |
+-------------+------------+-----------+------+--------+------------+
|          10 | Andy       | Dwyer     |   34 | Male   | 1989-03-25 |
+-------------+------------+-----------+------+--------+------------+
1 row in set (0.00 sec)
```

<br/>

here `first_name` starts with `A` and has at least 3 charters after the `A`
```sql
mysql> select *
    -> from employee_demographics
    -> where first_name like 'A___%';
+-------------+------------+-----------+------+--------+------------+
| employee_id | first_name | last_name | age  | gender | birth_date |
+-------------+------------+-----------+------+--------+------------+
|           4 | April      | Ludgate   |   29 | Female | 1994-03-27 |
|          10 | Andy       | Dwyer     |   34 | Male   | 1989-03-25 |
+-------------+------------+-----------+------+--------+------------+
2 rows in set (0.00 sec)
```

<br/>

we can use it with date too
```sql
mysql> select *
    -> from employee_demographics
    -> where birth_date like '1989%';
+-------------+------------+-----------+------+--------+------------+
| employee_id | first_name | last_name | age  | gender | birth_date |
+-------------+------------+-----------+------+--------+------------+
|          10 | Andy       | Dwyer     |   34 | Male   | 1989-03-25 |
+-------------+------------+-----------+------+--------+------------+
1 row in set (0.00 sec)
```