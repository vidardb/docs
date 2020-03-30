```sql
CREATE DATABASE example;
\c example;

CREATE EXTENSION kv_fdw;  
CREATE SERVER kv_server FOREIGN DATA WRAPPER kv_fdw;  
CREATE FOREIGN TABLE student(id INTEGER, name TEXT, major TEXT, address TEXT) SERVER kv_server OPTIONS(storage 'column');

INSERT INTO student VALUES(20757123, 'Rafferty', 'Computer Science', 'Waterloo');
INSERT INTO student VALUES(20767234, 'Jones', 'Math', 'Boston');
DELETE FROM student WHERE id=20757123;
UPDATE student SET name='Tom' WHERE id=20767234;


DROP FOREIGN TABLE student;  

DROP SERVER kv_server;  
DROP EXTENSION kv_fdw;  
  
\c postgres  
DROP DATABASE example;  
```
