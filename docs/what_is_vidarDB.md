# What is VidarDB

Welcome to this section, where you will get an overview of VidarDB.

## Basic Info
VidarDB is a unified database system for simplifying companies' architecture in the data layer, with the same interface as PostgreSQL and 50~1000X speedup. It can replace multiple data tools (Message Queues, Server Caches, Operational Databases, Data warehouse, Machine Learning) with a single unified tool, due to its efficiency, and is designed to break the trade-off between simplicity (general databases) and efficiency (purpose-built databases).

## Target Problem
Typically, companies have to install two groups of tools: one optimized for interactive client operations (e.g., message queue, server cache, operational database), and another for business analysis (e.g., data warehouse and machine learning). This deployment approach has two major drawbacks: First, it is time-consuming and costly, as multiple systems need to be maintained by expert administrators. Second, as the data need to be migrated between the different tools, it effects data freshness and reduces its business value.

VidarDB is the unified database system that eliminates the need for installing and maintaining multiple data processing tools, which significantly reduces companies' software costs and human capital, and at the same time it enables the real-time reporting.

## Core Tech
Unlike any other database that almost relies on the data structure designed in the 1970s, VidarDB is built on a new data structure we designed for modern memory hierarchy, efficiently supporting RAM, NVM, SSD, Disk as well as smooth data flow among these storage tiers. Additionally, it is a versatile data structure, which will adapt to and optimize for different workloads, such as operational, data analysis, streaming and even mixed of them. Then, we have brought the machine learning ability into VidarDB, where users can run familiar machine learning algorithms inside VidarDB via SQL, without moving your data to other tools.

<img src="../img/vidardb_arch.png" alt="drawing" width="60%" height="60%" style="display: block; margin-left: auto; margin-right: auto;"/>

VidarDB has a novel storage engine built on our designed data structure, and an additional layer to support machine learning. At the same time, it utilizes many PostgreSQL components such as parser and optimizer, and with the same interface.
