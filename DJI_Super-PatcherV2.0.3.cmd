@echo off
:: set basic envirnment variables
title DJI Super-Patcher 2.0.2
SETLOCAL EnableDelayedExpansion
mode con: cols=160 lines=45
set basever=2
set branch=2.0
set sppath="%cd%"
set PATH=%path%;%sppath%
Title DJI Super-Patcher 2.0.2
echo ===============================================================================================================================================================
echo "  /$$$$$$                                                  /$$$$$$$             /$$               /$$                                  /$$$$$$       /$$$$$$ ";
echo " /$$__  $$                                                | $$__  $$           | $$              | $$                                 /$$__  $$     /$$$_  $$";
echo "| $$  \__/ /$$   /$$  /$$$$$$   /$$$$$$   /$$$$$$         | $$  \ $$ /$$$$$$  /$$$$$$    /$$$$$$$| $$$$$$$   /$$$$$$   /$$$$$$       |__/  \ $$    | $$$$\ $$";
echo "|  $$$$$$ | $$  | $$ /$$__  $$ /$$__  $$ /$$__  $$ /$$$$$$| $$$$$$$/|____  $$|_  $$_/   /$$_____/| $$__  $$ /$$__  $$ /$$__  $$        /$$$$$$/    | $$ $$ $$";
echo " \____  $$| $$  | $$| $$  \ $$| $$$$$$$$| $$  \__/|______/| $$____/  /$$$$$$$  | $$    | $$      | $$  \ $$| $$$$$$$$| $$  \__/       /$$____/     | $$\ $$$$";
echo " /$$  \ $$| $$  | $$| $$  | $$| $$_____/| $$              | $$      /$$__  $$  | $$ /$$| $$      | $$  | $$| $$_____/| $$            | $$          | $$ \ $$$";
echo "|  $$$$$$/|  $$$$$$/| $$$$$$$/|  $$$$$$$| $$              | $$     |  $$$$$$$  |  $$$$/|  $$$$$$$| $$  | $$|  $$$$$$$| $$            | $$$$$$$$ /$$|  $$$$$$/";
echo " \______/  \______/ | $$____/  \_______/|__/              |__/      \_______/   \___/   \_______/|__/  |__/ \_______/|__/            |________/|__/ \______/ ";
echo "                    | $$                                                     ___         ___          __  __  ___  ___  ___  ____                            ";
echo "                    | $$                                                    / _ )__ __  / _ )_______ / /_/ /_( _ )( _ )( _ )|_  /                            ";
echo "                    |__/                                                   / _  / // / / _  / __/ -_) __/ __/ _  / _  / _  |/_ <                             ";
echo "                                                                          /____/\_, / /____/_/  \__/\__/\__/\___/\___/\___/____/                             ";
echo "                                                                               /___/                                                                         ";
echo ===============================================================================================================================================================
::delete old log files and/or create new log folder. This will be hidden to unclutter folder but will be unhidden if SP is unsuccessful
rmdir /Q /S nonemptydir logs 2>nul
del logs 2>nul
md logs
::set absolute path to busybox and logs folder
set logpath="%cd%\logs"
echo START SUPER_PATCHER > %logpath%\log.txt
set log="%cd%\logs\log.txt"
echo %date%_%time% >> %log%
set busybox=%sppath%\busybox.exe
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
Title DJI Super-Patcher 2.0.2
echo ===============================================================================================================================================================
echo "  /$$$$$$                                                  /$$$$$$$             /$$               /$$                                  /$$$$$$       /$$$$$$ ";
echo " /$$__  $$                                                | $$__  $$           | $$              | $$                                 /$$__  $$     /$$$_  $$";
echo "| $$  \__/ /$$   /$$  /$$$$$$   /$$$$$$   /$$$$$$         | $$  \ $$ /$$$$$$  /$$$$$$    /$$$$$$$| $$$$$$$   /$$$$$$   /$$$$$$       |__/  \ $$    | $$$$\ $$";
echo "|  $$$$$$ | $$  | $$ /$$__  $$ /$$__  $$ /$$__  $$ /$$$$$$| $$$$$$$/|____  $$|_  $$_/   /$$_____/| $$__  $$ /$$__  $$ /$$__  $$        /$$$$$$/    | $$ $$ $$";
echo " \____  $$| $$  | $$| $$  \ $$| $$$$$$$$| $$  \__/|______/| $$____/  /$$$$$$$  | $$    | $$      | $$  \ $$| $$$$$$$$| $$  \__/       /$$____/     | $$\ $$$$";
echo " /$$  \ $$| $$  | $$| $$  | $$| $$_____/| $$              | $$      /$$__  $$  | $$ /$$| $$      | $$  | $$| $$_____/| $$            | $$          | $$ \ $$$";
echo "|  $$$$$$/|  $$$$$$/| $$$$$$$/|  $$$$$$$| $$              | $$     |  $$$$$$$  |  $$$$/|  $$$$$$$| $$  | $$|  $$$$$$$| $$            | $$$$$$$$ /$$|  $$$$$$/";
echo " \______/  \______/ | $$____/  \_______/|__/              |__/      \_______/   \___/   \_______/|__/  |__/ \_______/|__/            |________/|__/ \______/ ";
echo "                    | $$                                                     ___         ___          __  __  ___  ___  ___  ____                            ";
echo "                    | $$                                                    / _ )__ __  / _ )_______ / /_/ /_( _ )( _ )( _ )|_  /                            ";
echo "                    |__/                                                   / _  / // / / _  / __/ -_) __/ __/ _  / _  / _  |/_ <                             ";
echo "                                                                          /____/\_, / /____/_/  \__/\__/\__/\___/\___/\___/____/                             ";
echo "                                                                               /___/                                                                         ";
echo ===============================================================================================================================================================
:: detect if internet is availible and can connect to github otherwise check if Super-Tools-%branch% is already availble
echo PLEASE WAIT..
title DJI Super-Patcher 2.0.2
PING -n 1 140.82.113.4 |find "TTL=" && goto downloadtools
:nointernet
:: Give Error message giving user opertunity to turn on internet
cls
Title DJI Super-Patcher 2.0.2
echo ===============================================================================================================================================================
echo "  /$$$$$$                                                  /$$$$$$$             /$$               /$$                                  /$$$$$$       /$$$$$$ ";
echo " /$$__  $$                                                | $$__  $$           | $$              | $$                                 /$$__  $$     /$$$_  $$";
echo "| $$  \__/ /$$   /$$  /$$$$$$   /$$$$$$   /$$$$$$         | $$  \ $$ /$$$$$$  /$$$$$$    /$$$$$$$| $$$$$$$   /$$$$$$   /$$$$$$       |__/  \ $$    | $$$$\ $$";
echo "|  $$$$$$ | $$  | $$ /$$__  $$ /$$__  $$ /$$__  $$ /$$$$$$| $$$$$$$/|____  $$|_  $$_/   /$$_____/| $$__  $$ /$$__  $$ /$$__  $$        /$$$$$$/    | $$ $$ $$";
echo " \____  $$| $$  | $$| $$  \ $$| $$$$$$$$| $$  \__/|______/| $$____/  /$$$$$$$  | $$    | $$      | $$  \ $$| $$$$$$$$| $$  \__/       /$$____/     | $$\ $$$$";
echo " /$$  \ $$| $$  | $$| $$  | $$| $$_____/| $$              | $$      /$$__  $$  | $$ /$$| $$      | $$  | $$| $$_____/| $$            | $$          | $$ \ $$$";
echo "|  $$$$$$/|  $$$$$$/| $$$$$$$/|  $$$$$$$| $$              | $$     |  $$$$$$$  |  $$$$/|  $$$$$$$| $$  | $$|  $$$$$$$| $$            | $$$$$$$$ /$$|  $$$$$$/";
echo " \______/  \______/ | $$____/  \_______/|__/              |__/      \_______/   \___/   \_______/|__/  |__/ \_______/|__/            |________/|__/ \______/ ";
echo "                    | $$                                                     ___         ___          __  __  ___  ___  ___  ____                            ";
echo "                    | $$                                                    / _ )__ __  / _ )_______ / /_/ /_( _ )( _ )( _ )|_  /                            ";
echo "                    |__/                                                   / _  / // / / _  / __/ -_) __/ __/ _  / _  / _  |/_ <                             ";
echo "                                                                          /____/\_, / /____/_/  \__/\__/\__/\___/\___/\___/____/                             ";
echo "                                                                               /___/                                                                         ";
echo ===============================================================================================================================================================
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
Title DJI Super-Patcher 2.0.2
echo ===============================================================================================================================================================
echo "  /$$$$$$                                                  /$$$$$$$             /$$               /$$                                  /$$$$$$       /$$$$$$ ";
echo " /$$__  $$                                                | $$__  $$           | $$              | $$                                 /$$__  $$     /$$$_  $$";
echo "| $$  \__/ /$$   /$$  /$$$$$$   /$$$$$$   /$$$$$$         | $$  \ $$ /$$$$$$  /$$$$$$    /$$$$$$$| $$$$$$$   /$$$$$$   /$$$$$$       |__/  \ $$    | $$$$\ $$";
echo "|  $$$$$$ | $$  | $$ /$$__  $$ /$$__  $$ /$$__  $$ /$$$$$$| $$$$$$$/|____  $$|_  $$_/   /$$_____/| $$__  $$ /$$__  $$ /$$__  $$        /$$$$$$/    | $$ $$ $$";
echo " \____  $$| $$  | $$| $$  \ $$| $$$$$$$$| $$  \__/|______/| $$____/  /$$$$$$$  | $$    | $$      | $$  \ $$| $$$$$$$$| $$  \__/       /$$____/     | $$\ $$$$";
echo " /$$  \ $$| $$  | $$| $$  | $$| $$_____/| $$              | $$      /$$__  $$  | $$ /$$| $$      | $$  | $$| $$_____/| $$            | $$          | $$ \ $$$";
echo "|  $$$$$$/|  $$$$$$/| $$$$$$$/|  $$$$$$$| $$              | $$     |  $$$$$$$  |  $$$$/|  $$$$$$$| $$  | $$|  $$$$$$$| $$            | $$$$$$$$ /$$|  $$$$$$/";
echo " \______/  \______/ | $$____/  \_______/|__/              |__/      \_______/   \___/   \_______/|__/  |__/ \_______/|__/            |________/|__/ \______/ ";
echo "                    | $$                                                     ___         ___          __  __  ___  ___  ___  ____                            ";
echo "                    | $$                                                    / _ )__ __  / _ )_______ / /_/ /_( _ )( _ )( _ )|_  /                            ";
echo "                    |__/                                                   / _  / // / / _  / __/ -_) __/ __/ _  / _  / _  |/_ <                             ";
echo "                                                                          /____/\_, / /____/_/  \__/\__/\__/\___/\___/\___/____/                             ";
echo "                                                                               /___/                                                                         ";
echo ===============================================================================================================================================================
echo Success! I have verified internet access to GitHub.
echo.
echo I have verified internet access to GitHub >> %log%
echo %time% >> %log%
echo Please wait while I set things up. This wont take long...
echo.
%busybox% wget https://github.com/brett8883/Super-Tools/archive/%branch%.zip && echo Download success! || goto Busyboxerror
%busybox% unzip -o -q %branch%.zip
del /f /s %branch%.zip
cd Super-Tools-%branch%
call startup.cmd || goto crash


:Busyboxerror
cls
Title DJI Super-Patcher 2.0.2
echo ===============================================================================================================================================================
echo "  /$$$$$$                                                  /$$$$$$$             /$$               /$$                                  /$$$$$$       /$$$$$$ ";
echo " /$$__  $$                                                | $$__  $$           | $$              | $$                                 /$$__  $$     /$$$_  $$";
echo "| $$  \__/ /$$   /$$  /$$$$$$   /$$$$$$   /$$$$$$         | $$  \ $$ /$$$$$$  /$$$$$$    /$$$$$$$| $$$$$$$   /$$$$$$   /$$$$$$       |__/  \ $$    | $$$$\ $$";
echo "|  $$$$$$ | $$  | $$ /$$__  $$ /$$__  $$ /$$__  $$ /$$$$$$| $$$$$$$/|____  $$|_  $$_/   /$$_____/| $$__  $$ /$$__  $$ /$$__  $$        /$$$$$$/    | $$ $$ $$";
echo " \____  $$| $$  | $$| $$  \ $$| $$$$$$$$| $$  \__/|______/| $$____/  /$$$$$$$  | $$    | $$      | $$  \ $$| $$$$$$$$| $$  \__/       /$$____/     | $$\ $$$$";
echo " /$$  \ $$| $$  | $$| $$  | $$| $$_____/| $$              | $$      /$$__  $$  | $$ /$$| $$      | $$  | $$| $$_____/| $$            | $$          | $$ \ $$$";
echo "|  $$$$$$/|  $$$$$$/| $$$$$$$/|  $$$$$$$| $$              | $$     |  $$$$$$$  |  $$$$/|  $$$$$$$| $$  | $$|  $$$$$$$| $$            | $$$$$$$$ /$$|  $$$$$$/";
echo " \______/  \______/ | $$____/  \_______/|__/              |__/      \_______/   \___/   \_______/|__/  |__/ \_______/|__/            |________/|__/ \______/ ";
echo "                    | $$                                                     ___         ___          __  __  ___  ___  ___  ____                            ";
echo "                    | $$                                                    / _ )__ __  / _ )_______ / /_/ /_( _ )( _ )( _ )|_  /                            ";
echo "                    |__/                                                   / _  / // / / _  / __/ -_) __/ __/ _  / _  / _  |/_ <                             ";
echo "                                                                          /____/\_, / /____/_/  \__/\__/\__/\___/\___/\___/____/                             ";
echo "                                                                               /___/                                                                         ";
echo ===============================================================================================================================================================
echo.
Echo. BUSYBOX ERROR Handling 
echo
echo 32 bit busybox not working, will try 64 bit version >> %log%
echo There is an issue running the included 32 bit version of Busybox on your machine. I am going to try using the 32 bit version now. If you continue to see this message there is a problem with your machine running BusyBox and you may need to download the correct version of Busybox for your machine
Echo. 
set busybox=%sppath%\busybox64.exe
%busybox% wget https://github.com/brett8883/Super-Tools/archive/%branch%.zip && echo Download success! || goto Busyboxerrorarm
%busybox% unzip -o -q %branch%.zip
del /f /s %branch%.zip
cd Super-Tools-%branch%
call startup.cmd || echo SuperTools has not downloaded properly and this program is about to crash. 

:crash
Echo UNRECOVERABLE EROOR
ECHO.
Echo There has been an error that this program has not been designed to handle. I have added in this message to prevent the program from crashing but after you read this message please close Super-Patcher and try again
Pause

:Busyboxerrorarm
echo There is an issue running the included 64 and 32 bit version of Busybox on your machine. I am going to try using the 64 bit ARM version now. If you continue to see this message there is a problem with your machine running BusyBox and you may need to download the correct version of Busybox for your machine
Echo. 
pause
set busybox=%sppath%\busybox64a.exe
%busybox% wget https://github.com/brett8883/Super-Tools/archive/%branch%.zip && echo Download success! || goto crash
%busybox% unzip -o -q %branch%.zip
del /f /s %branch%.zip
cd Super-Tools-%branch%
call startup.cmd || goto crash 


