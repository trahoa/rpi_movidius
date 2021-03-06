#!/bin/sh
# IMPORTANT: Plug Movidius in before running this script

# Uninstall Office + Wolframe
sudo apt-get update
sudo apt-get purge -y wolfram-engine libreoffice* minecraft-pi sonic-pi
sudo apt-get clean
sudo apt-get upgrade -y
sudo apt-get autoremove -y

# Modify to be able to compile
sudo sed -i 's/CONF_SWAPSIZE=100/CONF_SWAPSIZE=2048/g' /etc/dphys-swapfile
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start

# Download NCSDK and copy the new install-opencv.sh
mkdir ~/workspace
cp install-opencv.sh ~/workspace
cd ~/workspace
git clone https://github.com/movidius/ncsdk
git clone https://github.com/movidius/ncappzoo

# Install OpenCV
cd ~/workspace/ncsdk
mv install-opencv.sh install-opencv.sh.bak
mv ../install-opencv.sh .
chmod +x install-opencv.sh

# Install NCSDK
sudo make install

# Clean
sudo apt autoremove -y

# Compile examples
make examples
