# Access Denied for User root@localhost



## Overview
* Prerequisites
* Connect to MySQL
* Update Password
* Stop and Start MySql server

## Prerequisites
* MySQL


## Connect to MySql

* Execute the command below to connect to MySQL.
  * `mysql -u root -p`

[![](./mysql-as-root.gif)](./mysql-as-root.gif)


* Executing the command below may result in a failure to connect to MySQL
  * `mysql`

[![](./mysql-command-failed.gif)](./mysql-command-failed.gif)



## Update Password
* Upon accessing the MySQL terminal, execute the command below to update the password of the root user.
  * `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'new-password';`

## Stop and Start MySQL Server

```shell
sudo service mysql stop
sudo service mysql start
```

