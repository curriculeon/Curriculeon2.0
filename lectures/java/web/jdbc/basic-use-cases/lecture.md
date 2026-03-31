# JDBC
## Basic Use Cases

-
-
### Procedure to Connect to Database with JDBC
0. Add a connector dependency
1. Register Database `Driver`
2. Initialize `Connection` by providing each of the following to `DriverManager`:
    * Database URL
    * Username
    * Password
3. Prepare a statement
4. Execute the statement
5. Retrieve Database results


-
#### Procedure to Connect to Database
##### Step 0 - Add connector dependency
* `Connector` is a program that enables various databases to be accessed by Java application servers.
* Add the dependency to your `pom.xml` or `build.gradle` to ensure your application can connect to a respective vendor.
* The example below uses `mysql-connector-java` to interface with a `MySQL` database.


```xml
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.18</version>
</dependency>
```




-
#### JDBC Procedure to Connect to Database
##### Step 1 - Register Driver
* JDBC includes a `DriverManager` class which enables database `Driver` creation and database `Driver` registry.
    * Registry ensures that the same connection can be referenced throughout different parts of the application



-
#### JDBC Procedure to Connect to Database
##### Step 1 - Register Driver

```java

static void registerJDBCDriver() {
    // Attempt to register JDBC Driver
    try {
        DriverManager.registerDriver(Driver.class.newInstance());
    } catch (InstantiationException | IllegalAccessException | SQLException e1) {
        throw new SQLError(e1);
    }
}

public static void main(String[] args) {
    registerJDBCDriver();
}
```




-
#### JDBC Procedure to Connect to Database
##### Step 2 - Initialize Connection

```java
static Connection getConnection(String dbVendor) {
    String username = "root";
    String password = "";
    String url = "jdbc:" + dbVendor + "://127.0.0.1/";
    try {
        return DriverManager.getConnection(url, username, password);
    } catch (SQLException e) {
        throw new Error(e);
    }
}

public static void main(String[] args) {
    registerJDBCDriver();
    Connection mysqlConnection = getConnection("mysql");
    Connection mariadbConnection = getConnection("mariadb");
}
```




-
#### JDBC Procedure to Connect to Database
##### Step 3 - Create Statement

```java
static Statement getScrollableStatement(Connection connection) {
    int resultSetType =  ResultSet.TYPE_SCROLL_INSENSITIVE;
    int resultSetConcurrency = ResultSet.CONCUR_READ_ONLY;
    try { // scrollable statements can be iterated more than once without closing
        return connection.createStatement(resultSetType, resultSetConcurrency);
    } catch (SQLException e) {
        throw new Error(e);
    }
}

public static void main(String[] args) {
    registerJDBCDriver();
    Connection mysqlDbConnection = getConnection("mysql");
    Statement scrollableStatement = getScrollableStatement(mysqlDbConnection);
}
```





-
#### JDBC Procedure to Connect to Database
##### Step 4A - Executing Statement; creating Database

```java
static void executeStatement(Connection connection, String sqlStatement) {
    try {
        Statement statement = getScrollableStatement(connection);
        statement.execute(sqlStatement);
        connection.commit();
    } catch (SQLException e) {
        throw new Error(e);
    }
}

public static void main(String[] args) {
    registerJDBCDriver();
    Connection mysqlDbConnection = getConnection("mysql");
    executeStatement(mysqlDbConnection, "CREATE DATABASE IF NOT EXISTS databaseName;");
    executeStatement(mysqlDbConnection, "USE databaseName;");
}
```




-
#### JDBC Procedure to Connect to Database
##### Step 4B - Executing Statement; creating Table

```java
public static void main(String[] args) {
  registerJDBCDriver();
  Connection mysqlDbConnection = getConnection("mysql");
  executeStatement(mysqlDbConnection, "CREATE DATABASE IF NOT EXISTS databaseName;");
  executeStatement(mysqlDbConnection, "USE databaseName;");
  executeStatement(mysqlDbConnection, new StringBuilder()
      .append("CREATE TABLE IF NOT EXISTS databaseName.pokemonTable(")
      .append("id int auto_increment primary key,")
      .append("name text not null,")
      .append("primary_type int not null,")
      .append("secondary_type int null);")
      .toString());
}
```





-
#### JDBC Procedure to Connect to Database
##### Step 4C - Executing Statement; populating Table

```java
public static void main(String[] args) {
  registerJDBCDriver();
  Connection mysqlDbConnection = getConnection("mysql");

  executeStatement(mysqlDbConnection, "CREATE DATABASE IF NOT EXISTS databaseName;");
  executeStatement(mysqlDbConnection, "USE databaseName;");
  executeStatement(mysqlDbConnection, new StringBuilder()
      .append("CREATE TABLE IF NOT EXISTS databaseName.pokemonTable(")
      .append("id int auto_increment primary key,")
      .append("name text not null,")
      .append("primary_type int not null,")
      .append("secondary_type int null);")
      .toString());
  
  executeStatement(mysqlDbConnection, new StringBuilder()
      .append("INSERT INTO databaseName.pokemonTable(")
      .append("id, name, primary_type, secondary_type) ")
      .append("VALUES (12, 'Ivysaur', 3, 7);")
      .toString());
}
```




-
#### JDBC Procedure to Connect to Database
##### Step 5A - Defining Query Execution & Result Printing

```java
static ResultSet executeQuery(Connection connection, String sqlQuery) {
    try {
        Statement statement = getScrollableStatement(connection);
        return statement.executeQuery(sqlQuery);
    } catch (SQLException e) {
        throw new Error(e);
    }
}

static void printResults(ResultSet resultSet) {
    try {
        for (Integer rowNumber = 0; resultSet.next(); rowNumber++) {
            String firstColumnData = resultSet.getString(1);
            String secondColumnData = resultSet.getString(2);
            String thirdColumnData = resultSet.getString(3);
            System.out.println(new StringJoiner("\n")
                    .add("Row number = " + rowNumber.toString())
                    .add("First Column = " + firstColumnData)
                    .add("Second Column = " + secondColumnData)
                    .add("Third column = " + thirdColumnData)
                    .toString());
        }
    } catch (SQLException e) {
        throw new Error(e);
    }
}
```




-
#### JDBC Procedure to Connect to Database
##### Step 5B - Executing Query; Retrieving Results

```java
public static void main(String[] args) {
  registerJDBCDriver();
  Connection mysqlDbConnection = getConnection("mysql");

  executeStatement(mysqlDbConnection, "DROP DATABASE IF EXISTS databaseName;");
  executeStatement(mysqlDbConnection, "CREATE DATABASE IF NOT EXISTS databaseName;");
  executeStatement(mysqlDbConnection, "USE databaseName;");
  executeStatement(mysqlDbConnection, new StringBuilder()
      .append("CREATE TABLE IF NOT EXISTS databaseName.pokemonTable(")
      .append("id int auto_increment primary key,")
      .append("name text not null,")
      .append("primary_type int not null,")
      .append("secondary_type int null);").toString());

  executeStatement(mysqlDbConnection, new StringBuilder()
      .append("INSERT INTO databaseName.pokemonTable(")
      .append("id, name, primary_type, secondary_type) ")
      .append("VALUES (12, 'Ivysaur', 3, 7);").toString());

  String query = "SELECT * FROM databaseName.pokemonTable;";
  ResultSet resultSet = executeQuery(mysqlDbConnection, query);
  printResults(resultSet);
}
```



-
#### JDBC Procedure to Connect to Database
##### Step 5C - Viewing Retrieved Results

* **Output**

```java
Row number = 0
First Column = 12
Second Column = Ivysaur
Third column = 3
```
