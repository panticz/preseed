#!/bin/bash

# ensure that this script is run as root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# download GRUB iPXE boot image
wget -q http://dl.panticz.de/ipxe/ipxe.lkrn -O /boot/ipxe.lkrn

# create GRUB menu entry
wget -q https://raw.githubusercontent.com/panticz/preseed/master/ipxe/scripts/grub/49_ipxe -O /etc/grub.d/49_ipxe 
chmod a+x /etc/grub.d/49_ipxe

# update GRUB config
. /etc/os-release
case ${ID} in
  fedora)
    grub2-mkconfig -o /boot/grub2/grub.cfg
  ;;
  debian|ubuntu)
    update-grub
  ;;
  *)
    echo "Distribution not supported. Please upgrade grub configuration manually"
esac
