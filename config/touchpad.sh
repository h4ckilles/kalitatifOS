#!/bin/sh

# Configuration of the touchpad
sudo apt install -y xinput libinput-tools xserver-xorg-input-libinput 
sudo tee /etc/X11/xorg.conf.d/50-libinput.conf <<EOF > /dev/null
Section "InputClass"
        Identifier "touchpad catchall"
        Driver "libinput"
        MatchIsTouchpad "on"
	Option "Tapping" "on"
	Option "NaturalScrolling" "true"
EndSection
EOF

