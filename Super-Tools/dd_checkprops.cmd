@Echo off
title Super-Patcher 2.0 for %AC%
:dummy_verify_step
set fork=0
echo starting dummy_verify_step >> %log%
cls
cd %tpath%
del /f /s *.txt 2>nul
cls
call %header%
ECHO PLEASE TAKE CARE TO FOLLOW INSTRUCTIONS EXACTLY
ECHO GO SLOW AND READ INSTRUCTIONS CAREFULLY BEFORE ACTING
ECHO DO NOT SKIP STEPS, DO NOT DO EXTRA STEPS
Echo ****************************************************************************************************************************************************************
pause
cls
call %header%
Echo Please turn on the %AC% and after it has fully started, connect to the PC
echo.
echo Continue when ready to begin
Echo ****************************************************************************************************************************************************************
Pause
cls
call %header%
Echo Please ensure DUMLdore says you are on firmware %stock% and that this is stock version
echo.
echo Then click "Enable ADB" in DUMLdore and wait for ADB to enable
Echo The front lights will usually flash, turn on, or turn off
echo.
echo then close DUMLdore
Echo.
Echo Continue once ADB has been enabled and DUMLdore is closed
start %dumldore%
Echo ***************************************************************************************************************************************************************
Pause
:: Start check props
cls
call %header%
echo.
echo.
Echo Checking Aircraft PROPERTIES please wait...
ECHO.
echo. >> %log%
echo AIRCRAFT PROPERTIES: >> %log%
echo. >> %log%
echo ^*WARNING^!^* AIRCRAFT PROPERTIES INFORMATION IS UNDER DEVELOPMENT AND IS UNRELIABLE AT THIS TIME >> %log%
echo INSTEAD USE NLDapp or DUMLdore FOR AC PROPERTIES >> %log%
echo.
adb shell grep -i 'device id' /data/upgrade/*.cfg.sig > devicetmp.txt
for /f "tokens=1-3 delims==>" %%A in (devicetmp.txt) do (set device=%%B)
adb shell grep -i 'firmware formal' /data/upgrade/*.cfg.sig > firmwaretmp.txt
for /f "tokens=1-2 delims==>" %%A in (firmwaretmp.txt) do (set cfirmware=%%B)
adb shell grep -i '0306' /data/upgrade/*.cfg.sig > FCtmp.txt
for /f "tokens=4-5 delims== " %%A in (fctmp.txt) do (set curFC=%%B)
  :: Remove quotes
   SET device=###%device%###
   SET device=%device:"###=%
   SET device=%device:###"=%
   SET device=%device:###=%
echo %device%
echo %device% >> %log%
 :: Remove quotes
   SET cfirmware=###%cfirmware%###
   SET cfirmware=%cfirmware:"###=%
   SET cfirmware=%cfirmware:###"=%
   SET cfirmware=%cfirmware:###=%
echo %cfirmware% >> %log%
 :: Remove quotes
   SET curFC=###%curFC%###
   SET curFC=%curFC:"###=%
   SET curFC=%curFC:###"=%
   SET curFC=%curFC:###=%
echo %curFC%
echo %curFC% >> %log%
del /f /q *.txt
cd %stpath%
call dummy_bind.cmd
REM if "%curFC%"=="" (goto end) ELSE (goto declareprops)

REM :declareprops
REM ECHO AIRCRAFT PROPERTIES
REM echo.
REM echo Model:%device%
REM echo Firmware: %cfirmware%
REM echo Flight Controller#: %curFC%
REM PING -n 4 127.0.0.1>nul
REM :end
REM call dummy_bind.cmd

REM :checkfw
REM Echo Expecting firmware version #: %stock%
REM PING -n 2 127.0.0.1>nul
REM echo Aircraft reporting current firmware is %cfirmware%
REM PING -n 2 127.0.0.1>nul
REM if "%stock%"=="%cfirmware%" (goto fwmatch) ELSE (goto fwmm)

REM :fwmatch
REM echo.
REM Echo Success passed firmware check
REM Echo Success passed firmware check >> %log%
REM PING -n 3 127.0.0.1 > nul
REM goto checkfc


REM :fwmm
REM echo.
REM Echo ERROR Expected firmware for aircraft selected does not match the firmware the aircraft is reporting
REM Echo ERROR Expected firmware for aircraft selected does not match the firmware the aircraft is reporting >> %log%
REM Echo.
REM echo I would advise going back to the main menu and flashing the correct stock firmware first!
REM echo.
REM echo Would you like to go back to the Main Menu, or ignore this error and continue?
REM Echo.
REM echo Reccomended [1] Take me back to Main Menu
REM echo             [2] Ingnore this error and continue
REM echo.
REM choice /c 12 /m "Make a selection with keyboard"
REM if errorlevel 2 goto checkfc & echo User chose to Ignore FW error and continue >> %log%
REM if errorlevel 1 goto mainmenu

REM :checkfc
REM echo.
REM Echo Checking flight controller#. Please wait...
REM echo.
REM PING -n 3 127.0.0.1 > nul
REM echo expected flight controller# is %ofc%
REM PING -n 2 127.0.0.1 > nul
REM echo current flight controller on aircraft is %curFC%
REM PING -n 3 127.0.0.1 > nul
REM if "%ofc%"=="%curfc%" goto fcmatch

REM :fcMM
REM Echo.
REM echo Expected flight controller number does not match the stock flight controller number for a %AC% on stock %stock% firmware
REM echo Expected flight controller number does not match the stock flight controller number for a %AC% on stock %stock% firmware >> %log%
REM echo.
REM echo This could just mean you have already installed a custom flight controller using Super-Patcher of FC_Patcher
REM echo   if this is the case you can ignore this error and continue, otherwise please flash stock %stock% firmware again
REM echo.
REM echo Did you use Super-Patcher or FC_Patcher to install your current flight controller?
REM echo.
REM echo         [Y] Yes, ignore this error
REM echo         [N] No, take me back so I can flash stock firware needed for Super-Patcher again
REM echo.
REM choice  /m "please make selection with keyboard"
REM if errorlevel 2 goto MainMenu & echo User chose to go back to mainmenu
REM if errorlevel 1 goto continue

REM :fcmatch
REM Echo Success^! Current Flight Controller matches expected stock Flight Controller^!
REM echo.
REM echo Starting Super-Patcher installation. Please Wait...
REM echo Starting Super-Patcher installation...>> %log%
REM PING -n 3 127.0.0.1 > nul
REM goto end

REM :continue
REM echo.
REM adb kill-server 2>>nul
REM taskkill /im adb.exe 2>>nul
REM cd %stpath%
REM goto end

REM :mainmenu
REM set fork=1
REM cd %stpath%
REM call mainmenu.cmd

REM :end
REM if "%fork%"=="1" (call mainmenu.cmd) ELSE (call dummy_bind.cmd)