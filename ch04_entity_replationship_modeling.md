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
    font-size: 0.50rem;
  }
---
# Chapter4: Entity Relationship (ER) Modeling
- Data modeling is the first step in database design, as a bridge between real-world objects and the database model implemented in the computer.
- It is important to illustrate data-modeling details graphically through entity relationship diagrams (ERDs) to facilitate communication.
<div class="middle-grid">
    <img src="restricted/CFig02_05.jpg" alt="">
</div>

# Entity Relationship Model
- The entity relationship model (ERM) forms the basis of an ERD
- The ERD represents the <span class="blue-text">conceptual database</span> as viewed by the end user
- ERDs depict the database’s main components:
  - Entities
  - Attributes
  - Relationships
![bg right:40% w:100% database design process](https://techforumugm.files.wordpress.com/2020/03/dd01.png?w=816&h=352&crop=1)

# Entity
- An entity is an object of interest to the end user
- An entity refers to the entity set and not to a single entity occurrence
- An entity in the ERM is a table, a row is an entity instance entity occurrence
- In Chen, Crow’s Foot, and UML notations, an entity is represented by a rectangle
  - contains entity name
  - entity name is a noun usually written in all capital letters

# Attributes
- **Attributes** are characteristics of entities
- **Required attribute** and **optional attribute**
- Attributes must have a **domain**, which is the set of possible values for a given attribute
- **Identifier** and **composite identifier** is one or more attributes that uniquely identify each row (primary key, PK)
- **Simple attribute** (age, sex) and **composite attribute** (address, phone_number)
- **Single-valued attribute** (emp_id) and **multi-valued attributes** (car_color)
  - Create several new attributes to replace multi-value attribute
  - Create an new entity
- **Derived attribute** whose value is calculated from other attributes (working_years)

# Entity's Notation
<div class="grid">
    <img src="restricted/CFig04_01.jpg" alt="">
    <img src="restricted/CFig04_03.jpg" alt="">
    <img src="restricted/CFig04_04.jpg" alt="">
    <img src="restricted/CFig04_06.jpg" alt="">
</div>

# Relationship
- The entities that participate in a relationship are also known as <span class="blue-text">participants</span>
- A relationship is identified by a name that describes the relationship
- The relationship name is an active or passive <span class="blue-text">verb</span>
- <span class="blue-text">Connectivity</span> describes the relationship classification: 1:1, 1:M, and M:N
- <span class="blue-text">Cardinality</span> expresses the minimum and maximum number of entity occurrences associated with one occurrence of the related entity

# Relationship Notation
<div class="grid">
    <img src="restricted/CFig04_07.jpg" alt="">
    <img src="restricted/CFig04_08.jpg" alt="">
</div>

# Existence Dependence