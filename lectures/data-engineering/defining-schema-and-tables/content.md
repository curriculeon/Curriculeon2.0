# Creating a schema with tables




### Schemas and Tables

* Lets say we are designing a database for our backend developers.
  * They are creating an app for teachers to keep track of their students' assignments.
  * We'll also want to keep metadata on the teachers.
  * Their application has Students, Teachers, Labs, and Submissions.
  * Let's try to go through designing this database.

* First we'll need to make a schema.
  * To do this we can run the following script:

```sql
CREATE SCHEMA curriculeon
```



### Schemas and Tables

* What have we just done? _We created a SCHEMA_
  * Created a home for all data related to an application
  * Allowed ourselves to manage multiple applications in the same database without worrying about collisions




### Schemas and Tables

* Teachers have a name and a specialty.
  * We are going to create a table with these fields as well as a unique identifier.
  * To create a a table we use the `CREATE TABLE` command.
  * Let's make the Teacher Table
  * In this query, we create each column followed by the properties of the columns.
  * We are using the `INTEGER`, `VARCHAR`, and `ENUM` data types

```sql
CREATE TABLE curriculeon.teachers
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    specialty ENUM('FRONT END', 'MIDDLE TIER', 'DATA TIER')
);
CREATE UNIQUE INDEX teachers_id_uindex ON curriculeon.teachers (id);
```





### Schemas and Tables

* Next let us make a student table.
  * The student record will have a name, a classroom, and notes from the teachers on a particular student
  * In this query we create each of these columns and are using `INTEGER`, `VARCHAR`, `TINYTEXT`, and `TEXT`.

```sql
CREATE TABLE curriculeon.students
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    classroom TINYTEXT,
    notes TEXT
);
CREATE UNIQUE INDEX students_id_uindex ON curriculeon.students (id);
```






### Schemas and Tables

* Lastly, we need an assignment table.
* This should merely have the assignment name and a link to the assignment.
* We are creating a table similar to the last two, however we are making the URL a fixed length `CHAR` field and making that unique.

```sql
CREATE TABLE curriculeon.assignments
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name TINYTEXT NOT NULL,
    URL CHAR(255) NOT NULL
);
CREATE UNIQUE INDEX assignments_id_uindex ON curriculeon.assignments (id);
CREATE UNIQUE INDEX assignments_URL_uindex ON curriculeon.assignments (URL);
```




### Schemas and Tables

* Last, but not least, we'll be creating the teacher_meta table.
* In the meta table, the developers will keep track of the number of years a teacher has worked here, and the room number of the teacher's office.
* Here we use the `TINYINT` column and make those unsigned.

```sql
CREATE TABLE curriculeon.teacher_meta
(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    room_number TINYINT UNSIGNED,
    years TINYINT UNSIGNED
);
CREATE UNIQUE INDEX teacher_meta_id_uindex ON curriculeon.teacher_meta (id);
```






### Schemas and Tables

* Now we have tables, but we have learned that teachers are actually going to have a first name and last name, and the devs have said they want these to be two separate fields.
* Before we continue let's `ALTER` this table.

* We are going to `ADD` first name amd last name.
* Then we will `DROP` name.

```sql
ALTER TABLE curriculeon.teachers ADD first_name VARCHAR(25) NOT NULL;
ALTER TABLE curriculeon.teachers ADD last_name VARCHAR(25) NOT NULL;
ALTER TABLE curriculeon.teachers DROP name;
```




### One to One
* With those tables made, we're going to have to set this table up with `FOREIGN KEY`s.

* The first thing we will be creating is a One to One relationship between teachers and teacher_meta.

```sql
ALTER TABLE curriculeon.teacher_meta ADD teacher_id int NOT NULL;
CREATE UNIQUE INDEX teacher_meta_teacher_id_uindex ON curriculeon.teacher_meta (teacher_id);
ALTER TABLE curriculeon.teacher_meta
ADD CONSTRAINT teacher_meta_teachers_id_fk
FOREIGN KEY (teacher_id) REFERENCES teachers (id);
```

* Here, we add teacher_id to the teacher_meta table so that one teacher meta will belong to a teacher.
* To ensure that each teacher has only one meta, we also make teacher_id on this table unique.



### One to Many

* Next we'll create the One to Many relationship between teachers and assignments.

* One teacher will have many assignments that they've created, and every assignment will belong to one teacher.
* To get this we will have to add a column called teacher_id on assignment and then mark that as a `FOREIGN KEY`

```sql
ALTER TABLE curriculeon.assignments ADD teacher_id INTEGER NULL;
ALTER TABLE curriculeon.assignments
ADD CONSTRAINT teacher___fk
FOREIGN KEY (teacher_id) REFERENCES teachers (id);
```




### Many to Many

* Next we'll want to create the relationship between students and assignments.
* In this case, one student can have many assignments, but each of those assignments can also belong to many students.
* Where should be put the `FOREIGN KEY`?
  * In the student table with `assignment_id`
  * In the assignment table with `student_id`




### Many to Many

* Both of those options are wrong.
* To effectively match up a many to many relationship, we will need a pivot table
  * a pivot table will have foreign keys to both tables meaning that you can have the same student id match up to multiple assignments and vice versa.

* We're also going to create a unique constraint to make sure that the same assignment can't be attached to one student more than once.




### Many to Many

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