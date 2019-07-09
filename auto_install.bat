@echo off
cls
SETLOCAL EnableDelayedExpansion
cd program
del startup.bat
wget https://raw.githubusercontent.com/brett8883/Super-Tools/master/startup.bat
call startup.bat 

