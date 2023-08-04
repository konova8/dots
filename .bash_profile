#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Autostart X at login
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec startx
#fi

# use systemd-environment-d-generator(8) to generate environment,
# and export those variables
export $(run-parts /usr/lib/systemd/user-environment-generators | sed '/:$/d; /^$/d' | xargs)
