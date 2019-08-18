@echo off
:: set basic envirnment variables
title DJI Super-Patcher 2.0
SETLOCAL EnableDelayedExpansion
mode con: cols=160 lines=45
set basever=2
set branch=2.0
set sppath=%cd%
set autoheader=%cd%\autoheader.bat
call %autoheader%
::delete old log files and/or create new log folder. This will be hidden to unclutter folder but will be unhidden if SP is unsuccessful
rmdir /Q /S nonemptydir logs 2>nul
del logs 2>nul
md logs
ATTRIB +H busybox.exe
::set absolute path to busybox and logs folder
set logpath=%cd%\logs
echo START SUPER_PATCHER > %logpath%\log.txt
set log=%cd%\logs\log.txt
echo %date%_%time% >> %log%
ATTRIB +H %logpath%
set busybox=%cd%\busybox.exe
echo Please Wait
taskkill /im adb.exe 2>>nul
adb kill-server 2>>nul
:: Detect if machine is running Windows 10 if not show notice but continue anyway
SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (`wmic os get version`) DO (
  SET var!count!=%%F
  SET /a count=!count!+1
)
set _string=%var2%
for /f "tokens=1 delims=." %%a in ("%_string%") do (
  set /a winver=%%a
  )
if "%winver%"=="10" (goto windows10) ELSE (goto windowsver)

:windows10
::Windows version is 10 notice
Echo Windows 10 is detected
echo Start download process...
PING -n 3 127.0.0.1>nul
goto main

:windowsver
::not windows 10 notice
Echo I have detected that your Windows version is Windows %winver% ...
echo.
echo Super-Patcher works best with Windows 10.
echo.
echo If you have any issues running Super-Patcher please try again on a Windows 10 PC.
echo.
ECHO Please continue when ready
echo
pause

:main
cls
call %autoheader%
:: detect if internet is availible and can connect to github otherwise check if Super-Tools-%branch% is already availble 
echo PLEASE WAIT..
title DJI Super-Patcher 2.0
PING -n 1 140.82.113.4 |find "TTL=" && goto downloadtools
:nointernet
:: Give Error message giving user opertunity to turn on internet
if exist Super-Tools-%branch% goto end
cls
call %autoheader%
Echo ERROR Cannot connect to Github.com.
echo.
echo Super-Patcher requires internet access to connect to GitHub.
echo.
echo Please ensure there is an internet connection and that GitHub.com is not blocked by a firewall.
echo.
echo Continue when internet access is availible 
echo.
pause
goto main

:toolsavailible
cls
call %autoheader%
echo MINOR ERROR
Echo There was a problem downloading the tools needed for Super-Patcher. 
echo This is likley due to not having internet connection or a firewall not allowing a connection to GitHub.com
echo.
echo Please check your connection and ensure GitHub.com ian't being blocked.
echo.
echo I have also detected an older version of Super-Tools is already downloaded. 
echo I might be able to use these tools instead, though, there could be issues with it being an older version
echo.
echo Would you like me to try again or would you like me to attempt to continue with the version of Super-Tools already downloaded?
echo.
echo [1] I have checked my connection. Try to download the latest version of tools again.
echo [2] Just attempt to use the version of SUper-Tools I already have
choice /c /m "Make selection with your keyboard"
if errorlevel 2 ECHO ATTEMPTING TO USE AVAILIBLE TOOLS
if errorlevel 2 PING -n 5 127.0.0.1>nul
if errorlevel 2 goto end
if errorlevel 1 cls
if errorlevel 1 call %autoheader%
if errorlevel 1 echo Checking connection to GithHub again
if errorlevel 1 PING -n 5 127.0.0.1>nul
if errorlevel 1 goto main

:downloadtools
cls
call %autoheader%
echo Success! I have verified internet access to GitHub.
echo I have verified internet access to GitHub >> %log%
echo %time% >> %log%
cls
call %autoheader%
echo Please wait while I set things up. This wont take long...
echo.
%busybox% wget https://github.com/brett8883/Super-Tools/archive/%branch%.zip && echo Download success!
title DJI Super-Patcher 2.0
cls
call %autoheader%
echo Please wait while I set things up. This wont take long...
%busybox% unzip -q %branch%.zip -o
del /f /s %branch%.zip
ATTRIB +H Super-Tools-%branch%
:end
cd Super-Tools-%branch%
call startup.cmd

