# ***DJI Super-Patcher 1.7***

*For unlocking height limits, NFZ limits, Galileo Satellites, fixed fcc and boost + more for DJI Aircraft. 
***************************************************************************************************************************
***1.7 UPDATES***

- Added Phantom 4 Standard support

- Added Phantom 4 Advanced support 

- Fixed some GUI bugs (will no longer ask if you want jkson if its not avilible for your aircraft)

- Fixed an issue where adb.exe would remain running in the backgroud. This has been patched remotely to all copies of v1.7

-------------------------------------------------------------------------------------------------------------------------

Super-Patcher now supports the following aircraft and firmwares:

- Mavic Pro 1.04.0300

- Spark 1.00.0900 

- Phantom 4 Pro 1.05.0600
 
- Phantom 4 standard 2.00.0700
 
- Phantom 4 advanced 1.00.0128

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

**OBJECTIVE SUMMARY**

This package is for installing a custom 306 flight controller for:

- ***Mavic Pro or Mavic Pro Platinum*** running a 100% stock version of the v01.04.0300 firmware.

- ***Spark*** running a 100% stock version of the v01.00.0900 firmware.

- ***Phantom 4 Professional*** running a 100% stock version of the v1.05.0600 firmware.

- ***Phantom 4 advanced*** running a 100% sotock version of the v1.00.0128 firmware.

- ***Phantom 4 Standard*** running a 100% stock version of the v2.00.0700. 



The purpose of this project is to enable even the most technically challenged among us the ability to be liberated from the limitations imposed by DJI and reap the benefits of the other features enabled by the FC_Patcher project https://github.com/o-gs/DJI_FC_Patcher by Matioupi.

Super-Patcher works differently than other methods for unlocking firmware. It is not a mixed firmware mod. Super-Patcher works by modifying the stock flight controller module already installed on your aircraft. This means you retain a cohesive single firmware version on your bird without the complications that occur with mixed firmware mods. This ability to change the actual firmware itself means that new capabilities are unlocked. Super-Patcher has been tested and verified you can trust that it has been proven but you still use at your own risk.

***************************************************************************************************************************
**Please carefully read through the through explanation of the benefits below. Directions to get started will follow**
***************************************************************************************************************************

# ***Features of Super-Patcher***

   **Remove height limitations by default**

- There is nothing additional the user needs to do to enable this feature and it is always enabled.
  
- As soon as the Super-Patcher process is complete the drone will ignore ALL height limitations even if set by the user in DJI Go 4.

  -Even though the user is able to enter a value in for height limit in DJI Go 4, the drone WILL NOT obey this hight limit command.
  
    - **Please fly with caution!**
    
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
    
      - **Please fly with caution!**
      
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

    - **P-GPS** *mode with front sensors OFF*
    
          g_config_mode_normal_cfg_tors_gyro_range

         
    - **Sport Mode**
    
          g_config_mode_sport_cfg_tors_gyro_range

    - **Tripod mode**

          g_config_mode_tripod_cfg_tors_gyro_range

    - **Cinematic Mode**

           CM_tors_range
         
    **These are optional**
    
***************************************************************************************************************************
                                                               
   **Optional ability to enable full time FCC or FCC boost mode with jkson_fcc_mod by jkson5** https://github.com/jkson5/jkson_fcc_mod

- This is now integrated with Super-Patcher. You will be asked if you'd like to enable jkson_fcc_mod. Jkson_fcc_mod is only availible for Mavic Pro, Mavic Pro Platinum, and Mavic Pro Artic White on Super-Patcher at this time. P4PV2 coming soon!

    **This is optional**
***************************************************************************************************************************
***************************************************************************************************************************
      
**PREREQUSITES**

- Mavic Pro or Mavic Pro Platinum has to be STOCK v01.04.0300 fw for all modules

or

- Spark has to be STOCK V01.00.0900 fw for all modules 

or

- Phantom 4 Professional has to be on STOCK v1.05.0600 fw for all modules

or

- Phantom 4 standard has to be on 2.00.0700  fw for all modules

or

- Phantom 4 advanced has to be on 1.00.0128 fw for all modules


  - *This means if your firmware is mixed with the flight controller of another firmware, even though it says you are on the correct firmware, you will need to flash a stock version of the correct firmware for you aircraft listed above TWICE to ensure all modules get flashed.* 
          
    - When in doubt flash the correct stock firmware **TWICE** with DUMLdore 
        
- Get correct stock firmware versions with DankDroneDownloader Tool https://github.com/cs2000/DankDroneDownloader:

- Get DUMLdore from here:

    https://github.com/jezzab/DUMLdore/releases/tag/v3.20
      
- *Super-Patcher only runs on Windows*

***************************************************************************************************************************
***************************************************************************************************************************

**DIRECTIONS**

1. Ensure the prerequisites above are met

2. Download or clone the entire repository
  - Be sure to keep all files in original folders

3. Double click the file called “auto_install.bat”

4. The auto_install.bat will guide you through the process step by step.

  - **Please do what it says when it says to do it**
  
    - Follow all the steps even if you think you don't need to do them... **YOU DO!**
  
    - Don't try to outsmart the process or do anything extra "for good measure"
    
      - these are the main reasons for Super-Patcher not being sucessful

5. You will be prompted to verify flight controller version at the end to confirm Super-Patcher is sucessful 

6. You may optionally use the simulator in Assistant 2 or DJI Go 4 to verify working order before testing outside. 

- If there are issues with flight in the simulator there will be issues with flight in real life.

  - Reflash stock firmware and then redo ENTIRE Super-Patcher process in case of an issue.
  
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

**A. No, Super-Patcher doesn’t do anything with the controller and it makes no difference which controller firmware you are using.**

***************************************************************************************************************************
***************************************************************************************************************************

**Acknowledgments**

While I brought everything together into a single easy to use project and maintain this repo, Super-Patcher is the culmination of work of many various other projects, contributors, and beta testers. 

A special thanks to Henfri and lukasx for taking the plunge to test this with their birds before knowing what would happen and their continued contributions throughout development.

Thanks to D95GAS, frank2006, and Kilrah for consulting during initial conceptual development. 

A special thanks to Matioupi and the OG’s /o-gs/DJI_FC_Patcher https://github.com/o-gs/DJI_FC_Patcher project and all its contributors of which Super-Patcher can be considered as a branch of and very much dependent on. DJI_FC_Patcher is the engine that drives this project. Super-Patcher serves as an easy to use deployment of the DJI_FC_Patcher that anyone can use with almost no technical ability.

A special thanks to jezzab and the jezzab/DUMLdore application https://github.com/jezzab/DUMLdore a full copy of which is included in Super-Patcher and without it Super-Patcher would not be possible. 

Thanks to mefisto for his https://github.com/o-gs/dji-firmware-tools and tutoring me on how to use them. 

Thanks to cs2000 and his DankDroneDownloader https://github.com/cs2000/DankDroneDownloader without which this project would have been much more difficult or impossible. Also thanks to cs2000 for hosting the custom flight controller files and providing continued mentoring. 

Thanks to DigDat0 for helping with the 1.3 upgrades which were influenced by his fcchooser project https://github.com/digdat0/fcchooser and for teaching me various programming techniques. 

Thanks to jkson5 who is the author of the jkson fcc mod which I have barrowed and intregrated into Super-Patcher 1.3 and above 

Thanks to the other OGs who have contributed to the dependencies required for Super-Patche and who have, by making their work open, helped me liberate my drone from the limits imposed on it by DJI and inspired me to help others liberate theirs. 

Thanks to the NoLimitDronez team https://nolimitdronez.com/ for letting me embed their free desktop app into Super-Patcher 

There are many whos names I do not know that contributed to the dependencies required for this project. I apologise for not having all of their names acknowleged but I will update this list as I discover them.
