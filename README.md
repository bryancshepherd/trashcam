# trashcam
A computer vision-based project to identify roadside trash (and possibly clogged ditches)

## Basic Use
### Take a set of pictures 
```
cd ~Projects/trashcam/code
./camera.sh 300 800 120000 1000
```

_**camera.sh parameters**_
**First parameter:** Shutter exposure in milliseconds. Longer exposures mean brighter pictures, but with more blur.

**Second parameter:** ISO (sensor sensitivity). Higher values mean brighter pictures, but with more grain. 

**Third parameter:** Total camera time. The total amount of time we want the camera to be active.

**Fourth parameter:** Periodicity of photos. The (approximate) amount of time between photos.

The total camera time divided by the periodity of the photos is the approximate number of images that will be taken. 
This will save pictures to the `./photos` directory

### Show a 200x200px camera preview
```raspistill -t 0 -p 50,50,200,200```
