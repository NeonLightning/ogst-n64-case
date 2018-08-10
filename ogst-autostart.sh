#!/bin/sh

while pgrep fbi &>/dev/null;
    do sleep 1;
    done
while pgrep mplayer &>/dev/null;
    do sleep 1;
    done
while pgrep vlc >/dev/null; do sleep 1; done

if [ -a /home/pigaming/scripts/bgm/start.sc ];  then
    (mpg123 -f 18000 -Z /home/pigaming/bgm/*.mp3 >/dev/null 2>&1) &
fi

if [[ $(< /sys/class/graphics/fb0/name) != "fb_ili9340" ]]; then
    emulationstation #auto
elif [[ $(< /sys/class/graphics/fb0/name) == "fb_ili9340" ]]; then
    sudo fbi -T 1 -d /dev/fb0 -t 5 -noverbose -a /opt/retropie/supplementary/ogst-n64-case/screen/no-hdmi.png
fi