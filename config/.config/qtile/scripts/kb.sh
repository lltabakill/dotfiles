#!/bin/bash

layout=$(echo -e "ara\nfr" | rofi -dmenu -p "Select layout:")
if [ "$layout" == "ara" ]; then
    setxkbmap ara
elif [ "$layout" == "fr" ]; then
    setxkbmap fr
fi

