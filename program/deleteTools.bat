@echo off
rmdir /Q /S nonemptydir TOOLS
del downloadtools.bat
del *.bin
cls
echo Deleted
timeout 1
call GETwhichAC.bat