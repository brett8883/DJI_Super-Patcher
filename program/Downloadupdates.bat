@echo off
rmdir /Q /S nonemptydir TOOLS
cls
wget https://github.com/brett8883/Super-Tools/raw/%appver%/downloadtools.bat
pause
cls
call downloadtools.bat
