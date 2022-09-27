# What is VidarDB

This material provides a brief overview of VidarDB.

## Basic Info

VidarDB is a PostgreSQL extension. Its revolutionary Flexible Advanced Data Structure (FADS) enables orders of magnitude speed multiplication for both data ingestion and query execution. The extension requires only 10 MB of disk and 10 MB of RAM for its ten minute, completely non-intrusive installation, which supercharges PostgreSQL system performance.

Our extension modifies the performance of layers which are well below the human interface, and so, will seem invisible to the database users. Invisibility means there is no training required to use this remarkable extension. All the benefits of PostgreSQL remain, and users gain the benefits of VidarDB.

The performance improvements will speed task execution, supporting business growth while reducing costs. For database systems, faster is better!

## Target Problem

For many decades, analytic queries have accessed data in a B-Tree data structure (a generalization of the binary tree structure). The queries may take a long time to execute, as the data can be spread across multiple tables, or in rows and columns within tables, and there may be GB (TB, PB, …) of data.  

Of course, Moore’s Law has helped to mask the speed limitations imposed by the antiquated B-Tree data structure, but those year-over-year gains have slowed in recent years. Ever since the invention of the B-Tree in the 1970s, database system designers have tried to speed queries by employing various methods including indexing schemes, horizontal scaling, and vertical scaling. All these solutions are costly in terms of either hardware cost, labour cost, infrastructure cost, or combinations of all of these. Importantly, timeliness of information extracted from the data is one of the costs to a business.

The fundamental problem was that the underlying data structure was unwieldy. This was the target problem that launched VidarDB’s development. We sought a solution to the ever-rising cost of a query by changing the data structure used by the query.  

We invented our revolutionary Flexible Advanced Data Structure (FADS).  It is the first major invention in this arena since the 1970s. The new invention affords an order of magnitude speed multiplier in queries and two orders of magnitude in data ingestion. This speed advantage reduces cost in all the cost areas, and orders of magnitude gains in the timeliness of information flowing from the data.

Our solution has been three years in development and is at the cusp of market deployment as the core technology of an extension to PostgreSQL.

## Core Technology

Unlike most other databases that almost rely on a data structure designed in the 1970s, VidarDB is built on a revolutionary new Flexible Advanced Data Structure (FADS) that we invented for modern memory hierarchy, efficiently supporting RAM, NVMe, SSD, Disk as well as smooth data flow among these storage tiers.

Additionally, it is a versatile, polymorphic data structure, which will adapt to, and optimize for different workloads, such as operational, data analysis, streaming and even a mixture of them.  Operational and analytic databases, with their associated tools, have been combined into a single simple system which enables the extreme speed improvements we have reported.  

The VidarDB core technology exists in software layers well away from the human interfaces of PostgreSQL. As an extension to PostgreSQL, users retain all the benefits of that system, while gaining the speed and simplicity provided by an essentially invisible software layer.

VidarDB is not only a storage engine, because it embeds deeply in PostgreSQL and reutilize PostgreSQL’s many components, including SQL interface. Additionally, VidarDB has its own executor based on PostgreSQL’s.
