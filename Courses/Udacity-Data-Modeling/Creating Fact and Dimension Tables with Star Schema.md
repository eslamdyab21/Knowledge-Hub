### Let's imagine we work at an online Music Store. There will be many tables in our database but let's just focus on 4 tables around customer purchases.


> [Table Name: customer_transactions]
> column: Customer Id
> column: Store Id
> column: Spent


> [Table Name: Customer]
> column: Customer Id
> column: Name
> column: Rewards


> [Table Name: store]
> column: Store Id
> column: State


> [Table Name: items_purchased]
> column: customer id
> column: Item Name

<br/>
<br/>

From this representation we can already start to see the makings of a "STAR". We have one fact table (the center of the star) and 3 dimension tables that are coming from it.

<br/>
<br/>

### Create the Fact Table and insert the data into the table
```sql
CREATE TABLE IF NOT EXISTS customer_transactions (customer_id int, store_id int, spent numeric);

postgres=# INSERT INTO customer_transactions VALUES (1, 1, 20.50), (2, 1, 35.21);
```

<br/>
<br/>

### Create our Dimension Tables and insert data into those tables.
```SQL
postgres=# CREATE TABLE IF NOT EXISTS items_purchased (customer_id int, item_number int, item_name varchar);

postgres=# CREATE TABLE IF NOT EXISTS store (store_id int, state varchar);

postgres=# CREATE TABLE IF NOT EXISTS customer (customer_id int, name varchar, rewards boolean);


postgres=# INSERT INTO items_purchased VALUES (1, 1, 'Rubber Soul'), (2, 3, 'Let It Be');

postgres=# INSERT INTO store VALUES (1, 'CA'), (2, 'WA');

postgres=# INSERT INTO customer VALUES (1, 'Amanda', True), (2, 'Toby', False);
```

<br/>
<br/>

```SQL
postgres=# SELECT * FROM customer;
 customer_id |  name  | rewards 
-------------+--------+---------
           1 | Amanda | t
           2 | Toby   | f
(2 rows)

postgres=# SELECT * FROM customer_transactions;
 customer_id | store_id | spent 
-------------+----------+-------
           1 |        1 | 20.50
           2 |        1 | 35.21
(2 rows)

postgres=# SELECT * FROM store;
 store_id | state 
----------+-------
        1 | CA
        2 | WA
(2 rows)

postgres=# SELECT * FROM items_purchased;
 customer_id | item_number |  item_name  
-------------+-------------+-------------
           1 |           1 | Rubber Soul
           2 |           3 | Let It Be
(2 rows)
```

<br/>
<br/>

### Now run the following queries on this data that utilize the Fact/Dimension and Star Schema
  
#### Query 1: Find all the customers that spent more than 30 dollars, who are they, which store they bought it from, location of the store, what they bought and if they are a rewards member.

```SQL
postgres=# SELECT customer.name, store.store_id, store.state, items_purchased.item_name, customer.rewards             

FROM (((customer_transactions JOIN customer ON customer_transactions.customer_id = customer.customer_id)               
JOIN store ON customer_transactions.store_id = store.store_id)                   JOIN items_purchased ON customer_transactions.customer_id = items_purchased.customer_id)                          

WHERE spent > 30 ;

 name | store_id | state | item_name | rewards 
------+----------+-------+-----------+---------
 Toby |        1 | CA    | Let It Be | f
(1 row)
```



### Query 2: How much did Customer 2 spend?
```SQL
postgres=# SELECT SUM(spent) FROM customer_transactions WHERE customer_id = 2;
  sum  
-------
 35.21
(1 row)
```
