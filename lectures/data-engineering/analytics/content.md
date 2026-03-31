# Analytics




### Aggregates

* Aggregates are functions that allow you to run a function down a column rather than on each particular row.
* Some of these include
  * `COUNT`
  * `MAX`
  * `MIN`
  * `SUM`




### Aggregates - Count

* `COUNT` will give you the total number of rows in a table based on a column. 
* `COUNT` does not consider the values in any column.
* It will simply add one for each row.

```sql
SELECT COUNT(*) as "count"
FROM teachers;
```

| count |
|:-----:|
| 3     |







### Aggregates - Max/Min

* `MAX` and `MIN` will give you the largest or smallest value of a column in any row.
* `MAX` and `MIN` will consider data type when doing this sort.
* `TEXT` will sort lexographically and numbers will sort numerically.

```sql
SELECT MAX(years) as "max", MIN(years) as "min"
FROM curriculeon.teacher_meta
```

| max | min |
|:----|:----|
| 11  | 4   |





### Aggregates - Sum

* `SUM` will take the value of a numeric column and add together all of the values.

```sql
SELECT SUM(years) as "sum"
FROM curriculeon.teacher_meta
```

| sum |
|:---:|
| 19  |




### Aggregates - Group_Concat
* `GROUP_CONCAT` will take a column and concatenate all the rows. 

```SQL
SELECT GROUP_CONCAT(' ', first_name, ' ', last_name) as "group_concat"
FROM curriculeon.teachers;
```

| group_concat                              |
|:------------------------------------------|
|  John Smith, Tabitha Schultz, Jane Herman |




### Group By 
* Sometimes you want to take an aggregate of rows but you don't want to indiscriminately aggregate all rows.
* You want to group some rows together and aggregate those.
* Right now in order to do that you could try using a `WHERE` clause, but you'd have to know some information about the rows beforehand.
* Instead we may group a column with a `GROUP BY`.
* Let's write a query to list teachers who have equivilent experience together.

```SQL
SELECT GROUP_CONCAT(' ', first_name, ' ', last_name) as "teachers", years
FROM curriculeon.teachers t
JOIN curriculeon.teacher_meta tm
  ON t.id = tm.teacher_id
GROUP BY tm.years;
```

| teachers                    | years |
|:----------------------------|:-----:|
| John Smith, Tabitha Schultz | 4     |
| Jane Herman                 | 11    |





### Having

* A `HAVING` clause can be used to filter the results of a query.
* This is similar to the `WHERE` clause, but it works only with fields that are Aggregates.
* Let's write a query to find all the students who have been assigned more than one assignment.


```sql
SELECT s.name, COUNT(a_s.assignment_id) as "assignments given"
FROM curriculeon.students s
JOIN curriculeon.assignment_student a_s
  ON s.id = a_s.student_id
GROUP BY s.name
HAVING COUNT(a_s.assignment_id) > 1;
```


| name               | assignments given |
|:-------------------|:-----------------:|
| Linnell McLanachan | 2                 |




<img src="http://img.petshow.cc/ueditor/2016_01/2417092214536265621569945175386650530.jpg">

DBA corgis hope you're `HAVING` a blast!
