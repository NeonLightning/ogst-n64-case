if [[ $2 == reicast* ]]; then
    sudo modprobe fbtft_device name=hktft9340 busnum=1 rotate=270
fi

if [[ $(< /sys/class/graphics/fb1/name) == "fb_ili9340" ]]; then
    mplayer -vo fbdev2:/dev/fb1 -vf scale=320:240 /opt/retropie/supplementary/ogst-n64-case/screen/logo.png &> /dev/null
fi