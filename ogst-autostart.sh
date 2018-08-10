#!/bin/sh

while pgrep fbi &>/dev/null;
    do sleep 1;
    done
while pgrep mplayer &>/dev/null;
    do sleep 1;
    done
while pgrep vlc >/dev/null; do sleep 1; done

if [ -a /home/pi/scripts/bgm/start.sc ];  then
    (mpg123 -f 18000 -Z /home/pi/bgm/*.mp3 >/dev/null 2>&1) &
fi

if [[ $(< /sys/class/graphics/fb0/name) != "fb_ili9340" ]]; then
    emulationstation #auto
elif [[ $(< /sys/class/graphics/fb0/name) == "fb_ili9340" ]]; then
    sudo fbi -T 1 -d /dev/fb0 -t 5 -noverbose -a ~/screen/no-hdmi-1.png ~/screen/no-hdmi-2.png ~/screen/no-hdmi-3.png
fi