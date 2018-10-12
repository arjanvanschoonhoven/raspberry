#!/bin/sh
echo "Starting smbd daemon ..."
smbd
echo "Starting nmbd daemon ..."
nmbd
tail -f /dev/null & wait