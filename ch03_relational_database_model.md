---
marp: true
theme: default
paginate: true
---
# Chapter3: The Relational Database Model
- Learn about the **relational model's logical structure** and about how entity relationship diagrams (ERDs) can be used to design a relational database. 
- Learn how the relational database's basic data components into a logical construct known as a table, and how tables within a database can related to one another.
- Learn about tables, their components, and their relationships, and basic table design.

---
# A Logical View of Data
- Logical simplicity tends to yield simple and effective database design methodologies
- Provide systematical and visual way to design data model

---
# Tables and Their Characteristics
- A **table** (relation) is a two-dimensional structure composed of rows and columns
- Each **row** (tuple) represents a single entity occurrence within the entity set
- Each **column** represents an attribute, and each column has a distinct column name
- Each intersection of a row and column represents a single **data value**
- All values in a column must conform to the same **data format**
- Each column has a specific allowable values known as the **attribute domain**
- Each table must have an attribute or combination of attributes (**primary key PK**) that uniquely identifies each row
- A **foreign key (FK)** is a primary key of one table that has been placed in another table to illustrate the relationship among tables
- The order of the rows and columns is immaterial to the DBMS

---
# Keys
- A key consists of one or more attributes that determine other attributes (invoice# determines invoice date and customer name)
- Key are used to ensure that each row in a table is uniquely identifiable (PK)
- Key are also used to establish relationships among tables and to ensure the integrity of the data (FK)
![bg right:50% w:600 table characteristics](restricted/CFig03_01.jpg)

---
# Dependencies
- **Functional dependence** means that the value of one or more attributes determines the value of one or more other attributes
- In relational database theory, a functional dependency is the following constraint between two attribute sets in a relation: 
  - Given a relation R and attribute sets X, Y ⊆ R , X is said to functionally determine Y (written X → Y) if each X value is associated with precisely one Y value. R is then said to satisfy the functional dependency X → Y. 
  - The attribute X whose value determines another is called the **determinant** or the key
  - The attribute Y whose value is determined by the other is called the **dependent** 
  
---
# Example 1 of Functional Dependence
![bg right:40% w:400 example of FD](files/image/functional_dependency_example.png)

- Whenever two rows in this table having the same StudentID, they also necessarily have the same Semester values. This basic fact can be expressed by a functional dependency: **StudentID → Semester**.
- If a row was added where the student had a different value of semester, then the functional dependency FD would no longer exist. This means that the FD is implied by the data as it is possible to be destroyed.

---
# Example 2 of Functional Dependence
![bg right:50% w:600 FD in textbook](restricted/CFig03_01.jpg)
- STU_NUM → STU_LNAME
- STU_NUM → (STU_LNAME, STU_FNAME, STU_GPA)
- (STU_FNAME, STU_LNAME, STU_INIT, STU_PHONE) → (STU_DOB, STU_HRS, STU_GPA)
- STU_NUM → STU_GPA
- (STU_NUM, STU_LNAME) → STU_GPA 


---
# Full Functional Dependence and Partial Functional Dependence
- Full functional dependence is used to refer to functional dependencies in which the **entire collection of attributes** in the determinant is **necessary** for the relationship
- Simply put, if A fully determines B without any proper subset of A giving full cause to B, then A is said to fully depend on B. In other words, you cannot derive B from a smaller part of A.
  - Full functional dependence: STU_NUM → STU_GPA
  - Partial functional dependence(STU_NUM, STU_LNAME) → STU_GPA   

---
# Types of Keys (Primary Key)
- A **composite key** is a key that is composed of more than one attribute
- An attribute that is part of a key is called a **key attribute**
- A **super key** is a key that can uniquely identify any **row** in the table
- A **candidate key** is a minimal super key; that is, a key that does not contain a subset of attributes that is itself a super key. Choice a candidate key as **primary key**
- **Entity integrity** is the condition in which each row in the table has its own known, unique and non-null identity (primary key)
- A **null** is the absence of any data value which is never allowed in a primary key
  - An unknown attribute value
  - A known, but missing, attribute value
  - A “not applicable” condition

---
# Example of Keys
![bg right:50% w:600 keys](restricted/CFig03_01.jpg)
- Keys are determinants in functional dependence
- Composite key: *(STU_FNAME, STU_LNAME, STU_INIT, STU_PHONE)* → STU_HRS
- Superkey: STU_NUM, (STU_NUM, STU_LNAME), (STU_FNAME, STU_LNAME, STU_INIT)
- Candidate key: STU_NUM

---
# Type of Keys (Foreign Key and Secondary Key)
- A **foreign key** (FK) is a primary key of one table that has been placed in another table
- **Referential integrity** is a condition by which a dependent table’s foreign key entry must have either a null entry or a matching entry in the primary key of the related table
- A **secondary key** is a key that is used strictly for data retrieval purposes and does not require a functional dependency
  - not require a functional dependency. one X value may get more Y values
  - (CUS_LNAME, CUS_PHONE) can be a secondary key to serve data retrieval purposes when CUS_NUM is the primary key

---
# Example of a Simple Relational Database
![bg right:60% w:800 relational DB](restricted/CFig03_02.jpg)

---
# Relational Database Keys Comparison
Key Type| Definition
--------|-----------
Super key|An attribute or combination of attributes that uniquely identifies each row
Candidate key|A minimal superkey
Primary key| A candidate key selected to uniquely identify any given row; cannot contain null entries
Foreign key | An attribute or combination of attributes in one table whose values must either match the primary key in another table or be null
Secondary key | An attribute or combination of attributes used for data retrieval purposes 

---
# Integrity Rules
- **Entity integrity**: all primary key entries are unique, and no part of a primary key may be null. 
  - No invoice can have a duplicate number, nor can it be null
- **Referential Integrity**: foreign key value allow null and every non-null foreign key value must reference an existing primary key value. 
  - A customer might not yet have an assigned sales representative (allow null), but it will be impossible to have an invalid sales representative (must reference).

---
# Illustration of Integrity Rules
![bg right:60% w:800 relational DB](restricted/CFig03_03.jpg)

---
# Relational Algebra
- **Relational algebra** is a set of mathematical principles that form the basis for manipulating relational table contents
- The following are the eight main functions: SELECT, PROJECT, JOIN, INTERSECT, UNION, DIFFERENCE, PRODUCT, and DIVIDE
- **Formal Definitions and Terminology**
  - A relation is the data that you see in your tables
  - A relvar (relation variable) is a variable that holds a relation. It is a container (variable) for holding a relation data, not the relation itself
  - A relvar has the following two parts:
    - The heading contains the names of the attributes
    - The body contains the relation

---
# Relational Set Operators (SELECT)
SELECT is an operator used to select a subset of rows
![bg right:60% w:800 select table](restricted/CFig03_04.jpg)

---
# Relational Set Operators (PROJECT)
PROJECT is an operator used to select a subset of columns
![bg right:60% w:800 project table](restricted/CFig03_05.jpg)

---
# Relational Set Operators (UNION)
UNION is an operator used to merge two tables into a new table, dropping duplicate rows
![bg right:60% w:800 union table](restricted/CFig03_06.jpg)

---
# Relational Set Operators (INTERSECT)
INTERSECT is an operator used to yield only the rows that are common to two union-compatible tables
![bg right:60% w:800 intersect table](restricted/CFig03_07.jpg)

---
# Relational Set Operators (DIFFERENCE)
DIFFERENCE is an operator used to yield all rows from one table that are not found in another union-compatible table
![bg right:60% w:800 difference table](restricted/CFig03_08.jpg)

---
# Relational Set Operators (PRODUCT)
PRODUCT is an operator used to yield all possible pairs of rows from two tables
![bg right:60% w:800 product table](restricted/CFig03_09.jpg)

---
# Relational Set Operators (JOIN)
JOIN allows information to be intelligently combined from two or more tables
- Natural join links tables by selecting only the rows with common values in their common attributes
- Equijoin – links tables on the basis of an equality condition that compares specified columns of each table
- Theta join – links tables using an inequality comparison operator
- **Inner join** – only returns matched records from the tables that are being joined
- **Left outer join**: yields all of the rows in the first table, including those that do not have a matching value in the second table 
- Right outer join: yields all of the rows in the second table, including those that do not have matching values in the first table

---
# Natural Join
PRODUCT -> SELECT -> PROJECT
<style>
.grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 10px;
}
.grid img {
    width: 100%;
}
</style>

<div class="grid">
    <img src="restricted/CFig03_10.jpg" alt="two tables">
    <img src="restricted/CFig03_11.jpg" alt="product">
    <img src="restricted/CFig03_12.jpg" alt="select">
    <img src="restricted/CFig03_13.jpg" alt="project">
</div>

---
# Left Outer Join
<div class="grid">
    <img src="restricted/CFig03_10.jpg" alt="two tables">
    <img src="restricted/CFig03_14.jpg" alt="left outer join">
</div>

---
# Right Outer Join
<div class="grid">
    <img src="restricted/CFig03_10.jpg" alt="two tables">
    <img src="restricted/CFig03_15.jpg" alt="right outer join">
</div>

---
# Relational Set Operators (DIVIDE)
The DIVIDE operator is used to answer questions about one set of data being associated with all values of data in another set of data
![bg right:60% w:800 divide](restricted/CFig03_16.jpg)

---
# Data Dictionary and the System Catalog
- **Data dictionary** describes all tables in the DB created by the user and designer
- **System catalog** describes all objects within the database
- Homonym – same name is used to label different attributes 
- Synonym – different names are used to describe the same attribute 
![bg right:40% w:90% data dictionary](restricted/CTable03_06.jpg)
 
---
# Relationships within the Relational Database 
 
