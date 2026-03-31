# Intro to SQL and Relational Databases
_by [miscbits](https://github.com/miscbits)_

-

### Overview

- Definitions
- Connecting to a database
- Creating a schema with tables
- Seeding a database
- SELECTING data
- Analytics/Processing
- Relationships
- Putting it into code

-
-

### What is a database?
A database is an organized collection of data. A database will usually have some sort of api to query the data. Using a Structured Query Language (SQL) will allow you to interact with the data in a predictable way. A query in this case is a statement you ask a database. A properly made database will be able to answer a query with all relevent information.

What makes a database relational though?

-

### Indexing

"
A database index is a data structure that improves the speed of data retrieval operations on a database table at the cost of additional writes and storage space to maintain the index data structure
"

Basically, you put a special tag on a piece of data so that you can find it faster. This requires extra work and takes more space on disk, but will help speed up your database.

-

### Indexing

Most SQL data sets will have columns based on the fields of an item and rows for each of the individual items. When written out, it resembles a spreadsheet.

| First Name | Last Name | Age | Gender |
|:-----------|:----------|:----|:-------|
| Leon       | Hunter    | 24  | Male   |
| Wilhem     | Alcivar   | 23  | NULL   |
| Nhu        | Nguyen    | NULL| Female |

-

### Indexing

Issue: Let us say we want to find out Leon's age. We might tell our database to return all the info related to the row with the first name of Leon. For now that would work since we only have one Leon in the database, but what if we hired another Leon? We could ask for only Leon Hunter, but we really can't rely on this data always being unique. 

| First Name | Last Name | Age | Gender |
|:-----------|:----------|:----|:-------|
| Leon       | Hunter    | 24  | Male   |
| Leon       | Smith     | 24  | Male   |

-

### Indexing

Solution: Add a unique id to each row. 

| ID | First Name | Last Name | Age | Gender |
|:---|:-----------|:----------|:----|:-------|
| 1  | Leon       | Hunter    | 24  | Male   |
| 2  | Wilhem.    | Alcivar   | 23  | NULL   |
| 3  | Nhu.       | Nguyen    | NULL| Female |

We can denote this id as the `PRIMARY KEY` which will make this an index. Searching for a row by its id will not only help us get only the data we want, but it will also be faster by a measurable degree

-

### Indexing

Let's say we keep a list of phone numbers now: 

| ID | Phone Number | Phone Owner |
|:---|:-------------|:------------|
| 1  | 555-321-4547 | Wilhem      |
| 2  | 555-221-4548 | Leon        |
| 3  | 555-782-4549 | Nhu         |

Same issue as before. That owner there refers to only one person now, but how can we make sure that we match it to the correct person?

-

### Indexing

Solution: Use the person's unique id to identify who this number belongs to.

| ID | Phone Number | Phone Owner ID |
|:---|:-------------|:---------------|
| 1  | 555-321-4547 | 2              |
| 2  | 555-221-4548 | 1              |
| 3  | 555-782-4549 | 3              |

To find out who owns the phone number, we take that id and search for it in the Person list that we made above. This is what we call a relationship. Relational data uses these kinds of relationships.