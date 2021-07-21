#!/bin/bash
if ! [ -f "/etc/sgx-installed" ]
then
    #creating a FrankenDebian
    echo 'deb [arch=armhf] http://repos.rcn-ee.com/debian/ stretch main' > /etc/apt/sources.list.d/rcn-ee-stretch.list
    echo 'APT::Default-Release "buster";' > /etc/apt/apt.conf.d/10buster-default.conf
    #upgrading system packages
    apt-get update
    apt-get upgrade -y
    #installing PowerVR SGX530 graphics driver, required kernel for the user-space and kernel-space binaries to match, and other dependencies for SDL2-bbb-sgx
    apt-get install -y linux-image-4.14.108-ti-r131 linux-headers-4.14.108-ti-r131 ti-sgx-ti335x-modules-4.14.108-ti-r131 libdrm-dev ti-libgbm2-dev build-essential make cmake autoconf automake libtool libasound2-dev libdbus-1-dev libudev-dev libevdev-dev libusb-dev joystick libibus-1.0-dev libxkbcommon-dev python3 
    apt-get install -y -t stretch ti-sgx-ti33x-ddk-um ti-sgx-common-ddk-um
    #BBB supports stereo HDMI audio output, but default BBB ALSA configuration file mixes streams into mono. removing to reset to Debian defaults
    rm -f /etc/asound.conf
    #default BBB udev rules restrict access to USB input devices in certain ways. Adding default user to input group
    usermod -a -G input debian
    #discouraging unnecessary repetition without booting a clean image
    touch /etc/sgx-installed
    reboot
else
    echo 'install-sgx has already been run! Aborting.'
fi
