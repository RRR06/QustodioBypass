#! /bin/sh
if (( $EUID != 0 )); then
    echo "Please run as sudo/admin."
    exit
fi
if ["$1" = "close"]; then
 sudo launchctl disable system/com.qustodio.engine
 sudo launchctl disable system/com.qustodio.update
 echo "launchtl disabled..."
 sudo launchctl stop system/com.qustodio.engine
 sudo launchctl stop system/com.qustodio.update
 echo "launchctl stopped..."
 echo "Done. Restarting your system..."
elif ["$1" = "open"]; then
 sudo launchctl enable system/com.qustodio.engine
 sudo launchctl enable system/com.qustodio.update
 echo "launchctl enabled..."
 sudo launchctl start system/com.qustodio.engine
 sudo launchctl start system/com.qustodio.update
 echo "launchctl started..."
 echo "Done. Restarting your system..."
fi
sudo shutdown -r now
