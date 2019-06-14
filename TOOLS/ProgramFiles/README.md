[<img src=https://media.giphy.com/media/nQfQayikD5rX2/giphy.gif>]

Download the releases here: https://github.com/jezzab/DUMLdore/releases

Compatible with:<br>
**Aircraft:** *P4, P4 Pro, Mavic, Spark, I2, Mavic Air*<br>
**Remote Control:** *Mavic*<br>
**Goggles:** *DJI*<br>

Make sure Assistant2 is not running<br>
Plug in USB cable from the aircraft or RC into the PC<br>
Turn on the aircraft/RC and allow it to fully start up<br>
Start DUMLdoreV3.exe<br>

**LOAD:** Will load a firmware file to flash<br>
**FLASH:** Upload the firmware file to the device and begin the upgrade/downgrade.<br>
**PULL UPGRADE LOGS:** Download the last upgrde log in tar/gzip<br>
**UNLOCK DEVICE:** Unlock a device that has been grounded due to not upgrading the firmware by 1 Sept 2017<br>
**ACTIVATE DEVICE:** Offline activate SOME devices (MavicPro, P4, Spark) Reults may vary<br>
**ADB ENABLE:** Instantly enable ADB root shell<br>
**DOWNLOAD FIRMWARE:** Link to DankDroneDownloader<br>

**NOTE**: Make sure you have atleast 50% battery remaining before you begin<br>

Thanks to hostile, the_lord, p0v and many others for the information :)

*-jezzab*


### #DeejayeyeHackingClub information repos aka "The OG's" (Original Gangsters)

http://dji.retroroms.info/ - "Wiki"

https://github.com/fvantienen/dji_rev - This repository contains tools for reverse engineering DJI product firmware images.

https://github.com/Bin4ry/deejayeye-modder - APK "tweaks" for settings & "mods" for additional / altered functionality

https://github.com/hdnes/pyduml - Assistant-less firmware pushes and DUMLHacks referred to as DUMBHerring when used with "fireworks.tar" from RedHerring. DJI silently changes Assistant? great... we will just stop using it.

https://github.com/MAVProxyUser/P0VsRedHerring - RedHerring, aka "July 4th Independence Day exploit", "FTPD directory transversal 0day", etc. (Requires Assistant). We all needed a public root exploit... why not burn some 0day?

https://github.com/MAVProxyUser/dji_system.bin - Current Archive of dji_system.bin files that compose firmware updates referenced by MD5 sum. These can be used to upgrade and downgrade, and root your I2, P4, Mavic, Spark, Goggles, and Mavic RC to your hearts content. (Use with pyduml or DUMLDore)

https://github.com/MAVProxyUser/firm_cache - Extracted contents of dji_system.bin, in the future will be used to mix and match pieces of firmware for custom upgrade files. This repo was previously private... it is now open.

https://github.com/MAVProxyUser/DUMLrub - Ruby port of PyDUML, and firmware cherry picking tool. Allows rolling of custom firmware images.

https://github.com/jezzab/DUMLdore - Even windows users need some love, so DUMLDore was created to help archive, and flash dji_system.bin files on windows platforms.

https://github.com/MAVProxyUser/DJI_ftpd_aes_unscramble - DJI has modified the GPL Busybox ftpd on Mavic, Spark, & Inspire 2 to include AES scrambling of downloaded files... this tool will reverse the scrambling

https://github.com/darksimpson/jdjitools - Java DJI Tools, a collection of various tools/snippets tied in one CLI shell-like application
