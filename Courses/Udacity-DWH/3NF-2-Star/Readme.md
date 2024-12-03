# Setup postgres with docker
Pull the docker image
```bash
dyab:3NF-2-Star$ docker pull postgres:17
17: Pulling from library/postgres
bc0965b23a04: Pull complete 
002e1a8eb6f9: Pull complete 
a24f300391ed: Pull complete 
627f580b7ad7: Pull complete 
cfb3c2203f88: Pull complete 
9e592465b243: Pull complete 
8d4265d09d9c: Pull complete 
e3a8293e92fd: Pull complete 
2cb801c39436: Pull complete 
c5fdb20d8658: Pull complete 
67c5fe618f0c: Pull complete 
c9cdd1fe82e4: Pull complete 
8f152c4aceed: Pull complete 
2cd360f3b7db: Pull complete 
Digest: sha256:fe4efc6901dda0d952306fd962643d8022d7bb773ffe13fe8a21551b9276e50c
Status: Downloaded newer image for postgres:17
docker.io/library/postgres:17
```

<br/>

Run the container
```bash
dyab:3NF-2-Star$ docker run --name postgres -e POSTGRES_PASSWORD=password -p 5432:5432 -d postgres:17
be3ce0fa145070e5f439762e96a60bec2d4de99d5a4acee213c36d12ea40a8b1```

```bash
dyab:3NF-2-Star$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS                 PORTS                                       NAMES
be3ce0fa1450   postgres:17             "docker-entrypoint.s…"   24 seconds ago   Up 20 seconds          0.0.0.0:5432->5432/tcp, :::5432->5432/tcp   postgres
```


<br/>

Access the container
```bash
dyab:3NF-2-Star$ docker exec -it postgres bash
root@be3ce0fa1450:/# 
```

<br/>

access postgres server and create an empty db
```bash
root@be3ce0fa1450:/# psql -U postgres
psql (17.2 (Debian 17.2-1.pgdg120+1))
Type "help" for help.

postgres=# CREATE DATABASE pagila;
CREATE DATABASE
postgres=# 
```

<br/>
<br/>

# Load pagila db data into the container 
Download the db from here https://www.postgresql.org/ftp/projects/pgFoundry/dbsamples/pagila/pagila/

```bash
dyab:3NF-2-Star$ ls pagila-0.10.1/
pagila-data.sql  pagila-insert-data.sql  pagila-schema.sql  README
```

<br/>

We have this file in our local machine, to send to the container
```bash
dyab:3NF-2-Star$ docker cp pagila-0.10.1/ postgres:pagila-0.10.1/
Successfully copied 2.9MB to postgres:pagila-0.10.1/
```

```bash
root@be3ce0fa1450:/# ls pagila-0.10.1/
pagila-data.sql  pagila-insert-data.sql  pagila-schema.sql  README
```

<br/>

Load the db
```bash
root@be3ce0fa1450:/# cat pagila-0.10.1/pagila-schema.sql | psql -U postgres -d pagila

root@be3ce0fa1450:/# cat pagila-0.10.1/pagila-data.sql | psql -U postgres -d pagila
```

```bash
root@be3ce0fa1450:/# psql -U postgres
psql (17.2 (Debian 17.2-1.pgdg120+1))
Type "help" for help.

postgres=# \c pagila
You are now connected to database "pagila" as user "postgres".
pagila=# \dt
              List of relations
 Schema |       Name       | Type  |  Owner   
--------+------------------+-------+----------
 public | actor            | table | postgres
 public | address          | table | postgres
 public | category         | table | postgres
 public | city             | table | postgres
 public | country          | table | postgres
 public | customer         | table | postgres
 public | film             | table | postgres
 public | film_actor       | table | postgres
 public | film_category    | table | postgres
 public | inventory        | table | postgres
 public | language         | table | postgres
 public | payment          | table | postgres
 public | payment_p2007_01 | table | postgres
 public | payment_p2007_02 | table | postgres
 public | payment_p2007_03 | table | postgres
 public | payment_p2007_04 | table | postgres
 public | payment_p2007_05 | table | postgres
 public | payment_p2007_06 | table | postgres
 public | rental           | table | postgres
 public | staff            | table | postgres
 public | store            | table | postgres
(21 rows)
```