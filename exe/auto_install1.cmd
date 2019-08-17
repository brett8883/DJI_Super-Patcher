::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCaQOX+uOpET6/326uSTsXE6XfYXbY3n/p6nH9MG+kD2OKYswnlSndkwCQNdQhC+fRY2pnYMs3yAVw==
::fBE1pAF6MU+EWHreyHcjLQlHcCaQOX+uOpET6/326uSTsXE6XfYXbY3n/p6nH9MG+kD2OKYswnlSndkwCQNdQhO+egA8rG9Gs3bLNcaI0w==
::fBE1pAF6MU+EWHreyHcjLQlHcCaQOX+uOpET6/326uSTsXE6XfYXbY3n/p6nH9MG+kD2OKYswnlSndkwCQNdQhuoYQFU
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDlGSRCWAE+1BaAR7ebv/Nagq1k1QeADXKXy5YebMOUBp3XlYZUl02hmndMJMBJbcRyXO19n+TsU5Te6EMGujAbiRUbH70g/ew==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJiZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQIUAjJrfxGSOXn3NrQI6+D+/dzV7B19
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIcIRlRXgWWOSueLJxczPr04e+Uwg==
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE1lA1PA8MFFzRfCO5T/VOuLmijw==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDlGSRCWAE+1BaAR7ebv/Nagq1k1QeADXKXy5YebMOUBp3XlYZUl02hmndMJMD9yVy2Yex8xuyNyt3CGP8KOhV2vGgaM/k5Q
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
:: set basic envirnment variables
title DJI Super-Patcher 2.0
SETLOCAL EnableDelayedExpansion
mode con: cols=160 lines=45
set basever=2
set branch=2.0
set sppath=%cd%
set autoheader=%cd%\autoheader.bat
call %autoHeader%
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
:: detect if internet is availible and can connect to github otherwise check if Super-Tools-%branch% is already availble 
echo PLEASE WAIT..
title DJI Super-Patcher 2.0
PING -n 1 140.82.113.4 |find "TTL=" && goto downloadtools
:nointernet
:: Give Error message giving user opertunity to turn on internet
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

:downloadtools
echo I have verified internet access to GitHub >> %log%
echo %time% >> %log%
cls
call %autoheader%
echo Success! I have verified internet access to GitHub.
echo Please wait while I set things up. This wont take long...
echo.
%busybox% wget https://github.com/brett8883/Super-Tools/archive/%branch%.zip && echo Download success!
%busybox% unzip -q %branch%.zip -o
del /f /s %branch%.zip
ATTRIB +H Super-Tools-%branch%
:end
cd Super-Tools-%branch%
call startup.cmd

