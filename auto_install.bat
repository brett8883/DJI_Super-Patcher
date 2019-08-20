@echo off
mode con: cols=95 lines=40
set branch=1.7.6
rmdir /Q /S nonemptydir Super-Tools-%branch% 2>>nul
del /f /s errorlog.txt
Title DJI Super-Patcher
cls
adb kill-server
taskkill /im adb.exe
:check
cls
ECHO -------------------------------------------------------------------------------------------
ECHO SUPER-PATCHER Set Up Widget 1.7.6
echo By Brett8883
ECHO -------------------------------------------------------------------------------------------
ECHO -------------------------------------------------------------------------------------------
Echo Please wait while I set things up. This wont take long...
echo.
PING -n 2 127.0.0.1>nul
echo.
Title DJI Super-Patcher
:check
busybox wget -q --spider https://github.com/brett8883/Super-Tools/archive/%branch%.zip && goto download
echo.
echo.
echo ERROR CANNOT CONNECT TO GITHUB
echo.
echo OH NO! There was an error on that last one. Sorry about this!
echo.
Echo -Super-Patcher requires internet access to GitHub.com but was unable to reach GitHUb.com
echo.
echo -Please check your internet connection and that there is no firewall preventing access
echo.
echo -When internet service is restored please continue.
echo.
pause
goto check

:download
busybox wget https://github.com/brett8883/Super-Tools/archive/%branch%.zip
busybox unzip -o -q %branch%.zip
del %branch%.zip
cd Super-Tools-%branch%
Title DJI Super-Patcher
call startup.bat

