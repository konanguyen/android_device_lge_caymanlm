#!/vendor/bin/sh

if [ "$(getprop ro.vendor.lge.build.target_operator)" == "VZW" ]; then
    echo "using qns_vzw" > /dev/kmsg
    /system/vendor/bin/qns_vzw -d /mnt/vendor/power -l /data/vendor/power -o 2
else
    echo "using qns" > /dev/kmsg
    /system/vendor/bin/qns -d /mnt/vendor/power -l /data/vendor/power -o 2
fi
