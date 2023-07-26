#!/usr/bin/env bash

CGROUPPATH=$(find /sys/fs/cgroup/kubepods -name "*$POD_UID*")

for DEVICE in $(lsblk -l | grep -v NAME | grep " disk " | awk '{ print $2 }' | uniq); do
    echo $DEVICE rbps=$RBPS riops=$RIOPS wbps=$WBPS wiops=$WIOPS > $CGROUPPATH/io.max
done

echo "Configured limits for CGROUPPATH $CGROUPPATH:"
cat $CGROUPPATH/io.max
