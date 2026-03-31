# Structured Query Language

## Overview
* What is Structured Query Language?
* Data Definition Language
* Data Query Language
* Data Manipulation Language
* Data Control Language
* Transaction Control Language

<hr>


### What is Structured Query Language?
* Structured Query Language (SQL) is the database language used to create and perform operations on databases.
* SQL uses certain commands like `CREATE`, `INSERT`, `SELECT`, `DROP`, etc. to carry out the required tasks.
* SQL commands are mainly categorized into four categories as:
	1.  DDL – Data Definition Language
	2.  DQL – Data Query Language
	3.  DML – Data Manipulation Language
	4.  DCL – Data Control Language
	5.  TCL – Transaction Control Language


<hr>

### Data Definition Language
* Data Definition Language (DDL) consists of the SQL commands used to define the database schema.
* It deals with descriptions of the database schema
* It is used to create and modify the structure of database objects in the database.
* **Example**
	* `CREATE`– is used to create the database or its objects (like table, index, function, views, store procedure and triggers).
	* `DROP`– is used to delete objects from the database.
	* `ALTER` -is used to alter the structure of the database.
	* `TRUNCATE` –is used to remove all records from a table, including all spaces allocated for the records are removed.
	* `COMMENT`–is used to add comments to the data dictionary.
	* `RENAME`–is used to rename an object existing in the database.


<hr>

### Data Query Language
* DML statements are used for performing queries on the data within schema objects. 
* The purpose of Data Query Language (DQL) is to get some schema relation based on the query passed to it.
* **Example of DQL**
	* `SELECT`– is used to retrieve data from the a database.


<hr>

### Data Manipulation Language
* The SQL commands that deals with the manipulation of data present in the database belong to Data Manipulation Language (DML) and this includes most of the SQL statements.
* **Examples of DML**
  * `INSERT`– is used to insert data into a table.
  * `UPDATE`– is used to update existing data within a table.
  * `DELETE`– is used to delete records from a database table.

<hr>

### Data Control Language
* Data Control Language (DCL) includes commands such as `GRANT` and `REVOKE` which mainly deals with the rights, permissions and other controls of the database system.
* **Examples of DCL commands:**    
    * `GRANT` - gives user’s access privileges to database.
    * `REVOKE` - withdraw user’s access privileges given by using the GRANT command.

<hr>

### Transaction Control Language
* Transaction Control Language (TCL) commands deal with the [transaction within the database](https://www.geeksforgeeks.org/sql-transactions/).    
* **Examples of TCL commands:**
	* `COMMIT` - commits a Transaction.
	* `ROLLBACK` – rollbacks a transaction in case of any error occurs.
	* `SAVEPOINT` – sets a savepoint within a transaction.
	* `SET TRANSACTION` – specifies characteristics of the transaction.