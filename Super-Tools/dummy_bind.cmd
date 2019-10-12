@echo OFF
cls
call %header%
cd %tpath%
::adb shell cd vendor; ls >tmp.txt
::findstr bin tmp.txt && goto yesVendorbin || goto noVendorbin
::noVendorbin
::set vendorstatus=0
::goto dummy_verify

REM :yesVendorbin
REM set vendorstatus=1
REM echo /vendor/bin exists no need to mkdir
REM echo /vendor/bin exists no need to mkdir >> %log%
REM echo.
REM echo Checking for vendor/bin/dummy_verify.sh please wait...
REM PING -n 3 127.0.0.1>nul
REM goto checkdummy

REM :checkdummy
REM echo.
REM adb shell cd vendor/bin; ls >tmp.txt
REM findstr dummy_verify.sh tmp.txt && goto present || goto noDummy
REM :yesDummy
REM echo /vendor/bin contents >> %log%
REM type tmp.txt >> %log%
REM ECHO. >> %log%
REM echo dummy_verify is already in /vendor/bin skipping to bind step
REM echo dummy_verify is already in /vendor/bin skipping to bind step >> %log%
REM echo. >> %log%
REM PING -n 3 127.0.0.1>nul
REM set bindstatus=1
REM del /f /q tmp.txt
REM goto bind

REM :noDummy
REM echo
REM set bindstatus=0
REM echo vendor/bin/dummy_verify.sh does NOT exist already. Starting create dummy_verify.sh step
REM echo PLEASE WAIT..
REM PING -n 4 127.0.0.1>nul
REM del /f /q tmp.txt
REM goto dummy_verify
:dummy_verify
cls
call %header%
echo. >> %log%
Echo WORKING PLEASE WAIT...
echo.
adb shell mount -o remount,rw /vendor 2>>log1.txt
echo adb shell mount -o remount,rw /vendor
PING -n 2 127.0.0.1>nul
type log1.txt
echo adb shell mount -o remount,rw /vendor >adblog.txt
type log1.txt > adblog.txt
::if "%vendorstatus%"=="1" (goto dummypush) Else (goto makevinbin)
:makevinbin
echo.
echo adb shell mkdir /vendor/bin
adb shell mkdir /vendor/bin 2> log2.txt
PING -n 3 127.0.0.1>nul
type log2.txt
echo adb shell mkdir /vendor/bin >> adblog.txt
type log2.txt >> adblog.txt
:dummypush
::echo SKIPPING MKDIR STEP BECAUSE vendor/bin already exists
::echo SKIPPING MKDIR STEP BECAUSE vendor/bin already exists >>adblog.txt
echo.
echo adb push dummy_verify.sh /vendor/bin/
adb push dummy_verify.sh /vendor/bin/ 2> log3.txt
PING -n 3 127.0.0.1>nul
type log3.txt
echo adb push dummy_verify.sh /vendor/bin/ >>adblog.txt
type log3.txt>> adblog.txt
type adblog.txt >> %log%
PING -n 3 127.0.0.1>nul
if "%vt%"=="1" (goto dummy1) else (goto dummy2)

:dummy1
echo.
set dummytype=1
echo. >> %log%
echo dummy1 engaged based on verify type is %AC% %vt%
echo dummy1 engaged based on AC type is %AC% %VT% >> %log%
echo.
echo adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd /
echo adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / >>%log%
PING -n 3 127.0.0.1>nul
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / 2>> log4.txt
type log4.txt
type log4.txt >> %log%
goto enddummy

:dummy2
echo.
set dummytype=2
echo dummy2 engaged based on AC type is %AC% verify type is %vt%
echo.
echo dummy2 engaged based on AC type is %AC% verify type is %VT% > log4.txt
echo adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /system/bin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd /
echo adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /system/bin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / >> %log%
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /system/bin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd / 2>> log4.txt
PING -n 3 127.0.0.1>nul
type log4.txt
type log4.txt >>%log%
goto enddummy

:enddummy
echo.
echo adb shell mount -o remount,ro /vendor
echo adb shell mount -o remount,ro /vendor >> %log%
adb shell mount -o remount,ro /vendor 2>> log5.txt
PING -n 3 127.0.0.1>nul
type log5.txt
type log5.txt >> %log%
echo dummy_verify step complete >> %log%
echo.
echo STILL WORKING... Just a sec
adb kill-server 2> nul
echo dummy_verify step complete
echo.
PING -n 3 127.0.0.1 >nul
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
echo.
echo Please continue when ready...
echo.
pause
cls
call %header%
Echo Please restart your aircraft
Echo.
echo Allow the aircraft to fully restart then reconnect to the PC
echo.
echo Once fully restarted and connected please continue
echo.
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
:startbind
cls
call %header%
echo Starting bind step... >> %log%
echo Starting bind step...
PING -n 3 127.0.0.1>nul
cls
call %header%
echo click "Enable ADB" in DUMLdore and then close DUMLdore before proceeding
start %dumldore%
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
Pause
:bind
cls
call %header%
ECHO WORKING. PLEASE WAIT...
if "%vt%"=="1" (goto bind1) else (goto bind2)

:bind1
echo.
if "%vt%"=="1" Echo PASSED verify type check
echo.
echo bind1 engaged based on AC type is %AC%, verify type is %vt% >> %log%
echo adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify
echo adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify >> %log%
adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify 2> log6.txt
type log6.txt
type log6.txt >> %log%
goto endbind

:bind2
echo.
echo bind2 engaged based on AC type is %AC%, verify type is %vt%
echo bind2 engaged based on AC type is %AC%, verify type is %vt% >> %log%
adb shell mount -o bind /vendor/bin/dummy_verify.sh /system/bin/dji_verify 2> log6.txt
echo.
adb shell mount -o bind /vendor/bin/dummy_verify.sh /system/bin/dji_verify
type log6.txt
type log6.txt >> %log%
:endbind
del /f /q *.txt
echo.
Echo Still working please wait...
adb kill-server > nul
echo.
echo.
echo Bind step complete please continue when ready
echo.
pause
echo Start flash step >> %log%
cls
call %header%
echo Starting flash step...
PING -n 2 127.0.0.1>nul
cls
call %header%
echo ***DO NOT TURN OFF AIRCRAFT!***
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
echo 1. Please click "Load Firmware" button in DUMLdore
echo.
echo 2. Choose the file %fw2% it is in your SP_Flight_Controllers folder which is at:
echo %FCfolderpath%
echo.
ECHO 3. Then click "Flash Firmware" in DUMLdore
echo.
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO 4. Please allow DUMLdore to flash to the aircraft.
echo   NOTE: Progress bar in DUMLdore is not accurate and may go above 100^% or may seem to hang at 100^% for some time but will complete
echo.
echo   NOTE: Spark ESCs may chirp. This is normal and a good sign.
echo.
echo If successful, %AC% will reboot itself 1 or more times- but will still need to be rebooted after the flashing process manually
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
echo **Do not disconnect the %AC% until DUMLdore says it is ok to!**
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
echo 5. Once DUMLdore is finished and says its ok to reboot the aicraft, please reboot the aircraft manually
Echo.
echo 6. Once aircraft has restarted fully and connected to PC. Please continue
echo.
PING -n 1 127.0.0.1>nul
start %dumldore%
Echo ----------------------------------------------------------------------------------------------------------------------------------------------------------------
pause
echo dummy_bind complete >> %log%
Call jkson.cmd