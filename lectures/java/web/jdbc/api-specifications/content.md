# What is JDBC?


-
-
## What is JDBC
* A Java application programming interface (API), that defines how a client may access a database.
* JDBC is part of the Java Standard Edition platform, from Oracle Corporation.
* JDBC provides methods to query and update data in a database, and is oriented towards relational databases.


-
-
## Why use JDBC
* allows multiple implementations to exist and be used by the same application.
* provides a mechanism for dynamically loading correct Java packages and registering them with the JDBC `DriverManager`.
    * The `DriverManager` is used as a connection-factory for creating JDBC connections. 
* JDBC connections support _creating_ and _executing_ statements.
    * These may be update or query statements:
        * `CREATE`, `INSERT`, `UPDATE`, `DELETE`, or `SELECT`
    * stored procedures may be invoked through a JDBC connection.



-
### JDBC Statement Classes
* JDBC represents statements using one of the following classes: 
    * `Statement` – the statement is sent to the database server each and every time.
    * `PreparedStatement` – the statement is cached and then the execution path is pre-determined on the database server allowing it to be executed multiple times in an efficient manner.
    * `CallableStatement` – used for executing stored procedures on the database.



-
-
### JDBC Procedure to Connect to Database
1. Register Database `Driver`
2. Initialize `Connection` by providing each of the following to `DriverManager`:
    * Database URL
    * Username
    * Password
3. Prepare a statement
4. Execute the statement
5. Retrieve Database results

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
        .append("CREATE TABLE IF NOT EXISTS pokemon.pokemons(")
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
        .append("CREATE TABLE IF NOT EXISTS databaseName.pokemons(")
        .append("id int auto_increment primary key,")
        .append("name text not null,")
        .append("primary_type int not null,")
        .append("secondary_type int null);")
        .toString());
    executeStatement(mysqlDbConnection, new StringBuilder()
        .append("INSERT INTO pokemon.pokemons ")
        .append("(id, name, primary_type, secondary_type)")
        .append(" VALUES (12, 'Ivysaur', 3, 7);")
        .toString());
}
```




-
#### JDBC Procedure to Connect to Database
##### Step 5 - Executing Query; Retrieving Results

```java
static ResultSet executeQuery(Connection connection, String sqlQuery) {
    try {
        Statement statement = getScrollableStatement(connection);
        return statement.executeQuery(sqlQuery);
    } catch (SQLException e) {
        throw new Error(e);
    }
}


public static void main(String[] args) {
    registerJDBCDriver();
    Connection mysqlDbConnection = getConnection("mysql");
    executeStatement(mysqlDbConnection, "CREATE DATABASE IF NOT EXISTS databaseName;");
    executeStatement(mysqlDbConnection, "USE databaseName;");
    executeStatement(mysqlDbConnection, new StringBuilder()
        .append("CREATE TABLE IF NOT EXISTS databaseName.pokemons(")
        .append("id int auto_increment primary key,")
        .append("name text not null,")
        .append("primary_type int not null,")
        .append("secondary_type int null);").toString());

    executeStatement(mysqlDbConnection, new StringBuilder()
        .append("INSERT INTO pokemon.pokemons ")
        .append("(id, name, primary_type, secondary_type)")
        .append(" VALUES (12, 'Ivysaur', 3, 7);").toString());

    String query = "SELECT * FROM databaseName.pokemonTable;";
    ResultSet result = executeQuery(mysqlDbConnection, query)
}
```