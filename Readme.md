Super Patcher For Mavic Pro and Mavic Pro Platinum

This package is for installing a custom patched 306 flight controller for the Mavic Pro or Mavic Pro Platinum 
	on a Mavic running a 100% stock version of the 01.04.0300 firmware. 

This is a Flight Controller Patch for DJI Mavic Pro and Pro Plantinum. It will not work on any other drones!
PLEASE READ CAREFULLY BEFORE PROCEEDING

This is NOT a mixed firmware modification.This will modify the ACTUAL 306 module on Mavics runnig the STOCK 01.04.0300 firmware,
therefore, it does not require an internal sd card installed like other modification methods.
Percision RTH works normally after this modification(other methods prevent this feature from working properly.)

This modification is to be done ONLY on a Mavic Pro or Mavic Pro Platinum-
that has a STOCK 01.04.0300 firmware installed! 

If your firmware is a mixed with the flight controller from 01.03.0700 **DO NOT PROCEED before reflashing a clean stock version of 01.04.0300 using DUMLdore!** Flash stock 01.04.0300 twice to be sure the entire firware has installed 

This modification will automatically:
	[1] Remove height limits from the firmware.
	[2] Turn off aircraft side nfz restrictions.
	[3] Enable Gallileo satellite reception.
	[4] Significantly reduced yaw movement limit (yaw speed) in Cinematic Mode(can be undone in DJI Go 4 or Assistant 1.1.2)
 	[5] Extends the parameter range that yaw movement limit can be set for normal mode, avoid mode, sport mode, cinematic mode, and tripod mode, in Assistant 1.1.2 by the user.

*These modifications are automatic but can be undone by reflashing the original stock firmware 01.04.0300 firmware.*
Additional modifications can be enabled by the user using Assistant 2 1.1.2 in debug mode. Some parameter ranges have been expanded.

**The purpose of this modification is to allow experienced and law abiding citizens to unlock their Mavic Pro without the need to contact DJI to fly their aircraft.
 ****Use at your own risk***

The pilot in command is always resposible for flight safety and following local regulations. 
This removes some of the "idiot-proofing" designed into DJI products so take extra care to know your local laws before each flight**

***DO NOT PROCEED IF YOU DONT UNDERSTAND***

Download or clone complete repository and keep all files in original folders. 

Double click the "auto-install.bat" to continue. 


Acknowledgments 
A special thanks to Henfri and lukasx for taking the plunge to test this with their birds before knowing what would happen and their continued contributions throughout development. 

Also thanks to D95GAS, frank2006, and Kilrah for consulting.  

This project is made possible by the work done by many contributers and dependencies. 
This project contains alomost no new programming and serves as an easy to use deployment of the /o-gs/DJI_FC_Patcher project https://github.com/o-gs/DJI_FC_Patcher that anyone can use with almost no technical ability. 

Both this project and the DJI_FC_Patcher project rely on the hard work of jezzab and the DUMLdore application https://github.com/jezzab/DUMLdore

