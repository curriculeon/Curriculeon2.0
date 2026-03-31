# Creat Context Menus

## Creating Context Menu Items
* Using `.bat` files, one can create context menus to easily launch executable applications on a specified file or directory.

### How to Add Context Menu
* Find the executable path of the application you would like to create a context menu for.
* Download the [`context-menu.create.bat`](./context-menu.create.bat) file.
* Launch the file by double clicking it.
* From the Command Prompt, enter the name of the application.
* From the Command Prompt, enter the name of the executable path of the application.
* You can download the `.bat` file used in the animation below by clicking [here](./context-menu.create.bat)
* You can also preview the file contents by clicking [here](#create-context-menu-file-content).













## Removing Context Menu Items
* Using `.bat` files, one can remove the aforementioned context menus.


### How To

* Download the [`context-menu.remove.bat`](./context-menu.remove.bat) file.
* Launch the file by double clicking it.
* From the Command Prompt, enter the name of the application.
* You can download the `.bat` file used in the animation below by clicking [here](./context-menu.create.bat)
* You can also preview the file contents by clicking [here](#remove-context-menu-file-content).




## File Previews


### Create Context Menu File Content
* [`context-menu.create.bat`](./context-menu.create.bat)

```bat
:: Needs to be run as administrator.
:: Change the paths below to match the desired IDE.
:: Make sure you don't quote any of the paths in following lines, spaces are allowed.

@ECHO OFF
ECHO "Creating Context Menus From User Input"
GOTO:MAIN



:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:defaultCreateContextMenu
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET applicationName=%~1
        SET executableUrl=%~2
		call createContextMenu %applicationName% %executableUrl% %executableUrl%
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################







:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install 'some application'
:createContextMenu
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET applicationName=%~1
        SET executableUrl=%~2
		SET iconPath=%~3

		SET LaunchPath=%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe
		SET IconPath=%executableUrl%
		SET AppName=Powershell
		 
		echo Adding file entries
		@reg add "HKEY_CLASSES_ROOT\*\shell\%applicationName%" /t REG_SZ /v "" /d "Edit with %applicationName%"   /f
		@reg add "HKEY_CLASSES_ROOT\*\shell\%applicationName%" /t REG_EXPAND_SZ /v "Icon" /d "%IconPath%,0" /f
		@reg add "HKEY_CLASSES_ROOT\*\shell\%applicationName%\command" /t REG_SZ /v "" /d "%executableUrl% \"%%1\"" /f
		 
		echo Adding within a folder entries
		@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%applicationName%" /t REG_SZ /v "" /d "Open with %applicationName%"   /f
		@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%applicationName%" /t REG_EXPAND_SZ /v "Icon" /d "%IconPath%,0" /f
		@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%applicationName%\command" /t REG_SZ /v "" /d "%executableUrl% \"%%V\"" /f

		echo Adding folder entries
		@reg add "HKEY_CLASSES_ROOT\Directory\shell\%applicationName%" /t REG_SZ /v "" /d "Open with %applicationName%"   /f
		@reg add "HKEY_CLASSES_ROOT\Directory\shell\%applicationName%" /t REG_EXPAND_SZ /v "Icon" /d "%IconPath%,0" /f
		@reg add "HKEY_CLASSES_ROOT\Directory\shell\%applicationName%\command" /t REG_SZ /v "" /d "%executableUrl% \"%%1\"" /f
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################



:MAIN
set /p applicationName=What is the name of the application?
set /p applicationPath=What is the path of the executable?
call:defaultCreateContextMenu "%applicationName%" "%applicationPath%"
```



###  Remove Context Menu File Content
* [`context-menu.remove.bat`](context-menu.remove.bat)

```bat
:: Needs to be run as administrator.
:: Change the paths below to match the desired IDE.
:: Make sure you don't quote any of the paths in following lines, spaces are allowed.

@ECHO OFF
ECHO "Removing Context Menu From User Input"
GOTO:MAIN



:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:removeContextMenu
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
		SET applicationName=%~1
		 
		echo Deleting file entries
		@reg delete "HKEY_CLASSES_ROOT\*\shell\%applicationName%"
		 
		echo Deleting within a folder entries
		@reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\%applicationName%"

		echo Deleting folder entries
		@reg delete "HKEY_CLASSES_ROOT\Directory\shell\%applicationName%"
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################



:MAIN
set /p applicationName=What is the name of the application?
call:removeContextMenu "%applicationName%"
```

