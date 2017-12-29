#!/bin/bash

NEWUSER=$1
AUTHORIZEDKEYS=$2

# bootstrap2
echo "Configuring remote access (xrdp)"
cat /root/xrdp.ini > /etc/xrdp/xrdp.ini
setcap -r `which i3status`
echo "Starting xrdp"
/etc/xrdp/xrdp.sh start
echo "Remote access (xrdp) enabled (vncserver still needs to be started manually)"

if [ -f "/home/$NEWUSER/.vnc/xstartup" ]; then
    echo "/home/$NEWUSER/.vnc/xstartup, leaving it alone"
else
    echo "/home/$NEWUSER/.vnc/xstartup not found, it needs to just launch i3. Copying from template..."
    su -c "mkdir ~/.vnc && cat /tmp/xstartup > ~/.vnc/xstartup && chmod a+x ~/.vnc/xstartup" $NEWUSER    
fi
