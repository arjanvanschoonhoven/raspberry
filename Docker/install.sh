# Run this script with sudo
###### PART 1 #######
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

sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common -y

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

echo "deb [arch=armhf] https://download.docker.com/linux/debian \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update

sudo apt-get install docker-ce -y

# Install git and clone our repository
sudo apt-get -y install git-core

sudo usermod -a -G docker $USER

sudo apt-get install python-pip -y
sudo pip install docker-compose

git clone https://github.com/arjanvanschoonhoven/raspberry.git

# create mount point
sudo mkdir /media/HDD
sudo chmod 777 /media/HDD
sudo chown -R pi:pi /media/HDD

# change fstab file, add usb drive mount point
sudo bash -c 'echo "/dev/sda1 /media/HDD vfat auto,nofail,noatime,users,rw,uid=pi,gid=pi 0 0" >> /etc/fstab'

# disable avahi
sudo systemctl disable avahi-daemon

sudo reboot

#after reboot
cd /home/pi/raspberry/Docker

docker-compose up -d
