@echo off
cls
rmdir /Q /S nonemptydir Super-Tools-1.8_beta
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER Set Up Widget
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo Please wait while I set things up. This wont take long...
Timeout 5
wget https://github.com/brett8883/Super-Tools/archive/1.8_beta.zip
unzip 1.8_beta.zip
del 1.8_beta.zip
cd Super-Tools-1.8_beta
call startup.bat 

