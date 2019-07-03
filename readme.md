# ***DJI Super-Patcher***

*For unlocking height limits, NFZ limits, Galileo Satellites and more for the Mavic Pro/Mavic Pro Platinum/Mavic Pro Alpine White*
***************************************************************************************************************************

**OBJECTIVE SUMMARY**

This package is for installing a custom patched 306 flight controller for the Mavic Pro or Mavic Pro Platinum on a Mavic running a 100% stock version of the 01.04.0300 firmware.

The purpose of this project is to enable even the most technically challenged among us the ability to be liberated from the limitations imposed by DJI and reap the benefits of the other features enabled by the FC_Patcher project https://github.com/o-gs/DJI_FC_Patcher by Matioupi.

Super-Patcher works differently than other methods for unlocking firmware. It is not a mixed firmware mod. Super-Patcher works by modifying the stock flight controller module of the v01.04.0300 firmware that is already installed on your Mavic. This means you retain a cohesive single firmware version on your bird without the complications that occur with mixed firmware mods. This ability to change the actual firmware itself means that new capabilities are unlocked. Super-Patcher has been tested and verified you can trust that it has been proven but you still use at your own risk.

***************************************************************************************************************************
**Please carefully read through the through explanation of the benefits below. Directions to get started will follow**
***************************************************************************************************************************

# ***Features of Super-Patcher***

   **Remove height limitations by default**

- There is nothing additional the user needs to do to enable this feature and it is always enabled.
  
- As soon as the Super-Patcher process is complete the drone will ignore ALL height limitations even if set by the user in DJI Go 4.

  -Even though the user is able to enter a value in for height limit in DJI Go 4, the drone WILL NOT obey this hight limit command.
  
      - **Please fly with caution**
    
- *This is not optional and is hard-coded into the firmware. There will be no height limit parameters visable in Assistant 2*
    
- To enable height limits again would require uninstalling Super-Patcher which can be done simply by flashing to a stock firmware version

- Please note that the height limit parameters in Assistant 2 1.1.2 in debug mode will NOT be visable beacuse they are hard-coded to the firmware. These parameters have been modified to disable height limit altogether even though they are not visable.  

     **It is always the responsibility of the pilot to fly safely and to know local regulations. **
      
***************************************************************************************************************************

   **Remove NFZ and GeoZone limits by default**

  There is nothing additional the user needs to do to enable this feature and it is always enabled.

- As soon as the Super-Patcher process is complete the drone will ignore all forced GeoZone and NFZ limitations

- **This is not an optional and is hard coded into the firmware.** 

- Please note:

- GeoZones will still be marked in the app and the app will still warn you when the drone is close to or in an NFZ, 
          
  however…
          
    - Your drone will not be prevented from flying 
          
    - Your drone will not be forced to auto-land.
          
    - You drone will not be preventing from taking off
    
- The airport limit parameters are hard-coded and will not be visable in Assistant 2. Airport limits have already been disabled. These parameters have been modified to disable airport limits altogether even though they are not visable. 

    **It is always the responsibility of the pilot to fly safely and to know local regulations.**
***************************************************************************************************************************
   -*For more highly detailed information about hard-coded parameters and other parameters please see the readme.md located in the FirmwareInfo folder or at https://github.com/brett8883/DJI_Super-Patcher/tree/master/FirmwareInfo*
***************************************************************************************************************************

   **Enable Galileo satellite reception by default**

- The drone will now connect to Galileo GPS satellites in addition to the satellites already available.This means you can expect to see a greater satellite count in the app and a stronger, more reliable, and more accurate GPS signal.
      
- There is nothing additional the user needs to do to enable it and it is always enabled.

- Typically you can expect to see your sat count at between 20-30 sats once they have all connected

***************************************************************************************************************************

   **Does NOT require an internal SD card be installed**

- With older methods for unlocking, namely mixed firmware mods, the Mavic Pro Platinum and some more recently manufactured Mavic Pros required that the Mavic be opened and an internal SD card installed for other mods to work. 
      
  - **NOT** with Super-Patcher. Super-Patcher does NOT require an internal SD card because it is **NOT** a mixed firmware mod.
***************************************************************************************************************************
      
   **No motors errors on Mavic Pro Platinum**

- With older modification techniques, namely mixed firmware mods, the Mavic Pro Platinum will give motor errors due to not having the correct ESC modules for the upgraded MPP ESCs
      
- Because Super-Patcher modifies the flight controller on v01.04.0300 firmware which has the correct ESC modules for Mavic Pro AND Mavic Pro Platinum there will be no motor errors and ESCs will work as designed

***************************************************************************************************************************

   **Precision RTH and Precision Landing are not affected and will work normally**

- With older methods for removing height limits and NFZ limits, namely mixed firmware mods, the precision RTH and precision landing features did not function as expected.
      
- Because Super-Patcher is not a mixed firmware mod it does **NOT** affect these functions and so they will work as expected.

***************************************************************************************************************************

**OPTIONAL FEATURES**

   **Optionally customize parameters with Assistant 2 1.1.2 in debug mode**

- Just like any other firmware you can use Assistant 2 1.1.2 in debug modeto turn up the max speed parameters, enable ATTI mode, or virtually endless parameter modifications

- For more information on some of the available parameter mods see howto:parameterhacks [dji.retroroms.info]
These are optional

***************************************************************************************************************************

   **Optionally enable slower more cinematic panning motions for more cinematic video.**

- Enables setting yaw speed to as low as 1 degree per second in any mode using Assistant 2 1.1.2 in debug modeor directly in DJI Go 4 for P-GPS mode to get much smoother and slower cinematic pans.
     
  - By default yaw speeds are factory default
     
- Each flight mode has its own yaw speed parameter that can be changed in Assistant 2 1.1.2 in debug mode. The value these parameters is in degrees per second
     
     ***The parameters for yaw speed for each mode are:***
              
    - **P-GPS** *mode with front OA sensors ON*
    
          g_config_avoid_cfg_avoid_tors_rate_range

         - *Stock is 70. My personal preference is 27*

    - **P-GPS** *mode with front sensors OFF*
    
          g_config_mode_normal_cfg_tors_gyro_range

         - *Stock is 100. My personal preference is 25*
         
    - **Sport Mode**
    
          g_config_mode_sport_cfg_tors_gyro_range

         - *Stock is 200. My personal preference is 30*

    - **Tripod mode**

          g_config_mode_tripod_cfg_tors_gyro_range

         - *Stock is 30. My personal preference is 3*
         
    - **Cinematic Mode**

           CM_tors_range
           
         - *Stock is 50. My personal preference is 3*
         
    **These are optional**
    
***************************************************************************************************************************
                                                               
   **Optional ability to enable full time FCC or FCC boost mode with jkson_fcc_mod by jkson5** https://github.com/jkson5/jkson_fcc_mod

- *This is not actually part of Super-Patcher and I did not make this mod but it is frequently asked if this mod can be done on top of Super-Patcher so I have decided to include the information here that **YES** jkson_fcc_mod can be done after Super-Patcher is complete.*
      
- *If your bird already has jkson_fcc_mod installed it will NOT interfere with Super-Patcher but you will need to reinstall jkson_fcc_mod after the Super-Patcher process is complete.*

    **This is optional**
***************************************************************************************************************************
***************************************************************************************************************************
      
**PREREQUSITES**

- Firmware on bird has to be STOCK v01.04.0300 for all modules

- *This means if your firmware is mixed with the 01.03.0700 flight controller, even though it says you are on 01.04.0300 you will need to flash a stock version of v01.04.0300 TWICE to ensure all modules get flashed.* 
          
    - When in doubt flash v01.04.0300 **TWICE** with DUMLdore 
        
- Get stock v01.04.0300 from here:

  http://dji.polybotes.feralhosting.com/DJI-Firmware/BIN/Mavic%20Pro%201%20-%20Incl%20Platinum%20and%20Alpine/V01.04.0300_Mavic_dji_system.bin  

    - or with DankDroneDownloader Tool https://github.com/cs2000/DankDroneDownloader

- Get DUMLdore from here:

    https://github.com/jezzab/DUMLdore/releases/tag/v3.20
      
- *Super-Patcher only runs on Windows*

***************************************************************************************************************************
***************************************************************************************************************************

**DIRECTIONS**

1. Ensure the prerequisites above are met

2. Download or clone the entire repository form GitHub brett8883/DJI_Super-Patcher
  - Be sure to keep all files in original folders

3. Double click the file called “auto_install.bat”

4. The auto_install.bat will guide you through the process step by step.

  - **Please do what it says when it says to do it**
  
    - Follow all the steps even if you think you don't need to do them... **YOU DO!**
  
    - Don't try to outsmart the process or do anything extra "for good measure"
    
      - these are the main reasons for Super-Patcher not being sucessful

5. You will be prompted to verify flight controller version at the end to ensure Super-Patcher is sucessful 

6. You may optionally use the simulator in Assistant 2 or DJI Go 4 to verify working order before testing outside. 

- If there are issues with flight in the simulator there will be issues with flight in real life.

  - Reflash stock 01.04.0300 and then redo ENTIRE Super-Patcher process in case of an issue.
  
    - *Please Note: To date there has never been an issue with flight after instaling Super-Patcher. This reccomendation is only a matter of good practice whenever modifying or flashing firmware*

Done!

  - Process takes maybe 5 minutes
    
***************************************************************************************************************************    
**DO NOT PROCEED IF YOU DONT UNDERSTAND**
***************************************************************************************************************************
***************************************************************************************************************************

**FAQ**

*Q. Do I need a specific version of the DJI Go 4 app to get the benefits of this mod?*

**A. No, Super-Patcher is not dependent on an app so you can use any one you’d like.**

*Q. Do I need to do anything with the controller? Like upgrade/downgrade the controller?*

**A. No, Super-Patcher doesn’t do anything with the controller and it makes no difference which controller firmware you are using. They are all the same.**

***************************************************************************************************************************
***************************************************************************************************************************

**Acknowledgments**

A special thanks to Henfri and lukasx for taking the plunge to test this with their birds before knowing what would happen and their continued contributions throughout development.

Also thanks to D95GAS, frank2006, and Kilrah for consulting.

This project is made possible by the work done by many contributers and dependencies. 

This project contains alomost no new programming and serves as an easy to use deployment of the /o-gs/DJI_FC_Patcher project https://github.com/o-gs/DJI_FC_Patcher by Matioupi that anyone can use with almost no technical ability.

This project relies on the hard work of jezzab and the jezzab/DUMLdore application https://github.com/jezzab/DUMLdore

Thanks to the OGs who, by making their work open and open source, not only powers this poject but have enabled me to liberate myself from the limits imposed on my property by DJI and inspired me to help others liberate themselves.

Thanks to DigDat0 for giving me an idea to clean up the interface.

Thanks to the NoLimitDronez team https://nolimitdronez.com/ for letting me embed their free desktop app into Super-Patcher 

There are many whos names I do not know that contributed to the dependencies required for this project. I apologise for not having all of their names acknowleged but I will update this list as I discover them.
