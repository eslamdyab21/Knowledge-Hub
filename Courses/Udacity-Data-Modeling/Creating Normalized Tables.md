```sql
postgres=# \dt
            List of relations
 Schema |    Name     | Type  |  Owner   
--------+-------------+-------+----------
 public | music_store | table | postgres
(1 row)

postgres=# SELECT * FROM music_store;
 transaction_id | customer_name | cashier_name | year |      albums_purchased       
----------------+---------------+--------------+------+-----------------------------
              1 | Amanda        | Sam          | 2000 | {"Rubber Soul","Let it Be"}
              2 | Toby          | Sam          | 2000 | {"My Generation"}
              3 | Max           | Bob          | 2018 | {"Meet the Beatles",Help!}
(3 rows)
```

<br/>
<br/>

### Moving to 1st Normal Form (1NF)

This data has not been normalized. To get this data into 1st normal form, we will need to remove any collections or list of data. We need to break up the list of songs into individual rows.

```sql
postgres=# CREATE TABLE IF NOT EXISTS music_store2 (transaction_id int,customer_name varchar, cashier_name varchar, year int, albums_purchased text);

postgres=# INSERT INTO music_store2 VALUES (1, 'Amanda', 'Sam', 2000, 'Rubber Soul');
INSERT 0 1

postgres=# INSERT INTO music_store2 VALUES (1, 'Amanda', 'Sam', 2000, 'Let it Be');
INSERT 0 1

postgres=# INSERT INTO music_store2 VALUES (2, 'Toby', 'Sam', 2000, 'My Generation')
;
INSERT 0 1

postgres=# INSERT INTO music_store2 VALUES (3, 'Max', 'Bob', 2018,'Meet the Beatles');
INSERT 0 1

postgres=# INSERT INTO music_store2 VALUES (3, 'Max', 'Bob', 2018,'Help!');
INSERT 0 1

postgres=# 
```

<br/>
<br/>

```sql
postgres=# SELECT * FROM music_store2;
 transaction_id | customer_name | cashier_name | year | albums_purchased 
----------------+---------------+--------------+------+------------------
              1 | Amanda        | Sam          | 2000 | Rubber Soul
              1 | Amanda        | Sam          | 2000 | Let it Be
              2 | Toby          | Sam          | 2000 | My Generation
              3 | Max           | Bob          | 2018 | Meet the Beatles
              3 | Max           | Bob          | 2018 | Help!
(5 rows)
```

<br/>
<br/>

### Moving to 2nd Normal Form (2NF)

We have moved our data to be in 1NF which is the first step in moving to 2nd Normal Form. Our table is not yet in 2nd Normal Form. While each of our records in our table is unique, our Primary key (transaction id) is not unique. We need to break this up into two tables, transactions and albums sold.


> [Table Name: transactions]
> column 0: Transaction ID
> column 1: Customer Name
> column 2: Cashier Name
> column 3: Year 


> [Table Name: albums_sold]
> column 0: Album Id
> column 1: Transaction Id
> column 3: Album Name

<br/>
<br/>

```sql
postgres=# CREATE TABLE transactions (transaction_id int, customer_name varchar, cashier_name varchar, year int);


postgres=# CREATE TABLE albums_sold (albume_id int, transaction_id int, album_name varchar);

postgres=# INSERT INTO transactions VALUES (1, 'Amanda', 'Sam', 2000), (2, 'Toby', 'Sam', 2000), (3, 'Max', 'Bob', 2018);

postgres=# INSERT INTO albums_sold VALUES (1, 1, 'Rubber Soul'), (2, 1, 'Let it Be'), (3, 2, 'My Generation'), (4, 3, 'Meet the Beatles'), (5, 3, 'Help!');
```

```sql
postgres=# SELECT * FROM transactions;
 transaction_id | customer_name | cashier_name | year 
----------------+---------------+--------------+------
              1 | Amanda        | Sam          | 2000
              2 | Toby          | Sam          | 2000
              3 | Max           | Bob          | 2018
(3 rows)

postgres=# SELECT * FROM albums_sold;
 albume_id | transaction_id |    album_name    
-----------+----------------+------------------
         1 |              1 | Rubber Soul
         2 |              1 | Let it Be
         3 |              2 | My Generation
         4 |              3 | Meet the Beatles
         5 |              3 | Help!
(5 rows)
```

<br/>
<br/>

#### Let's do a `JOIN` on this table so we can get all the information we had in our first Table.

```sql
postgres=# SELECT * FROM transactions JOIN albums_sold ON transactions.transaction_id = albums_sold.transaction_id;

 transaction_id | customer_name | cashier_name | year | albume_id | transaction_id |    album_name    
----------------+---------------+--------------+------+-----------+----------------+------------------
              1 | Amanda        | Sam          | 2000 |         1 |              1 | Rubber Soul
              1 | Amanda        | Sam          | 2000 |         2 |              1 | Let it Be
              2 | Toby          | Sam          | 2000 |         3 |              2 | My Generation
              3 | Max           | Bob          | 2018 |         4 |              3 | Meet the Beatles
              3 | Max           | Bob          | 2018 |         5 |              3 | Help!
(5 rows)
```

<br/>
<br/>

### Moving to 3rd Normal Form (3NF)

Let's check our table for any transitive dependencies. Transactions can remove Cashier Name to its own table, called Employees, which will leave us with 3 tables.


> [Table Name: transactions2]
> column 0: transaction Id
> column 1: Customer Name
> column 2: Cashier Id
> column 3: Year 


> [Table Name: albums_sold]
> column 0: Album Id
> column 1: Transaction Id
> column 3: Album Name


> [Table Name: employees]
> column 0: Employee Id
> column 1: Employee Name 

