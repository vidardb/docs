# VidarDB Examples

In this section, we are going to show some basic VidarDB commands and simple interactions with PostgreSQL.

## Basic Commands

To create a database `example` and switch to it:

```sql
CREATE DATABASE example;
\c example;
```

Create a new table `student` using VidarDB's data engine. Claiming `EXTENSION` and `SERVER` are needed to trigger VidarDB's engine:

```sql
CREATE EXTENSION kv_fdw;
CREATE SERVER kv_server FOREIGN DATA WRAPPER kv_fdw;
CREATE FOREIGN TABLE student(name TEXT, ID TEXT) SERVER kv_server;
```

Let's try to insert some sample data into our new table:

```sql
INSERT INTO student VALUES('Rafferty', '20757123');
INSERT INTO student VALUES('Jones', '20767234');
INSERT INTO student VALUES('Heisenberg', '20777345');
```

In the next step, use `SELECT` statment to query students' information:

```sql
example=# SELECT * FROM student;
    name    |    id    
------------+----------
 Jones      | 20767234
 Rafferty   | 20757123
 Heisenberg | 20777345
(3 rows)
```

Also have a try at `DELETE` statment:

```sql
example=# DELETE FROM student WHERE NAME='Jones';
DELETE 1

example=# SELECT * FROM student;
    name    |    id    
------------+----------
 Rafferty   | 20757123
 Heisenberg | 20777345
(2 rows)
```

And update Rafferty's student id to `20757321`:

```sql
example=# UPDATE student SET ID='20757321' WHERE NAME='Rafferty';
UPDATE 1

example=# SELECT * FROM student;
    name    |    id    
------------+----------
 Rafferty   | 20757321
 Heisenberg | 20777345
(2 rows)
```

## Interaction with PostgreSQL

VidarDB works seamlessily with the original PostgreSQL. Now, we will create another new table using PostgreSQL's data engine and add one row into it:

```sql
CREATE TABLE student_course(ID TEXT, COURSE TEXT);
INSERT INTO student_course VALUES('20757321', 'Computer Science');
```

We currently have something like:

```sql
example=# SELECT * FROM student_course;
    id    |      course      
----------+------------------
 20757321 | Computer Science
(1 row)
```

Let's try with the `JOIN` statement with the table `student` (created by VidarDB engine) and `student_course` (created by PostgreSQL engine):

```sql
example=# SELECT student.name FROM student INNER JOIN student_course ON student.id = student_course.id;
   name   
----------
 Rafferty
(1 row)
```

(More examples will come soon!)
