@ECHO OFF
SET commitMessage=%~1
SET branchName=%~2
SET gitStatementConstant="git add .; git commit -m "%commitMessage%^"; git push -u origin %branchName%"
GOTO:MAIN

:: ##########################################################################################
:: ##########################################################################################
:: ##########################################################################################
:: -----------------------------------------------------------------------------------------
:: prompt user to install 'some application'
:__gitAddCommitPush
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        SET gitStatement=%~1
        echo %gitStatement%
        %gitStatement%
    ENDLOCAL
EXIT /B 0



:_gitAddCommitPush
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        call:__gitAddCommitPush %~1
        pause
    ENDLOCAL
EXIT /B 0


:gitAddCommitPush
    @ECHO OFF
    SETLOCAL ENABLEDELAYEDEXPANSION
        call:_gitAddCommitPush %gitStatementConstant%
    ENDLOCAL
EXIT /B 0



:MAIN
call:gitAddCommitPush %1 %2
pause
EXIT