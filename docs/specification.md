# Specification

This document describes the tech specification of VidarDB.

## Fast Data Ingestion

Of course, performance improvements must be reported using a standard methodology to allow for system to system comparisons.  We have executed the global standard TPC-H data ingestion benchmark tests on both HDD and SSD with randomized input of the lineitem table (the biggest table in the dataset), scaling from 100 MB to 50 GB.

With an index on the primary key, B-tree of PostgreSQL and VidarDB’s patented data structure, we observed that data ingestion is up to 70 and 35 times faster than PostgreSQL for HDD and SSD respectively.  VidarDB’s data ingestion speed remained the same throughout the testing, while PostgreSQL’s performance decreases as the dataset grows.

Similar results would be observed in other places, as long as the disk side is a bottleneck with growing data amounts. The science behind this dramatic difference is the B-Tree’s delete and rebuild mechanism working to keep the index self balanced during data input.

The VidarDB invention does not have any similar limitation to performance.


## Fast Analytics

Of course, performance improvements must be reported using a standard methodology to allow for system to system comparisons.  We have executed six of the global standard TPC-H query tests with a 20 GB standard dataset using a commodity laptop. Although only six of the tests are being reported here, others are in progress. 

The speed improvement varies with the query performed, but the average performance improvement shows a 10 times increase over PostgreSQL alone.  To assure an ‘apples to apples’ comparison, we didn’t build any extra indexes on the data, and used only a single process.  These 6 queries contain both scan and join, where we forced both systems to use the widely accepted hash join. 

The VidarDB extension is much better than the PostgreSQL alone, and the order of magnitude increase in query speed has a direct cost benefit in execution time, hardware cost, and finally labour cost of the analysts creating information from a data set.

## PostgreSQL Extension

The design and implementation of VidarDB has followed a principle of complete non-intrusiveness, which means your PostgreSQL remains intact when the VidarDB extension is installed.  At the same time, you can benefit from the speed of VidarDB with the familiar PostgreSQL front end. Just think of Chrome and the Chrome extension for ease of understanding. Furthermore, VidarDB is configurable through the same configure file as PostgreSQL. 

The VidarDB extension can exist in as little as 10 MB on disk and 10 MB in RAM.  It can be installed in about 10 minutes. Uninstallation of VidarDB is also easy, needing only 1 minute to remove all traces of VidarDB.

Because VidarDB is a PostgreSQL extension, it brings orders of magnitude performance improvement to naked PostgreSQL, while retaining all the familiarity of the existing system.  The extension works in deep layers below the human interfaces, so no training period is needed.

## Efficient Use of Resources

There are many relational database management systems (RDBMS) available today. The number of choices is daunting to any business decision-maker.  Once a selection is made for a business, the operational staff must make resource decisions to support growth of the data and increased demands of users.

One method for increased performance is to scale hardware horizontally by adding additional nodes. The server nodes might be colocated, as in a blade system, or dispersed, perhaps in different geographic regions. There are RDBMS vendors supporting up to 1000 nodes now.

Another method for increasing performance is to scale hardware vertically by improving the nodes themselves. The nodes might have upgraded processors, memory, storage disk size or type.  Each node in a system might be upgraded.

VidarDB’s patented invention was to change the way the database is queried.  By installing a database software extension, the data ingestion performance and analytics performance are increased by 70 and 10 times respectively.

This software installation is then about equivalent to using 10 nodes in horizontal scaling terms or a mainframe in vertical scaling terms.

For an existing data centre, computer hardware is used more efficiently by making the software ‘smarter’ to provide a 90% reduction in hardware operating cost.

## Immediacy of Data Analysis

In the 1970s, binary tree data structures were generalized to the B-Tree structure. This invention allowed for nodes to have more than two children.  This structure is still used by many relational database management systems (RDBMS) today.

In most large current data collection and analysis systems, the data are collected all day in an operational database and then copied to an analytic database overnight. Of course, that is a very time-consuming task where columns of a table are heavily indexed.

After 50 years with little change to the data structure, Shichao Jin invented a new data structure. That invention was awarded a patent in 2021.

This revolutionary new structure supports significant speed increases in both data ingestion and data analysis. It may disrupt the RDBMS marketplace by making the operational and analytic database separation paradigm obsolete.

Using the VidarDB extension to PostgreSQL allows the use of a single live database because data ingestion is so fast. There is no data latency forced by the separation of the functionality of the two databases. There is just ‘the database’.

Many database users don’t even know that there are two different functional database systems.  Our invention has simplified the technology, so they won’t have to learn about the difference.
