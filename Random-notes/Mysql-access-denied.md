---
tags: 
- programming
- mysql

date: 2023-01-31
---

# Access denied
_(It may work on other distributions, especially Debian-based ones.)_

Run the following to connect as `root` (without any password)

```bash
sudo /usr/bin/mysql --defaults-file=/etc/mysql/debian.cnf
```

If you don't want to add `--defaults-file` each time you want to connect as `root`, you can copy `/etc/mysql/debian.cnf` into your home directory:

```bash
sudo cp /etc/mysql/debian.cnf ~/.my.cnf
```

And then:

```bash
sudo mysql
```

Then
1.  Set new password by _`ALTER USER 'root'@'localhost' IDENTIFIED BY 'NewPassword';`_
2.  Go back to /etc/my.cnf and **remove/comment** skip-grant-tables
3.  Restart MySQL `sudo systemctl restart mysql`
4.  Now you will be able to login with the new password `mysql -u root -p`


# Password requirements
```sql
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'NewPassword';

ERROR 1819 (HY000): Your password does not satisfy the current policy requirements
```


Because of your password. You can see _password validate configuration metrics_ using the following query in MySQL client:

```sql
SHOW VARIABLES LIKE 'validate_password%';
```

The output should be something like that :

```sql
+--------------------------------------+-------+
| Variable_name                        | Value |
+--------------------------------------+-------+
| validate_password.check_user_name    | ON    |
| validate_password.dictionary_file    |       |
| validate_password.length             | 6     |
| validate_password.mixed_case_count   | 1     |
| validate_password.number_count       | 1     |
| validate_password.policy             | LOW   |
| validate_password.special_char_count | 1     |
+--------------------------------------+-------+
```

then you can set the password policy level lower, for example:

```sql
SET GLOBAL validate_password.length = 6;
SET GLOBAL validate_password.number_count = 0;
```


```sql
mysql> SHOW VARIABLES LIKE 'validate_password%';
+--------------------------------------+--------+
| Variable_name                        | Value  |
+--------------------------------------+--------+
| validate_password.check_user_name    | ON     |
| validate_password.dictionary_file    |        |
| validate_password.length             | 8      |
| validate_password.mixed_case_count   | 1      |
| validate_password.number_count       | 1      |
| validate_password.policy             | MEDIUM |
| validate_password.special_char_count | 1      |
+--------------------------------------+--------+
7 rows in set (0.03 sec)

mysql> SET GLOBAL validate_password.length = 6;
Query OK, 0 rows affected (0.00 sec)

mysql> SET GLOBAL validate_password.policy = LOW;
Query OK, 0 rows affected (0.00 sec)

mysql> SET GLOBAL validate_password.special_char_count = 0;
Query OK, 0 rows affected (0.00 sec)

mysql> SHOW VARIABLES LIKE 'validate_password%';
+--------------------------------------+-------+
| Variable_name                        | Value |
+--------------------------------------+-------+
| validate_password.check_user_name    | ON    |
| validate_password.dictionary_file    |       |
| validate_password.length             | 6     |
| validate_password.mixed_case_count   | 1     |
| validate_password.number_count       | 1     |
| validate_password.policy             | LOW   |
| validate_password.special_char_count | 0     |
+--------------------------------------+-------+
7 rows in set (0.00 sec)
```