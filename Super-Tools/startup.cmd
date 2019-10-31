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
cls
call %header%
::Delete old nldapp, download new, and set absoulte path to nldapp as variable
del /f /q nldapp.exe 2>>nul
Echo Downloading the latest NLD app, Please Wait...
Echo Downloading NLD app >> %log%
wget.exe https://nolimitdronez.com/downloads/nldapp.zip --no-check-certificate -nc --show-progress -a %log% && echo NLDapp downloaded successfully >>%log%
::NLDapp downloads as .zip so we have to unzip
7za.exe e nldapp.zip
cd %tpath%
::delete archive folders 
rmdir /Q /S NLDModClient
del /f /q nldapp.zip
set "NLD=%cd%\nldapp.exe"
cd %stpath%
call whichac.cmd
