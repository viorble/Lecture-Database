---
marp: true
theme: default
paginate: true
---
# Why Database
- Databases evolved from the need to manage **large amounts** of data in an **organized and efficient** manner
- Databases is everywhere
![bg right:60% w:600 Database is everywhere](restricted/CFig01_01.jpg)

---
# DIKW Pyramid
- **Data** consists of raw facts
- **Information** is about adding context to reveal the meaning of data
- **Knowledge** is about how to use the information
- **Wisdom** is about when to take action
![bg right:40% w:500 DIKW Pyramid](https://cdn.goconqr.com/uploads/media/image/17322876/desktop_976d9df3-92c0-41a9-939b-2fe6a63e1dcb.png)

---
# Data versus Information
- Information is the result of processing raw data to reveal the meaning of data
- **Data management** is a discipline that focuses on the proper generation, storage, and retrieval of data
![bg right:60% w:750 Data vs Information](restricted/CFig01_02.jpg)

---
# Introducing the Database
- A **database** is a collection of related data.
  - represent a **mini-world** to reflect some aspect of the real world
  - **logically coherent** collection of data with some inherent meaning
  - is designed, built, and populated with data for **a specific purpose**
- A **database management system (DBMS)** is a collection of programs that manages the database structure and controls access to the data stored in the database. Here, the database refers to a shared, integrated computer structure.
- Examples of DBMS: MySQL, Microsoft SQL Server, Oracle Database, MongoDB, Cassandra, Neo4j, ...

---
# Role and Advantages of DBMS
- DBMS presents the end user with a single, integrated view of the data in the database
- DBMS advantages:
  - Improved data sharing
  - Improved data security
  - Better data integration
  - Minimized data inconsistency
  - Improved data access
![bg right:40% w:500 DBMS role](restricted/CFig01_04.jpg)

---
# Types of DBMS
- by # of users: single-user, multiple-user 
- by location: centralized, distributed, cloud
- by time sensitive: online transaction processing (OLTP), online analytical processing (OLAP)
- by data characteristics: SQL store structured data, NoSQL store unstructured and semi-structured data

---
# Why Should We Learn Database Design
- **Database design** refers to the activities that focus on the design of the database structure that will be used to store and manage end-user data
- Poorly designed databases can lead to slow performance, data integrity issues, security vulnerabilities, and challenges in scaling applications.

![bg right:50% w:600 poor database design](restricted/CFig01_05.jpg)

---
# Database Design Process
- Requirements & Analysis: discover users requirements, analyze what data should be maintained
- Conceptual model: create a model that represents mini-world objects and their relationships.
- **Choice of a DBMS**
- Logical model: adapts the conceptual model to a specific DBMS implementation model.
- Physical model: create database keys, constraints, indexes, and other RDBMS features
- Implementation: realize physical model on running environment and optimize performance

![bg right:30% w:400 database design process](https://techforumugm.files.wordpress.com/2020/03/dd01.png?w=816&h=352&crop=1)

---
# A Good Database Design Following Database Design Process
![bg right:50% w:600 poor database design](restricted/CFig01_06.jpg)

---
# Database Application Environment
Defines and regulates the collection, storage, management, and use of data within a database environment, including:
- Hardware
- Software
- People
- Procedures
- Data

![bg right:55% w:700 database application environment](restricted/CFig01_10.jpg)
