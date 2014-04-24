#!/bin/bash

# ensure that this script is run as root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# download GRUB iPXE boot image
wget -q http://dl.panticz.de/ipxe/ipxe.lkrn -O /boot/grub/ipxe.lkrn

# create GRUB menu entry
cat <<EOF> /etc/grub.d/49_ipxe 
#!/bin/sh
exec tail -n +3 \$0

menuentry "Network boot (iPXE)" {
  linux16 /boot/grub/ipxe.lkrn
}
EOF

# make executable
sudo chmod a+x /etc/grub.d/49_ipxe

# update GRUB config
update-grub
