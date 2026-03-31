# Relationships

## Overview
* Relational Cardinality
  * One To One Relations
  * One To Many Relations
  * Many To Many Relations
* Joins
  * One To One Joins
  * One To Many Joins
  * Many To Many Joins



### Relational Cardinality
* Say we have `Table A` and `Table B`.
  * **One to One** - One item in `Table A` has one item in `Table B`. One item in `Table B` has one item in `Table A`
  * **One to Many** - One item in `Table A` has many items in `Table B`. One item in `Table B` has one item in `Table A`
  * **Many to Many** - One item in `Table A` has many items in `Table B`. One item in `Table B` has many items in `Table A`



### One to One
* With those tables made, we're going to have to set this table up with `FOREIGN KEY`s.
* The first thing we will be creating is a _one to one_ relationship between teachers and `teacher_meta`.
* Here we add `teacher_id` to the `teacher_meta` table so that one `teacher_meta` record can have reference to the `teacher_id` of one `teacher` record.
* To ensure that each teacher has only one meta, we also make `teacher_id` on this table `unique`.

```sql
ALTER TABLE curriculeon.teacher_meta ADD teacher_id int NOT NULL;
CREATE UNIQUE INDEX teacher_meta_teacher_id_uindex ON curriculeon.teacher_meta (teacher_id);
ALTER TABLE curriculeon.teacher_meta
ADD CONSTRAINT teacher_meta_teachers_id_fk
FOREIGN KEY (teacher_id) REFERENCES teachers (id);
```



### One to Many
* Next we'll create the _one to many_ relationship between `teacher` and `assignment`.
* One `teacher` will have many assignments that they've created, and every assignment will belong to one teacher.
* To get this we will have to add a column named `teacher_id` to `assignment` and tag the column as a `FOREIGN KEY`

```sql
ALTER TABLE curriculeon.assignments ADD teacher_id INTEGER NULL;
ALTER TABLE curriculeon.assignments
ADD CONSTRAINT teacher___fk
FOREIGN KEY (teacher_id) REFERENCES teachers (id);
```




### Many to Many
* Next we'll want to create the relationship between `student` and `assignment`.

#### Considering The Design Decisions
* In this case, one student can have many assignments.
* However, each of assignment can also belong to many students.
* Where should we add the `FOREIGN KEY`?
  * In the student table with `assignment_id`
  * In the assignment table with `student_id`




#### Assessing The Design Decisions
* Both of those options are wrong.
* To effectively match up a many to many relationship, we will need a _pivot table_
* a _pivot table_ will have foreign keys to both tables.
  * This means it is possible to have the same student id match up to multiple assignments and vice versa.
* We're also going to create a unique constraint to make sure that the same assignment can't be attached to one student more than once.




#### Defining the Schema

```sql
CREATE TABLE curriculeon.assignment_student
(
    assignment_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    CONSTRAINT students__fk FOREIGN KEY (student_id) 
    	REFERENCES students (id),
    CONSTRAINT assignments___fk FOREIGN KEY (assignment_id) 
    	REFERENCES assignments (id)
);
CREATE UNIQUE INDEX assignment_id_student_id_uindex
	ON curriculeon.assignment_student (assignment_id, student_id);
```





### Joins
* Viewing the data in one table can be useful, but often we'll want to see multiple tables' data together. To do this we use a `JOIN`.
* The Join clause will have two parts
  * The table to join to
  * The fields to compare







### Joins - One to One

* Let's do our first join to see the number of years each teacher has worked here.

```sql
SELECT t.first_name, t.last_name, tm.years FROM
  curriculeon.teachers t
JOIN curriculeon.teacher_meta tm
  ON t.id = tm.teacher_id;
```


| first_name | last_name | years |
|:-----------|:----------|------:|
| John       | Smith     | 4     |
| Tabitha    | Schultz   | 4     |
| Jane       | Herman    | 11    |







### Joins - One to Many

* Next, let's add a join to see which teachers wrote each assignment.
* This time, since some teachers may have written more than one assignment, we may see some duplication in the results.


```sql
SELECT t.first_name, t.last_name, a.name, a.URL
FROM curriculeon.teachers t
JOIN curriculeon.assignments a
  ON t.id = a.teacher_id;
```



| first_name | last_name | name           | URL                                                                     |
|:-----------|:----------|:---------------|:------------------------------------------------------------------------|
| Jane       | Herman    | Pokemon Lab    | https://github.com/Zipcoder/PokemonSqlLab                               |
| Jane       | Herman    | Poll App       | https://github.com/Zipcoder/CR-MacroLabs-Spring-QuickPollApplication    |
| Tabitha    | Schultz   | Sum or Product | https://github.com/Zipcoder/ZCW-MicroLabs-JavaFundamentals-SumOrProduct |










### Joins - Many to Many
* Lastly, let's see which assignments have been given to each student.
* For this relationship we must first join the pivot table, then join the destination table. 




```sql
SELECT s.name, a.name
FROM curriculeon.students s
JOIN curriculeon.assignment_student a_s
  ON a_s.student_id = s.id
JOIN curriculeon.assignments a
  ON a_s.assignment_id = a.id;
```


| name                 | name        |
|:---------------------|:------------|
| Linnell McLanachan   | Pokemon Lab |
| Lorianna Henrion     | Pokemon Lab |
| Corena Edgeson       | Pokemon Lab |
| Archaimbaud Lougheid | Pokemon Lab |
| Dun Pettet           | Pokemon Lab |
| Hymie Parrington     | Pokemon Lab |
| Linnell McLanachan   | Poll App    |



