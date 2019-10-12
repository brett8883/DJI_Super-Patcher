@echo off
:mainmenu
cd %stpath%
title Super-Patcher 2.0
cls
call header.bat
echo " _  __  __  _ __  _   __ __ ___ __  _ _  _                                                                                                                   ";
echo "|  V  |/  \| |  \| | |  V  | __|  \| | || |                                                                                                                  ";
echo "| \_/ | /\ | | | ' | | \_/ | _|| | ' | \/ |                                                                                                                  ";
echo "|_| |_|_||_|_|_|\__| |_| |_|___|_|\__|\__/                                                                                                                   ";
Echo "                                                                                                                                                             ";
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO.
echo                             WHAT DO YOU WANT TO DO?
echo.
echo                                        SUPER-PATCHER
echo                                         **[1] Run Super-Patcher!**
echo                                           [2] Download ^& Flash the correct stock firmware needed for Super-Patcher
echo.
echo                                        UTILITIES
echo                                           [3] Open DankDroneDownloader by CS2000 to download any other firmware files
echo                                           [4] Launch DUMLdore by Jezzeb
echo                                           [5] Launch jkson fcc mod (Mavic, Spark, and P4Pv2 only) by jkson5
echo                                           [6] Launch the free NoLimitDronez app
echo.
echo                                        ADVANCED
echo                                           [7] Enable ADB and open a new CMD Prompt into ADB
echo.
echo                                        DONATE
echo                                           [8]
echo                                        EXIT
echo                                           [9] Exit DJI Super-Patcher
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
Choice /c 123456789 /M "Please make a section with keyboard"
if errorlevel 9 goto exit
if errorlevel 8 goto donate
if errorlevel 7 goto adb
If Errorlevel 6 goto NLD
If Errorlevel 5 goto jkson
If Errorlevel 4 goto dumldore
If Errorlevel 3 goto getDownloader
If Errorlevel 2 goto flashstock
If Errorlevel 1 goto StartSP

:Donate
rundll32 url.dll,FileProtocolHandler https://www.paypal.me/brett8883
goto mainmenu

:flashstock
call flashstock.cmd
goto mainmenu

:getDownloader
echo start getdankdownloaderMM >> %log%
cls
call %header%
cd %tpath%
cd %DDMpath% 2>>nul
if exist DankDroneDownloader.exe start DankDroneDownloader.exe & echo DDD exists >> %log% & goto mainmenu
Echo Hold on just a sec...
cd %tpath%
%busybox% wget https://github.com/cs2000/DankDroneDownloader/archive/master.zip 2>> %log%
%busybox% unzip master.zip
cd DankDroneDownloader-master
set DDD=%cd%\DankDroneDownloader.exe
set DDMpath=%cd%
start DankDroneDownloader.exe
del master.zip
cd %stpath%
cd %tpath%
goto mainmenu

:dumldore
start %dumldore%
goto mainmenu

:jkson
cls
if "%AC%"=="MavicPro" goto startjkson
if "%AC%"=="P4Pv2" goto startjkson
if "%AC%"=="Spark" goto startjkson
goto sorryjkson

:startjkson
call %header%
Echo Please turn on the %AC% and after it has fully started, connect to the PC
echo.
echo Continue when ready to begin
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
cls
call %header%
echo Click "Enable ADB" in DUMLdore and wait for ADB to enable
Echo The front lights will usually flash, turn on, or turn off but not always
echo.
echo Then close DUMLdore
Echo.
Echo Continue once ADB has been enabled and DUMLdore is closed
start %dumldore%
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
cls
cd %tpath%
call jksonmm.cmd
adb kill-server 2>>nul
taskkill /im adb.exe 2>>nul
cd %stpath%
goto mainmenu

:sorryjkson
cls
call %header%
echo So sorry!
echo Jkson FCC Mod is only availible for MavicPro and P4Pv2 right now
echo.
echo I will take you back to the main menu. Continue when ready
pause
goto mainmenu

:startSp
cls
call variantchooser.cmd
goto mainmenu

:NLD
@echo off
cls
call %header%
echo PLEASE WAIT just a moment..
echo.
cd %tpath%
if exist NLDapp.exe (goto startNLD) else (goto downloadNLD)

:downloadNLD
wget https://nolimitdronez.com/downloads/nldapp.zip
7za.exe -e nldapp.zip
set %NLD%=nldapp.exe
:startNLD
start %NLD%
cd %stpath%
goto mainmenu

:adb
cls
call %header%
Echo Please turn on the %AC% and after it has fully started, connect to the PC, then continue
echo.
echo Continue when ready to begin
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
Pause
cls
call %header%
echo Then click "Enable ADB" in DUMLdore and wait for ADB to enable
echo.
Echo The front lights will sometimes flash, turn on, or turn off but not always
Echo.
Echo Continue once ADB has been enabled and DUMLdore is closed
start %dumldore%
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
cd %tpath%
start cmd /k adb shell
cd %stpath%
echo Continue to be taken back to the main menu
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
adb kill-server 2>>nul
taskkill /im adb.exe 2>>nul
goto mainmenu

:exit
exit