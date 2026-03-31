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