# Frequently Asked Questions

## How is VidarDB different from other traditional database systems?

The core data structures in traditional database systems like B+ trees were invented in the 1970s. They are optimized for the old storage medium.  In contrast, VidarDB is designed for modern fast storage. 

VidarDB is based on the log-structured merge tree (LSM Tree) data structure that has the following advantages:

1. superior write performance: inserts and updates are only appended to the top level of the tree, so the LSM Tree requires only sequential writes and avoids random writes.

2. eventual merge down the hierarchy: read performance and space utilization are improved while the cost of compaction and obsolete data cleaning is amortized.  

3. a data structure of data structures: A LSM tree maintains data in two or more separate levels, each of which is optimized for its respective underlying storage medium. Each level can have its own data structure. The memory component can use a skip list or a B+ tree while the disk component can use a B+ tree or a sorted string table (SSTable).

VidarDB is the world’s first system that introduces the column store into the LSM-tree. This innovation brings an amazing speedup for analytical workloads.  The fundamental advantage in the core data structure makes VidarDB a powerful engine for business intelligence. In addtion, thanks to the MADlib library, VidarDB can support AI algorithms in SQL.


## What is the relationship between VidarDB and Postgresql?

Postgresql is one of the most popular and advanced open source database systems. Currently VidarDB is used as a storage engine of Postgresql. Compared to the original Postgresql, VidarDB provides a significant improvement in performance. Meanwhile, VidarDB embraces the PostgreSQL ecosystem. All the client drivers, tools and other components in Postgresql like its outstanding parser and optimizer can be reused by VidarDB.


## Is VidarDB stable enough to use?

VidarDB is not developed from scratch. Instead, VidarDB is built on the mature key-value store - RocksDB. VidarDB improves the core data structure and keeps the quality of codes. 

## What are the system requirements for VidarDB?

VidarDB is written in C++ and the native server runs on Linux systems. Other operating systems are being tested. We also provide [a docker image](https://www.vidardb.com/docs/run_vidarDB_in_docker/) for users to quickly deploy VidarDB on any platform.


## What client driver can I use to work with VidarDB?

VidarDB reuses the frontend of Postgresql, so the client drivers for Postgresql can also work with VidarDB. Languages such as Java, C++, Python and C#/.Net are all supported.

## Does VidarDB support SQL?

Yes, VidarDB supports the SQL syntax in Postgresql. Users can even write their AI algorithms using SQL.

## Does VidarDB support atomic operations?

Yes, all the operations in VidarDB are atomic, but VidarDB does not support full ACID for now.

## How is VidarDB licensed?

VidarDB is licensed under the BSD 3-Clause Clear License.

