# Hands-on Lab: Automating Tasks in MySQL using Shell Scripts


<br/>
<br/>

## Objectives

After completing this lab, you will be able to use the MySQL command line to:

- Create the shell script to back up the database.
- Create a cron job to run the backup script thereby creating a backup file.
- Truncate the tables in the database.
- Restore the database using the backup file.


<br/>
<br/>


1- Copy the command below and run it on the terminal to fetch the [sakila_mysql_dump.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/sakila/sakila_mysql_dump.sql) file.
```bash
[dyab@localhost mysql-bash]$ wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/sakila/sakila_mysql_dump.sql

Connecting to cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud (cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud)|169.63.118.104|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3196680 (3.0M) [application/x-sql]
Saving to: ‘sakila_mysql_dump.sql’

sakila_mysql_dump.sql             100%[=============================================================>]   3.05M  1.57MB/s    in 1.9s    

2024-08-31 17:18:19 (1.57 MB/s) - ‘sakila_mysql_dump.sql’ saved [3196680/3196680]
```


<br/>

2- Create a new database **sakila** using the command below in the terminal.
```SQL
mysql> CREATE DATABASE sakila;
Query OK, 1 row affected (1.34 sec)
```


<br/>

3- load the database

```bash
[dyab@localhost mysql-bash]$ ls
sakila_mysql_dump.sql
[dyab@localhost mysql-bash]$ docker exec -i mysql mysql -uroot -p sakila < sakila_mysql_dump.sql
```

```sql
mysql> SHOW TABLES;
+----------------------------+
| Tables_in_sakila           |
+----------------------------+
| actor                      |
| actor_info                 |
| address                    |
| category                   |
| city                       |
| country                    |
| customer                   |
| customer_list              |
| film                       |
| film_actor                 |
| film_category              |
| film_list                  |
| inventory                  |
| language                   |
| nicer_but_slower_film_list |
| payment                    |
| rental                     |
| sales_by_film_category     |
| sales_by_store             |
| staff                      |
| staff_list                 |
| store                      |
+----------------------------+
22 rows in set (0.01 sec)
```


<br/>
<br/>

### Task C: Understanding the Process Involved in Creating MySQL Database Backups

You will create a shell script that does the following:

- Writes the database to an sqlfile created with a timestamp, using the `mysqldump` command
- Zips the sqlfile into a zip file using the `gzip` command
- Removes the sqlfile using rm command
- Deletes the backup after 30 days



```bash
#! /bin/sh

# Set the database name to a variable. 
DATABASE='sakila'

echo "Pulling Database: This may take a few minutes"


# Set the folder where the database backup will be stored
backupfolder=/home/dyab/backups


# Number of days to store the backup
keep_day=30

sqlfile=$backupfolder/$(date +%d-%m-%Y_%H-%M-%S).sql
zipfile=$backupfolder/$(date +%d-%m-%Y_%H-%M-%S).gz

# Create a backup

if docker exec -i mysql mysqldump -uroot -ppassword $DATABASE > $sqlfile;
then
    echo 'Sql dump created'
    # Compress backup
    if gzip -c $sqlfile > $zipfile;
    then
	echo 'The backup was successfully compressed'
    else
        echo 'Error compressing backupBackup was not created!'
	exit
    fi
    rm $sqlfile
else
   echo 'mysql return non-zero code No backup was created!'
   exit
fi

# Delete old backups
find $backupfolder -mtime +$keep_day -delete
```

<br/>
<br/>

### Task E: Setting Up a Cron Job

```bash
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                       7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * *  command_to_execute

0 0 * * * /home/dyab/Documents/Projects/ibm-data-eng/mysql-bash/backup.sh
```
