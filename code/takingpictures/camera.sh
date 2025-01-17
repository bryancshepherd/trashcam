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

# Total time in seconds
let "totaltime=${3} * 1000"

# Periodicity in seconds
let "period=${4} * 1000"

# Create path and file names
foldername=shut_${shut}_iso_${isosetting}_gn_${gn}
imagename=${foldername}

mkdir -p ../../data/staging/photos/${foldername}

# Write the GPS coordinates to a file
echo 'Starting location tracking...'
gpspipe -w -o ../../data/staging/location/location_data_${gn}.txt &
echo 'Started location tracking'

# Burst mode timelapse 
echo 'Taking pictures...'
raspistill -t ${totaltime} -tl ${period} \
-o ../../data/staging/photos/${foldername}/${imagename}_%04d.jpg \
-n -bm -ss ${shut} -ISO ${isosetting} -h 1024 -w 1024

# After the pictures are done, get a few more GPS data 
# points then kill gpspipe
echo 'Pictures done, waiting to kill location tracking'
sleep 5
kill %1
