#!/bin/bash
if ! [ -f "/etc/sgx-installed" ]
then
    #upgrading system packages
    apt-get update
    apt-get upgrade -y
    #FIXME: dist-upgrade to bullseye due to libc6 dependency in precompiled libgbm distributed with proprietary graphics binaries
    #installing PowerVR SGX530 graphics driver, required kernel for the user-space and kernel-space binaries to match, and other dependencies for SDL2-bbb-sgx
    apt-get install -y libwayland-client0 libwayland-server0 ti-sgx-ti335x-modules-4.19.94-ti-r42 linux-headers-4.19.94-ti-r42 libdrm-dev cmake libasound2-dev libudev-dev libevdev-dev libusb-dev joystick libxkbcommon-dev python3
    #clone and checkout ti repository for PowerVR userspace libraries 1.17.4948957
    git clone https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git
    cd omap5-sgx-ddk-um-linux/
    git checkout origin/1.17.4948957-next
    #copy proprietary userspace binaries into /usr/lib using Makefile
    export TARGET_PRODUCT=ti335x
    make install
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
