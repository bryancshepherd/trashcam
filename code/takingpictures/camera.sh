#!/bin/bash

# Date
dt=`date +"%d-%b-%Y-%H-%M"`

# Unique group id
randid=`openssl rand -hex 2`

# Group number
gn=${dt}_${randid}

# Shutter speed
shut=${1}

# ISO
isosetting=${2}

# Total time in milliseconds
totaltime=${3}

# Periodicity in milliseconds
period=$4

# Create path and file names
foldername=shut_${shut}_iso_${isosetting}_gn_${gn}
imagename=${foldername}

mkdir -p ../../photos/staging/${foldername}

# Write the GPS coordinates to a file
gpspipe -w -o ../../photos/staging/${foldername}/location_data.txt &
echo 'Started location tracking'

# Burst mode timelapse 
raspistill -t ${totaltime} -tl ${period} \
-o ../../photos/staging/${foldername}/${imagename}_%04d.jpg \
-n -bm -ss ${shut} -ISO ${isosetting} -h 600 -w 1024

# After the pictures are done, get a few more GPS data 
# points then kill gpspipe
echo 'Pictures done, waiting to kill location tracking'
sleep 5
kill %1
