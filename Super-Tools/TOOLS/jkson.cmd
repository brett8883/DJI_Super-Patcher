@echo off
SETLOCAL DisableDelayedExpansion
echo Start jkson >> %log%
if "%AC%"=="MavicPro" goto askjkson
if "%AC%"=="P4Pv2" goto askjkson
if "%AC%"=="Spark" goto askjkson
goto startverify
:askjkson
cls
call %header%
ECHO Would you like to enable jkson fcc radio mod to enable fixed FCC or fixed Boost? 
echo you can find out more about jkson fcc mod at http://github.com/jkson5/jkson_fcc_mod
Echo [1] Yes 
echo [2] No
echo [3] I'd like more information on jkson fcc mod 
choice /C 123 /D 1 /T 99 /M "Enable jkson mod?"
If Errorlevel 3 Goto getjksoninfo
If Errorlevel 2 Goto nofcc
If Errorlevel 1 Goto jkson

:nofcc
echo User declined FCC mod >> %log%
cls
Goto startverify

:getjksoninfo
echo User requested info on jkson >> %log%
cls
rundll32 url.dll,FileProtocolHandler https://github.com/jkson5/jkson_fcc_mod
goto askjkson

:jkson
echo User requests jkson fcc mod, starting now >> %log%
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD for %AC%
echo On loan from JKSON5
Echo *****************************************************************************************************
Echo ***************************************************************************************************** 
IF EXIST check_1860_state.sh DEL /F check_1860_state.sh
echo(
start %dumldore%
echo Please click "Enable ADB in DUMLdore
Echo wait till ADB is enabled, then close DUMLdore
echo( 
echo Once ADB is enabled and DUMLdore is closed, please continue
echo(
Pause
If "%AC%"=="MavicPro" Goto mp
If "%AC%"=="P4Pv2" Goto p4pv2
If "%AC%"=="Spark" Goto spark

:MP
cls
echo Starting jkson FCC mod for MavicPro since AC is %AC%
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD for MavicPro
echo On loan from JKSON5
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo #!/system/bin/sh > check_1860_state.sh
echo /system/bin/check_1860_state.sh^& >> check_1860_state.sh
echo busybox ping -c 1 -w 1800 192.168.41.2 >> check_1860_state.sh
echo sleep 5 >> check_1860_state.sh
echo.
echo 1 - **Auto frequency** (Choose this for best results in most cases)
echo 2 -   Force frequency to 2.3G (not compatible with DJI Goggles)
echo 3 -   Force frequency to 2.5G (not compatible with DJI Goggles)
echo.
choice /C 123 /D 1 /T 99 /M "Please select frequency"
echo while : >> check_1860_state.sh
echo do >> check_1860_state.sh
If Errorlevel 3 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00014600FFFF92040000 >> check_1860_state.sh
If Errorlevel 3 Goto EndFreq
If Errorlevel 2 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00014600FFFFA2030000 >> check_1860_state.sh
:EndFreq
echo.
echo 1 - Default power
echo 2 - Default^>FCC^>Boost^>Reset loop selector by Remote controller (note: loops power not frequency)
echo 3 - Fixed FCC
echo 4 - Fixed FCC and Boost
echo.
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
echo Starting jkson FCC mod for P4Pv2 since AC is %AC%
echo #!/system/bin/sh > check_1860_state.sh
echo /system/bin/check_1860_state.sh^& >> check_1860_state.sh
echo busybox ping -c 1 -w 1800 192.168.41.2 >> check_1860_state.sh
echo sleep 5 >> check_1860_state.sh
echo.
echo 1 - **Auto frequency** (Choose this for best results in most cases)
echo 2 -   Force frequency to 2.3G
echo 3 -   Force frequency to 2.5G
echo.
choice /C 123 /D 1 /T 99 /M "Please select frequency"
If Errorlevel 3 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00014600FFFF92040000 >> check_1860_state.sh
If Errorlevel 3 Goto P4PV2EndFreq
If Errorlevel 2 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00014600FFFFA2030000 >> check_1860_state.sh
:P4PV2EndFreq
echo.
echo 1 - Default power
echo 2 - Fixed FCC
echo 3 - Fixed FCC and Boost
echo.
choice /C 123 /D 1 /T 99 /M "Please select mod"
If Errorlevel 3 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00024800FFFF0200000000 >> check_1860_state.sh
If Errorlevel 3 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 3c >> check_1860_state.sh
If Errorlevel 3 Goto P4PV2EndMod
If Errorlevel 2 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00024800FFFF0200000000 >> check_1860_state.sh

:P4PV2EndMod
Goto AdbSet

:spark
echo Starting jkson mod for Spark since AC is %AC%
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO jkson FCC MOD by jkson5 for Spark
echo Optimized for Spark by BorisPlintovic
Echo *****************************************************************************************************
Echo ***************************************************************************************************** 
echo #!/system/bin/sh > check_1860_state.sh
echo /system/bin/check_1860_state.sh^& >> check_1860_state.sh
echo.
echo 1 - Set boost mod for Spark 
echo 2 - DELETE this mod from DJI device
echo.
choice /C 12 /M "Please select"
If Errorlevel 2 Goto AdbRemove
:EndFreqSpark
echo.
echo iw reg set US >> check_1860_state.sh
echo sleep 10 >> check_1860_state.sh
echo iw phy phy0 set txpower limit 3500 >> check_1860_state.sh
Goto EndModSpark

:EndModSpark
Goto AdbSet

:AdbRemove
@echo on
adb shell busybox mount -o remount,rw /vendor
adb shell rm /vendor/bin/check_1860_state.sh
@echo off
echo(
echo Jkson Mod has been removed! Please restart your device.
echo(
Goto End

:AdbSet
echo WORKING PLESE WAIT...
@echo on
dos2unix.exe check_1860_state.sh
adb shell mount -o remount,rw /vendor
adb shell mkdir /vendor/bin
adb shell chmod 755 /vendor/bin
adb push check_1860_state.sh /vendor/bin/check_1860_state.sh
adb shell chmod 755 /vendor/bin/check_1860_state.sh
adb shell mount -o remount,ro /vendor
@echo off
PING -n 4 127.0.0.1>nul
echo.
echo 
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD by jkson5 for %AC%
if "%AC%"=="Spark" echo Optimized for Spark by BorisPlintovic
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo Radio Power and frequency settings sent to aircraft!
echo.
echo PLEASE WAIT...
PING -n 3 127.0.0.1>nul
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD by jkson5 for %AC%
if "%AC%"=="Spark" echo Optimized for Spark by BorisPlintovic
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo Restart your aircraft and reconnect to this PC
echo.
Echo Once it has fully restarted and reconnected to this PC, please continue  
Echo *****************************************************************************************************
echo jkson mod complete >> %log%
pause
:startverify
echo going to _verify >> %log%
SETLOCAL EnableDelayedExpansion
cls
call _verify.cmd