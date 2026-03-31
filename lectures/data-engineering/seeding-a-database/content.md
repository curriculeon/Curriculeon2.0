# Seeding a Database




### Inserts
* Our database is set up for our devs to use, but they've asked us to create some mock data for them to demo their app.
* To do this we'll have to `INSERT` some data.
* Let's start by inserting a few teachers.




### Inserts

* Inserts will generally have 3 parts
  1. Reference to the table you want to insert into
  2. The columns to insert into
  3. The values to insert into those columns
* Let's create a teacher and then that teacher's meta.


### INSERT Teacher Record

* Here we are creating a new row in the teachers table.
* The first_name is set to John, the last_name is set to Smith, and the specialty is set to FRONT END.
* Note that the order of the columns we listed will be the order we list the values.
* If there is a different number of columns and values, then this will throw an error.
* Also note that since the id on this table is set to auto increment, it will automatically be filled in with the id of 1. 

```sql
INSERT INTO curriculeon.teachers (first_name, last_name, specialty) VALUES
  ('John', 'Smith', 'FRONT END');
```




### Inserts

* We now have one teacher in this table and we can add a few more, but instead of running them one by one, we can also just add many at the same time.

```sql
INSERT INTO curriculeon.teachers (first_name, last_name, specialty) VALUES
    ('Tabitha', 'Schultz', 'MIDDLE TIER'),
    ('Jane', 'Herman', 'DATA TIER');
```




### Inserts

* With the ability to insert data, we can also start populating the other tables

```sql
INSERT INTO curriculeon.teacher_meta (teacher_id, years, room_number) VALUES
  (1, 3, 2),
  (2, 3, 2),
  (3, 10, 1);
```

```sql
INSERT INTO curriculeon.students (name, classroom, notes) VALUES
  ('Linnell McLanachan', '1A', 'Likes Data'),
	('Lorianna Henrion', '1A', 'Loves Data'),
	('Corena Edgeson', '1A', 'Cannot get enough of data'),
	('Archaimbaud Lougheid', '2A', 'Would rather do nothing other than sit down in front of a mountain of data and read through it like a book. SERIOUSLY needs to seek help about this because there is no way it is healthy for this person to like data any more than they do'),
	('Dun Pettet', '2A', NULL ),
	('Hymie Parrington', '2A', 'Enjoys the Star Wars prequels');
```




### Inserts

```sql
INSERT INTO curriculeon.assignments (name, URL, teacher_id) VALUES
  ('Learner Lab', 'https://github.com/curriculeon/maven_learnerlab', 3),
  ('Dice And Bin', 'https://github.com/curriculeon/maven.diceandbin', 3),
  ('Spring React Template', 'https://github.com/curriculeon/spring.react_projecttemplate', 2);
```

```sql
INSERT INTO curriculeon.assignment_student (assignment_id, student_id) VALUES 
    (1, 1), (1, 2), (1,3), (1,4), (1,5), (1,6), (2, 1);
```




### Updates

* Updating data is very similar to inserting, but we will use an `UPDATE` clause instead.
* For this we will need to specify a table we want to update, then a `SET` clause to specify how to change a field or fields.
* Our devs inform us that they want a way to increment the number of years each teacher has worked here.
* Let's see how we would write that update statement




### Updates

* Here we are able to increment the years by setting years equal to whatever its own value is plus one.
* This works because SQL will go row by row.
* In each row, the years variable is set to whatever the value is in that particular row. 

```sql
UPDATE curriculeon.teacher_meta
SET years = years+1;
```





### Stored Procedures
* Now that we know how to do inserts and updates, it may be useful for us to create a stored procedure for something that will be done regularly.
* The devs have asked us to put this update statement in a Stored Procedure. 
* This procedure can be called instead of a developer trying to write their own update statement.
* This gives us control over the data and ensures it's quality remains up to a standard. (using `CALL curriculeon.increment_years_experience()`) 

```sql
CREATE PROCEDURE curriculeon.increment_years_experience ()
BEGIN
  UPDATE curriculeon.teacher_meta
    SET years = years+1;
END;
```