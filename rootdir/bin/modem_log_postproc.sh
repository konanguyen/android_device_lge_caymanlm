#!/bin/sh

# for fusion
echo 0 > /sys/bus/coresight/devices/coresight-stm/enable_source
echo 0 > /sys/bus/coresight/devices/coresight-tmc-etr/enable_sink

# for remove ftrace log in .bin file (KBA-201109154528)
# enable ftrace log
echo "0x1 1" > /sys/bus/coresight/devices/coresight-stm/entities
echo "0x2 1" > /sys/bus/coresight/devices/coresight-stm/entities
echo "0x4 1" > /sys/bus/coresight/devices/coresight-stm/entities

