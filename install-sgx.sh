#!/bin/bash
if ! [ -f "/etc/sgx-installed" ]
then
    echo 'deb [arch=armhf] http://repos.rcn-ee.com/debian/ stretch main' >> /etc/apt/sources.list
    echo 'APT::Default-Release "buster";' > /etc/apt/apt.conf.d/10default.conf
    apt-get update
    apt-get upgrade -y
    apt-get install -y linux-image-4.14.108-ti-r131 linux-headers-4.14.108-ti-r131 ti-sgx-ti335x-modules-4.14.108-ti-r131 libdrm-dev ti-libgbm2-dev build-essential make cmake autoconf automake libtool libpulse-dev libdbus-1-dev libudev-dev libibus-1.0-dev libxkbcommon-dev python3 
    apt-get install -y -t stretch ti-sgx-ti33x-ddk-um ti-sgx-common-ddk-um
    touch /etc/sgx-installed
    reboot
else
    echo 'install-sgx has already been run! Aborting.'
fi
