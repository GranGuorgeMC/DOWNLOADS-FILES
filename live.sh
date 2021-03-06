sudo add-apt-repository ppa:mc3man/trusty-media
sudo apt-get update
sudo apt-get install ffmpeg
ffmpeg -version

wget https://github.com/GraNXX/DOWNLOADS/releases/download/1.1/livemusic.mp3
wget https://github.com/GraNXX/DOWNLOADS/releases/download/1.1/Video.mp4


#! /bin/bash

VBR="1500k"
FPS="24"
QUAL="superfast"

YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"
KEY="k2g3-gemx-m267-pjjg-26fe"

VIDEO_SOURCE="/home/GranMC/live 2.mp4"
AUDIO_SOURCE="/home/GranMC/Video.mp4"

ffmpeg \
-re -f lavfi -i "movie=filename=$VIDEO_SOURCE:loop=0, setpts=N/(FRAME_RATE*TB)" \
-thread_queue_size 512 -i "$AUDIO_SOURCE" \
-map 0:v:0 -map 1:a:0 \
-map_metadata:g 1:g \
-vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
-acodec libmp3lame -ar 44100 -threads 6 -qscale:v 3 -b:a 320000 -bufsize 512k \
-f flv "$YOUTUBE_URL/$KEY"
