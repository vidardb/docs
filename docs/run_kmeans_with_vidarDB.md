# Run KMeans with VidarDB

VidarDB has a native support to [MADlib](https://madlib.apache.org/index.html), which allowed you to perfrom many commonly used algorithms in SQL easily. This page gives you a good example of using KMeans clustering algorithm provided by [MADlib](https://madlib.apache.org/index.html) to train your data in VidarDB. It assumes you already have VidarDB installed. If you do not, head over to the [Run VidarDB in Docker](./run_vidarDB_in_docker.md) section.

## Preparation

Clone and go into the VidarDB's util repository:

```sh
git clone https://github.com/vidardb/util.git && cd util
```

Import Chicago Taxi Tips data (If you don't have psql client installed, install it beforing executing the following command):

```sh
cd ./util-notebook/kmeans/ && psql -h 127.0.0.1 -p 5432 -U postgres -f ./import-data_chicago_taxi_trips.sql
```

This command will also create a new database called `chicago_taxi_trips`.

Then, we create a new table `chicago_taxi_trips_change` for the data training:

```sql
-- connect to the local vidardb
psql -h 127.0.0.1 -p 5432 -U postgres

-- connect to the database
\c chicago_taxi_trips postgres;

-- create new table
drop table if exists chicago_taxi_trips_change;

-- double precision array for (pickup_latitude,pickup_longitude)
create table chicago_taxi_trips_change
(
    row_id serial,
    taxi_id int,
    pickup_latitude decimal(10, 2),
    pickup_longitude decimal(10, 2),
    row_vec double precision[]
);

-- insert data
insert into chicago_taxi_trips_change (taxi_id,pickup_latitude,pickup_longitude, row_vec)
select taxi_id,
       pickup_latitude,
       pickup_longitude,
       array_cat(array[pickup_latitude], array[pickup_longitude])
from chicago_taxi_trips;
```

Now, the preparation job is done. Let's move to the training part.

## Data Training

This section is very simple and straightforward. Before data training, we need to enable AI support in `chicago_taxi_trips` database:

```shell
docker exec -it vidardb sh -c "install-madlib.sh -U postgres -D chicago_taxi_trips"
```

Try the following SQL commands to use KMeans algorithm to train the data:

```sql
-- connect to the local vidardb
psql -h 127.0.0.1 -p 5432 -U postgres

-- connect to the database
\c chicago_taxi_trips postgres;

-- create new table
DROP TABLE IF EXISTS km_result;

-- Run kmeans algorithm
CREATE TABLE km_result AS
SELECT * FROM madlib.kmeanspp(
    'chicago_taxi_trips_change',   -- Table of source data
    'row_vec',                     -- Column containing point co-ordinates 
    5,                             -- Number of centroids to calculate
    'madlib.squared_dist_norm2',   -- Distance function
    'madlib.avg',                  -- Aggregate function
    20,                            -- Number of iterations
    0.001                          -- Fraction of centroids reassigned to keep iterating 
    );
```

## Perform Clustering Predictions

Use the model we trained to predict the cluster_id of each trip:

```sql
SELECT trips_data.*, (madlib.closest_column(centroids, row_vec)).column_id AS cluster_id
    FROM chicago_taxi_trips_change AS trips_data, km_result
    ORDER BY trips_data.row_id DESC LIMIT 10;
```

We get some results like this:

```
 row_id | taxi_id | pickup_latitude | pickup_longitude |           row_vec            | cluster_id 
--------+---------+-----------------+------------------+------------------------------+------------
    999 |    7040 |           41.88 |           -87.63 | {41.880994471,-87.632746489} |          1
    998 |    7145 |           41.88 |           -87.64 | {41.879255084,-87.642648998} |          1
    997 |    7864 |           41.79 |           -87.75 | {41.785998518,-87.750934289} |          3
    996 |    6620 |           41.90 |           -87.62 | {41.89503345,-87.619710672}  |          0
    995 |     393 |           41.89 |           -87.63 | {41.892072635,-87.628874157} |          0
    994 |    1082 |           41.89 |           -87.62 | {41.890922026,-87.618868355} |          0
    993 |      55 |           41.88 |           -87.63 | {41.880994471,-87.632746489} |          1
    992 |    7749 |           41.89 |           -87.63 | {41.892042136,-87.63186395}  |          0
    991 |    7564 |           41.88 |           -87.62 | {41.884987192,-87.620992913} |          0
    990 |    7065 |           41.89 |           -87.63 | {41.892507781,-87.626214906} |          0
```

## Reference

The data this example used come from [Taxi Trips | City of Chicago | Data Portal](https://data.cityofchicago.org/Transportation/Taxi-Trips/wrvz-psew).
