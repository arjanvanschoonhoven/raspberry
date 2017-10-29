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

#copy sysctl.conf to enable ipv4 port forwarding
sudo cp ~/raspberry/conf/sysctl.conf /etc/sysctl.conf

#copy iptables.ipv4
sudo cp ~/raspberry/conf/iptables.ipv4.nat /etc/iptables.ipv4.nat

#copy rc.local file
sudo cp ~/raspberry/conf/rc.local /etc/rc.local

# install midnight commander
sudo apt-get install mc -y

# create mount point
sudo mkdir /media/HDD
sudo chmod 777 /media/HDD
sudo chown -R pi:pi /media/HDD

#copy fstab file
sudo cp ~/raspberry/conf/fstab /etc/fstab

# install minidlna
sudo apt-get install minidlna -y

# copy minidlna.conf file
sudo cp ~/raspberry/conf/minidlna.conf /etc/minidlna.conf

# install samba
sudo apt-get install samba samba-common-bin -y

# copy samba config file
sudo cp ~/raspberry/conf/smb.conf /etc/samba/smb.conf

# add user pi for samba
(echo raspberry; echo raspberry) | sudo smbpasswd -s -a pi

# get HTOP
wget https://github.com/wbenny/htop/files/573914/htop_2.0.2-2_armhf.deb.zip

# unzip HTOP
unzip htop_2.0.2-2_armhf.deb.zip

# install HTOP
sudo dpkg -i htop_2.0.2-2_armhf.deb

#restart
#sudo restart

