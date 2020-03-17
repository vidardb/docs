# Frequently Asked Questions

## How is VidarDB different from other database systems?

There are several fundamental differences. 

* Unlike most database systems relying on the data structure designed in the 1970s, VidarDB has designed a new data structure, which is a versatile data structure adaptive to and optimized for different workloads, such as operational, data analysis, streaming and even mixed of them. 

* The data structure is designed for modern memory hierarchy, efficiently leveraging RAM, NVM, SSD, Disk as well as supporting smooth data flow among these storage tiers. 

* We have brought the machine learning ability into VidarDB, where users can run familiar machine learning algorithms inside VidarDB via SQL, without moving your data to other tools.


## What is the relationship between VidarDB and PostgreSQL?

VidarDB utilizes the frontend of PostgreSQL, including its parser and optimizer, but replaces storage engine of PostgreSQL with a novel database engine based on a revolutionary data structure we designed. Currently, we keep both storage engines coexisted. Thus, you can join two tables created from different engines. Once VidarDB’s storage engine is mature, we will remove the engine of PostgreSQL. Meanwhile, VidarDB embraces the PostgreSQL ecosystem, meaning all the client drivers, tools and other components of PostgreSQL can be utilized in VidarDB directly without changing the code.


## Is VidarDB stable enough to use?

The idea and design of VidarDB are groundbreaking, but we do not develop VidarDB from scratch. Instead, the storage engine of VidarDB leverages the existing mature key-value store, RocksDB, where VidarDB seamlessly infuses the design and idea into it, and keeps the quality of our code by utilizing RocksDB code as much as possible. Additionally, VidarDB effectively utilizes the frontend of PostgreSQL, a popular database system, giving rise to a familiar interface to users.


## What are the system requirements for VidarDB?

VidarDB is written in C++, and natively runs on Linux systems. Other operating systems are being tested. We also provide [a docker image](https://www.vidardb.com/docs/run_vidarDB_with_docker/) for users to quickly deploy VidarDB on any platform.


## What client driver can I use to work with VidarDB?

VidarDB reuses the frontend of PostgreSQL, so the client drivers for PostgreSQL can also work with VidarDB without code change. Languages such as Java, C++, Python, Go and C#/.Net are all supported.


## Does VidarDB support SQL?

Yes, VidarDB supports the SQL syntax in PostgreSQL. Users can even call AI algorithms with SQL.


## How is VidarDB licensed?

VidarDB is licensed under the modified BSD 3-Clause Clear License. Anyone, no matter person or enterprise, can use it for free. But selling it directly as a service in the cloud is prohibited. 

