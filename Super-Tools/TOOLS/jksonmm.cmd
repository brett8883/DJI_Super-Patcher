@echo off
SETLOCAL DisableDelayedExpansion
cls
echo Start jksonMM >> %log%
:askjkson
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD
echo On loan from Jkson5
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO What would you like to do?
echo. 
Echo **[1] Start jkson_fcc_mod so I can ENABLE jkson_fcc_mod to configure radio power settings**
echo.
echo [2] I want to DELETE the jkson_fcc_mod settings I already have (not neccessary to delete and reapply. New settings overwrite old ones
echo [3] I'd like more information on jkson fcc mod
echo [4] Take me back to the MainMenu.
echo.
choice /C 1234 /D 1 /T 99 /M "Enable jkson mod?"
if errorlevel 4 Goto getjksoninfo
If Errorlevel 3 Goto nofcc
If Errorlevel 2 Goto AdbRemove
If Errorlevel 1 Goto jkson

:AdbRemove
echo User has indicated to remove jkson_fcc_mod. Starting removal process... >> %log%
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD
echo On loan from Jkson5
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo REMOVING jkson_fcc_mod settings PLEASE WAIT...
echo.
@echo on
adb shell busybox mount -o remount,rw /vendor
adb shell rm /vendor/bin/check_1860_state.sh
@echo off
echo.
echo Jkson Mod has been removed! Please restart your aircraft.
echo.
echo Once it has fully restarted and connected to this PC, please continue
pause
Goto End

:nofcc
echo User declined FCC mod >> %log%
cls
Goto end

:getjksoninfo
echo User requested info on jkson >> %log%
cls
rundll32 url.dll,FileProtocolHandler https://github.com/jkson5/jkson_fcc_mod
goto askjkson

:jkson
echo User requests jkson fcc mod, starting now >> %log%
If "%AC%"=="MavicPro" Goto mp
If "%AC%"=="P4Pv2" Goto p4pv2
If "%AC%"=="Spark" Goto Spark

:MP
echo start jkson mod for MP ac is %AC%
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
echo start jkson mod for P4Pv2 ac is %AC%
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

:Spark
echo start jkson mod for Spark, AC is %AC%
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO jkson FCC MOD by jkson5
echo Optimized for Spark by BorisPlintovic
Echo *****************************************************************************************************
Echo ***************************************************************************************************** 
echo #!/system/bin/sh > check_1860_state.sh
echo /system/bin/check_1860_state.sh^& >> check_1860_state.sh
echo.
echo 1 - Set the mod 
echo 2 - DELETE this mod from DJI device
echo.
choice /C 12 /M "Please select"
If Errorlevel 2 Goto AdbRemove
echo while : >> check_1860_state.sh
echo do >> check_1860_state.sh
:EndFreqSpark
echo.
echo 1 - Default
echo 2 - Force FCC
echo 3 - Force FCC+TX POWER (Use caution and keep RC cool)
echo.
choice /C 123 /M "Please select"
If Errorlevel 3 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00024800FFFF0200000000 >> check_1860_state.sh
If Errorlevel 3 echo sleep 10 >> check_1860_state.sh
If Errorlevel 3 echo iw phy phy0 set txpower limit 3500 >> check_1860_state.sh
If Errorlevel 3 echo break >> check_1860_state.sh
If Errorlevel 3 Goto EndModSpark
If Errorlevel 2 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00024800FFFF0200000000 >> check_1860_state.sh
If Errorlevel 2 echo break >> check_1860_state.sh
If Errorlevel 2 Goto EndModSpark
If Errorlevel 1 echo break >> check_1860_state.sh
:EndModSpark
echo done >> check_1860_state.sh
Goto AdbSet

:AdbSet
echo WORKING PLESE WAIT...
dos2unix.exe check_1860_state.sh
adb shell mount -o remount,rw /vendor
adb shell mkdir /vendor/bin
adb shell chmod 755 /vendor/bin
adb push check_1860_state.sh /vendor/bin/check_1860_state.sh
adb shell chmod 755 /vendor/bin/check_1860_state.sh
PING -n 6 127.0.0.1>nul
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD
echo On loan from JKSON5
if "%AC%"=="Spark" echo Optimized for Spark by BorisPlintovic
Echo *****************************************************************************************************
Echo *****************************************************************************************************
Echo Radio Power and frequency settings sent to aircraft!
PING -n 3 127.0.0.1>nul
cls
Echo *****************************************************************************************************
Echo *****************************************************************************************************
ECHO JKSON FCC MOD
echo On loan from JKSON5
if "%AC%"=="Spark" echo Optimized for Spark by BorisPlintovic
Echo *****************************************************************************************************
Echo *****************************************************************************************************
echo Restart your aircraft and reconnect to this PC
echo.
Echo Once it has fully restarted and reconnected to this PC, please continue  
Echo *****************************************************************************************************
echo jkson mod complete >> %log%
pause
goto end

:End
SETLOCAL EnableDelayedExpansion
cls
