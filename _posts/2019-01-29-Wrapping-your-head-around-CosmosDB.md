---
title: Wrapping your head around CosmosDB
author: Ravin Perera
linkedin: https://lk.linkedin.com/in/ravin-perera-61b4662b
description : CosmosDB
---

Cosmos DB is a globally-distributed multi-model NoSQL database service from Microsoft Azure. It seems that Microsoft is targeting developers moving on from SQL Server as well as MongoDB to transition to Cosmos DB. When you look at the marketing material, you might be tempted to switch your project to Cosmos DB because it's cool and new. Today, I'll talk about confusing areas and also hidden facts they don't highlight, that are crucial to be aware of when moving to Cosmos DB as a newcomer. This is mostly targeted at people who want to try out Cosmos DB transitioning from SQL Server/relational background but also there's something to take on for MongoDB devs as well.

Let's take CosmosDB features and limitations which are worth explaining one by one.

**Marketing keyword: Globally-distributed**

We all know what this is. Copies of your data are kept around the world and users from different regions of the world can receive the data from the closest copy. You can use this feature for improving performance and also use it for high-availability fail-over regions. One question I had was what if we want to restrict data for one country? (for data-sovereignty requirements). Well, you can do that by selecting the regions you data is available in.

**Marketing keyword: Multi-model**

This is not something we hear with lot of other database providers. What Microsoft has done here is, providing several independent database concepts under one roof. In plain English, Cosmos DB supports 3 database types. 

 1. JSON Document database

 You have 2 choices here. You can create your database with SQL API support which is more suitable for people familiar with SQL. Or you  can create MongoDB compatible database which is more suitable as a drop-in replacement for existing applications written for MongoDB.

 2. Key-value pair database

 You can create an Azure Table Storage-like database or Apache Casandra database under Cosmos DB.

 3. Graph database

 A graph database which supports Apache Gremlin API.

```
Possible confusion: SQL API vs DocumentDB vs MongoDB

When you look at Cosmos DB-related documentation on the web, you will stumble upon these terms 
which makes it difficult to choose what you want. There's some history associated with these 
terms knowing which can clear the picture.	

SQL API and DocumentDB means the same thing. The term DocumentDB was the old marketing term 
Microsoft used to name their JSON document database. Before introducing Cosmos DB service, 
DocumentDB NoSQL database service was Microsoft's competitor for MongoDB. When they came up 
with Cosmos DB, Microsoft moved DocumentDB under the roof of Cosmos DB to be a member of 
their "multi-model" offering.	

Then, after a while, to attract SQL Server developers, they renamed DocumentDB to "SQL API". 
So, when you look for Cosmos DB documents, you will encounter the old term "DocumentDB". 
New documents will call it as "SQL API". Also know that the term "SQL API" actually means 
"SQL-like query language for NoSQL JSON documents", NOT an actual relational/SQL database.	

MongoDB is Microsoft's MongoDB provider under Cosmos DB. It's purpose is to attract existing 
MongoDB developers into Azure Cosmos DB platform.

```

**Containers, Partitions and Throughput**

In Cosmos DB, you store all your items within containers. You can have several containers per database. SQL developers may tend to think of containers as Tables in a relational database, but this thinking can lead to lot of confusion. Just think of them as folders where you can put any kind of object. Since you get charged per container and they are not cheap, it's usually a good idea to put multiple types of your objects in a single container and manually filter the object type when you query.

All the data in a container is partitioned for load-balancing purposes. Every object you insert into a container is automatically stored in a partition specified by the value of a designated field (a.k.a "Partition Key") in the object. As the developer, you choose the field that needs to be treated as the partition key. This is how Cosmos DB provides its performance guarantees. If all your data live inside a single partition, Cosmos DB cannot do any load balancing between any queries/operations. You have to help Cosmos DB by equally distributing your data across many partitions. Designing your data strategy to support this depends on the business context of your application, and involves much deeper thought process than designing a normalized relational data model. You have to balance your partition design carefully between the following concerns which is not an easy task.

1. Should have as many partitions as possible (for better load balancing).

2. All partitions should be equally popular for data reads/writes (to avoid hot partitions).

3. All partitions should hold less than 10GB of data (Cosmos DB has 10GB partition size limit).

4. Store related data in the same partition as much as possible (to avoid cross-partition queries).

You have to tell Cosmos DB how much computing resources to allocate for your container. For this, Microsoft has come up with a unit called "Request Units per Second (RU/s)". A request unit is a virtual unit (just like DTU in Azure SQL) which represents some amount of CPU/RAM and other computing power in Azure infrastructure. Cosmos DB calculates how much RUs were used for every database operation you perform (you can get this value under "Request Charge" field in the response data of every database operation). You can experiment with a sample of your actual data operations and get an idea of how much total RUs would need to be allocated for your container. Per month, you'll get charged the corresponding dollar value for the RUs you've allocated.

```
Is it expensive?

Cosmos DB is inherently a high-performance database engine. So the minimum resource 
allocation allowed starts from around 24 USD a month. This is bit off-putting for 
newcomers who just want to store a simple set of data in a NoSQL database under 
Azure platform. The truth is, Cosmos DB is like a high performance sports car. 
You should not complain that a sports car is expensive. 
There are no cheap commodity versions available. 
In contrast, Azure SQL allows you to start from $5 a month and go up to very 
expensive configurations. However, this cannot be compared with Cosmos DB since 
it is infinitely scalable and for the money you pay, 
you get super-high-performance (sub 10ms latency globally). Overall, it offers 
better value-for-money than high-performance SQL Server configurations.

```

**Achieving high-performance**

Cosmos DB pricing model and internal data storage architecture is designed to build high-performance databases from the ground up. However, as the developer, you also play an important role in that. Just like a sports car needs a skilled mechanic and driver to realize its true potential, the decisions taken by you as the developer impacts a lot to your Cosmos DB performance. Mainly you have to help Cosmos DB by choosing the right partition key design. Furthermore, just as a sports car should ideally be driven in a race track, the kind of data and the business problem you are trying to solve might make it difficult for you to harness the full power of Cosmos DB.

**Using SQL API on .Net**

Cosmos DB has decent .Net wrappers for its rest API. For the SQL API (JSON NoSQL documents) specifically, it also offers support for LINQ translations. However, it's not fully mature like LINQ/EntityFramework support for SQL Server. Most Cosmos DB documentation examples use plain text SQL for queries, but I highly recommend to use LINQ if at all possible. We've had to apply workarounds for some limitations in the current LINQ provider but it has mostly worked out well for us in terms of type safety and code maintainability. A side benefit of using LINQ is it enables you to mock your Cosmos DB data access code for in-memory data storage, so you can easily unit test you business code.

**Further reading:**

https://docs.microsoft.com/en-us/azure/cosmos-db/partition-data

https://docs.microsoft.com/en-us/azure/cosmos-db/request-units

https://github.com/Azure/azure-cosmos-dotnet-v2/blob/master/samples/code-samples/Queries/Program.cs

