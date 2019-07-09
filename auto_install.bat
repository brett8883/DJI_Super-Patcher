@echo off
cls
rmdir /Q /S nonemptydir Super-Tools-master
del startup.bat
cls
wget https://github.com/brett8883/Super-Tools/archive/master.zip
unzip master.zip
del master.zip
cd Super-Tools-master
call startup.bat 

