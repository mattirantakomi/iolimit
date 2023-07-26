#!/usr/bin/env bash

CGROUPPATH=$(find /sys/fs/cgroup/kubepods -name "*$POD_UID*")

for DEVICE in $(lsblk -l | grep -v NAME | grep " disk " | awk '{ print $2 }' | uniq); do
    echo $DEVICE rbps=$RBPS riops=$RIOPS wbps=$WBPS wiops=$WIOPS
    echo $DEVICE rbps=$RBPS riops=$RIOPS wbps=$WBPS wiops=$WIOPS > $CGROUPPATH/io.max
done

cat $CGROUPPATH/io.max
