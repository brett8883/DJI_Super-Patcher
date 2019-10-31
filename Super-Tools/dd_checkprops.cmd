@Echo off
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
call %dumldore%
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