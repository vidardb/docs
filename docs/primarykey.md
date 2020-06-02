VidarDB does not support the primary key syntax in SQL due to the limitation of the foreign data wrapper. The first attribute in the table is used as the primary key by VidarDB, so the value of this attribute should be unique and not null.  For example, in the following table <em>student</em>, the attribute <em>id</em> is used as the primary key.

```sql
CREATE FOREIGN TABLE student(
    id      INTEGER, 
    name    TEXT
) SERVER kv_server;
```



VidarDB supports the composite type in PostgreSQL. When a composite primary key is required, VidarDB allows multiple attributes to be combined into a composite type. The following example uses such a composite type as the primary key.

```sql
CREATE TYPE inventory_item AS (
    name            TEXT,
    supplier_id     INTEGER,
    price           NUMERIC
);

CREATE FOREIGN TABLE shop (
    item      inventory_item,
    count     INTEGER
) SERVER kv_server;

INSERT INTO shop VALUES (ROW('fuzzy dice', 42, 1.99), 1000);
```


More information about the composite type can be found in the [PostgreSQL documentation](https://www.postgresql.org/docs/11/rowtypes.html)