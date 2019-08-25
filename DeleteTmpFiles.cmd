@echo off
echo This will delete all temporary files and logs produced by Super-Patcher.
echo.
echo Are you SURE you want to do that?
echo.
echo   [N] No, don't delete them. Exit this script
echo   [Y] Yes, delete all temp files
echo.
choice /m "Make selection with keyboard"
if errorlevel 2 goto end
if errorlevel 1 goto delete
:delete
echo.
echo DELETING. PLEASE WAIT...
echo.
taskkill /im adb.exe 2>>nul
adb kill-server 2>>nul
rmdir /Q /S nonemptydir Super-Tools-2.0
rmdir /Q /S nonemptydir SP_flight_controllers
rmdir /Q /S nonemptydir logs
rmdir /Q /S nonemptydir stock_firmware
rmdir /Q /S nonemptydir %appdata%\DJI_Super-Patcher
ECHO.
echo TEMP FILES DELETED
PING -n 5 127.0.0.1>nul
:end
exit
