#!/bin/bash
res=''

backlight_percentage='BACKLIGHT: '
backlight_percentage+=$(brightnessctl | grep 'Current brightness' | awk '{print $4}' | cut -d ')' -f 1 | cut -c2-)
res+=$backlight_percentage
res+='  |  '

name_connection=$(nmcli -t c show --active | grep wlan | awk -F: '{ print $1 }')
res_nc='NETWORK: '
if [[ -z $name_connection ]]
then
  res_nc+='Offline'
else
  res_nc+=$name_connection
fi
res+=$res_nc
res+='  |  '

volume_level='VOLUME: '$(pamixer --get-volume-human)
res+=$volume_level
res+='  |  '

battery_status=$(cat /sys/class/power_supply/BAT1/status)
battery_percentage=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')
battery=$battery_status' '$battery_percentage
res+='BATTERY: '
res+=$battery
res+='  |  '

date_formatted=$(date "+%a %F %H:%M:%S")
res+=$date_formatted

echo -e $res;