@echo off
:mainmenu
cd %stpath%
echo ------------------------------------------>>%log%
ECHO START MAINMENU >>%log%
echo ------------------------------------------>>%log%
cls
call %header%
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
echo                                           [3] Launch DUMLdore by Jezzeb
echo                                           [4] Launch jkson fcc mod (Mavic, Spark, and P4Pv2 only) by jkson5
echo.
echo                                        INSTALL ASSISTANT 2 ^& SET UP DEBUG mode
echo                                           [5] Download and install Assistant 1.1.2 and set up debug mode to modify parameters
echo.
echo                                        ADVANCED
echo                                           [6] Enable Indoor Mode (forces OPTI mode positioning)
echo                                           [7] Enable ADB and open a new CMD Prompt into ADB
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
Choice /c 1234567 /M "Please make a section with keyboard"
if errorlevel 7 goto adb
if errorlevel 6 goto indoor
if errorlevel 5 goto assistant
If Errorlevel 4 goto jkson
If Errorlevel 3 goto dumldore
If Errorlevel 2 goto flashstock
If Errorlevel 1 goto StartSP

:assistant
cls
cd %tpath%
call %header%
Echo Please wait while Assistant 2 1.1.2 is downloaded
echo.
echo Depending on your connection speed this may take some time as it is a big file
echo.
echo Make sure that any newer versions of Assistant 2 are uninstalled 
echo.
wget https://www.sekidorc.com/press/DJI_Assistant2_Installer_v1.1.2_20170527.zip --show-progress -nc --no-check-certificate -a %log% && echo Assistant 2 1.1.2 downloaded successfully & Assistant 2 1.1.2 downloaded successfully>>%log%
echo.
echo Please continue when ready.
pause
cls
call %header%
echo I will start the install process for Assistant 2 1.1.2 but you will need to finish the process manually. Just follow the prompts
echo.
echo continue oncw the install process is finished.
timeout 5
7za.exe e DJI_Assistant2_Installer_v1.1.2_20170527.zip
cls
call %header%
call "DJI Assistant 2 1.1.2.573 2017_05_27 16_41_02 6e0216bf(b21de8d8).exe"
cd "%ProgramFiles(x86)%\DJI Product\DJI Assistant 2\AppFiles"
cp main.js %sppath%
pause
goto mainmenu

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

:flashstock
call flashstock.cmd
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