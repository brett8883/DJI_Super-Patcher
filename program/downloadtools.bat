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
mkdir TOOLS
ECHO.
ECHO -------------------------------------------------------------------------------------------
ECHO  Super Patcher %version% %appver%
ECHO -------------------------------------------------------------------------------------------
java -jar download.jar https://raw.githubusercontent.com/brett8883/Super-Tools/master/dji_verify_step.bat dji_verify_step.bat
mkdir ProgramFiles
java -jar download.jar https://github.com/brett8883/Super-Tools/raw/master/ProgramFiles/NLDApp.exe NLDApp.exe
java -jar download.jar https://github.com/jezzab/DUMLdore/raw/master/DUMLdoreV3.exe DUMLdoreV3.exe
java -jar download.jar https://github.com/jezzab/DUMLdore/raw/master/payload.bin payload.bin
java -jar download.jar https://github.com/jezzab/DUMLdore/raw/master/payload_new.bin payload_new.bin
java -jar download.jar https://github.com/jezzab/DUMLdore/raw/master/root.bin root.bin
java -jar download.jar https://github.com/jezzab/DUMLdore/raw/master/root_new.bin root_new.bin
java -jar download.jar https://github.com/brett8883/Super-Tools/raw/master/ProgramFiles/AdbWinApi.dll AdbWinApi.dll
java -jar download.jar https://github.com/brett8883/Super-Tools/raw/master/ProgramFiles/AdbWinUsbApi.dll AdbWinUsbApi.dll
java -jar download.jar https://github.com/brett8883/Super-Tools/raw/master/ProgramFiles/adb.exe adb.exe
java -jar download.jar https://github.com/jkson5/jkson_fcc_mod/raw/master/dos2unix.exe dos2unix.exe
pause
call verify_step.bat