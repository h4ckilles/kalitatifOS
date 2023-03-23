#!/bin/sh

if ! command -v veracrypt > /dev/null; then
	wget 'https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-Debian-11-amd64.deb'
	sudo apt install ./veracrypt*.deb
	rm veracrypt*.deb
fi
