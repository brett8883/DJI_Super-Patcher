@echo off
:variantchooser
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
echo.
echo GALILEO SATELLITE RECEPTION
echo.
echo Super-Patcher can enable your aircraft to now connect to the new Galileo GPS satellite system.
echo.
echo This allows the %AC% to connect to more satellities for a more accurate, stonger, and more resiliant connection to GPS.
echo.
if "%AC%"=="MavicPro" echo Mavic Pro handles Galileo excetionally well. This is reccomended to all Mavic Pro users.
echo.
echo Galileo reception is hard-coded into the firmware. If you choose this option and decide later you would like to turn off this feature you will need to flash the stock firmware.
echo.
echo After flashing back to stock firmware you can redo Super-Patcher without the Galileo option enabled
echo.
ECHO Would you like to ENABLE Galileo reception?
echo.
echo [Y] YES
echo [N] No
echo.
choice /m "Please make selection with keyboard"
if errorlevel 2 goto gal2
if errorlevel 1 goto gal1

:gal1
set gal=1
goto askbatmod

:gal2
set gal=2
goto askbatmod

:askBatmod
cls
call %header%
echo.
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo **SMART BATTERY MODIFICATION**
echo ---------------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
echo Advanced Pilots only!
echo  NOTE: This modification disables some "idiot-proofing" features from DJI. Pilots must be able to monitor battery levels in flight without the need of an alert  
echo.
echo The Smart Battery modification will pre-configure your aircraft with settings to unlock the limitations caused by the smart battery
echo while still allowing the benefits of the DJI Smart Battery
echo.
echo - Disable Forced Auto-Landing due to Smart Battery low battery
echo     NOTE: Aircraft will still force auto-land at emergency voltage level at 3.0v per cell (well below the safe voltage for flight)
echo.
echo - Calibrated Smart Battery "Only enough battery remaining to return to the home point" calculation to be more accurate
echo.
echo    NOTE: With the Smart Battery Modification automatic low battery Return to Home can be enabled in DJI Go 4, however,
echo the aircraft will only automatically return to home when there is barely enough power remaining to make it back to the home point.
echo This feature should only be used as a fail-safe. All Smart Battery setting can be adjusted in Assistant 1.1.2 in debug mode
echo. 
echo - Disabled low battery warning when using DJI Smart Battery
echo - Disabled critical low battery warning when using DJI Smart Battery
echo.
echo These are OPTIONAL
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
if errorlevel 2 goto batmod2
if errorlevel 1 goto batmod1

:batmod1
set batmod=1
goto askstealth

:batmod2
set batmod=2
goto askstealth

:askstealth
cls
call %header%
echo.
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
if errorlevel 2 goto stealthmod2
if errorlevel 1 goto stealthmod1

:stealthmod1
set stealthmod=1
goto ask_NMR

:stealthmod2
set stealthmod=2
goto ask_NMR

:ask_NMR
set NMR=1
goto confirmmods

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
echo %varchoice%
if "%varchoice%"=="2211" set varianturl=%standard% & set variant=Standard
if "%varchoice%"=="1211" set varianturl=%battmod% & set variant=BattMod
if "%varchoice%"=="2111" set varianturl=%stealth% & set variant=Stealth
if "%varchoice%"=="1111" set varianturl=%FullyLoaded% & set variant=FullyLoaded
if "%varchoice%"=="2221" set varianturl=%standard_NoGal% & set variant=Standard_NoGal
if "%varchoice%"=="1221" set varianturl=%battmod_NoGal% & set variant=BattMod_NoGal
if "%varchoice%"=="2121" set varianturl=%stealth_NoGal% & set variant=Stealth_NoGal
if "%varchoice%"=="1121" set varianturl=%FullyLoaded_NoGal% & set variant=FullyLoaded_NoGal
set fw2=%AC%_SP_2.0_%variant%_%fc%_dji_system.bin
set fc=%fcbase%%varchoice%
cls
call %header%
title Super-Patcher 2.0 for %AC%
echo Wait just a moment...
echo.
cd %sppath%
rmdir /Q /S SP_Flight_Controllers 2>nul
md SP_Flight_Controllers 2>nul
cd SP_Flight_Controllers
set FCfolderpath=%cd%
if exist %fw2% goto end
%busybox% wget %varianturl%

REM :resolveurl2
REM echo %batmod%%stealthmod%
REM set varchoice=%batmod%%stealthmod%
REM echo %varchoice%
REM if "%varchoice%"=="22" set varianturl=%standard_NoGal% & set variant=Standard_NoGal & set "varchoice=44"
REM if "%varchoice%"=="12" set varianturl=%battmod_NoGal% & set variant=BattMod_NoGal & set "varchoice=34"
REM if "%varchoice%"=="21" set varianturl=%stealth_NoGal% & set variant=Stealth_NoGal & set "varchoice=43"
REM if "%varchoice%"=="11" set varianturl=%FullyLoaded_NoGal% & set variant=FullyLoaded_NoGal & set "varchoice=33"
REM set fw2=%AC%_SP_2.0_%variant%_%fc%_dji_system.bin
REM set fc=%fcbase%%varchoice%
REM cls
REM call %header%
REM title Super-Patcher 2.0 for %AC%
REM echo Wait just a moment...
REM echo.
REM cd %sppath%
REM md SP_Flight_Controllers 2>nul
REM cd SP_Flight_Controllers
REM set FCfolderpath=%cd%
REM if exist %fw2% goto end
REM %busybox% wget %varianturl%
:end
cd %stpath%
dd_checkprops.cmd
