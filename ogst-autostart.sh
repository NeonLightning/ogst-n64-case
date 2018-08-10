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
	if [[ $(< /sys/class/graphics/fb1/name) == "fb_ili9340" ]]; then
		mplayer -vo fbdev2:/dev/fb1 -vf scale=320:240 /opt/retropie/supplementary/ogst-n64-case/screen/logo.png &> /dev/null
	fi
	
	emulationstation #auto
elif [[ $(< /sys/class/graphics/fb0/name) == "fb_ili9340" ]]; then
    sudo fbi -T 1 -d /dev/fb0 -noverbose -a /opt/retropie/supplementary/ogst-n64-case/screen/no-hdmi.png
fi