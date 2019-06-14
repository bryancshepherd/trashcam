# trashcam
A computer vision-based project to identify roadside trash (and possibly clogged ditches)

## Basic Use
### Take a set of pictures 
```
cd ~Projects/trashcam/code
./camera.sh 300 800 120000 1000
```

**camera.sh parameters**:

**First parameter:** Shutter exposure in milliseconds. Longer exposures mean brighter pictures, but with more blur.

**Second parameter:** ISO (sensor sensitivity). Higher values mean brighter pictures, but with more grain. 

**Third parameter:** Total camera time. The total amount of time we want the camera to be active.

**Fourth parameter:** Periodicity of photos. The (approximate) amount of time between photos.

The total camera time divided by the periodity of the photos is the approximate number of images that will be taken. 
This will save pictures to the `./photos` directory

### Show a 200x200px camera preview
```raspistill -t 0 -p 50,50,200,200```

### Resources

**Manually geotagging pictures:**

https://www.raspberrypi.org/forums/viewtopic.php?t=196512

**Possible hardware sources:**

https://www.d3engineering.com/products/camera-modules/?gclid=Cj0KCQjwj9LkBRDnARIsAGQ-hUeBK29wYC2mMFyU_tB1BjB9AhN-SD_wurYyHNxwARvQN1FDxqnmy3UaAt1NEALw_wcB

**Interface with GoPro API:**

* Connect with the GoPro's wifi first, see pairing handshake command at the end of this:https://github.com/KonradIT/goprowifihack/blob/master/HERO5/HERO5-Commands.md 
* All Hero 5 commands: https://github.com/KonradIT/goprowifihack/tree/master/HERO5

**Image annotation:**

https://hackernoon.com/the-best-image-annotation-platforms-for-computer-vision-an-honest-review-of-each-dac7f565fea

**Useful videos:**

Entire process using YOLO - https://www.reddit.com/r/MachineLearning/comments/8p9car/p_playing_card_detection_with_yolov3_trained_on/

Image labelling steps - https://youtu.be/Rgpfk6eYxJA?t=1036 (Image labelling process)

### Development notes
Start the virtual environment:
```python
# From the project root
trashcamenv\Scripts\activate

```

### Random Notes
**Go Pro-Based Proof of Concept Approach:**

The GoPro isn't perfect for prototyping because you either have to use the API and write a program to continually take pictures, or use the burst mode. The resolution options are limited in burst mode so from a testing options perspective, the API approach is best. Unfortunately it is slow. That's not a huge deal, but it means the pictures will be less continuous than they would in application. 

**Tensorflow (GPU version) Setup**
https://www.tensorflow.org/install/gpu