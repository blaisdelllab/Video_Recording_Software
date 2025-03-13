#!/bin/bash

# Shell script called to use the ffmpeg library to start recording from
# the two webcams connected to the RPi

# Last updated 2025-03-06

# Ensure two arguments are provided
if [ $# -ne 2 ]; then
    echo "Need arguments: $0 <top_filename> <side_filename>"
    exit 1
fi

BASE_NAME=$1  # Not used directly, but included for clarity
TOP_FILE="$HOME/$1"   # TOP camera recording filename
SIDE_FILE="$HOME/$2"   # SIDE camera recording filename

# Set resolution/framerate for top web camera
RESOLUTION="320x240"
FRAME_RATE="20"

# Start recording from USB and VGA cameras indefinitely
ffmpeg -f v4l2 -video_size $RESOLUTION -framerate $FRAME_RATE -i /dev/video0 -y "$TOP_FILE" > /dev/null 2>&1 &
ffmpeg -f v4l2 -video_size $RESOLUTION -framerate $FRAME_RATE -i /dev/video2 -y "$SIDE_FILE" > /dev/null 2>&1 &

exit 0
 
