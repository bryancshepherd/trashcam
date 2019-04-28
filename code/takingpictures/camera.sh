#!/bin/bash

# Group number
gn=`openssl rand -hex 3`

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
raspistill -t $totaltime -tl $period -o ../../photos/$foldername/$imagename_%04d.jpg -n -bm -ss $shut -ISO $isosetting