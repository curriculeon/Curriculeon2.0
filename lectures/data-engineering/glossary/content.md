# Intro to Database Management Systems


## Overview
* What is a Data Set?
* What is a Data Set Collection?
* What is a Database Engine?
* What is a Database?




### What is a Data Set?
* A _dataset_ is representative of a _collection of like-records_.
    * A dataset has many rows.
* A _row_ is representative of a _single record_ within a dataset.
    * A row has many columns.
* A _column_ is representative of a _field_ (or property) _of a record_.
    * A column within a row is a _cell of data_.
* In SQL, datasets are called _Tables_.
* In Spreadsheet Applications, (like Excel of Google Sheets), datasets are called _Worksheets_.


| First Name | Last Name | Age | Gender |
|:-----------|:----------|:----|:-------|
| Leon       | Hunter    | 24  | Male   |
| Wilhem     | Alcivar   | 23  | NULL   |
| Nhu        | Nguyen    | NULL| Female |






### What is a Data Set Collection?
* In SQL, collections of datasets are called **_databases_**.
* In Spreadsheet Applications, collections of datasets are called _workbooks_.



### What is a Database Engine?
* the software component that the Database Management System uses to perform relational CRUD operations on a Database
  * Create records
  * Read records
  * Update records
  * Delete records


### What is a Database?
* A query is an inquiry: a request for information
* Unlike workbooks, a database has an api to query the data, referred to as Structured Query Language (SQL).
* Well-designed databases respond to queries with relevent information quickly without redundancies.
* Well-designed databases allow querying related data across several tables.