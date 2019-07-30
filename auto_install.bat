@echo off
cls
rmdir /Q /S nonemptydir Super-Tools-master
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER Set Up Widget 1.7.1
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo Please wait while I set things up. This wont take long...
Timeout 5
wget https://github.com/brett8883/Super-Tools/archive/master.zip
unzip master.zip
del master.zip
cd Super-Tools-master
call startup.bat 

