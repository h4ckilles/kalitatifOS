#!/bin/sh

me=$(grep ${USER} /etc/passwd)
newme=$(echo $me | sed 's/:[^:]*$/:\/bin\/bash/')
sudo sed -i "s%$me%$newme%g" /etc/passwd
