@Echo off
echo **************************************************************************
ECHO PLEASE TAKE CARE TO FOLLOW INSTRUCTIONS EXACTLY 
ECHO GO SLOW AND READ INSTRUCTIONS CAREFULLY BEFORE ACTING 
ECHO DO NOT SKIP STEPS, DO NOT DO EXTRA STEPS
ECHO **************************************************************************
ECHO **************************************************************************
ECHO STARTING PATCH SEQUENCE 
ECHO **************************************************************************
Echo Please turn on the Mavic and after it has fully started, connect to the PC
echo Continue when ready to begin
cd ProgramFiles
Pause
Echo Please ensure DUMLdore says you are on firmware v01.04.0300 
echo and that this is stock version 
echo Then click "Enable ADB" in DUMLdore and wait for ADB to enable 
echo then close DUMLdore 
Echo Continue once ADB has been enabled and DUMLdore is closed
start DUMLdoreV3.exe
pause
adb shell mount -o remount,rw /vendor
adb shell mkdir /vendor/bin
adb push dummy_verify.sh /vendor/bin/
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd /
adb shell mount -o remount,ro /vendor
Echo please restart your aircraft
echo Allow the aircraft to fully restart and reconnect to the PC
echo Once fully restarted and connected please continue
pause
echo click "Enable ADB" in DUMLdore and then close DUMLdore before proceeding
start DUMLdoreV3.exe
Pause
adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify
echo DO NOT TURN OFF AIRCRAFT
echo please load the file
echo "custom_306_super_patcher_MavicPro_MPP_dji_system.bin" into DUMLdore 
start DUMLdoreV3.exe
ECHO then click "flash firmware" in DUMLdore
ECHO Please allow DUMLdore to do its thing and do not disconnect the Mavic untill DUMLdore says it is ok to 
echo once DUMLdore is finished please restart the aircraft
echo Once aircraft has restarted fully and connected to PC 
echo you may continue
pause
Echo You have completed the Super-Patcher process!
Echo To verify Super-Patcher was successful 
Echo I will open the NLD app which will show you the flight controller number 
Echo for your aircraft. If Super-Patcher was successful this will show your 
Echo Flight Controller number as 03.02.44.10
Echo *************************************************************************************
Echo If NLD app shows your Flight Controller # is not 03.02.44.10 
ECHO then Super-Patcher was not successful and you should restart this process from the begining 
Echo Ready to start NLD and check FC number?
pause 
start NLDApp.exe
ECHO Once you have verified Super-Patcher was successful you can optionally 
ECHO aconnect to Assistant 2 and use the simulator to ensure proper working order in the sim before testing outside 
Echo You may now also modify any paramters you'd like using Assistant 2 1.1.2 in debug mode
echo ******************************************************************************************************
Echo You have completed the patching operation. Please note all settings and parameters are likely now reset
Echo remember to check your RTH altitude and such.
Echo The aircraft may ask you to recalibrate sensors but if it does not then it isn't neccesary
Echo Bye 
Pause 

