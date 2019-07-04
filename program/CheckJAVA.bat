@echo off
cls
rd tools
timeout 1
cls
java -version >nul 2>&1 && ( GOTO:MAIN
  ) || ( call )
javac -version >nul 2>&1 && ( GOTO:MAIN
 ) || ( echo.-: Java not installed...
echo Super-Patcher requires Java 
echo I can install Java for you then please restart the Super-Patcher process
ECHO Installing Java...
timeout 10
msiexec.exe /i jre1.8.0_21164.msi /passive
exit)

:main
call Downloadupdates.bat
