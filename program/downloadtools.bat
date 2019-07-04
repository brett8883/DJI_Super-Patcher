@echo off
java -version >nul 2>&1 && ( GOTO:MAIN
  ) || ( call )
javac -version >nul 2>&1 && ( GOTO:MAIN
 ) || ( echo.-: Java not installed...
Msiexec jre jre-8u211-windows-i586-iftw.exe /s
pause
exit )

:main
CLS
cd program
mkdir TOOLS
ECHO.
ECHO -------------------------------------------------------------------------------------------
ECHO  Super Patcher %version% %appver%
ECHO -------------------------------------------------------------------------------------------
ECHO.
ECHO.
java -jar download.jar https://github.com/brett8883/Super-Tools/archive/master.zip master.zip
cd \TOOLS\unzip\Super-Tools-master\TOOLS\TOOLS\
call verify_step.bat