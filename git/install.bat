:::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights
:::::::::::::::::::::::::::::::::::::::::
@echo off
CLS 
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:checkPrivileges 
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges ) 

:getPrivileges 
if '%1'=='ELEV' (shift & goto gotPrivileges)  
ECHO. 
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation 
ECHO **************************************

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs" 
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs" 
"%temp%\OEgetPrivileges.vbs" 
exit /B 

:gotPrivileges 
::::::::::::::::::::::::::::
:START
::::::::::::::::::::::::::::
setlocal & pushd .


REM Run shell as admin (example) - put here code as you like
cd %~dp0

@echo off

set dest="%userprofile%\.gitconfig"
set src="%CD%\.gitconfig"
if exist %dest% (
	echo Creating backup of %dest%.
	del %dest%_backup
	move %dest% %dest%_backup
	)
echo Creating symlink for %dest%.
mklink %dest% %src%

set dest="%userprofile%\.profile"
set src="%CD%\.profile"
if exist %dest% (
	echo Creating backup of %dest%.
	del %dest%_backup
	move %dest% %dest%_backup
	)
echo Creating symlink for %dest%.
mklink %dest% %src%

mkdir "%userprofile%\bin\" 2>NUL
set dest="%userprofile%\bin\mvbranch.sh"
set src="%CD%\bin\mvbranch.sh"
if exist %dest% (
	echo Creating backup of %dest%.
	del %dest%_backup
	move %dest% %dest%_backup
	)
echo Creating symlink for %dest%.
mklink %dest% %src%

pause