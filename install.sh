# Run this script with sudo

# Resize our root partition to maximum size
sudo raspi-config --expand-rootfs
sudo partprobe
sudo resize2fs /dev/mmcblk0p2

# update raspbian
echo "Upgrade Raspbian"
sudo apt-get update && sudo apt-get -y upgrade

#change timezone
echo "Change timezone" 
sudo cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

# Install git and clone our repository
sudo apt-get -y install git-core

# Clone repo
git clone https://github.com/arjanvanschoonhoven/raspberry.git

# Install dnsmasq and hostapd
sudo apt-get -y install dnsmasq hostapd

# copy dhcpcd.conf
sudo cp /home/pi/raspberry/conf/dhcpcd.conf /etc/dhcpcd.conf

# copy interfaces
sudo cp /home/pi/raspberry/conf/interfaces /etc/network/interfaces

# copy hostapd.conf
sudo cp /home/pi/raspberry/conf/hostapd.conf /etc/hostapd/

# copy default hostapd file
sudo cp ~/raspberry/conf/hostapd.default /etc/default/hostapd

# copy default dnsmasq.conf
sudo cp ~/raspberry/conf/dnsmasq.conf /etc/dnsmasq.conf

#restart
sudo restart
