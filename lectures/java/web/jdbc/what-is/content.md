# What is JDBC?




## What is JDBC
* Java Database Connection
* A Java application programming interface (API), that defines how a client may access a database.
* JDBC is part of the Java Standard Edition platform, from Oracle Corporation.
* JDBC provides methods to query and update data in a database, and is oriented towards relational databases.




## Why use JDBC
* allows multiple implementations to exist and be used by the same application.
* provides mechanism for dynamically loading Java packages and registering with JDBC `DriverManager`.
    * The `DriverManager` is used as connection-factory for creating JDBC connections. 
* JDBC connections support _creating_ and _executing_ statements.
    * These may be update or query statements:
        * `CREATE`, `INSERT`, `UPDATE`, `DELETE`, or `SELECT`
    * stored procedures may be invoked through a JDBC connection.




### JDBC Statement Classes
* JDBC represents statements using one of the following classes: 
    * `Statement` – the statement is sent to the database server each and every time.
    * `PreparedStatement` – the statement is cached and then the execution path is pre-determined on the database server allowing it to be executed multiple times in an efficient manner.
    * `CallableStatement` – used for executing stored procedures on the database.





### JDBC Procedure to Connect to Database
1. Register Database `Driver`
2. Initialize `Connection` by providing each of the following to `DriverManager`:
    * Database URL
    * Username
    * Password
3. Prepare a statement
4. Execute the statement
5. Retrieve Database results



### More resources
* Click [here](../basic-use-cases/index.md) to view basic use-cases of JDBC.