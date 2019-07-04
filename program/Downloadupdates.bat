@echo off
@echo off
rmdir /Q /S nonemptydir TOOLS
del downloadtools.bat
cls
mkdir tools
java -jar download.jar https://github.com/brett8883/Super-Tools/raw/master/downloadtools.bat downloadtools.bat
cd tools 
copy *.* ..
timeout 1
cd..
rmdir /Q /S nonemptydir tools
cls
call downloadtools.bat