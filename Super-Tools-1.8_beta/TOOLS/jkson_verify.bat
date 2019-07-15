@echo off 
cd ProgramFiles
cls
if "%AC%"=="MavicPro" goto askjkson
if "%AC%"=="P4Pv2" goto askjkson

:verify
@echo off
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo To verify Super-Patcher was successful I will open NLD. Please allow it to open
echo Please wait...
timeout 6
start NLDApp.exe
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo Please check the NLD app which will show your flight controller version #
echo(
Echo Please verify NLD app says your flight controller # is %FC% 
Echo(
Echo Does NLD app have say your flight controller number is correct? 
Echo(
Echo [1] Yes 
Echo [2] no 
ECho [3] Open NLD app again
choice /C 123 /D 1 /T 99 /M "correct FC number indicated?"
If Errorlevel 3 Goto verify
If Errorlevel 2 Goto nopatch
If Errorlevel 1 Goto success

:askjkson
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO ECHO SUPER-PATCHER %appver% for %AC%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo You have completed the Super-Patcher process!
Echo *****************************************************************************************************
ECHO Would you like to enable jkson fcc radio mod to enable fixed FCC or fixed Boost? 
echo you can find out more about jkson fcc mod at http://github.com/jkson5/jkson_fcc_mod
Echo [1] Yes 
echo [2] No
choice /C 12 /D 1 /T 99 /M "Enable jkson mod?"
If Errorlevel 2 Goto nofcc
If Errorlevel 1 Goto jkson

:nopatch
@echo off
cls 
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO ECHO SUPER-PATCHER %appver%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo If your Flight Controller # is not %fc% then Super-Patcher was not successful 
ECHO You should read the readme.md on GitHub again and restart Super-Patcher from the begining  
Echo *****************************************************************************************************
Echo Some common reasons for Super-Patcher not being successful:
echo 	-Not starting on a completely stock version of firmware %stock%
echo	-Not following the directions exactly please ONLY do what Super-Patcher says ONLY 
echo		when it says to do it 
ECHO	-When doing the "enable ADB" steps not waiting until ABD has been enabled. 
echo		Usually the front lights will turn on or off to indicate ADB has been enabled 
Echo *****************************************************************************************************
pause 
cd ..
exit 		

:nofcc
@echo off
cls
Goto verify

:success
@echo off
cd ..
cls 
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver%
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO Congradulations! Super-Patcher was sucessfull
ECHO *****************************************************************************************************
ECHO You can optionally Connect to Assistant 2 or DJI Go 4 and use the simulator to ensure 
Echo 		proper working order in the sim before testing outside.  
Echo 	-This is simply good practice any time firmware is updated or modified.
echo(
Echo You may now also modify any paramters you'd like using Assistant 2 1.1.2 in debug mode
echo ******************************************************************************************************
Echo ******************************************************************************************************
Echo You have completed the patching operation. Please note all settings and parameters are now reset
Echo remember to check your RTH altitude and such.
echo(
Echo Aircraft may ask you to recalibrate sensors but if it does not then it is not neccesary to calibrate
echo(
echo Thanks for using Super-Patcher!
pause
cls
Echo Bye!
exit

:jkson
@echo off
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD
echo On loan from JKSON5
Echo *****************************************************************************************************
Echo ***************************************************************************************************** 
IF EXIST check_1860_state.sh DEL /F check_1860_state.sh
echo(
start DUMLdoreV3.exe
echo Please click "Enable ADB in DUMLdore
Echo wait till ADB is enabled, then close DUMLdore
echo( 
echo Once ADB is enabled and DUMLdore is closed please continue
echo(
Pause
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD
echo On loan from JKSON5
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo 1 - Mavic PRO/Platinum (1.04.0300 and lower)
echo 2 - Phantom 4PROv2 (1.00.22.00 and lower)
echo 3 - Other
echo(
choice /C 123 /D 1 /T 99 /M "Please select your Aircraft"
If Errorlevel 3 Goto Sorry
If Errorlevel 2 Goto P4PV2
If Errorlevel 1 Goto MP

:MP
@echo off
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD
echo On loan from JKSON5
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo #!/system/bin/sh > check_1860_state.sh
echo /system/bin/check_1860_state.sh^& >> check_1860_state.sh
echo busybox ping -c 1 -w 1800 192.168.41.2 >> check_1860_state.sh
echo sleep 5 >> check_1860_state.sh
echo(
echo 1 - Auto frequency (Default)
echo 2 - Force frequency to 2.3G (not compatible with DJI Goggles)
echo 3 - Force frequency to 2.5G (not compatible with DJI Goggles)
echo 4 - DELETE this mod from DJI device
echo(
choice /C 1234 /D 1 /T 99 /M "Please select frequency"
If Errorlevel 4 Goto AdbRemove
echo while : >> check_1860_state.sh
echo do >> check_1860_state.sh
If Errorlevel 3 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00014600FFFF92040000 >> check_1860_state.sh
If Errorlevel 3 Goto EndFreq
If Errorlevel 2 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00014600FFFFA2030000 >> check_1860_state.sh
:EndFreq
echo(
echo 1 - Default power
echo 2 - Default^>FCC^>Boost^>Reset loop selector by Remote controller
echo 3 - Fixed FCC
echo 4 - Fixed FCC and Boost
echo(
choice /C 1234 /D 1 /T 99 /M "Please select mod"
If Errorlevel 4 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00024800FFFF0200000000 >> check_1860_state.sh
If Errorlevel 4 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 3c >> check_1860_state.sh
If Errorlevel 4 echo break >> check_1860_state.sh
If Errorlevel 4 Goto EndMod
If Errorlevel 3 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00024800FFFF0200000000 >> check_1860_state.sh
If Errorlevel 3 echo break >> check_1860_state.sh
If Errorlevel 3 Goto EndMod
If Errorlevel 2 echo logcat ^| grep -FEm 1 ', 0, 0, 1, 1, 0, 0, ., ., 0, 0, ., 0, 0, 0, ..' >> check_1860_state.sh
If Errorlevel 2 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00024800FFFF0200000000 >> check_1860_state.sh
If Errorlevel 2 echo sleep 5 >> check_1860_state.sh
If Errorlevel 2 echo logcat ^| grep -FEm 1 ', 0, 0, 1, 1, 0, 0, ., ., 0, 0, ., 0, 0, 0, ..' >> check_1860_state.sh
If Errorlevel 2 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 3c >> check_1860_state.sh
If Errorlevel 2 echo sleep 5 >> check_1860_state.sh
If Errorlevel 2 echo logcat ^| grep -FEm 1 ', 0, 0, 1, 1, 0, 0, ., ., 0, 0, ., 0, 0, 0, ..' >> check_1860_state.sh
If Errorlevel 2 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 >> check_1860_state.sh
If Errorlevel 2 echo sleep 10 >> check_1860_state.sh
If Errorlevel 2 Goto EndMod
If Errorlevel 1 echo break >> check_1860_state.sh
:EndMod
echo done >> check_1860_state.sh
Goto AdbSet

:P4PV2
echo #!/system/bin/sh > check_1860_state.sh
echo /system/bin/check_1860_state.sh^& >> check_1860_state.sh
echo busybox ping -c 1 -w 1800 192.168.41.2 >> check_1860_state.sh
echo sleep 5 >> check_1860_state.sh
echo(
echo 1 - Auto frequency (Default)
echo 2 - Force frequency to 2.3G
echo 3 - Force frequency to 2.5G
echo 4 - DELETE this mod from DJI device
echo(
choice /C 1234 /D 1 /T 99 /M "Please select frequency"
If Errorlevel 4 Goto AdbRemove
If Errorlevel 3 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00014600FFFF92040000 >> check_1860_state.sh
If Errorlevel 3 Goto P4PV2EndFreq
If Errorlevel 2 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00014600FFFFA2030000 >> check_1860_state.sh
:P4PV2EndFreq
echo(
echo 1 - Default power
echo 2 - Fixed FCC
echo 3 - Fixed FCC and Boost
echo(
choice /C 123 /D 1 /T 99 /M "Please select mod"
If Errorlevel 3 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00024800FFFF0200000000 >> check_1860_state.sh
If Errorlevel 3 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 3c >> check_1860_state.sh
If Errorlevel 3 Goto P4PV2EndMod
If Errorlevel 2 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00024800FFFF0200000000 >> check_1860_state.sh

:P4PV2EndMod
Goto AdbSet

:AdbSet
dos2unix.exe check_1860_state.sh
@echo off
adb shell busybox mount -o remount,rw /vendor
adb shell mkdir /vendor/bin
adb shell chmod 755 /vendor/bin
adb push check_1860_state.sh /vendor/bin/check_1860_state.sh
adb shell chmod 755 /vendor/bin/check_1860_state.sh
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD
echo On loan from JKSON5
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo Radio Power and frequency settings sent to aircraft!
timeout 5
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD
echo On loan from JKSON5
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo Restart your aircraft and reconnect to this PC
Echo Once it has fully restarted and connected
echo Please continue  
echo(
Echo *****************************************************************************************************
pause
Goto verify

:AdbRemove
@echo on
adb shell busybox mount -o remount,rw /vendor
adb shell rm /vendor/bin/check_1860_state.sh
@echo off
echo(
echo Jkson Mod has been removed! Please restart your device.
echo(
Goto End

:Sorry
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO SUPER-PATCHER %appver% 
echo By Brett8883
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo Sorry, but jkson mod is only compatible MP1 and P4PV2... 
echo(
echo Lets skip to verifing Super Patcher has worked
timeout 8
Goto verify


:Exit 
exit