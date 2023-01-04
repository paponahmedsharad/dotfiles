#!/bin/sh

setxkbmap -option ctrl:nocaps # change caps lock to control
xset r rate 200 45 # set key rapeat rate

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Start WM
exec awesome
# exec ~/.config/chadwm/scripts/./autostart
