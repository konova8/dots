name_connection=$(nmcli -t c show --active | grep wlan | awk -F: '{ print $1 }')
volume_level='Vol: '$(pamixer --get-volume-human)
date_formatted=$(date "+%a %F %H:%M:%S")
battery_status=$(cat /sys/class/power_supply/BAT0/status)
battery_percentage=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')
battery=$battery_status' '$battery_percentage
backlight_percentage='Backlight: '
backlight_percentage+=$(brightnessctl | grep 'Current brightness' | awk '{print $4}' | cut -d ')' -f 1 | cut -c2-)

if [[ -z $name_connection ]]
then
  name_connection='Offline'
fi

echo -e $backlight_percentage '  |  ' $name_connection '  |  ' $volume_level '  |  ' $battery '  |  ' $date_formatted;
