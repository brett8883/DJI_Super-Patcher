Manual Directions to install custom firmware


>Turn on aircraft and connect to your windows computer. 
>Once connected open the dumldore program and verify the current firmware version is 01.04.0300

>Click "enable ADB" 
>Once ADB is enabled close dumldore and open a windows command line by pressing control R. Click open 

>type or copy and paste the following commands (anything is parentheses are instructions not to be part of the commands.) 

cd (drag the "ProgramFiles" folder into the command line window so the path to it is referenced in the command)

adb shell mount -o remount,rw /vendor
adb shell mkdir /vendor/bin

adb push dummy_verify.sh /vendor/bin/
adb shell
cd /vendor/bin/
chown root:root dummy_verify.sh
chmod 755 dummy_verify.sh
cp /sbin/dji_verify /vendor/bin/original_dji_verify_copy
sync
cd /
mount -o remount,ro /vendor


(reboot your aircraft)
(use dumldore to enable ADB again)
(Open a new windows command line with command+R and type or copy and paste the following commands)

adb shell mount -o bind /vendor/bin/dummy_verify.sh /sbin/dji_verify
exit

(this concludes the use of the command line you can close it now. Please DO NOT turn off the aircraft and go to the next steps)


>Now open dumldore again and click "load firmware." You may need to type *.* into the file name line to enable it to see the firmware file.
 
>Navigate to the "FC Patched firmware" folder and choose the "super_patcher_dji_system.bin" file. 

>Click "flash firmware" in dulmdore. 
>Allow Dumldore to do its thing. It should be just a couple of minutes.
>Restart aircraft when Dumldore says to and you should be good. 

>Open Assistant 2 and go to the simulator. Connect your remote to the aircraft like normal and fly around in the simulator. 

>Fly around for a bit in the sim to make sure everything is good to go. 


>Worth doing an IMU and compass calibration before you go flying in real life. 

NOTE: DJI Go 4 and assistant 2 may recognize your firmware version as v00.00.0000 now and thats 100% normal. 


