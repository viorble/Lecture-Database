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
    color: lightskyblue;  
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
- The ERD represents the <span class="blue-text">external model</span> as viewed by end users
- The ERD represents the <span class="blue-text">conceptual model</span> as viewed by database designer
- ERDs depict the database’s main components:
  - Entities
  - Attributes
  - Relationships
![bg right:40% w:100% database design process](https://techforumugm.files.wordpress.com/2020/03/dd01.png?w=816&h=352&crop=1)

# Entity
- An entity is an object of interest to the end user
- An entity in the ERM is a table (relation), a row is an entity instance (tuple)
- In Chen, Crow’s Foot, and UML notations, an entity is represented by a rectangle
  - contains entity name
  - entity name is a noun usually written in all capital letters. It would depend on your naming convention

# Attributes
- **Attributes** are characteristics of entities
- **Required attribute** (not null) and **optional attribute** (allow null)
- Attributes must have a **domain**, the set of possible values for a given attribute
- **Identifier** and **composite identifier** is one or more attributes that uniquely identify each row (primary key, PK)
- **Simple attribute** (age, sex) and **composite attribute** (address, phone_number)
- **Single-valued attribute** (emp_id) and **multi-valued attributes** (car_color)
  - Replace multi-value attribute by creating several new attributes
  - Replace multi-value attribute by creating an new entity
- **Derived attribute** whose value is calculated from other attributes (working_years)

# Identifier and Composite identifier
<div class="grid">
    <img src="restricted/CFig04_02.jpg" alt="">
</div>

- CLASS (<u><b>CLASS_CODE</b></u>, CRS_CODE, CLASS_SECTION, CLASS_TIME,
ROOM_CODE, PROF_NUM)
- CLASS (<u><b>CRS_CODE, CLASS_SECTION</b></u>, CLASS_TIME, ROOM_CODE, PROF_NUM)

# Entity's Notation
<div class="grid">
    <img src="restricted/CFig04_01.jpg" alt="">
    <img src="restricted/CFig04_03.jpg" alt="">
</div>

Required attribute: bold font
PK: in a separated cell with bold and underline font

# Implementing Multi-valued Attributes
<div class="grid">
    <img src="restricted/CFig04_04.jpg" alt="">
    <img src="restricted/CFig04_05.jpg" alt="">
</div>

# Derived Attributes
<div class="grid">
    <img src="restricted/CFig04_06.jpg" alt="">
</div>

# Relationship
- The entities that participate in a relationship are also known as <span class="blue-text">participants</span>
- A relationship is identified by a name that describes the relationship
- The relationship name is an active or passive <span class="blue-text">verb</span>
- <span class="blue-text">Connectivity</span> describes the relationship classification: 1:1, 1:M, and M:N
- <span class="blue-text">Cardinality</span> expresses the minimum and maximum number of entity occurrences associated with one occurrence of the related entity

# Relationship's Notation
<div class="grid">
    <img src="restricted/CFig04_07.jpg" alt="">
    <img src="restricted/CFig04_08.jpg" alt="">
</div>

- (1, 4): one professor teach at least one and no more than four classes
- (1, 1): each class is taught by one and only one professor

# Existence Dependence
- An entity represents a real-world object in a database. 
- Entity is <span class="blue-text">strong</span> or <span class="blue-text">weak</span> depends on whether the entity can exist independently or not.
- A strong (regular) entity can exist apart from all of its related entities, it is <span class="blue-text">existence-independent</span>
- A weak entity is <span class="blue-text">existence-dependent</span> on another related entity occurrence. That is, it need a mandatory foreign key. 

- Relationship 'EMPLOYEE claims DEPENDENT', the DEPENDENT entity is existence dependent on the EMPLOYEE entity. That is, DEPENDENT has a mandatory foreign key, EMP_NUM to link with EMPLOYEE. 

# Weak Entity
A weak entity is an entity that cannot exist independently and depends on a strong entity for its identification.
- Does NOT have a sufficient PK on its own.
- Requires a FK from a related strong entity to form a composite PK.
- Always has a **total participation** (every row of the weak entity must be associated with at least one row of another strong entity).
- The relationship between a weak entity and its strong entity is called an **identifying relationship**.

# Illustrate Weak Entities
- A weak entity is existence-dependent on a strong entity with a strong (identifying) relationship
- A strong entity is existence-independent
<div class="middle-grid">
    <img src="restricted/CFig04_11.jpg" alt="">
    <img src="restricted/CFig04_12.jpg" alt="">
</div> 

# Strong Entity
A strong entity (or existence-independent entity) is an entity that can exist independently. It has a primary key that uniquely identifies each record without depending on any other entity.
-	Has a PK that uniquely identifies each instance.
- Does not depend on any other entity for its identification.
- STUDENT(<u><b>STUDENT_ID</b></u>, NAME, AGE, MAJOR)

# Example of Strong and Weak Entities
Considering two entities: EMPLOYEE (strong) and DEPENDENT (weak)
- Entity EMPLOYEE (<u><b>EMPLOYEE_ID</b></u>, NAME, AGE)
- Entity DEPENDENT (<u><b>DEPENDENT_NAME, EMPLOYEE_ID</b></u>, RELATIONSHIP)
- DEPENDENT_NAME alone cannot uniquely identify a dependent.
- EMPLOYEE_ID (from entity Employee) is needed to uniquely identify each dependent.
- PK of DEPENDENT is a combination of DEPENDENT_NAME + EMPLOYEE_ID.
- A weak entity is always associated with a strong entity through an **identifying relationship**.

# Key Differences Between Strong and Weak Entities
<style scoped>
table {
  font-size: 20px;
}
</style>
Feature	|Strong Entity|	Weak Entity
--------|-------------|------------
Existence|Can exist independently|Cannot exist without a related strong entity
Primary Key|Has a unique primary key|Requires a FK from a related strong entity to form a composite PK.
**Relationship Type**	|Regular relationship|Identifying relationship
**Participation**	|Can be partial or total|	Always total participation

# Relationship Strength
- <u>Relationship strength</u> is based on how to define PK of a related entity. 
- To implement a relationship, the PK of one entity (parent entity, normally on the “one” side of 1:M relationship) appears as a FK in the related entity (child entity, mostly the entity on the “many” side of 1:M relationship) to link two entities. 
  - <span class="blue-text"> Non-identifying(weak) Relationships </span>: if the PK of the related ("M side") entity does <u>NOT</u> contain a PK of the parent ('1 side') entity
  - <span class="blue-text"> Identifying (strong) Relationships</span>: when the PK of the related ("M side") entity contains the PK of the parent ("1 side") entity

# Illustration of Relationship Strength

<div class="middle-grid">
    <img src="restricted/CFig04_09.jpg" alt="">
    <img src="restricted/CFig04_10.jpg" alt="">
</div> 

- dotted line shows weak relationships; solid line shows strong relationships
- The 'o' symbol in Fig 4.10 is related to relationship participation

# Non-Identifying (Weak) Relationship
When the related (M side) entity has its own primary key and does not depend on another entity (1 side) for identification.
- The relationship exists between two strong entities.
- The FK in the related (M side) entity is not part of the PK of the related (1 side) entity.
- The related entity can exist independently.
For example:
- COURSE(<u><b>CRS_CODE</b></u>, DEPT_CODE, CRS_DESCRIPTION, CRS_CREDIT)
- CLASS(<u><b>CLASS_CODE</u></b>, *CRS_CODE*, CLASS_SECTION, CLASS_TIME, ROOM_CODE, PROF_NUM)
- CRS_CODE is a FK of entity CLASS

# Identifying (Strong) Relationship
Exists when a weak entity depends on a strong entity for its identification.
- The FK of the related (M side, weak) entity is 
- Part of weak (M side) entity's PK is the FK of it, which link to strong entity.
- The weak entity cannot exist independently.
For example:
- COURSE(<u><b>CRS_CODE</u></b>, DEPT_CODE, CRS_DESCRIPTION, CRS_CREDIT)
- CLASS(<u><b>CRS_CODE, CLASS_SECTION</u></b>, CLASS_TIME, ROOM_CODE, PROF_NUM)
- CRS_CODE + CLASS_SECTION is a PK of entity CLASS 
- CRS_CODE is a FK of entity CLASS

# Key Differences Between Non-Identifying and Identifying Relationships
<style scoped>
table {
  font-size: 20px;
}
</style>
Feature|Non-Identifying (Weak) Relationship | Identifying (Strong) Relationship
-------|-----------------------------|--------------------------
Entity Type	|Between strong entities|	Between a strong and weak entity
Foreign Key in Related Entity|	FK is not part of PK|	FK is part of composite PK
Entity Independence	|Related entity can exist independently| Related entity cannot exist without the strong entity

# The Order to Load Tables Under 1:M Relationship 
- Keep in mind that the order in which the tables are created and loaded is very important.
- In the “COURSE generates CLASS” relationship, the COURSE table must be created before the CLASS table. After all, it would not be acceptable to have the CLASS table’s foreign key refer to a COURSE table that did not yet exist.
- Load the data of the “1” side first in a 1:M relationship to avoid the possibility of referential integrity errors.

# Relationship Participation
- Relationship participation is either <span class="blue-text">optional or mandatory</span>.
- Because of the bidirectional nature of relationships, it is necessary to determine the connectivity as well as max and min cardinalities of the relationship from COURSE to CLASS and from CLASS to COURSE. 
- **Optional participation** means that one entity occurrence does not require a corresponding entity occurrence in the relationship
- **Mandatory participation** means that one entity occurrence requires a corresponding entity occurrence in the relationship

# Illustration of Relationship Participation

<div class="middle-grid">
    <img src="restricted/CFig04_13.jpg" alt="">
    <img src="restricted/CFig04_14.jpg" alt="">
    <img src="restricted/CFig04_15.jpg" alt="">
</div> 

# Mandatory (Total) Participation
An entity has mandatory (total) participation in a relationship if every instance of that entity must be associated with at least one instance of another entity.
- Every entity instance must participate in the relationship.
- Common in weak entities where a weak entity cannot exist without a strong entity.
For example
- Entity EMPLOYEE (EMPLOYEE_ID, NAME, AGE)
- Entity DEPENDENT (DEPENDENT_NAME, EMPLOYEE_ID, RELATIONSHIP)
- Relationship: **Employee “Has” Dependents**
- Every Dependent must be associated with an Employee.
- Dependent has mandatory (total) participation because it cannot exist without an Employee.

# Optional (Partial) Participation
An entity has partial participation in a relationship if some instances of the entity may not be associated with another entity.
- Not all entity instances are required to participate in the relationship.
For example
- COURSE(**CRS_CODE**, DEPT_CODE, CRS_DESCRIPTION, CRS_CREDIT)
- CLASS(**CLASS_CODE**, *CRS_CODE*, CLASS_SECTION, CLASS_TIME, ROOM_CODE, PROF_NUM)
- CRS_CODE is a FK of entity CLASS

# Key Differences Between Total and Partial Participation
<style scoped>
table {
  font-size: 20px;
}
</style>
Feature	| Total Participation |	Partial Participation
--------|---------------------|----------------------
Requirement|	Every entity instance must participate|	Some entity instances may not participate
Entity Dependency|	Entity cannot exist without the relationship|	Entity can exist independently
Common Examples|	Weak entities (e.g., Dependent must have an Employee)	|Optional relationships (e.g., Student may or may not have a Library Members

# Relationship Degree
- A relationship degree indicates the number of entities associated with a relationship
- A unary relationship exists when an association is maintained within a single entity 
- A binary relationship exists when two entities are associated
- A ternary relationship exists when three entities are associated


# Illustration of Relationship Degree (ERD)
<div class="middle-grid">
    <img src="restricted/CFig04_16.jpg" alt="">
</div> 

# Illustration of Relationship Degree (Table)
<div class="grid">
    <img src="restricted/CFig04_17.jpg" alt="">
</div>

# Recursive Relationship
One of unary relationship
<div class="middle-grid">
    <img src="restricted/CFig04_18.jpg" alt="">
    <img src="restricted/CFig04_19.jpg" alt="">
    <img src="restricted/CFig04_20.jpg" alt="">
    <img src="restricted/CFig04_21.jpg" alt="">
</div> 

# Associative (Composite) Entities
- The ER model uses the associative entity to represent an M:N relationship between two or more entities
- It is also called a composite or bridge entity and is a 1:M relationship with the parent entities
- It is composed of the primary key attributes of each parent entity
- The composite entity may also contain additional attributes that play no role in connective process

# Illustration of Associative Entities
STUDENT has CLASS is a M:N relationship
<div class="grid">
    <img src="restricted/CFig03_23.jpg" alt="">
    <img src="restricted/CFig04_26.jpg" alt="">
</div> 

# Developing an ER Diagram
Building an ERD usually involves the following activities as a <span class="blue-text">iterative process</span>:
- Create a detailed description of the organization’s operations
  - Interview users
  - Investigate SOPs, Forms, Reports 
- Identify business rules based on the description of operations
- Identify main entities and relationships from the business rules
- Develop the initial ERD
- Identify the attributes and primary keys that adequately describe entities
- Revise and review the ERD

# Tiny College (TC) (1,2/10)
- Tiny College is divided into several schools.
  - A school is managed by a professor. 
  - Each professor can be the dean of only one school, or none of any school. 
- Each school has several departments.
  - The number of departments operated by a school is at least one to many
  - Each department belongs to only a single school
![bg right:40% w:100% CFig04_27](restricted/CFig04_27.jpg)

# Tiny College (TC) (3/10)
- Each department may offer courses.
  - Some departments that were classified as "research only," they would not offer courses; therefore, the COURSE entity would be optional to the DEPARTMENT entity.
![bg right:40% w:100% CFig04_28](restricted/CFig04_28.jpg)

# Tiny College (TC) (4/10)
- A department may offer several sections (classes) of the same course. Each of those classes is taught by a professor at a given time in a given place. 
- A class is offered during a given semester. SEMESTER defines the year and the term that the class will be offered. 
- CLASS is optional to SEMESTER.
- CLASS is optional to COURSE.
![bg right:40% w:100% CFig04_29](restricted/CFig04_29.jpg)

# Tiny College (TC) (5/10)
- Each department should have one or more professors assigned to it. 
- One and only one of those professors chairs the department
- Not all professors are required to chair a department. 
- DEPARTMENT is optional to PROFESSOR in the "chairs" relationship.
![bg right:40% w:100% CFig04_30](restricted/CFig04_30.jpg)

# Tiny College (TC) (6/10)
- Each professor may teach up to four classes; each class is a section of a course.
- A professor may also be on a research contract and teach no classes at all.
![bg right:40% w:100% CFig04_31](restricted/CFig04_31.jpg)

# Tiny College (TC) (7/10)
- A student may enroll in several classes but take each class only once.
- Each student may enroll in up to six classes, and each class may have up to 35 students, (STUDENT and CLASS is M:N relationship ). 
- This M:N relationship must be divided into two 1:M relationships by ENROLL entity 
- If a class exists but has no students enrolled in it, that class does not occur in the ENROLL table. ENROLL entity is weak: it is existence-dependent.
![bg right:40% w:100% CFig04_32](restricted/CFig04_32.jpg)

# Tiny College (TC) (8/10)
- Each department has several students whose major is offered by that department.
- Each student has only a single major associated with a single department.
- It is possible for a student not to declare a major field of study.
![bg right:40% w:100% CFig04_33](restricted/CFig04_33.jpg)

# Tiny College (TC) (9/10)
- Each student has an advisor in his or her department
- Each advisor counsels several students.
- An advisor is also a professor, but not all professors advise students.
- Therefore, STUDENT is optional to PROFESSOR in the "PROFESSOR advises STUDENT" relationship.
![bg right:40% w:100% CFig04_34](restricted/CFig04_34.jpg)

# Tiny College (TC) (10/10)
- A class is taught in a room.
- Each room is located in a building.
- A building can contain many rooms. 
- Some buildings do not contain (class) rooms.
![bg right:40% w:100% CFig04_35](restricted/CFig04_35.jpg)

# Tiny College (TC) (Summary: Entities)
PROFESSOR
COURSE
STUDENT
SCHOOL
CLASS
BUILDING
DEPARTMENT
SEMESTER
ROOM
ENROLL (the associative entity between STUDENT and CLASS)

# Summary: Components of ERM
![bg right:70% w:100% CTable04_04](restricted/CTable04_04.jpg)

# Summary: Completed ERD
![bg right:70% w:60% CFig04_36](restricted/CFig04_36.jpg)

# Database Design Challenges: Conflicting Goals
- Database designers must often make design compromises that are triggered by conflicting goals
  - Database design must conform to design standards
  - High processing speed may limit the number and complexity of logically desirable relationships
  - Maximum information generation may lead to loss of clean design structures and high transaction speed
- A design that meets all logical requirements and design conventions is an important goal

# Database Design Challenges: Example
![bg right:70% w:90% CFig04_39](restricted/CFig04_39.jpg)

# Review Questions
- What two conditions must be met before an entity can be classified as a weak entity?
- What are the main characteristics of entity relationship components?
- What is the difference between weak entity and strong entity?
- What is the difference between non-identifying and identifying relationship?
- How to translate M:N relationship in ERM?

# Homework #B
資料庫課程作業(B)
