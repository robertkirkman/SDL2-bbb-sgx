THIS REPOSITORY IS OBSOLETE - replaced by https://github.com/robertkirkman/sm64ex-bbb-doc

This is a fork of Simple DirectMedia Layer 2.0 modified to support 
OpenGL ES 2.0 hardware 3D acceleration on the Texas Instruments 
BeagleBone Black via its Imagination Technologies PowerVR SGX530 GPU. 
To use this repository, a BeagleBone Black running Debian with the 
PowerVR SGX kernel space and user space drivers and a specific version 
of the Generic Buffer Management library forked by Texas Instruments 
for use with the PowerVR SGX driver are required. To install these 
dependencies and compile and install this library on a BeagleBone Black, 
read INSTALL.md in this repository: 
https://github.com/robertkirkman/SDL2-bbb-sgx/blob/main/INSTALL.md

Contributions to SDL2-bbb-sgx and credits to upstream developers:
Huge thanks to zmatt on #beagle at irc.libera.chat, to vanfanel the REAL
SDL developer, to Rob Clark, Remi Avignon, Robert Nelson the rcn-ee.com
maintainer, and to all the developers at Texas Instruments and 
Imagination Technologies, without whom this project would not be possible.


---
                         Simple DirectMedia Layer

                                  (SDL)

                                Version 2.0

---
https://www.libsdl.org/

Simple DirectMedia Layer is a cross-platform development library designed
to provide low level access to audio, keyboard, mouse, joystick, and graphics
hardware via OpenGL and Direct3D. It is used by video playback software,
emulators, and popular games including Valve's award winning catalog
and many Humble Bundle games.

More extensive documentation is available in the docs directory, starting
with README.md

Enjoy!
	Sam Lantinga				(slouken@libsdl.org)
