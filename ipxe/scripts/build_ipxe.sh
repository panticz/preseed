#!/bin/bash
 
# get source
cd /tmp
git clone git://git.ipxe.org/ipxe.git
 
# create boot script
cat <<EOF> /tmp/ipxe/src/boot.ipxe
#!ipxe
 
dhcp && chain http://\${next-server}/\${mac} || chain http://preseed.panticz.de/\${mac}
EOF
 
# OPTIONAL: enable HTTPS support
sed -i -e '/DOWNLOAD_PROTO_HTTPS/ s/#undef/#define/' /tmp/ipxe/src/config/general.h
 
# OPTIONAL: change product name
sed -i 's|PRODUCT_NAME ""|PRODUCT_NAME "preseed.panticz.de"|g' /tmp/ipxe/src/config/general.h
 
cd /tmp/ipxe/src
 
# build CD image (/tmp/ipxe/src/bin/ipxe.iso)
make bin/ipxe.iso EMBED=boot.ipxe
 
# build USB image (/tmp/ipxe/src/bin/ipxe.usb)
make bin/ipxe.usb EMBED=boot.ipxe
 
# build PXE image (/tmp/ipxe/src/bin/ipxe.pxe)
make bin/ipxe.pxe EMBED=boot.ipxe
 
# build GRUB image (/tmp/ipxe/src/bin/ipxe.lkrn)
make bin/ipxe.lkrn EMBED=boot.ipxe
 
# build undionly image (/tmp/ipxe/src/bin/undionly.kpxe)
make bin/undionly.kpxe EMBED=boot.ipxe
