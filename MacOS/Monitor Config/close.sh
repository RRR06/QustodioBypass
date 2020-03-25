#!/bin/zsh
 ECHO 
 ECHO Disabling Qustodio. A restart must happen, please save anything before executing, any unsaved data will be lost. Admin privileges required
 sudo launchctl disable system/com.qustodio.engine
 sudo launchctl disable system/com.qustodio.update
 ECHO 
 ECHO Restarting
 sudo shutdown -r now 