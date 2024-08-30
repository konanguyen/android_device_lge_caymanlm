#!/bin/sh

# For QDSS from "android/device/qcom/common/rootdir/etc/init.qcom.debug.sh"
#add permission for block_size, mem_type, mem_size nodes to collect diag over QDSS by ODL
#application by "oem_2902" group
if [ -e  /sys/devices/platform/soc/6048000.tmc/coresight-tmc-etr/block_size ]
then
    chown -h root.oem_2902 /sys/devices/platform/soc/6048000.tmc/coresight-tmc-etr/block_size
    chmod 660 /sys/devices/platform/soc/6048000.tmc/coresight-tmc-etr/block_size
    chown -h root.oem_2902 /sys/devices/platform/soc/6048000.tmc/coresight-tmc-etr/mem_type
    chmod 660 /sys/devices/platform/soc/6048000.tmc/coresight-tmc-etr/mem_type
    chown -h root.oem_2902 /sys/devices/platform/soc/6048000.tmc/coresight-tmc-etr/mem_size
    chmod 660 /sys/devices/platform/soc/6048000.tmc/coresight-tmc-etr/mem_size
else
    chown -h root.oem_2902 /sys/devices/platform/soc/8048000.tmc/coresight-tmc-etr/block_size
    chmod 660 /sys/devices/platform/soc/8048000.tmc/coresight-tmc-etr/block_size
    chown -h root.oem_2902 /sys/devices/platform/soc/8048000.tmc/coresight-tmc-etr/mem_type
    chmod 660 /sys/devices/platform/soc/8048000.tmc/coresight-tmc-etr/mem_type
    chown -h root.oem_2902 /sys/devices/platform/soc/8048000.tmc/coresight-tmc-etr/mem_size
    chmod 660 /sys/devices/platform/soc/8048000.tmc/coresight-tmc-etr/mem_size
fi

# for remove ftrace log in .bin file (KBA-201109154528)
# disable ftrace log
echo "0x1 0" > /sys/bus/coresight/devices/coresight-stm/entities
echo "0x2 0" > /sys/bus/coresight/devices/coresight-stm/entities
echo "0x4 0" > /sys/bus/coresight/devices/coresight-stm/entities

# flush buffer
echo 1 > /sys/bus/coresight/reset_source_sink

# for fusion
echo 1 > /sys/bus/coresight/devices/coresight-tmc-etr/enable_sink
echo 1 > /sys/bus/coresight/devices/coresight-stm/enable_source

