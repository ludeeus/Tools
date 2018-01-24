#!/bin/bash
#
#Run this comand to install:
# $ wget -O - https://raw.githubusercontent.com/ludeeus/tools/master/fake_hassbian_installer.sh | sudo bash -
#
if [ "$(id -u)" != "0" ]; then
echo "This script must be run with sudo. Use \"sudo ${0} ${*}\"" 1>&2
exit 1
fi

echo "Updating distro..."
apt update
apt upgrade -y
apr dist-upgrade

echo "Installing additional software..."
apt-get install -y git python3 curl python3-venv python3-pip bluetooth libbluetooth-dev rng-tools rpi-update htop tmux avahi-daemon libtool autoconf rfkill
pip3 install --upgrade virtualenv

echo "Adding homeassistant user and install dir..."
addgroup homeassistant
useradd -u 1001 -g homeassistant -rm homeassistant
mkdir /srv/homeassistant
chown homeassistant:homeassistant -R /srv/homeassistant
chown homeassistant:homeassistant -R /home/homeassistant
usermod -G dialout,i2c,gpio,spi -a homeassistant


echo "Downloading and installing hassbian-config..."
curl https://api.github.com/repos/home-assistant/hassbian-scripts/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -qi -
apt install -y ./hassbian*
rm ./hassbian*

echo "Installing Home Assistant..."
hassbian-config install homeassistant

echo "Installation complete..."
