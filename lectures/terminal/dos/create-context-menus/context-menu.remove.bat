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