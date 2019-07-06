@echo off
cls
rmdir /Q /S nonemptydir tools
:main
SET APPVER=1.0
mkdir TOOLS
cls
ECHO *******************************************************************************************
ECHO *******************************************************************************************
ECHO Super-Patcher Set up Helper %appver%
ECHO By Brett8883
ECHO *******************************************************************************************
ECHO *******************************************************************************************
ECHO Hang on while I get things set up. This won't take long...
echo.
java -jar download.jar https://raw.githubusercontent.com/brett8883/Super-Tools/master/dji_verify_step.bat dji_verify_step.bat
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
java -jar download.jar https://github.com/brett8883/Super-Tools/raw/master/jkson_verify.bat jkson_verify.bat
java -jar download.jar https://raw.githubusercontent.com/brett8883/Super-Tools/master/End.bat End.bat
java -jar download.jar https://raw.githubusercontent.com/brett8883/Super-Tools/master/ProgramFiles/dummy_verify.sh dummy_verify.sh
cd tools
cls
call dji_verify_step.bat