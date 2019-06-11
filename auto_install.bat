Echo off
Echo Starting Super Patcher for Mavic Pro and Mavic Pro Platinum!
pause
Echo This is a Flight Controller Patch for DJI Mavic Pro and Pro Plantinum. It will not work on any other drones!
ECHO PLEASE READ CAREFULLY BEFORE PROCEEDING
Pause
Echo This is NOT a mixed firmware modification. 
Echo This will modify the ACTUAL 306 module on Mavics runnig the STOCK 01.04.0300 firmware,
ECHO	therefore,
ECHO	It does not require an internal sd card installed like other modification methods.
ECHO	Percision RTH works normally after this modification(other methods prevent this feature from working properly.)
pause
Echo This modification is to be done ONLY on a Mavic Pro or Mavic Pro Platinum-
Echo that has a STOCK 01.04.0300 firmware installed! 
PAUSE
ECHO If your firmware is a mixed with the flight controller from 01.03.0700-
Echo **DO NOT PROCEED before reflashing a clean stock version of 01.04.0300 using DUMLdore!**
ECHO Flash stock 01.04.0300 twice to be sure the entire firware has installed 
pause
Echo This modification will automatically:
ECHO	[1] Remove height limits from the firmware.
ECHO	[2] Turn off aircraft side nfz restrictions.
ECHO	[3] Enable Gallileo satellite reception.
ECHO 	[4] Extends the parameter range that yaw movement limit can be set later in Assistant 1.1.2 by the user. 
Echo (No change in yaw speed till set by user)  
ECHO *These modifications are not optional and to be undone the user must reflash the original firmware 01.04.0300 firmware.*
ECHO Additional modifications can be enabled by the user using Assistant 2 1.1.2 in debug mode. Some parameter ranges have been expanded.
pause
ECHO **The purpose of this modification is to allow experienced and law abiding citizens to unlock their Mavic Pro without the need to contact DJI to fly their aircraft.
Echo ****Use at your own risk***
Pause
Echo The pilot in command is always resposible for flight safety and following local regulations. 
Echo This removes some of the "idiot-proofing" designed into DJI products so take extra care to know your local laws before each flight**
Echo ***DO NOT PROCEED IF YOU DONT UNDERSTAND***
Pause
cd MavicPro_Patched_FC
Call run_me.bat
