@echo off
rmdir /Q /S nonemptydir Super-Tools-1.7.6 2>nul
del /f .wget-hsts 2>nul
del /f *.bin 2>nul
del /f *.txt 2>nul
exit