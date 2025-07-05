#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`
cd $progdir
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$progdir
devsd=/dev/mmcblk1
echo "=============================================="
echo "============== USB Storage Mode  ============="
echo "=============================================="



if [ -e /dev/mmcblk0p1 ]
then
devsd="/dev/mmcblk0p1"
fi

echo SD dev:$devsd

swapoff -a
echo 0 > /sys/class/android_usb/android0/enable
echo adb,mass_storage > /sys/class/android_usb/android0/functions
echo 1 > /sys/class/android_usb/android0/enable

umount /mnt/SDCARD
echo "/dev/mmcblk0" > /sys/devices/platform/sunxi_usb_udc/gadget/lun0/file


chmod 777 usb_storage
./usb_storage

sync
echo "" > /sys/devices/platform/sunxi_usb_udc/gadget/lun0/file
mount $devsd /mnt/SDCARD
