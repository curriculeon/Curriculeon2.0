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
		 
		echo Adding file entries
		@reg add "HKEY_CLASSES_ROOT\*\shell\%applicationName%" /t REG_SZ /v "" /d "Edit with %applicationName%"   /f
		@reg add "HKEY_CLASSES_ROOT\*\shell\%applicationName%" /t REG_EXPAND_SZ /v "Icon" /d "%iconPath%,0" /f
		@reg add "HKEY_CLASSES_ROOT\*\shell\%applicationName%\command" /t REG_SZ /v "" /d "%executableUrl% \"%%1\"" /f
		 
		echo Adding within a folder entries
		@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%applicationName%" /t REG_SZ /v "" /d "Open with %applicationName%"   /f
		@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%applicationName%" /t REG_EXPAND_SZ /v "Icon" /d "%iconPath%,0" /f
		@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\%applicationName%\command" /t REG_SZ /v "" /d "%executableUrl% \"%%V\"" /f

		echo Adding folder entries
		@reg add "HKEY_CLASSES_ROOT\Directory\shell\%applicationName%" /t REG_SZ /v "" /d "Open with %applicationName%"   /f
		@reg add "HKEY_CLASSES_ROOT\Directory\shell\%applicationName%" /t REG_EXPAND_SZ /v "Icon" /d "%iconPath%,0" /f
		@reg add "HKEY_CLASSES_ROOT\Directory\shell\%applicationName%\command" /t REG_SZ /v "" /d "%executableUrl% \"%%1\"" /f
    ENDLOCAL
EXIT /B 0
:: -----------------------------------------------------------------------------------------
:: ##########################################################################################



:MAIN
set /p applicationName=What is the name of the application?
set /p applicationPath=What is the path of the executable?
call:defaultCreateContextMenu "%applicationName%" "%applicationPath%"