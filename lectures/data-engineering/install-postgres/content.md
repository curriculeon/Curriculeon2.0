<!-- http://www.jamespgilbert.com/2019/09/up-and-running-fast-with-php-apache-on-windows-10/ -->
<!-- https://brian.teeman.net/joomla/885-install-amp-on-windows-with-chocolatey -->

### Install PostgreSQL
* Execute the command below to install postgesql

```powershell
choco install postgresql -y
```

### Install PgAdmin4 for PostgreSQL
* From a bash terminal, execute the command below to install pgadmin4

```powershell
choco install pgadmin4 -y
```

<!-- [<img src="./install-postgresql.gif">](./install-apache.gif) -->

### Enable PostgreSQL extension in PHP

* Execute the commands below to enable postgresql in php
    * click [here](configure-php.sh) to download the shell script

```bash
#!/bin/bash

echo "=========================================="
echo "initializing variables"
echo "=========================================="
phpPath=`which php` # fetch php executatble path
phpParentPath="$(dirname "$phpPath")" # fetch php parent directory path
phpIniPath=$phpParentPath/php.ini
phpIniPathWindows=`cygpath -d $phpIniPath`
cp $phpIniPath $phpIniPath-development # create development `php.ini` file
cp $phpIniPath-development $phpIniPath # create production `php.ini` file
cp $phpIniPath $phpParentPath/php.backup.ini # create back up of production `php.ini`



echo "=========================================="
echo "Creating Powershell script to configure PHP"
echo "=========================================="
echo "
#!/usr/bin/env pwsh
(gc $phpIniPath).replace(';extension=php_pdo_pgsql.dll','extension=php_pdo_pgsql.dll') | sc $phpIniPath
(gc $phpIniPath).replace(';extension=php_pgsql.dll','extension=php_pgsql.dll') | sc $phpIniPath
" > configure-php.ps1

echo "=========================================="
echo "Executing aforementioned powershell script"
echo "=========================================="
chmod u+x configure-php.ps1
powershell ./configure-php.ps1
```

<!-- [<img src="./configure-php.gif">](./configure-php.gif) -->


