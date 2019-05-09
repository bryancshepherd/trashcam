# trashcam
A computer vision-based project to identify roadside trash (and possibly clogged ditches)

## Basic Use
### Take a set of pictures 
```
cd ~Projects/trashcam/code
./camera.sh 300 800 120000 1000
```
This will save pictures to the `./photos` directory

### Show a 200x200px camera preview
```raspistill -t 0 -p 50,50,200,200```
