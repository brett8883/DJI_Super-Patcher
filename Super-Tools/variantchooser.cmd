@echo off
:variantchooser
echo. >>%log%
echo START VARIANT CHOOSER>>%log%
cls
call %header%
Echo Super-Patcher features optional modifications.
echo.
echo The new modifications will each be discribed and then you will asked if you'd like to enable them.
echo.
echo Continue when ready...
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
cls
call %header%
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo GALILEO SATELLITE RECEPTION
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
echo Super-Patcher can enable your aircraft to now connect to the new Galileo GPS satellite system.
echo.
echo This allows the %AC% to connect to more satellities for a more accurate, stonger, and more resiliant connection to GPS.
echo.
if "%AC%"=="MavicPro" echo Mavic Pro handles Galileo excetionally well. This is recommend to all Mavic Pro users.
echo.
echo Galileo reception is hard-coded into the firmware.
echo.
echo If you choose this option and decide later you would like to turn Galileo off you will need to flash the stock firmware.
echo.
echo After flashing back to stock firmware you can redo Super-Patcher without the Galileo option enabled
echo.
ECHO Would you like to ENABLE Galileo reception?
echo.
echo [Y] YES
echo [N] No
echo.
choice /m "Please make selection with keyboard"
if errorlevel 2 set "gal=2" & set "galwords=NoGal"
if errorlevel 1 set "gal=1" & set "galwords=YesGal"

:askBatmod
cls
call %header%
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo **SMART BATTERY MODIFICATION**
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo *Advanced Pilots only!*
echo -NOTE: This modification disables some "idiot-proofing" features from DJI. Pilots must be able to monitor battery levels in flight without the need of an alert  
echo.
echo The Smart Battery modification will pre-configure your aircraft with settings to remove limitations on the Smart Battery
echo.
echo - Disable Forced Auto-Landing due to Smart Battery low battery
echo     NOTE: Aircraft will still force auto-land at emergency voltage level at 3.0v per cell (well below the safe voltage for flight)
echo.
echo    NOTE: With the Smart Battery Modification, automatic low battery Return to Home can be enabled in DJI Go 4, however,
echo the aircraft will only automatically return to home when there is barely enough power remaining to make it back to the home point.
echo This feature should only be used as a fail-safe and not relied upon regularly.
echo. 
echo - Disabled low battery warning
echo - Disabled critical low battery
echo.
echo These options can be enabled in Assistant 2 1.1.2 OR they can be enabled by AUTOMATICALLY by indicating "YES" below.
echo   NOTTE: The Smart Battery modifications can also be disabled or tweaked to user preference in Assistant 2 1.1.2 in debug mode
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo If "YES" is indicated below the Smart Battery options will be enabled and there would be nothing additional the user needs to do to enable them
echo.
echo If "NO" is indicated below the factory defualts will remain default but can be enabled later by the user in Assistant 2 1.1.2 in debug mode
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO Would you like to ENABLE the new Smart Battery modification by default?
echo.
echo [Y] YES
echo [N] No
echo.
choice /m "Please make selection with keyboard"
if errorlevel 2 set "batmod=2"
if errorlevel 1 set "batmod=1"

:askstealth
cls
call %header%
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo **STEALTH MODIFICATION**
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
echo FLY WITH CAUTION!
echo.
echo The new Stealth modification will disable the rear LED lights on the aircraft which will remain OFF during flight for Super Stealthy flight.
echo.
echo The Stealth modification is optional but it is hard-coded into the firmware and cannot be changed by the user in flight or with Assistant 2 1.1.2 in debug mode
echo   NOTE: To undo the Stealth mod, simply run Super-Patcher again without the Stealth mod selected or download and flash stock firmware from the main menu
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo If "YES" is indicated below the Stealth option will be enabled and there would be nothing additional the user needs to do to enable it
echo.
echo If "NO" is indicated below the factory defualt will remain and the rear LED light will function as normal
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
echo Would you like to ENABLE the new stealth mod?
echo.
echo [Y] YES
echo [N] No
echo.
choice /m "Please make selection with keyboard"
if errorlevel 2 set "stealthmod=2"
if errorlevel 1 set "stealthmod=1"

:ask_NMR
cls
call %header%
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo ABILITY TO START MOTORS WHEN AIRCRAFT IS INVERTED
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
Echo The ABILITY TO START MOTORS WHEN AIRCRAFT IS INVERTED mod allows the pilot to start the motors if the aircraft is inverted (upside down.)
echo.
echo This mod is primarly for pilots who like to perform a CSC manuver in flight to cut the motors and allow the aircraft to free fall and then 
echo start the motors up again just before hitting the ground. Without this mod if the aircraft flips over while free falling then the aircraft will not allow
echo the motors to be started and the aircraft will hit the ground.
echo.
echo With this modification the aircraft will start the motors even if flipped upside down and will right itself once the motors have restarted saving the aircraft.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo This mod also has some secondary benefits that might be drawbacks to some users. 
echo.
echo With this mod the aircraft will attempt to right itself and recover after a colision. This can save an aircraft from crashing
echo.
echo The possible drawback to this is if hand catching the drone it cannot be turned off by flipping it. 
echo The motors will continue to run and will try to right itself vigorously
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo This modification was previously not optional and enabled by default for all Super-Patcher users. Only a small number of users found it to be a drawback
echo.
echo The vast majority of users either did not notice it or liked the fuctionality. You now have a choice.
echo.
echo You can change this function with DJI Assistant 2 1.1.2 in debug mode. The parameter is [g_config.fdi_open.close_auto_stop_motor_check]
echo.
echo WOULD YOU LIKE TO ENABLE ABILITY TO START MOTORS WHEN AIRCRAFT IS INVERTED?
echo.
echo [Y] Yes
echo [N] no
choice /m "Please make a selection with the keyboard"
if errorlevel 2 set "NMR=2"
if errorlevel 1 set "NMR=1"

:confirmmods
cls
call %header%
echo.
echo You have chosen the following mods:
echo.
if "%gal%"=="1" echo Galileo: ENABLED
if "%gal%"=="2" echo Galileo: DISABLED
echo.
if "%batmod%"=="1" echo Smart Battery Mod: ENABLED
if "%batmod%"=="2" echo Smart Battery Mod: DISABLED
echo.
if "%stealthmod%"=="1" echo Stealth Mod: ENABLED
if "%stealthmod%"=="2" echo Stealth Mod: DISABLED
echo.
if "%NMR%"=="1" echo ABILITY TO START MOTORS WHEN AIRCRAFT IS INVERTED: ENABLED
if "%NMR%"=="2" echo ABILITY TO START MOTORS WHEN AIRCRAFT IS INVERTED: DISABLED
echo.
echo.
echo Are these the options you want?
echo.
echo [Y] Yes
echo [N] no
echo.
choice /m "Please make a selection with your keyboard"
if errorlevel 2 goto variantchooser
if errorlevel 1 goto resolveurl1

:resolveurl1
echo %batmod%%stealthmod%%gal%%NMR%
set varchoice=%batmod%%stealthmod%%gal%%NMR%
echo 1^=yes 2^=no (galileo SmartBat Stealth MotorsAbleToBeRestartedWhenInverted)>>%log%
echo %varchoice%>>%log%
if "%varchoice%"=="2211" set "variant=Standard_YesGal" & set "fc2=22"
if "%varchoice%"=="1211" set "variant=Batt-Mod_YesGal" & set "fc2=12"
if "%varchoice%"=="2111" set "variant=Stealth_YesGal" & set "fc2=21"
if "%varchoice%"=="1111" set "variant=FullyLoaded_YesGal" & set "fc2=11"
if "%varchoice%"=="2212" set "variant=Standard_NMR_YesGal" & set "fc2=44"
if "%varchoice%"=="1212" set "variant=Batt-Mod_NMR_YesGal" & set "fc2=34"
if "%varchoice%"=="2112" set "variant=Stealth_NMR_YesGal" & set "fc2=43"
if "%varchoice%"=="1112" set "variant=FullyLoaded_NMR_YesGal" & set "fc2=33"
if "%varchoice%"=="2221" set "variant=Standard_NoGal" & set "fc2=66"
if "%varchoice%"=="1221" set "variant=Batt-Mod_NoGal" & set "fc2=56"
if "%varchoice%"=="2121" set "variant=Stealth_NoGal" & set "fc2=65"
if "%varchoice%"=="1121" set "variant=FullyLoaded_NoGal" & set "fc2=55"
if "%varchoice%"=="2222" set "variant=Standard_NMR_NoGal" & set "fc2=88"
if "%varchoice%"=="1222" set "variant=Batt-Mod_NMR_NoGal" & set "fc2=78"
if "%varchoice%"=="2122" set "variant=Stealth_NMR_NoGal" & set "fc2=87"
if "%varchoice%"=="1122" set "variant=FullyLoaded_NMR_NoGal" & set "fc2=77"
:setFCnumber
if "%AC%"=="I2" (set "fc=%fcbase%%fc2%.%fc2%") ELSE (set "fc=%fcbase%%fc2%")
echo %fc%
echo flight controller number is %fc%>>%log%
echo variant is %variant%>>%log%
pause
REM set fw2=%AC%_SP_2.0_%variant%_%fc%_dji_system.bin
REM set varianturl1=%AC%_%variant%_%fcbase%%fc2%_dji_system.bin
REM set varianturl2=%baseurl%%varianturl1%
rem https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/2.1/MavicPro_Standard_YesGal_03.02.44.22_dji_system.bin
set varianturl2=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/%AC%/2.1/%AC%_%variant%_%fc%_dji_system.bin
echo download URL resolves to %varianturl2%>>%log%
REM echo %baseurl%
REM echo %variant%
REM echo %fcbase%%fc2%
REM echo %varianturl1%
REM echo %baseurl%%varianturl1%
REM echo %AC%_%variant%_%fcbase%%fc2%_dji_system.bin
REM echo %varianturl2%
REM echo %varianturl2%
cls
call %header%
echo Wait just a moment...
echo.
cd %sppath%
rmdir /Q /S SP_Flight_Controllers 2>nul
md SP_Flight_Controllers 2>nul
cd SP_Flight_Controllers
set FCfolderpath="%cd%"
echo %varianturl2%
Echo https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/2.1/MavicPro_Standard_YesGal_03.02.44.22_dji_system.bin
pause
%busybox% wget %varianturl2% && echo downloaded successfully
pause

:end
cd %stpath%
call dd_checkprops.cmd
