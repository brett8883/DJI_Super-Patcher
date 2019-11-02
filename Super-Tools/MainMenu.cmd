@echo off
:mainmenu
cd %stpath%
echo ------------------------------------------>>%log%
ECHO START MAINMENU >>%log%
echo ------------------------------------------>>%log%
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
echo                                           [7] Enable Indoor Mode (forces OPTI mode positioning)
echo                                           [8] Enable ADB and open a new CMD Prompt into ADB
echo.
echo                                        DONATE
echo                                           [9] Donate
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
Choice /c 123456789 /M "Please make a section with keyboard"
if errorlevel 9 goto donate
if errorlevel 8 goto adb
if errorlevel 7 goto indoor
If Errorlevel 6 goto NLD
If Errorlevel 5 goto jkson
If Errorlevel 4 goto dumldore
If Errorlevel 3 goto getDownloader
If Errorlevel 2 goto flashstock
If Errorlevel 1 goto StartSP

:indoor
cls
call %header%
echo.
echo INDOOR MODE
echo.
echo.
echo Indoor Mode disables GPS positioning but still allows vision positioning, ideal for indoor flying or any other location where GPS unavailble or spotty
echo.
echo When Indoor Mode is enabled OPTI mode postioning allows precise positioning without GPS upto roughly 100 feet above the ground.
echo.
echo When Indoor Mode is enabled and GPS signal is suffient the drone's location will still be shown on the map, however, GPS postitioning will not be used
echo.
echo Return to home feature WILL NOT BE AVAILIBLE in Indoor Mode. Advanced Pilots ONLY
echo.
echo If conditions for VPS are not met the drone will revert to ATTI mode. Be prepared to take manual control in lighting conditions weaken 
echo or height above the ground exceeds 100 feet.
echo.
echo Indoor mod cannot be turned on and off in flight. Users will need to do either the normal Super-Patcher process or flash back to stock to get GPS postioning back
echo.
echo If you are currently in a flight controller installed using Super-Patcher you do NOT need to flash back to stock first and do not need to flash to stock if going
echo from Indoor Mode back to the normal Super-Patcher process.
echo.
echo If you are not on stock %stock% firmware or Super-Patcher firmware you should flash stock %stock% TWICE before proceeding
echo.
echo.
echo
echo Would you like to continue with enabling Indoor Mode?
echo.
echo [Y]
echo [N]
echo.
choice /m "Please make selection with keyboard"
if errorlevel 2 goto mainmenu
if errorlevel 1 goto indoor2

:indoor2
call indoor.cmd
goto mainmenu  
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
call %dumldore%
echo.
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