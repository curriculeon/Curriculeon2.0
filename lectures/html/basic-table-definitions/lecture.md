# Tables - Basic Definitions


-
-
## Overview
* Defining a table
* Naming the table
* Creating and naming columns
* Creating columns



-
-
### Defining a Table
* Tables are a way to represent information in a grid format
* Defined by the `<table>` with opening and closing tags

```html
    <table>
    </table>
```


-
### Naming the Table
* Defining the name of the table is done using the `<caption>` opening and closing tags
* The `<caption>` tag must be inserted immediately after the `<table>` tags
* There can only ONE `<caption>` tag specified

```html
    <table>
      <caption>Title of you table</caption>
    </table>
```


-
-
### Creating and Naming Columns
* Tables are divided into as many rows needed for your data purposes
* Rows are created using the `<tr>` opening and closing tags
* Rows are named using the table header `<th>` opening and closing tags

```html
    <table>
      <caption>Title of your table</caption>
      <tr>
        <th>Column header 1</th>
        <th>Column header 2</th>
      </tr>
    </table>
```

-
-
### Creating columns
* Table rows are divided into table columns(table data)
* Columns are created using the `<td>` opening and closing tags

```html
  <table>
    <caption>Title of your table</caption>
    <tr>
        <th>Column header 1</th>
        <th>Column header 2</th>
    </tr>
    <tr>
        <td>Data 1</td>
        <td>Data 2</td>
    </tr>
  </table>
```


-
-
### Example
```HTML
    <table>
      <caption>Title of you table</caption>
        <tr>
          <th>Column header 1</th>
          <th>Column header 2</th>
        </tr>
        <tr>
          <td>Data 1</td>
          <td>Data 2</td>
        </tr>
        <tr>
          <td>Data 3</td>
          <td>Data 4</td>
        </tr>
    </table>
```


-
-
## Demonstration
<img src="my-first-table.gif">

-
-
## Lecture Summary
* Defining a table using the `<table>` opening and closing tags and using the `<caption>` tags to name the table
* Rows are created with the `<tr>` tags
* Columns are created with the `<td>` tags and are named using the `<th>` tags
