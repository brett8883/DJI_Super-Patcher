@echo off
cls
call %header%
cd %sppath%
rmdir /Q /S SP_Flight_Controllers 2>nul
md SP_Flight_Controllers 2>nul
cd SP_Flight_Controllers
set FCfolderpath=%cd%
set varianturl=%indoor%
set variant=indoor
