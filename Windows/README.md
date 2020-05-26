# Installation
Download the winKill.bat or monitorConfig.bat, found under the Windows folder.

# Executing the script
Executing the script is done by clicking on MonitorConfig.bat / winKill.bat once downloaded

# Features
We currently have 3 features for MonitorConfig.bat, these are
- "close" = stops qustodio from working | "open" = allows qustodio to work
- "nuke" = stops qustodio from working and then deletes it (Note: This might trigger a warning to parents about your actions and the     service sitting in your system-tray will remain)
- "delay" = Puts the qengine and qupdate services last in the boot sequence
- "help" = Bring up the help menu
- "end" = Close the program
And for WinKill.bat, it just tries to shutdown Qustodio

# Creating a shortcut
Just make a shortcut linking to winKill.bat

# Notes
Unfortunately you need Admin privileges to run the scripts
Tampering with the code could result in it failing ;)
Credits to Matt for his Elevate.cmd script

# Our winpy branch is the experimental branch
The script just uses an alternate method to execute the sam task
