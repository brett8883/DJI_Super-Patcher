@echo off
cls 
echo Deleting old tools hang on...
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
ECHO deleting old downloadtools.bat
del downloadtools.bat
ECHO deleting old whichAC.bat
del whichAC.bat
echo ALL deleted
cls
call GETwhichAC.bat