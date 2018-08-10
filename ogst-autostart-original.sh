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
emulationstation #auto