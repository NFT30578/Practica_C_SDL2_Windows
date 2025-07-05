#!/bin/sh

KERNEL=$1
echo "hotplug action=${ACTION}, kernel=${KERNEL}" >> /tmp/.hotplug_log

# remove
if [ "${ACTION}" == "remove" ]; then
    MOUNTPOINT="$(grep -w "^/dev/${KERNEL}" /proc/mounts | awk '{print $2}')"
    [ -n "${MOUNTPOINT}" ] \
        && /bin/umount -l ${MOUNTPOINT} 2>/dev/null 1>/dev/null
    exit 0
fi

# add
if [ "${ACTION}" == "add" ]; then
    case ${KERNEL} in
        mmcblk[0-9])
            [ -d "/sys/block/${KERNEL}/${KERNEL}p1" ] && exit 0
            MOUNTPOINT=/mnt/SDCARD
            ;;
        mmcblk[0-9]p[0-9])
            MOUNTPOINT=/mnt/SDCARD
            ;;
        sd[a-z])
            [ -d "/sys/block/${KERNEL}/${KERNEL}1" ] && exit 0
            MOUNTPOINT=/mnt/exUDISK
            ;;
        sd[a-z][0-9])
            MOUNTPOINT=/mnt/exUDISK
            ;;
        *)
            exit 0
            ;;
    esac
    for fstype in vfat exfat ext4
    do
        [ "${fstype}" = "ext4" -a -x "/usr/sbin/e2fsck" ] \
            && e2fsck -p /dev/${KERNEL} >/dev/null
        /bin/mount -t ${fstype} -o utf8 /dev/${KERNEL} ${MOUNTPOINT} && exit 0
    done
    [ ! -b "/dev/${KERNEL}" -a -f "/sys/block/${KERNEL%p*}/${KERNEL}/uevent" ] \
        && echo add > /sys/block/${KERNEL%p*}/${KERNEL}/uevent
fi

exit 0
