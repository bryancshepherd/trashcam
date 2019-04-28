#!/bin/bash

# Date
dt=`date +"%d-%b-%Y-%H-%M"`

# Unique group id
randid=`openssl rand -hex 2`

# Group number
gn=${dt}_${randid}

# Shutter speed
shut=$1

# ISO
isosetting=$2

# Total time in milliseconds
totaltime=$3

# Periodicity in milliseconds
period=$4

# Create path and file names
foldername=shut_${shut}_iso_${isosetting}_gn_${gn}
imagename=$foldername

mkdir -p ../../photos/$foldername

# Burst mode timelapse 
raspistill -t $totaltime -tl $period -o ../../photos/$foldername/$imagename_%04d.jpg -n -bm -ss $shut -ISO $isosetting -h 600 -w 1024
