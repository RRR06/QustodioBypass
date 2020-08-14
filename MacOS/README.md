# Installation and Usage
1. Download the "Monitor Config" folder, preferably keep it in your downloads folder (as that is where the configuration script will search for)
2. Run the configuration script (Found under the configure section)
3. Now you can move the folder with the scripts in to wherever you want. Just remember to run them with terminal
or
1. Use curl to download the file/Run the below command
```
cd ~/Downloads
mkdir "Monitor Config"
cd "Monitor Config"
curl -O https://raw.githubusercontent.com/RRR06/QustodioBypass/master/MacOS/Monitor%20Config/config.sh
```

# Configure
When you've downloaded the folder, you have to give the config.sh file permissions to be executed. To do this, the below script will navigate to the Monitor Config folder, and change the permissions of config.sh to be executable.
```
cd ~/Downloads/"Monitor Config"
chmod +x config.sh
```

# Executing the script
Change the Directory to where the Monitor Config folder is located at using `cd` and then run the command `sh config.sh close`
after config.sh type either close or open to open or close qustodio

# Features
Right now we only have methods for disabling or enabling the agents

# Notes
Admin privileges needed
