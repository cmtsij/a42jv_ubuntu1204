#!/bin/sh
# Toggle wireless device on Asus A42 laptops
# file: /etc/acpi/asus-wireless-switch.sh

WLANSTATUS=`cat /sys/class/ieee80211/phy*/rfkill*/state`

test -z $WLANSTATUS && exit 1

if [ $WLANSTATUS = 0 ]; then
echo 0 > /sys/devices/platform/asus_laptop/wlan
elif [ $WLANSTATUS = 1 ]; then
echo 1 > /sys/devices/platform/asus_laptop/wlan
fi

### need restart service:
### 	sudo service acpid restart
### 	sudo /etc/init.d/acpi-support restart
