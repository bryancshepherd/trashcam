#!/bin/bash

# Group number
gn=`openssl rand -hex 3`
echo $gn

# Shutter speed
shut=$1
echo $shut

# ISO
isosetting=$2
echo $isosetting

# Total time in milliseconds
totaltime=$3
echo $totaltime

# Periodicity in milliseconds
period=$4
echo $period

# Create path and file names
foldername=shut_${shut}_iso_${isosetting}_gn_${gn}
imagename=$foldername

echo $foldername

mkdir -p ../../photos/$foldername

# Burst mode timelapse 
raspistill -t $totaltime -tl $period -o ../../photos/$foldername/$imagename_%04d.jpg -n -bm -ss $shut -ISO $isosetting