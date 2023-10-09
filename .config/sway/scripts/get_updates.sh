#!/bin/bash
res=''

sleep 15
linescheckupdates=$(checkupdates | wc -l)

if [ $? -eq 0 ]; then
  res+='Updates: '
  res+=$linescheckupdates
  res+=$'\n\n'

  aur=$(yay -Qum | wc -l)
  res+='AUR: '
  res+=$aur

  notify-send -u critical "$res"
else
  notify-send -u critical "Not yet connected"
fi
