system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
    #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
else
    [[ -f ~/.bashrc ]] && . ~/.bashrc

    # Autostart X at login
    #if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    #  exec startx
    #fi
fi

export VISUAL=nvim
export EDITOR=nvim
