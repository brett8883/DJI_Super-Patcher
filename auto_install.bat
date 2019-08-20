@echo off
mode con: cols=95 lines=40
set branch=1.7.6
cls
adb kill-server
taskkill /im adb.exe
cls
ECHO -------------------------------------------------------------------------------------------
ECHO SUPER-PATCHER Set Up Widget 1.7.4
echo By Brett8883
ECHO -------------------------------------------------------------------------------------------
ECHO -------------------------------------------------------------------------------------------
Echo Please wait while I set things up. This wont take long...
Timeout 2
wget https://github.com/brett8883/Super-Tools/archive/%branch%.zip
unzip -o %branch%.zip
del %branch%.zip
cd Super-Tools-%branch%
call startup.bat

