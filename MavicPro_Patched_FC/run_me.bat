Echo off
Echo Please turn on the Mavic and after it has started connect to the PC
Pause
cd ProgramFiles
start DUMLdoreV3.exe
Echo Please ensure DUMLdore says you are on firmware v01.04.0300 and that this is stock version 
pause
echo click "Enable ADB" in DUMLdore and then close DUMLdore 
pause
adb shell mount -o remount,rw /vendor
adb shell mkdir /vendor/bin
adb push dummy_verify.sh /vendor/bin/
adb shell cd /vendor/bin/; chown root:root dummy_verify.sh; chmod 755 dummy_verify.sh; cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy; sync; cd /
Echo please restart your aircraft and reconnect to PC before continueing 
pause
start DUMLdoreV3.exe
echo click "Enable ADB" in DUMLdore 
Pause
adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify
echo please load the file "super_patcher_dji_system.bin" into DUMLdore and click "flash firmware" 
Pause 
ECHO Please allow DUMLdore to do its thing and do not disconnect the Mavic untill DUMLdore says it is ok to
pause 
echo once DUMLdore is finished please restart the aircraft and then connect to Assistant 2 and use the simulator to ensure proper working order in the sim before testing outside 
pause 
Echo You may now modify any paramters you'd like using Assistant 2 1.1.2 in debug mode
Pause
Echo You have completed the patching operating. Please note all settings on the Mavic are likely now reset so remember to redo your RTH altitude and such.
Pause 


