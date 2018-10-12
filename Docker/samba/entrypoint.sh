#!/bin/sh
echo "Starting smbd daemon ..."
smbd
echo "Starting nmbd daemon ..."
nmbd
echo "Starting starting Avahi daemon ..."
avahi-daemon
tail -f /dev/null & wait