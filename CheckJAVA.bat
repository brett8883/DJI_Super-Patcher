@echo off
cls
rd tools
timeout 1
java -version >nul 2>&1 && ( GOTO:MAIN
  ) || ( call )
javac -version >nul 2>&1 && ( GOTO:MAIN
 ) || ( echo.-: Java not installed...
Msiexec jre jre-8u211-windows-i586-iftw.exe /s
pause
call CheckJAVA.bat)

:main
call Downloadupdates.bat
