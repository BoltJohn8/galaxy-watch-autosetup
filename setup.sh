#!/bin/bash
if [ "adb start-server"="-bash: adb: command not found" ]; then
    echo "Please install adb first."
fi
echo "Enter IP address of the watch:"
read watch_IP
watch_IP="$watch_IP:5555"
stop=0
# Connecting to watch
while [ 0 == $stop ]
do
    if [ "adb connect $watch_IP"="already connected to $watch_IP" ]
    then
        echo "Connected to watch"
        stop=1
    else
        adb connect $watch_IP
        echo "Please accept prompt on watch"
        sleep 1
    fi
done

# Bloat removal part
if [ "$1" = "--remove-bloat" ]; then
    echo "Removing Samsung pay, bixby and worldclock"
    adb shell pm uninstall -k --user 0 com.samsung.android.bixby.agent
    adb shell pm uninstall -k --user 0 com.samsung.android.samsungpay.gear
    adb shell pm uninstall -k --user 0 com.samsung.android.bixby.wakeup
    adb shell pm uninstall -k --user 0 com.samsung.android.watch.worldclock
elif [ "$1" = "--keep-bloat" ]; then
    echo "Keeping bloat"
fi

# SHM install part
if [ "$2" = "--replace-shm" ]; then
    echo "Removing stock SHM"
    adb shell pm uninstall -k --user 0 com.samsung.android.shealthmonitor
    curl "https://drive.google.com/file/d/1EgM6DmqceKMhWQuLurQZq75Xvu1GA123/view?usp=sharing" -o shm_mod.apk
    adb install ./shm_mod.apk
    echo "Replaced SHM successfully" 
elif [ "$2" = "--keep-shm" ]; then
        curl "https://drive.google.com/file/d/1EgM6DmqceKMhWQuLurQZq75Xvu1GA123/view?usp=sharing" -o shm_mod.apk
    adb install ./shm_mod.apk
    echo "Installed SHM successfully"
elif [ "$2" = "--skip-shm" ]; then
    echo "Skipping SHM install"
fi

# Installing dnd-sync
if [ "$3" = "--install-dndsync" ]; then
    curl "https://github.com/rhaeus/dnd-sync/releases/download/v1.0/dndsync_mobile.apk" -o dndsync.apk
    adb install ./dndsync.apk
    echo "Dnd-sync v1.0 installed successfully"
elif [ "$3" = "" ]; then
    echo "Skipping dnd-sync install"
fi

echo "Removing install files from local machine"
rm -rf ./shm_mod.apk
rm -rf ./dndsync.apk
echo "Installation complete. DONT FORGET TO TURN OFF ADB ON WATCH!!!"
exit 1
