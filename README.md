# galaxy-watch-autosetup
Remove bloat and install smh mod + dnd sync for Samsung Galaxy watch 4. Only works on linux for now(maybe windows support later)
# Preparation
First, [install adb](https://www.xda-developers.com/install-adb-windows-macos-linux/). Dont connect to the watch, the script will do that automatically.
# Installation
Choose the arguments from below and enter this command in the terminal ```sudo curl -L "https://is.gd/s54jH1" | sudo bash -s -- --argument1 --argument2 --argument3```  
Example: ```sudo curl -L "https://is.gd/s54jH1" | sudo bash -s -- --remove-bloat --replace-shm --install-dndsync```  
#### Argument 1:
To remove Samsung pay, bixby and worldclock use ```--remove-bloat```  
To keep bloat use ```--keep-bloat```
#### Argument 2:
To replace original SHM with [SHM mod](https://forum.xda-developers.com/t/restrictions-removed-samsung-health-monitor-wearos-1-1-1-181-root-age-country-device-restriction-removed-29th-january-2022.4322527/) use ```--replace-shm```  
To install [SHM mod](https://forum.xda-developers.com/t/restrictions-removed-samsung-health-monitor-wearos-1-1-1-181-root-age-country-device-restriction-removed-29th-january-2022.4322527/) and keep original SHM use ```--keep-shm```  
To not modify SHM use ```--skip-shm```
#### Argument 3:
To install [dnd-sync](https://github.com/rhaeus/dnd-sync) use ```--install-dndsync```  
To not install [dnd-sync](https://github.com/rhaeus/dnd-sync) dont use the 3rd argument.
