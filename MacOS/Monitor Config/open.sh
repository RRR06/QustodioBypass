#!/bin/zsh
 ECHO 
 ECHO Enabling Qustodio. A restart must happen, please save anything before executing, any unsaved data will be lost. Admin privileges required
 sudo launchctl enable system/com.qustodio.engine
 sudo launchctl enable system/com.qustodio.update
 ECHO 
 ECHO Restarting
 sudo shutdown -r now 