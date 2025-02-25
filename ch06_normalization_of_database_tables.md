---
marp: true
theme: default
class: invert
size: 16:9
paginate: true
footer: 國立陽明交通大學 電子與光子學士學位學程
headingDivider: 1
style: |
  section::after {
    content: attr(data-marpit-pagination) '/' attr(data-marpit-pagination-total);
  }
  
  .middle-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
  }
  .middle-grid img {
    width: 75%;
  }
  .grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 10px;
  }
  .grid img {
    width: 100%;
  }
  .red-text {
    color: red;
  }
  
  .blue-text {
    color: blue;  
  }

  .small-text {
    font-size: 0.80rem;
  }
---
# Chapter6: Normalization of Database Tables
- Good database design must be matched to good table structures. 
- Learn to evaluate and design good table structures to **control data redundancies** thereby avoiding data anomalies.
- The process that yields such desirable results is known as **normalization**.

# Database Tables and Normalization
- <span class="blue-text">**Normalization**</span> is a process for evaluating and correcting table structures to **minimize data redundancies** 
  - Reduce data anomalies
  - Assigns attributes to tables based on determination
- Normalization works through a series of stages called normal forms
![bg right:50% w:100%](https://www.c-sharpcorner.com/UploadFile/nipuntomar/normalization-and-its-types/Images/Norm.gif)

# A Sample Report Layout
![bg right:70% w:100%](restricted/CTable06_01.jpg)

# Poor Table Structure
![bg right:60% w:100%](restricted/CFig06_01.jpg)
- Data inconsistency
- Difficult to update
- Data redundant

# Enough Normalization
- From a structural point of view, higher normal forms are better than lower normal forms
- For most purposes in business database design, 3NF is as high as you need to go in the normalization process
- Denormalization produces a lower normal form to increase performance but greater data redundancy

# The Need for Normalization
- Database designers commonly use normalization in the following two situations:
  - When designing a new database structure
  - To analyze the relationship among the attributes within each entity and determine if the structure can be improved through normalization
- The main goal of normalization is to eliminate data anomalies by eliminating unnecessary or unwanted data redundancies
- Normalization uses the concept of functional dependencies to identify which attribute determines other attributes

# The Normalization Process
The objective of normalization is to ensure:
- Each table represents a single subject
- Each row/column intersection contains only one value and not a group of values
- No data item will be unnecessarily stored in more than one table. Data is updated in only one place
- All non-prime attributes in a table are dependent on the primary key
- Each table has no insertion, update, or deletion anomalies
- Ensure that all tables are in at least in 3NF in business environment
- Work one relation at a time, identifying the determination and functional dependencies of a relation (table)

# Normal Forms
![bg right:70% w:100%](restricted/CTable06_02.jpg)

# Normalization Base: Functional Dependency
- Normalization starts by identifying the dependencies of a given table
- Them progressively breaking up the table into a set of new tables based on the identified dependencies.
- Functional Dependency: The attribute B is fully functionally dependent on the attribute A if each value of A determines one and only one value of B.
- Example: 
  - PROJ_NUM → PROJ_ NAME (read as PROJ_ NUM functionally determines PROJ_NAME)
  - Attribute PROJ_NUM is known as the determinant attribute
  - Attribute PROJ_NAME is known as the dependent attribute.

# Functional Dependency Type: Partial dependency
When there is a functional dependence in which the determinant is only part of the PK
- The assumption is that there is only one candidate key 
- Partial dependencies tend to be straightforward and easy to identify

Example
- functional dependency: (A, B) &rarr; (C, D)
- functional dependency: B &rarr; C
- primary key: (A, B)
- We will call B &rarr; C is partial dependency 

# Functional Dependency - Transitive dependency
When the attribute is dependent on another attribute that is not part of the primary key
- Transitive dependencies are more difficult to identify among a set of data
- They occur only when a functional dependence exists among non-prime attributes
Example
- functional dependencies X → Y
- functional dependencies Y → Z
- primary key: X 
- the dependency X → Z is a transitive dependency because X determines the value of Z via Y. 
- Y → Z signals that a transitive dependency exists because Y is not a PK.

# Why Do We Do Database Normalization?
![bg right:70% w:100%](https://cdn.hackr.io/uploads/posts/attachments/1666888816mdnYlrMoEE.png)

# Conversion to First Normal Form (1NF) 