#!/bin/bash

function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

##changed via give-me-azerty-qtile
#setxkbmap be

#start sxhkd to replace Qtile native key-bindings
run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &
mpd &
run nm-applet &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
picom --config $HOME/.config/picom/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
~/.config/qtile/scripts/launch.sh &
~/.config/qtile/scripts/wali &
#starting user applications at boot time
run volumeicon &
