@echo off
SETLOCAL EnableDelayedExpansion
:: Set cmd window size
mode con: cols=160 lines=50
:: set basic envirnment variables
set appver=2.1
set basever=2.1
set branch=2.1
:: set absolute paths and add current directory to local path temporarly
set "sppath=%cd%"
set PATH=%path%;%sppath%
:: set location of header.bat and call header.bat script to save room and repetition
set "header=%cd%\Super-Tools\header.bat"
call %header%
::delete old log files and/or create new log folder. This will be hidden to unclutter folder but will be unhidden if SP is unsuccessful
rmdir /Q /S nonemptydir logs 2>nul
del /f /s logs 2>nul
::Delete flight controllers and stock firmware leaving a clean interface
rmdir /Q /S nonemptydir Stock_Firmware 2>nul
del /f /s Stock_Firmware 2>nul
rmdir /Q /S nonemptydir SP_Flight_Controllers 2>nul
del /f /s SP_Flight_Controllers 2>nul
md logs
::set absolute path to busybox and logs folder
set logpath="%cd%\logs"
echo START SUPER_PATCHER > %logpath%\log.txt
set log="%cd%\logs\log.txt"
echo %date%_%time% >> %log%
set busybox="%cd%\Super-Tools\busybox.exe"
echo Please Wait
:: Kill adb. In the early days of SP this solved an issue where multiple instances of adb running would cause errors
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
Echo Windows 10 is detected >>%log%
PING -n 2 127.0.0.1>nul
goto main

:windowsver
::not windows 10 notice
if "%winver%"=="6" set "winver=7"
echo Windows %winver% is detected >> %log%
Echo I have detected that your Windows version is Windows %winver% ...
echo.
echo Super-Patcher works best with Windows 10.
echo.
echo If you have any issues running Super-Patcher please try again on a Windows 10 PC.
echo.
ECHO Please continue when ready
echo User has been advised that with the current version of Windows mileage may vary >> %log%
echo
pause

:main
cls
call %header%
:: detect if internet is availible and can connect to github
echo PLEASE WAIT..
PING -n 1 140.82.113.4 |find "TTL=" && goto downloadtools
:nointernet
:: Give Error message giving user opertunity to turn on internet
cls
call %header%
Echo ERROR Cannot connect to Github.com.
echo.
echo Super-Patcher requires internet access to connect to GitHub.
echo.
echo Please ensure there is an internet connection and that GitHub.com is not blocked by a firewall.
echo.
echo Continue once internet access is restored
echo.
pause
goto main

:downloadtools
cls
call %header%
echo Success! I have verified internet access to GitHub.
echo.
echo I have verified internet access to GitHub >> %log%
echo %time% >> %log%
echo Please wait while I set things up. This wont take long...
echo.
cd Super-Tools
set "stpath=%cd%"
call startup.cmd
