::::::::::::::::::::::::::::::::::::::::::::
:: Elevate.cmd - Version 4
:: MonitorConfig - Version 3
:: see "https://stackoverflow.com/a/12264592/1016343" for more about Elevate.cmd
:: Thx to Matt for the script
::::::::::::::::::::::::::::::::::::::::::::
 
 @ECHO off
 CLS
 ECHO ===============================
 ECHO Small config panel for Qustodio
 ECHO ===============================

:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~0"
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
 NET FILE 1>NUL 2>NUL
 if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
  ECHO.
  ECHO **************************************
  ECHO Invoking UAC for Privilege Escalation
  ECHO **************************************

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"

  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
 
:help
 ECHO.
 ECHO Type "close" to close Qustodio
 ECHO Type "open" to restart/open Qustodio
 ECHO Type "nuke" to delete qustodio
 ECHO Type "delay" to put qustodio at the end of the boot sequence
 ECHO Type "end" to exit from the program
 ECHO Type "help" to bring this menu up
 ECHO NOTE:
 ECHO 1)The boot sequence will be reset when running any of the other commands
 ECHO 2)The "nuke" command will not delete the Qustodio service sitting in your system-tray
 
:startOfScript
 ECHO.
 SET /P _inputname= Please enter an input:
 IF "%_inputname%"=="close" GOTO :close
 IF "%_inputname%"=="open" GOTO :open 
 IF "%_inputname%"=="nuke" GOTO :nuke
 IF "%_inputname%"=="delay" GOTO :delay
 IF "%_inputname%"=="end" GOTO :EOF
 IF "%_inputname%"=="help" GOTO :help
 IF "%_inputname%"=="robigan" ECHO ;)
 ECHO Error; Incorrect syntax or not recognized
 GOTO :startOfScript
 
:close
 sc config qengine start= disabled
 sc config qupdate start= disabled
 net stop qengine
 net stop qupdate
 GOTO :startOfScript
 
:open
 sc config qengine start= auto
 sc config qupdate start= auto
 net start qengine
 net start qupdate
 GOTO :startOfScript
 
:delete
 sc config qengine start= disabled
 sc config qupdate start= disabled
 net stop qengine
 net stop qupdate
 sc delete qengine
 sc delete qupdate
 GOTO :startOfScript
 
:nuke
 SET /P delete= Do you want to continue? (Y/N)
 IF "%delete%"=="Y" GOTO :delete
 GOTO :startOfScript
 
:delay
 sc config qengine start= delayed_auto
 sc config qupdate start= delayed_auto
 GOTO :startOfScript
