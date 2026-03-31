# Database Index

## What is an Index?
* A database index is a column of a table that allows records of the respective table to be retrieved more quickly.
* A database index is most often used a primary key for a record.
* This requires extra space on disk, but will help speed up your database.
* Indexing allows efficient searching to be performed on a data set


### Design without Index

* Assume we have created a Table to account for our employees.
* Assume our first hire is a 24 year old named `Leon Hunter`.
* Assume our second hire is a 24 year old named `Leon Hunter`.
* Assume our objective is to find the age of a _particular_ `Leon Hunter`.
* The above constraints support storage of indistinct records.
* The constraints support no way to _query_ for a "_particular_ `Leon Hunter", as the data returned will not be distinct.


| First Name | Last Name | Age | Gender |
|:-----------|:----------|:----|:-------|
| Leon       | Hunter    | 24  | Male   |
| Wilhem     | Alcivar   | 23  | NULL   |
| Nhu        | Nguyen    | NULL| Female |
| Leon       | Hunter    | 24  | Male   |



### Design with Index
* Add a column named `ID` and denote column as `PRIMARY KEY` to make the column an index.
* Searching for a row by its `ID` help us retrieve only the desired data and also improve speed by a measurable degree.


| ID | First Name | Last Name | Age | Gender |
|:---|:-----------|:----------|:----|:-------|
| 1  | Leon       | Hunter    | 24  | Male   |
| 2  | Wilhem     | Alcivar   | 23  | NULL   |
| 3  | Nhu        | Nguyen    | NULL| Female |
| 4  | Leon       | Hunter    | 24  | Male   |



<hr>

## Relational Data Using Index

### Problem
* Let's say we keep a list of phone numbers now.
* Same issue as before.
* That owner there refers to only one person now, but how can we make sure that we match it to the correct person?




<table>
    <thead>
        <tr>
            <th style="text-align:left">ID</th>
            <th style="text-align:left">Phone Number</th>
            <th style="text-align:left">Phone Owner</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="text-align:left">1</td>
            <td style="text-align:left">555-321-4547</td>
            <td style="text-align:left">Wilhem</td>
        </tr>
        <tr>
            <td style="text-align:left">2</td>
            <td style="text-align:left">555-221-4548</td>
            <td style="text-align:left">Leon</td>
        </tr>
        <tr>
            <td style="text-align:left">3</td>
            <td style="text-align:left">555-782-4549</td>
            <td style="text-align:left">Nhu</td>
        </tr>
    </tbody>
</table>




### Solution
* Use the person's unique id to identify who this number belongs to.
* To find out who owns the phone number, we take that id and search for it in the Person list that we made above.
* This is what we call a _relationship_.
* Relational data uses these kinds of relationships.

<table>
    <thead>
        <tr>
            <th style="text-align:left">ID</th>
            <th style="text-align:left">Phone Number</th>
            <th style="text-align:left">Phone Owner ID</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="text-align:left">1</td>
            <td style="text-align:left">555-321-4547</td>
            <td style="text-align:left">2</td>
        </tr>
        <tr>
            <td style="text-align:left">2</td>
            <td style="text-align:left">555-221-4548</td>
            <td style="text-align:left">1</td>
        </tr>
        <tr>
            <td style="text-align:left">3</td>
            <td style="text-align:left">555-782-4549</td>
            <td style="text-align:left">3</td>
        </tr>
    </tbody>
</table>