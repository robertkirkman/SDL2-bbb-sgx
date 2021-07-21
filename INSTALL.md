# Compiling and Installing SDL2-bbb-sgx
#### GNU/Linux on the BeagleBone Black WITHOUT cross-compilation:
1. Download the official 2020-04-06 compressed image of Debian 10 for the BeagleBone Black from [beagleboard.org](https://debian.beagleboard.org/images/bone-debian-10.3-iot-armhf-2020-04-06-4gb.img.xz).
2. Follow the directions in the [BeagleBoard Getting Started Guide](https://beagleboard.org/getting-started) to flash the image to the BeagleBone Black and initialize a network connection. 
3. An HDMI monitor and male Micro HDMI to male HDMI cable are required to view SDL demos and applications. Connect these to the BBB.
4. Either connect a USB keyboard or use ssh to log in to the BBB and launch a shell.
5. Obtain an internet connection by connecting over ethernet, sharing your workstation's connection over USB, or installing a wireless network adapter and connecting to a wireless network.
6. Configure your preferred DNS address, changing 1.1.1.1 to your desired address:

`sudo rm -rf /etc/resolv.conf`

`sudo echo 'nameserver 1.1.1.1' | sudo tee /etc/resolv.conf`

`sudo chattr +i /etc/resolv.conf`

8. Set the system time zone:

`timedatectl list-timezones`

`sudo timedatectl set-timezone <Your/Timezone>`

For example:

`sudo timedatectl set-timezone America/Chicago`

9. Sync the system time with 0.debian.pool.ntp.org:

`sudo systemctl daemon-reload && sudo systemctl restart systemd-timesyncd`

10. Clone this repository and enter the directory:

`git clone https://github.com/robertkirkman/SDL2-bbb-sgx.git && cd SDL2-bbb-sgx`

11. **WARNING: The following step will downgrade your system to kernel 4.14, add the default user to the `input` group, and create a [FrankenDebian](https://wiki.debian.org/DontBreakDebian). The graphics driver is unmaintained - if you know a better solution that works, for example if you know how to use [openpvrsgx](https://github.com/openpvrsgx-devgroup/linux_openpvrsgx), please contact me on Discord at magi#5813.**
Install the graphics driver binaries for the IT PowerVR SGX530 from rcn-ee.com, the official beagleboard repository, by running the installation script as root:

`sudo ./install-sgx.sh`

This might take a long time. The system will reboot when it is complete.


12. Launch a shell on the BBB and change directory to the repository again, then create a build directory:

`cd SDL2-bbb-sgx && mkdir build && cd build`

13. Compile and install SDL2 into `/usr/local/`:

`CFLAGS="-O3 -march=armv7-a -marm -mfpu=neon -mtune=cortex-a8" ../configure --enable-video-kmsdrm --disable-video-vulkan --disable-video-opengl --enable-video-opengles --disable-video-opengles1 --enable-video-opengles2 --disable-video-dummy --disable-video-x11 --disable-kmsdrm-shared --enable-alsa --disable-alsa-shared --disable-pulseaudio --disable-diskaudio --disable-dummyaudio --disable-oss; make; sudo make install`

- Note: Attempting to install or use Xorg or Wayland alongside SDL2 in this environment is completely unsupported. Please feel free to tinker, but remember to load a clean image and follow these steps again if you break the installation. In this FrankenDebian, `apt` might allow you to install certain packages that *will* break SDL2-bbb-sgx, so be aware of this when installing other software.

#### GNU/Linux on the BeagleBone Black WITH cross-compilation:
* TODO
