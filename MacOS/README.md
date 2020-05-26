# Installation and Usage
1. Download the "Monitor Config" folder, preferrably keep it in your downloads folder (as that is where the configuration script will search for)
2. Run the configuration script (Found under the configure section)
3. Now you can move the folder with the scripts in to wherever you want. Just remember to run them with terminal

# Configure
When you've downloaded the folder, you have to give the files permissions to be executed. To do this, the script will go to the Monitor Config folder, and change the permissions of the files to be executable. There are 2 methods for this script.
The first method is to run this in Terminal:
```
cd Downloads
cd "Monitor Config"
chmod 700 close.sh
chmod 700 open.sh
```
The second method is to paste this line of code ("chmod 700") into Terminal and then drag the "close.sh" file over the Terminal window. And then paste again the same line of code ("chmod 700") into Terminal but drag the "open.sh file over the Terminal window.


# Executing the script
When running either the "close.sh" or "open.sh" file, make sure to right-click the file and "open with" Terminal. If there's no Terminal option, then select Terminal from the "Other..." window

# Features
Right now we only have methods for starting or stopping Qustodio

# Notes
Admin privileges needed
