#!/bin/bash

# take a faceshot
# -V dummy -A dummy supress video output (opening up a display)
vlc -I dummy v4l2:///dev/video0 --video-filter scene --no-audio --scene-path /home/pgadey/poissonpings/faceshots/ --scene-prefix `date +%s`+ --scene-format png vlc://quit --run-time=1 -V dummy -A dummy

# take a screenshot
scrot '%s.png' -e 'mv $f ~/poissonpings/screenshots/'

# play a noise
aplay /home/pgadey/poissonpings/alert.wav

## GET TAGS
#TAGS=`echo -e "surfing\nreading\nworking\nhacking" | dmenu -nb \#FF0000 -nf \#FFFFFF -p tags`
TAGS=`zenity --entry --title="What are you doing?" --text="Please input tags" --width=400`

echo `date +%s` : $TAGS >> $HOME/poissonpings/pings
