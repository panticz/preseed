#!/bin/bash

MIRROR=http://archive.ubuntu.com/ubuntu/dists/SUITE/main/installer-ARCH/current/images/netboot/ubuntu-installer/ARCH
TFTPDIR=/var/lib/tftpboot/ubuntu/SUITE/ARCH

download() {
  SUITE=$1
        ARCH=$2
  FILE=$3
  
  echo -n "    - $3"

  MIRROR1=${MIRROR//SUITE/$SUITE}
  MIRROR_TMP=${MIRROR1//ARCH/$ARCH}

  TFTPDIR1=${TFTPDIR//SUITE/$SUITE}
  TFTPDIR_TMP=${TFTPDIR1//ARCH/$ARCH}

  if [ ! -d $TFTPDIR_TMP ]; then
    mkdir -p $TFTPDIR_TMP
  fi
  
  wget --quiet $MIRROR_TMP/$FILE -O $TFTPDIR_TMP/$FILE

  if [ $? == 0 ]; then
    printf "%20s\n" "OK"
  else
    printf "%20s\n" "ERROR"
    echo "$MIRROR_TMP/$FILE"
  fi
}

echo "Update Ubuntu netboot files:"
for SUITE in oneiric precise quantal; do
  echo "+ $SUITE"

  for ARCH in i386 amd64; do
    echo "  + $ARCH"
  
    for FILE in linux initrd.gz; do
      download $SUITE $ARCH $FILE
    done
  done
done
