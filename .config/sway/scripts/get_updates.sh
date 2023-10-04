#!/bin/bash
res=''

sleep 5

updates=$(checkupdates | wc -l)
res+='Updates: '
res+=$updates
res+=$'\n\n'

aur=$(yay -Qum | wc -l)
res+='AUR: '
res+=$aur

notify-send -u critical "$res"
