#!/bin/bash

# bootstrap2
echo "Configuring remote access (xrdp)"
cat /root/xrdp.ini > /etc/xrdp/xrdp.ini
setcap -r `which i3status`
echo "Starting xrdp"
/etc/xrdp/xrdp.sh start
echo "Remote access (xrdp) enabled (vncserver still needs to be started manually)"

