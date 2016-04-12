#!/bin/bash

DIST=xenial

# install required applications
wget -q http://mirrors.kernel.org/ubuntu/pool/main/s/syslinux/syslinux_6.03+dfsg-11ubuntu1_amd64.deb -P /tmp/
sudo dpkg -i /tmp/syslinux_6.03+dfsg-11ubuntu1_amd64.deb

# create target directory
mkdir /tmp/iso

# download kernel and initrd
wget -q http://archive.ubuntu.com/ubuntu/dists/${DIST}/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/linux -O /tmp/iso/linux
wget -q http://archive.ubuntu.com/ubuntu/dists/${DIST}/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/initrd.gz -O /tmp/iso/initrd.gz

# create preseed configuration (and copy to webserver)
cat <<EOF> /tmp/iso/ssh.seed
d-i anna/choose_modules string network-console
d-i preseed/early_command string anna-install network-console

# password authentification
d-i network-console/password password t00r
d-i network-console/password-again password t00r

# or authentication with pre-shared SSH key
#d-i network-console/password-disabled boolean true
#d-i network-console/authorized_keys_url string http://www.example.com/user/ssh/id_rsa.pub
EOF

# create isolinux configuration
cat <<EOF> /tmp/iso/isolinux.cfg
default linux
timeout 1
label linux
kernel linux
append initrd=initrd.gz url=http://www.example/preseed/ssh.seed auto=true interface=auto locale=en_US.UTF-8 priority=critical biosdevname=0 --
EOF

# copy required files
cp /usr/lib/syslinux/isolinux.bin /tmp/iso

# create iso image
mkisofs -q -V "netinstall" -o /tmp/netinstall.iso -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -r -J /tmp/iso
