# Exporting Database to file


### Windows

* From an administrative Powershell window, execute the commands below to export your database to a file

```ps1
$databaseName="MYSQL_DATABASE_NAME"
echo "Dumping data..."
mysqld -u root start # starting daemon
net start MySQL # starting service
mysqldump -uroot -p $databaseName > databaseBackUp.sql # dumping database to file 
```

### Linux & Mac OS

```bash
databaseName="MYSQL_DATABASE_NAME"
echo "Dumping data..."
mysqld -u root start # starting daemon
net start MySQL # starting service
mysqldump -uroot -p $databaseName > databaseBackUp.sql # dumping database to file 
```

### Linux
* `placeholder text`