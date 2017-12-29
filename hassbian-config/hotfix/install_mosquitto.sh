#!/bin/bash
# Date: 12/29/2017
# This is an HotFix for issues with hassbian-config install mosquitto.
# This fix can be implemented by running this:
# sudo curl -o /opt/hassbian/suites/install_mosquitto.sh https://raw.githubusercontent.com/ludeeus/Tools/master/hassbian-config/hotfix/install_mosquitto.sh && sudo hassbian-config install mosquitto

function mosquitto-show-short-info {
    echo "Mosquitto Installer for Hassbian."
}

function mosquitto-show-long-info {
	echo "Installs the Mosquitto package for setting up a local MQTT server."
}

function mosquitto-show-copyright-info {
    echo "Install script by Ludeeus <https://github.com/ludeeus>"
}

function mosquitto-install-package {
mosquitto-show-short-info
mosquitto-show-copyright-info
echo
echo "This should only be run if there is an issue with the installer in the image."
echo "Cleaning up previous tries of installing."
sudo rm /etc/apt/sources.list.d/mosquitto-stretch.list*
sudo rm -R /etc/mosquitto
sudo apt remove -y mosquitto mosquitto-clients libmosquitto1 libc-ares2 libssl1.0.0

echo
echo
echo "Downloading mosquitto and required dependencies..."
sudo mkdir /tmp/mosquitto_install
cd /tmp/mosquitto_install
sudo wget -q http://ftp.se.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u7_armhf.deb
sudo wget -q http://ftp.se.debian.org/debian/pool/main/c/c-ares/libc-ares2_1.12.0-1+deb9u1_armhf.deb
sudo wget -q http://repo.mosquitto.org/debian/pool/main/m/mosquitto/mosquitto_1.4.14-0mosquitto1~nows1_armhf.deb
sudo wget -q http://repo.mosquitto.org/debian/pool/main/m/mosquitto/libmosquitto1_1.4.14-0mosquitto1~nows1_armhf.deb
sudo wget -q http://repo.mosquitto.org/debian/pool/main/m/mosquitto/mosquitto-clients_1.4.14-0mosquitto1~nows1_armhf.deb

echo "Installing mosquitto and required dependencies..."
sudo dpkg -i *
echo
echo "Cleanup..."
cd
sudo rm -R /tmp/mosquitto_install

echo
echo
echo "Writing default configuration..."
cd /etc/mosquitto
mv mosquitto.conf mosquitto.conf.backup
cp /opt/hassbian/suites/files/mosquitto.conf /etc/mosquitto/mosquitto.conf

echo
echo
echo "Initializing password file"
touch pwfile
chown mosquitto:mosquitto pwfile
chmod 0600 pwfile

echo
echo
echo "Please take a moment to setup your first MQTT user"
echo "If no choice is made a default account will be created (pi/raspberry)"
echo
echo -n "Username: "
read mqtt_username
if [ ! "$mqtt_username" ]; then
  mqtt_username=pi
fi

echo -n "Password: "
read -s mqtt_password
echo
if [ ! "$mqtt_password" ]; then
  mqtt_password=raspberry
fi

echo "Creating password entry for user $mqtt_username..."
mosquitto_passwd -b pwfile "$mqtt_username" "$mqtt_password"

echo "Starting Mosquitto..."
(crontab -l ; echo "@reboot /usr/sbin/mosquitto -d")| crontab -
mosquitto -d

ip_address=$(ifconfig | grep "inet.*broadcast" | grep -v 0.0.0.0 | awk '{print $2}')

echo
echo "Installation done!"
echo
echo "Your MQTT broker is running at $ip_address:1883 or if prefered hassbian.local:1883"
echo
echo "To continue have a look at https://home-assistant.io/docs/mqtt/"
echo "If you have issues with this script, please say something in the #Hassbian channel on Discord."
echo
return 0
}

# Make this script function as it always has if run standalone, rather than issue a warning and do nothing.
[[ $0 == "$BASH_SOURCE" ]] && webterminal-install-package
