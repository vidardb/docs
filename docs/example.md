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
CREATE FOREIGN TABLE student(id INTEGER, name TEXT) SERVER kv_server;
```

Let's try to insert some sample data into our new table:

```sql
INSERT INTO student VALUES(20757123, 'Rafferty');
INSERT INTO student VALUES(20767234, 'Jones');
INSERT INTO student VALUES(20777345, 'Heisenberg');
```

In the next step, use `SELECT` statement to query students' information:

```sql
example=# SELECT * FROM student;
    id    |    name    
----------+------------
 20767234 | Jones
 20777345 | Heisenberg
 20757123 | Rafferty
(3 rows)
```

Also have a try at `DELETE` statement:

```sql
example=# DELETE FROM student WHERE name='Jones';
DELETE 1

example=# SELECT * FROM student;
    id    |    name    
----------+------------
 20777345 | Heisenberg
 20757123 | Rafferty
(2 rows)
```

And update 20777345's student name to `Tom`:

```sql
example=# UPDATE student SET name='Tom' WHERE id=20777345;
UPDATE 1

example=# SELECT * FROM student;
    name    |    id    
------------+----------
 Rafferty   | 20757321
 Heisenberg | 20777345
(2 rows)
```

## Interaction with PostgreSQL

VidarDB works seamlessily with the original PostgreSQL. Now, we will create another new table using PostgreSQL's storage engine and add one row into it:

```sql
CREATE TABLE student_course(id INTEGER, course TEXT);
INSERT INTO student_course VALUES(20757123, 'Computer Science');
```

We currently have something like:

```sql
example=# SELECT * FROM student_course;
    id    |      course      
----------+------------------
 20757123 | Computer Science
(1 row)
```

Let's try with the `JOIN` statement with the table `student` (created by VidarDB engine) and `student_course` (created by PostgreSQL engine):

```sql
example=# SELECT student.name FROM student, student_course WHERE student.id = student_course.id;
   name   
----------
 Rafferty
(1 row)
```

(More examples will come soon!)
