#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap -option ctrl:nocaps # change caps lock to control
xset r rate 240 50 # set key rapeat rate

# START SOME NICE PROGRAMS
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec awesome
# exec Hypr
# exec bspwm
# exec openbox
