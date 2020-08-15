if ["$1" = "close"]; then
 ECHO Disabling Qustodio. A restart must happen, please save anything before executing, any unsaved data will be lost.
 ECHO
 ECHO Admin privileges required
 sudo -v
 ECHO Waiting 10 seconds before starting process
 sudo launchctl disable system/com.qustodio.engine
 sudo launchctl disable system/com.qustodio.update
 ECHO
 ECHO Restarting
 sudo shutdown -r now
elif ["$1" = "open"]; then
 ECHO Enabling Qustodio. A restart must happen, please save anything before executing, any unsaved data will be lost.
 ECHO
 ECHO Admin privileges required
 sudo -v
 ECHO Waiting 10 seconds before starting process
 sudo launchctl enable system/com.qustodio.engine
 sudo launchctl enable system/com.qustodio.update
 ECHO
 ECHO Restarting
 sudo shutdown -r now
fi
