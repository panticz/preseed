#!/bin/bash

# download GRUB iPXE boot image
wget http://dl.panticz.de/ipxe/ipxe.lkrn -O /boot/grub/ipxe.lkrn

# create GRUB menu entry
cat <<EOF> /etc/grub.d/49_ipxe 
#!/bin/sh
exec tail -n +3 $0

menuentry "Network boot (iPXE)" {
  linux16 /boot/grub/ipxe.lkrn
}
EOF

# update GRUB config
update-grub
