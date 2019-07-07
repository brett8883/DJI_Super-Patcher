@echo off
if %vt%=="1" GOTO mpsk 
else GOTO phantom

:mpsk
@echo off
cls 
echo mpspk indicated
pause
call mpspk_verify.bat

:phantom
@echo off
cls
echo phantom indicated
pause
call Phantom_verify.bat