<a href="https://github.com/brett8883/DJI_Super-Patcher
" target="_blank"><img src="https://github.com/brett8883/DJI_Super-Patcher/blob/photos/readmephotos/super-Patcher.png" 
alt="IMAGE ALT TEXT HERE" width="950" height="180" border="10" /></a>

# ***DJI Super-Patcher 1.7.3***

*For unlocking height limits, NFZ limits, Galileo Satellites, fixed fcc and boost + more for DJI Aircraft. 
***************************************************************************************************************************
***1.7.3 UPDATES***

- Minor fixes
   - Downgraded version of adb hoping for better universal support
   - Fixed visual issue where cmd window would not size large enough to view entire line
   - Fixed issue where Super Tools folder would not delete at runtime

-Added error logging for adb commands. If user indicates super-Patcher wasnt sucessfull the errorlog file will be generated and deposited in the main Super-Patcher folder

-------------------------------------------------------------------------------------------------------------------------

Super-Patcher now supports the following aircraft and firmwares:

- Mavic Pro V01.04.0300

- Spark V01.00.0900 

- Phantom 4 Pro V01.05.0600
 
- Phantom 4 standard V2.00.0700
 
- Phantom 4 advanced V1.00.0128

- Phantom 4 ProV2 V01.00.1500

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

**OBJECTIVE SUMMARY**

This package is for installing a custom flight controller for:

- ***Mavic Pro or Mavic Pro Platinum*** running a 100% stock version of the v01.04.0300 firmware.

- ***Spark*** running a 100% stock version of the v01.00.0900 firmware.

- ***Phantom 4 Professional*** running a 100% stock version of the v1.05.0600 firmware.

- ***Phantom 4 advanced*** running a 100% sotock version of the v1.00.0128 firmware.

- ***Phantom 4 Standard*** running a 100% stock version of the v2.00.0700 firmware. 

- ***Phantom 4 ProV2*** running a 100% stock version of the V01.00.1500 firmware.

The purpose of this project is to enable even the most technically challenged among us the ability to be liberated from the limitations imposed by DJI and reap the benefits of the other features enabled by the FC_Patcher project https://github.com/o-gs/DJI_FC_Patcher by Matioupi.

Super-Patcher works differently than other methods for unlocking firmware. It is not a mixed firmware mod. Super-Patcher works by modifying the stock flight controller module already installed on your aircraft. This means you retain a cohesive single firmware version on your bird without the complications that occur with mixed firmware mods. This ability to change the actual firmware itself means that new capabilities are unlocked. Super-Patcher has been tested and verified you can trust that it has been proven but you still use at your own risk.
***************************************************************************************************************************

**BENEFITS SUMMARY**

*(PLEASE READ THE DETAILED LIST THAT FOLLOWS AS WELL)

- Remove height limitations
- Remove NFZ and GeoZone limits
- Enable Galileo satellite reception
- No motors errors on Mavic Pro Platinum
- Does NOT require an internal SD card be installed
- Precision RTH and Precision Landing will work normally
- Optionally enable slower more cinematic panning (yaw) speed
- Optionally enable full time FCC or boost mode with jkson_fcc_mod by jkson5 built in (Mavic and P4PV2 Only)

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

SEE VIDEO BELOW FOR INFORMATION REGARDING SETTINGS FOR HIGH ALTITUDE FLIGHTS AND HOW TO CONFIGURE THE BATTERY FOR THEN USSING ASSISTANT 2 1.1.2 in Debug mode https://dji.retroroms.info/howto/assistanddebug

<a href="http://www.youtube.com/watch?feature=player_embedded&v=BnNo3lWoXkQ 
" target="_blank"><img src="https://github.com/brett8883/DJI_Super-Patcher/blob/photos/readmephotos/batteryvideo.PNG" 
alt="IMAGE ALT TEXT HERE" width="800" height="300" border="10" /></a>

*(Credits to digdat0 for the video)*


      
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

- For more information on some of the available parameter mods see [howto:parameterhacks](https://dji.retroroms.info/howto/parameterhacks) 
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
                                                               
   **Optionally enable full time FCC or FCC boost mode with jkson_fcc_mod by jkson5**

- You will be asked if you'd like to enable jkson_fcc_mod if your aircraft supports it. Jkson_fcc_mod is only availible for Mavic Pro, Mavic Pro Platinum, Mavic Pro Artic White, and P4Pv2

- Jkson mod also allows you to choose between "Auto frequency" (2.4 GHz), fixed 2.3 GHz, and fixed 2.5 GHz.
	- I highly recommend choosing "Auto-frequency"
		- 2.3 GHz and 2.5 GHz might be better in 1% of cases but it is very rare and even if they do work better they are more likly to cut video feed without warning because they are fixed to a single channel.

- You can learn more about jkson fcc mod by jkson5 at https://github.com/jkson5/jkson_fcc_mod

- I am not the developer of this mod so questions about it are better directed to jkson5 

- It is included in Super-Patcher because it is a widely used mod and it shares dependancies with Super-Patcher so it made sense to include it for convenience 	

    **This is optional**
***************************************************************************************************************************
***************************************************************************************************************************
      
**PREREQUSITES**

- ***Mavic Pro***; ***Mavic Pro Platinum***; or ***Mavic Pro Alpine White*** has to be running STOCK ***V01.04.0300*** fw for all modules

or

- ***Spark*** has to be running STOCK ***V01.00.0900*** fw for all modules 

or

- ***Phantom 4 Professional*** has to be running on STOCK ***V1.05.0600*** fw for all modules

or

- ***Phantom 4 Standard*** has to be running on ***V02.00.0700***  fw for all modules

or

- ***Phantom 4 Advanced*** has to be running on ***V01.00.0128*** fw for all modules

or 

***Phantom 4 ProV2*** running a 100% stock version of the ***V01.00.1500*** firmware for all modules 


  - *This means if your firmware is mixed with the flight controller of another firmware, even though it says you are on the correct firmware, you will need to flash a stock version of the correct firmware for you aircraft listed above TWICE to ensure all modules get flashed.* 
          
    - When in doubt flash the correct stock firmware **TWICE** with DUMLdore 
        
- Get correct stock firmware versions with [DankDroneDownloader Tool](https://github.com/cs2000/DankDroneDownloader) :

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

*Q. There is a parameter called g_config_fw_cfg_max_speed=10 that increased the max flight speed and I was told to increase this to 20 so I can fly faster but when I try to adjust this parameter in Assistant 2 it reverts back to 10 when I reboot the aircraft. How to I change this parameter so I can increase flight speed? 

**A. The parameter** g_config_fw_cfg_max_speed=10 **does not affect flight speed. The parameters that control max flight speed end with** "_cfg_tilt_atti_range" **and** "_cfg_rc_scale"**each mode has a parameter like this that will adjust the max speed in each mode. g_config_fw_cfg_max_speed=10 was misidentified and somepoint in the past as a max flight speed parameter but it is not. I do not know what it does but I know it does not affect max flight speed. On the newer firmwares this parameter is hardcoded but still visable in Assistant 2 1.1.2 so it will seemingly change in Assistant 2 1.1.2 but in reality it will not let you change it. As far as I am concerned nobody knows what this parameters does.**   

*Q. Is it worth trying this in my Mavic 2? Any idea when Mavic 2 will be available? 

**A. Super-Patcher has zero chance of working on the Mavic 2 at this time. We need a decryption key for Mavic 2’s firmware and a way to gain adb access. Both of those things are above my pay grade**

***************************************************************************************************************************
***************************************************************************************************************************

# Donations are very welcome and very much appreciated via [paypal.me/brett8883](https://www.paypal.com/paypalme2/brett8883)

***************************************************************************************************************************
***************************************************************************************************************************
**Acknowledgments**

While I brought everything together into a single easy to use project and maintain this repo, Super-Patcher is the culmination of work of many various other projects, contributors, and beta testers. 

A special thanks to Henfri and lukasx for taking the plunge to test this with their birds before knowing what would happen and their continued contributions throughout development.

Thanks to D95GAS, frank2006, and Kilrah for consulting during initial conceptual development. 

A special thanks to Matioupi and the OG’s [/o-gs/DJI_FC_Patcher](https://github.com/o-gs/DJI_FC_Patcher) project and all its contributors of which Super-Patcher can be considered as a branch of and very much dependent on. DJI_FC_Patcher is the engine that drives this project. Super-Patcher serves as an easy to use deployment of the DJI_FC_Patcher that anyone can use with almost no technical ability.

A special thanks to jezzab and the [jezzab/DUMLdore](https://github.com/jezzab/DUMLdore) application  a full copy of which is included in Super-Patcher and without it Super-Patcher would not be possible. 

Thanks to Mefistotelis for his [dji-firmware-tools](https://github.com/o-gs/dji-firmware-tools) and tutoring me on how to use them. 

Thanks to cs2000 and his [DankDroneDownloader](https://github.com/cs2000/DankDroneDownloader) without which this project would have been much more difficult or impossible. Also thanks to cs2000 for hosting the custom flight controller files and providing continued mentoring. 

Thanks to DigDat0 for helping with the 1.3 upgrades which were influenced by his [fcchooser](https://github.com/digdat0/fcchooser) project and for teaching me various programming techniques. 

Thanks to jkson5 who is the author of the jkson fcc mod which I have barrowed and intregrated into Super-Patcher 1.3 and above 

Thanks to the other OGs who have contributed to the dependencies required for Super-Patche and who have, by making their work open, helped me liberate my drone from the limits imposed on it by DJI and inspired me to help others liberate theirs. 

Thanks to the [NoLimitDronez team](https://nolimitdronez.com/) for letting me embed their free desktop app into Super-Patcher 

There are many whos names I do not know that contributed to the dependencies required for this project. I apologise for not having all of their names acknowleged but I will update this list as I discover them.
