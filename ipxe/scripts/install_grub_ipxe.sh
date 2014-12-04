#!/bin/bash

# ensure that this script is run as root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# download GRUB iPXE boot image
wget -q http://dl.panticz.de/ipxe/ipxe.lkrn -O /boot/grub/ipxe.lkrn

# create GRUB menu entry
wget -q http://dl.panticz.de/ipxe/49_ipxe -O /etc/grub.d/49_ipxe 
sudo chmod a+x /etc/grub.d/49_ipxe

# update GRUB config
update-grub
