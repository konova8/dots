#!/bin/bash
res=''

sleep 15
rescheckupdates=$(checkupdates)

if [ $? -eq 0 ]; then
  updates=$(echo $rescheckupdates | wc -l)
  res+='Updates: '
  res+=$updates
  res+=$'\n\n'

  aur=$(yay -Qum | wc -l)
  res+='AUR: '
  res+=$aur

  notify-send -u critical "$res"
else
  notify-send -u critical "Not yet connected"
fi
