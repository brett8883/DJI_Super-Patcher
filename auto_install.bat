@echo off
mode con: cols=95 lines=40
cls
adb kill-server
taskkill /im adb.exe
cls
ECHO -------------------------------------------------------------------------------------------
ECHO SUPER-PATCHER Set Up Widget 1.7.1
echo By Brett8883
ECHO -------------------------------------------------------------------------------------------
ECHO -------------------------------------------------------------------------------------------
Echo Please wait while I set things up. This wont take long...
Timeout 3
wget https://github.com/brett8883/Super-Tools/archive/master.zip
unzip -o master.zip
del master.zip
cd Super-Tools-master
call startup.bat

