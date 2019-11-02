@echo off
cls
echo ---------------------------------------------------------------- >>%log%
echo DOWNLOADING AND FLASHING STOCK FIRMWARE FOR %AC% >>%log%
call %header%
cd %Sppath%
md Stock_Firmware 2>>nul
cd Stock_Firmware
set sfwpath="%cd%"
if exist %stockfw% (goto flash) else (goto download)

:download
echo Please Wait while I download %stockfw%.
Echo.
echo When it's ready it will be in %sfwpath%
Echo.
echo.
%wget% %stockdl% --show-progress -nc --no-check-certificate -a %log% && echo downloaded Stock firmware %stockfw% successfully
goto flash

:flash
cls
call %header%
echo Turn on your aircraft and connect it to your PC. When it has fully started and connected to this PC, please continue.
pause
cls
call %header%
echo Please press "Load Firmware" in Dumldore and choose the %stockfw% file
echo.
echo which is in your Super-Patcher folder at %sppath%
echo.
echo Then press "Flash Firmware" in Dumldore
ECHO.
ECHO.
ECHO Once Dumldore says its ok to reboot, please reboot the aircraft and then continue
ECHO.
start %dumldore%
cd %stpath%
pause
cls
call %header%
echo It is typically neccesary to flash the stock firmware a second time before running Super-Patcher but isn't required if removing Super-Patcher
echo.
ECHO Whould you like to flash a second time or would you like to go straight back to the MainMenu?
echo.
echo      [1] Yes, I'd like to flash a second Stock_Firmware
echo      [2] No, take me back to the MainMenu
echo.
choice /c 12 /m "Please make a selection with the keyboard."
if errorlevel 2 goto end
if errorlevel 1 goto flash2

:flash2
cls
call %header%
echo Turn on your aircraft and connect it to your PC. When it has fully started and connected to this PC, please continue.
pause
cls
call %header%
echo Please press "Load Firmware" in Dumldore and choose the %stockfw% file
echo.
echo which is in your Super-Patcher folder at %sppath%
echo.
echo Then press "Flash Firmware" in Dumldore
ECHO.
ECHO.
ECHO Once Dumldore says its ok to reboot, please reboot the aircraft and then continue
ECHO.
start %dumldore%
Pause
:end
echo END FLASH STOCK FIRMWARE>>%log%
echo ---------------------------------------------------------------- >>%log%
echo GOING BACK TO MAINMENU >> %log%
call mainmmenu.cmd
