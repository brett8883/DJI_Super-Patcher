@echo off 
mkdir tools
java -jar download.jar https://github.com/brett8883/Super-Tools/raw/master/downloadtools.bat downloadtools.bat
cd tools 
copy *.* ..
timeout 1
cd..
rd tools
timeout 1
cls
call downloadtools.bat