@echo off
cls
timeout 1
cls
java -version >nul 2>&1 && ( GOTO:MAIN
  ) || ( call )
javac -version >nul 2>&1 && ( GOTO:MAIN
 ) || ( ECHO *******************************************************************************************
ECHO *******************************************************************************************
ECHO Super-Patcher Set up Helper %appver%
ECHO By Brett8883
ECHO *******************************************************************************************
ECHO ******************************************************************************************* 
ECHO Java not installed...
echo Super-Patcher requires Java
echo. 
echo I will install Java for you then please restart the Super-Patcher process
echo.
ECHO Installing Java...
timeout 10
msiexec.exe /i jre1.8.0_21164.msi /passive
exit)

:main
cls
call deletetools.bat
