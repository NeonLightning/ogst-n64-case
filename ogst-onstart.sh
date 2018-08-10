if [[ $(< /sys/class/graphics/fb1/name) == "fb_ili9340" ]]; then
    if [[ $2 == reicast* ]]; then
        sudo rmmod fbtft_device
        exit
    fi
    rom_path=$3
    system_path="/home/pi/RetroPie/roms/$1"
    media_path="$system_path/media/screen${rom_path:${#system_path}:${#rom_path}}"
    media_path="${media_path%.*}.png"

    if [ -e "$media_path" ]; then
        mplayer -vo fbdev2:/dev/fb1 -vf scale=320:240 "$media_path" &> /dev/null
        exit
    fi
    if [ -e "~/screen/system-$1.png" ]; then
        mplayer -vo fbdev2:/dev/fb1 -vf scale=320:240 "~/screen/system-$1.png" &> /dev/null
        exit
    fi

    mplayer -vo fbdev2:/dev/fb1 -vf scale=320:240 "~/screen/logo-black.png" &> /dev/null
fi