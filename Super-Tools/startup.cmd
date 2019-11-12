@echo off
::set envirnment variables and paths
cls
call %header%
echo Downloading the latest version of DUMLdore, Please Wait...
echo.
cd tools
set "tpath=%cd%"
::download dumldore. Set absolute path to dumldore
echo Downloading the latest version of DUMLdore >>%log%
wget.exe https://github.com/jezzab/DUMLdore/raw/master/DUMLdoreV3.exe --show-progress -nc --no-check-certificate -a %log% && echo DUMLdore downloaded successfully >>%log%
set "dumldore=%cd%\dumldoreV3.exe"
cd %stpath%
call whichac.cmd
