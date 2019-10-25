@echo off
title Super-Patcher 2.0
cls 
call header.bat
ECHO. 
ECHO  Please choose your Aircraft
ECHO.
ECHO ----------------------------------------------------------------------------------------------------------------------------------------------------------------
ECHO	1) Mavic Pro 1 / Mavic Platinum / Mavic Artic White
ECHO	2) Spark
ECHO	3) Phantom 4 Pro
ECHO	4) Phantom 4 Standard
ECHO	5) Phantom 4 Advanced
ECHO	6) Phantom 4 Pro V2
ECHO	7) Inspire 2
ECHO.
choice /C 1234567 /M "Please select connected device"
If Errorlevel 7 goto I2
If Errorlevel 6 goto P4Pv2
If Errorlevel 5 goto p4a
If Errorlevel 4 goto p4s
If Errorlevel 3 goto p4p
If Errorlevel 2 goto SPK
If Errorlevel 1 goto MP

:MP
set AC=MavicPro
set fcbase=03.02.44.
set stock=01.04.0300
set ofc=03.02.44.07
set vt=1
set stockfw=V01.04.0300_Mavic_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Mavic%%20Pro%%201%%20-%%20Incl%%20Platinum%%20and%%20Alpine/V01.04.0300_Mavic_dji_system.bin
set baseurl=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/MavicPro/Hotpoint_mod_bin/
REM set standard=22
REM set battmod=12
REM set stealth=21
REM set FullyLoaded=11
REM set standard_NMR=44
REM set battmod_NMR=34
REM set stealth_NMR=43
REM set FullyLoaded_NMR=33
REM set standard_NoGal=66
REM set battmod_NoGal=56
REM set stealth_NoGal=65
REM set FullyLoaded_NoGal=55
REM set standard_NoGal_NMR=88
REM set battmod_NoGal_NMR=78
REM set stealth_NoGal_NMR=87
REM set FullyLoaded_NoGal_NMR=77
goto mainmenu

REM template for new mod urls
REM set standard_NoGal=
REM set battmod_NoGal=
REM set stealth_NoGal=
REM set FullyLoaded_NoGal=
REM set standard_NoGal_NMR=
REM set battmod_NoGal_NMR=
REM set stealth_NoGal_NMR=
REM set FullyLoaded_NoGal_NMR=
REM set standard_NMR=
REM set battmod_NMR=
REM set stealth_NMR=
REM set FullyLoaded_NMR=

:SPK
set AC=Spark
set fcbase=03.02.43.
set stock=1.00.0900
set ofc=03.02.43.20
set vt=1
set stockfw=V01.00.0900_Spark_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Spark/V01.00.0900_Spark_dji_system.bin
set baseurl=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/Spark/FC_Bin/2.1/
goto mainmenu

:p4p
set AC=P4P
set fcbase=03.02.44.
set stock=01.05.0600
set ofc=03.02.44.07
set vt=2
set stockfw=V01.05.0600_P4P_dji_system.tar
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%%204%%20Professional/V01.05.0600_P4P_dji_system.tar
set standard=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4P/FC_bin/P4P_SP_2.0_Standard_03.02.44.22_dji_system.bin
set battmod=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4P/FC_bin/P4P_SP_2.0_BattMod_03.02.44.12_dji_system.bin
set stealth=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4P/FC_bin/P4P_SP_2.0_Stealth_03.02.44.21_dji_system.bin
set FullyLoaded=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4P/FC_bin/P4P_SP_2.0_FullyLoaded_03.02.44.11_dji_system.bin
goto mainmenu

:p4a
set AC=P4A
set fcbase=03.02.35.
set stock=01.00.0128
set ofc=03.02.35.05
set vt=2
set stockfw=V01.00.0128_P4A_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%%204%%20Advanced/V01.00.0128_P4A_dji_system.bin
set baseurl=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4A/2.1/fc_bin/
goto mainmenu

:p4s
set AC=P4
set fcbase=03.02.44.
set stock=2.00.0700
set ofc=03.02.44.31
set vt=2
set stockfw=V02.00.0700_P4_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%%204%%20Standard/V02.00.0700_P4_dji_system.bin
set standard=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4S/2.0/FC_bin/P4_SP_2.0_Standard_03.02.44.22_dji_system.bin
set battmod=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4S/2.0/FC_bin/P4_SP_2.0_BattMod_03.02.44.12_dji_system.bin
set stealth=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4S/2.0/FC_bin/P4_SP_2.0_Stealth_03.02.44.21_dji_system.bin
set FullyLoaded=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4S/2.0/FC_bin/P4_SP_2.0_FullyLoaded_03.02.44.11_dji_system.bin
goto mainmenu

:P4Pv2
set AC=P4Pv2
set fcbase=03.03.04.
set stock=01.00.1500
set ofc=03.03.13.05
set vt=1
set stockfw=V01.00.1500_P4PV2_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Phantom%%204%%20Pro%%202.0/V01.00.1500_P4PV2_dji_system.bin
set standard=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4Pv2/2.0/FC_bin/P4PV2_SP_2.0_Standard_03.03.04.22_dji_system.bin
set battmod=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4Pv2/2.0/FC_bin/P4PV2_SP_2.0_BattMod_03.03.04.12_dji_system.bin
set stealth=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4Pv2/2.0/FC_bin/P4PV2_SP_2.0_Stealth_03.03.04.21_dji_system.bin
set FullyLoaded=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/P4Pv2/2.0/FC_bin/P4PV2_SP_2.0_FullyLoaded_03.03.04.11_dji_system.bin
goto mainmenu

:I2
set AC=I2
set fcbase=03.03.
set stock=01.02.0200
set ofc=03.03.09.09
set vt=1
set stockfw=V01.02.0200_I2_dji_system.bin
set stockdl=http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Inspire%%202/V01.02.0200_I2_dji_system.bin
set standard=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/I2/I2_SP_2.0/2.0/FC_bin/I2_SP_2.0_Standard_03.03.22.22_dji_system.bin
set battmod=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/I2/I2_SP_2.0/2.0/FC_bin/I2_SP_2.0_BattMod_03.03.12.12_dji_system.bin
set stealth=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/I2/I2_SP_2.0/2.0/FC_bin/I2_SP_2.0_Stealth_03.03.21.21_dji_system.bin
set FullyLoaded=https://github.com/brett8883/Super-Firmware_Cache/raw/2.0/I2/I2_SP_2.0/2.0/FC_bin/I2_SP_2.0_FullyLoaded_03.03.11.11_dji_system.bin
goto mainmenu

:mainmenu
call MainMenu.cmd

