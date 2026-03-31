# Viewing the Data

-

### Selects

We've now finished all the work we need to do for the devs and are free to explore our own database and come up with some queries that will be able to answer some questions about the students. These updates will keep our boss happy and help our teachers know what they need to do to give students the highest quality of education. 

-

### Selects

In order to get this done we'll have to `SELECT` data out of our database. A `SELECT` statement will generally have at least two parts. 

- A Select clause, where we say the columns we want to see
- A FROM clause, where we specify from which table to pull that data

-

```
SELECT id, first_name, last_name, specialty 
FROM zipcode.teachers;
```

| ID | First Name | Last Name |  Specialty  |
|:---|:-----------|:----------|:------------|
| 1  | John       | Smith     | FRONT END   |
| 2  | Tabitha    | Schultz   | MIDDLE TIER |
| 3  | Jane       | Herman    | DATA TIER   |


-

### Where Clause

We've been informed by a higher-up that there is a very important project that needs a lead. Anyone who can work on front end development will be able to help immensely. Let's try and `SELECT` from teachers again, but this time let's add a `WHERE` statement to ensure we only pull a teacher with the FRONT END specialty.


-

### Where Clause

```
SELECT id, first_name, last_name, specialty
FROM zipcode.teachers
WHERE specialty='FRONT END';
```

| ID | First Name | Last Name |  Specialty  |
|:---|:-----------|:----------|:------------|
| 1  | John       | Smith     | FRONT END   |

-

### Limit and Order Clauses

This will return a single row with the teacher John Smith, who is our only FRONT END specialist. You tell the higher-ups that you think John would be up to the task. They say great, but ask who can take over that teacher's spot. We'll want to choose the teacher with the most experience, who isn't John. 

-

### Limit and Order Clauses

We check and see that John's id is 1, so we'll keep that in mind. Next, we think of how we can find the teacher with the most years of experience. To do this, we may use an `ORDER BY` clause. This kind of clause will specify a list of fields by which we will sort a table, and the direction we want to sort them. The two directions are `ASC` and `DESC`.

-

### Limit and Order Clauses

```
SELECT id, room_number, years, teacher_id FROM zipcode.teacher_meta
WHERE teacher_id != 1
ORDER BY years DESC;
```

We specify DESC here so that the table will be ordered by years from highest to lowest. This works, but we only want to find one top teacher id. To do this, we can use a `LIMIT`. The Limit clause will take the number of items you want to return.

-

### Limit and Order Clauses

```
SELECT teacher_id FROM zipcode.teacher_meta
WHERE teacher_id != 1
ORDER BY years DESC
LIMIT 1;
```
| teacher_id |
|:----------:|
| 3          |

Select from the teachers table where id is 3 and find that Jane is the best person to take on the extra classes.