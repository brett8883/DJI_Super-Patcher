@echo off
cls 
echo Delete old tools hang on...
echo 
ECHO.
ECHO deleting old tools
rmdir /Q /S nonemptydir TOOLS
ECHO.
ECHO. deleting old downloadtools.bat
del downloadtools.bat
ECHO. deleting old whichac
del whichAC.bat
ECHO deleting old bins
del *.bin
ECHO deleting downloadtools
del downloadtools.bat
Echo deleting whichAC
del whichAC.bat
cls
echo deleted
timeout 1
cls
exit