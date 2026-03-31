# Connecting to a database

## Overview
* Prerequisites
* Definitions
* Install MySQL Via Docker

### Prerequisites
* [Install Docker](https://curriculeon.github.io/Curriculeon/lectures/containerization/docker/installation/instructions.html)


### Definitions
* Mysql is a popular Relational Database Management System (RDBMS).
* It runs on most systems so it can be run directly on your own machine, but it's best to run it on a Docker instance running Linux. 
* In order to connect to a MySQL instance, you need to know a few things:
    * Host - this is usually a url or ip address for a server
    * Port - Port listening for a connection. Defaults to 3306
    * Username - The MySQL user you are connecting with
    * Password - The password for the user (This could be blank)



### Install 

* The easiest way to install a local MySQL instance on any machine is with a docker container.
* The following line will start up an instance

```
docker run --name local-mysql -e MYSQL_ROOT_PASSWORD=password\
p 3306:3306 -d mysql:tag
```

This will allow you to connect using the following 

```
Host: localhost
Port: 3306
User: root
Password: password
```




### MySQL

* Once you have connected, it is advised for security reasons that you create a new user.
* The current user is the root user, which will always have all privledges and it is insecure to use it for general purposes.
* Execute the SQL command below to create a new database.
    * `CREATE DATABASE database_name DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;`
* Execute the SQL command below to make a new user and give them permissions to do anything to aforementioned database:
    * `GRANT ALL PRIVILEGES ON database_name.* TO 'new_user'@'localhost' IDENTIFIED BY 'new_password';`
    * This will create a user with username `new_user` and password `new_password`.
        * Note if you forget the root password and the `new_password` you will not have any way of resetting this.    


### MySQL

* Created user has all the same powers as root user
* Keep track of who is running particular queries
* Possible to create users that can only read data
* *Keep everyone's permissions to  minimum...* even yours