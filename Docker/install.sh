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

# Install git and clone our repository
sudo apt-get -y install git-core

#Install Docker
sudo curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -a -G docker $USER

sudo apt-get -y install python-pip
sudo pip install docker-compose

git clone https://github.com/arjanvanschoonhoven/raspberry.git

# create mount point
sudo mkdir /media/HDD
sudo chmod 777 /media/HDD
sudo chown -R pi:pi /media/HDD

# change fstab file, add usb drive mount point
sudo bash -c 'echo "/dev/sda1 /media/HDD vfat auto,nofail,noatime,users,rw,uid=pi,gid=pi 0 0" >> /etc/fstab'

sudo reboot

#after reboot
cd /home/pi/raspberry/Docker/Compose

docker-compose up
