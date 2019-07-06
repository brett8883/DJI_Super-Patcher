@echo off
del whichAC.bat
cls
rmdir /Q /S nonemptydir TOOLS
timeout 1
cls
mkdir tools 
java -jar download.jar https://raw.githubusercontent.com/brett8883/Super-Tools/2.0/whichAC.bat whichAC.bat
cd tools
copy *.* ..
cd ..
rmdir /Q /S nonemptydir TOOLS
cls
call whichAC.bat
