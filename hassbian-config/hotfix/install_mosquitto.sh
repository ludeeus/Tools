#!/bin/bash
# Date: 12/29/2017 -- Issue resolved 01/14/18
# This is an HotFix for issues with hassbian-config install mosquitto.
# This fix can be implemented by running this:
# sudo curl -o /opt/hassbian/suites/install_mosquitto.sh https://raw.githubusercontent.com/ludeeus/Tools/master/hassbian-config/hotfix/install_mosquitto.sh && sudo hassbian-config install mosquitto

#!/bin/bash

function mosquitto-show-short-info {
    echo "Mosquitto Installer for Hassbian"
}

function mosquitto-show-long-info {
	echo "Installs the Mosquitto package for setting up a local MQTT server"
}

function mosquitto-show-copyright-info {
    echo "Copyright(c) 2016 Dale Higgs <https://github.com/dale3h>"
    echo "Modified by Landrash for use with Hassbian."
}

function mosquitto-install-package {
mosquitto-show-short-info
mosquitto-show-copyright-info

echo ""
echo -e "\e[31mThis workaround is no longer needed..."
echo -e "\e[31mThis issue was resolved in the main repo 01/14/18..."
echo -e "\e[31mRedirecting this installer to use the one in hassbian-config..."
echo -e "\e[0m"
read -p "Press [Enter] key to confirm..."
hassbian-config install mosquitto --force
}

[[ $_ == $0 ]] && echo "hassbian-config helper script; do not run directly, use hassbian-config install instead"
