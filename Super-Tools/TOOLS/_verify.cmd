@echo off
cls 
call %header%
echo PLEASE WAIT just a moment..
echo.
cd %tpath%
if exist NLDapp.exe (goto verify) else (goto downloadNLD)

:downloadNLD
wget https://nolimitdronez.com/downloads/nldapp.zip
7za.exe -e nldapp.zip
set %NLD%=nldapp.exe
goto verify

:verify
cls
echo _verify.cmd starting >> %log%
call %header%
Echo To verify Super-Patcher was successful I will open NLD. Please allow it to open
echo Please wait...
timeout 4
:startnld
start %NLD%
cls
call %header%
echo Please check the NLD app which will show your flight controller version #
echo(
Echo Please verify NLD app says your flight controller # is %FC% 
Echo(
Echo Does NLD app have say your flight controller number is correct? 
Echo(
Echo [1] Yes 
Echo [2] no 
ECho [3] Open NLD app again
choice /C 123 /M "correct FC number indicated?"
If Errorlevel 3 Goto startnld
If Errorlevel 2 Goto nopatch
If Errorlevel 1 Goto success

:nopatch
@echo off
echo User Indicated patch not successful. Showing log file >> %log%
ATTRIB -H %logpath%
cls 
Call %Header%
Echo If your Flight Controller # is not %fc% then Super-Patcher was not successful 
ECHO You should read the readme.md on GitHub again and restart Super-Patcher from the begining  
echo ===============================================================================================================================================================
echo I have generated a log file for you which can now be found at 
echo %logpath%
echo.
echo This file can be helpful to determine what has gone wrong
echo ===============================================================================================================================================================
Echo Some common reasons for Super-Patcher not being successful:
echo.
echo -Not starting on a completely stock version of firmware %stock%
echo.
echo -Not following the directions exactly please ONLY do what Super-Patcher says ONLY when it says to 
echo.		 
ECHO -When doing the "enable ADB" steps not waiting until ABD has been enabled. 
echo        Usually the front lights will turn on or off to indicate ADB has been enabled
echo.
echo -Not using a Windows 10 PC. Windows 7 and 8 do not have to proper adb drivers Super-Patcher needs
echo        This can be over come by manually installing the drivers but using Windows 10 is easier
echo ===============================================================================================================================================================
echo Continuing will take you back to the main menu
echo ===============================================================================================================================================================
pause 
cd %stpath%
goto end

:success
@echo off
cls 
call %header%
ECHO Congradulations! Super-Patcher was sucessful
echo ===============================================================================================================================================================
Echo You may now also modify any paramters you'd like using Assistant 2 1.1.2 in debug mode
echo ===============================================================================================================================================================
Echo You have completed the patching operation. Please note most settings and all parameters are now reset
echo.
Echo -Remember to check your RTH altitude and such.
echo ===============================================================================================================================================================
echo.
echo If you have found that this program has been helpful please consider donating on PayPal.
echo.
echo Super-Patcher has always been free to use but the continued development has been financed by users like you. 
echo -The average donation has been about $10-$20 USD
echo.
echo Any amount is greatly appreciated but there is no obligation
echo ===============================================================================================================================================================
echo.
echo [1] Yes take me to the PayPal page!
echo [2] Not now, take me back to the MainMenu
echo [3] Shut down Super-Patcher
choice /c 123 /m "Please make selection with keyboard"
If Errorlevel 3 Goto exitsp
If Errorlevel 2 Goto end
If Errorlevel 1 Goto donate

:donate
rundll32 url.dll,FileProtocolHandler https://www.paypal.me/brett8883
cd %stpath%
goto end

:exitsp
exit

:end
call mainmenu.cmd