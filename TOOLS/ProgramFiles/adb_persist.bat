@echo off
IF EXIST check_1860_state.sh DEL /F check_1860_state.sh
echo(
echo You can continue if your DJI device connected and ADB enabled
echo(
echo Please read "How to install" http://github.com/jkson5/jkson_fcc_mod
echo(
Pause
echo(
echo 1 - Mavic PRO/Platinum (1.04.0300 and lower)
echo 2 - Phantom 4PROv2 (1.00.22.00 and lower)
echo 3 - Other
echo(
choice /C 123 /D 1 /T 99 /M "Please select connected device"
If Errorlevel 3 Goto Sorry
If Errorlevel 2 Goto P4PV2
If Errorlevel 1 Goto MP
:MP
echo #!/system/bin/sh > check_1860_state.sh
echo /system/bin/check_1860_state.sh^& >> check_1860_state.sh
echo /system/bin/adb_en.sh NonSecurePrivilege >> check_1860_state.sh
echo busybox ping -c 1 -w 1800 192.168.41.2 >> check_1860_state.sh
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
echo /system/bin/adb_en.sh NonSecurePrivilege >> check_1860_state.sh
echo busybox ping -c 1 -w 1800 192.168.41.2 >> check_1860_state.sh
echo(
echo 1 - Auto frequency (Default)
echo 2 - Force frequency to 2.3G
echo 3 - Force frequency to 2.5G
echo 4 - DELETE this mod from DJI device
echo(
choice /C 1234 /D 1 /T 99 /M "Please select frequency"
If Errorlevel 4 Goto AdbRemove
If Errorlevel 2 echo sleep 5 >> check_1860_state.sh
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
If Errorlevel 3 echo break >> check_1860_state.sh
If Errorlevel 3 Goto P4PV2EndMod
If Errorlevel 2 echo dji_mb_ctrl -S test -R local -g 9 -s 9 -c 27 00024800FFFF0200000000 >> check_1860_state.sh

:P4PV2EndMod
Goto AdbSet

:AdbSet
dos2unix.exe check_1860_state.sh
@echo on
adb shell busybox mount -o remount,rw /vendor
adb shell mkdir /vendor/bin
adb shell chmod 755 /vendor/bin
adb push check_1860_state.sh /vendor/bin/check_1860_state.sh
adb shell chmod 755 /vendor/bin/check_1860_state.sh
@echo off
echo(
echo Jkson Mod with selected parameters has been sent! Please restart your device.
echo(
Goto End

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
echo Sorry, but this mod compatible only with listed devices... 
echo(
:End
Pause
