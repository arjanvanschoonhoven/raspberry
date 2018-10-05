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