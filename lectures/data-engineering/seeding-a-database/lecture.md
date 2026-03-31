-
# Seeding a Database

-

### Inserts

Our database is set up for our devs to use, but they've asked us to create some mock data for them to demo their app. To do this we'll have to `INSERT` some data.

Let's start by inserting a few teachers.

-

### Inserts

Inserts will generally have 3 parts

- Reference to the table you want to insert into
- The columns you want to fill
- The values to fill those columns with

Let's create a teacher and then that teacher's meta.

-

### Inserts

```
INSERT INTO zipcode.teachers (first_name, last_name, specialty)
    VALUES ('John', 'Smith', 'FRONT END');

```

Here we are creating a new row in the teachers table. The first_name is set to John, the last_name is set to Smith, and the specialty is set to FRONT END. Note that the order of the columns we listed will be the order we list the values. If there is a different number of columns and values, then this will throw an error. Also note that since the id on this table is set to auto increment, it will automatically be filled in with the id of 1. 

-

### Inserts

We now have one teacher in this table and we can add a few more, but instead of running them one by one, we can also just add many at the same time.

```
INSERT INTO zipcode.teachers (first_name, last_name, specialty)
    VALUES ('Tabitha', 'Schultz', 'MIDDLE TIER'),
      ('Jane', 'Herman', 'DATA TIER');
```

-

### Inserts

With the ability to insert data, we can also start populating the other tables

```
INSERT INTO zipcode.teacher_meta (teacher_id, years, room_number)
    VALUES (1, 3, 2),
      (2, 3, 2),
      (3, 10, 1);
```

```
INSERT INTO zipcode.students (name, classroom, notes)
  VALUES  ('Linnell McLanachan', '1A', 'Likes Data'),
	('Lorianna Henrion', '1A', 'Loves Data'),
	('Corena Edgeson', '1A', 'Cannot get enough of data'),
	('Archaimbaud Lougheid', '2A', 'Would rather do nothing other than sit down in front of a mountain of data and read through it like a book. SERIOUSLY needs to seek help about this because there is no way it is healthy for this person to like data any more than they do'),
	('Dun Pettet', '2A', NULL ),
	('Hymie Parrington', '2A', 'Enjoys the Star Wars prequels');
```

-

### Inserts

```
INSERT INTO zipcode.assignments (name, URL, teacher_id)
  VALUES ('Pokemon Lab', 'https://github.com/Zipcoder/PokemonSqlLab', 3),
  ('Poll App', 'https://github.com/Zipcoder/CR-MacroLabs-Spring-QuickPollApplication', 3),
  ('Sum or Product', 'https://github.com/Zipcoder/ZCW-MicroLabs-JavaFundamentals-SumOrProduct', 2);
```

```
INSERT INTO zipcode.assignment_student (assignment_id, student_id)
    VALUES (1, 1), (1, 2), (1,3), (1,4), (1,5), (1,6), (2, 1);
```

-

### Updates

Updating data is very similar to inserting, but we will use an `UPDATE` clause instead. For this we will need to specify a table we want to update, then a `SET` clause to specify how to change a field or fields.

Our devs inform us that they want a way to increment the number of years each teacher has worked here. Let's see how we would write that update statement

-

### Updates

```
UPDATE zipcode.teacher_meta
SET years = years+1;
```

Here we are able to increment the years by setting years = to whatever its own value is plus one. This works because SQL will go row by row. In each row, the years variable is set to whatever the value is in that particular row. 

-

### Stored Procedures

Now that we know how to do inserts and updates, it may be useful for us to create a stored procedure for something that will be done regularly. The devs have asked us to put this update statement in a Stored Procedure. 

```
CREATE PROCEDURE zipcode.increment_years_experience ()
BEGIN
  UPDATE zipcode.teacher_meta
    SET years = years+1;
END;
```

This procedure can be called instead of a developer trying to write their own update statement. This gives us control over the data and ensures it's quality remains up to a standard. (using 'CALL zipcode.increment_years_experience()') 