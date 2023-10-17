#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#------------------------------------------------------------

### Gruvbox Colors
TEXT_RED="$(tput setaf 1)"
TEXT_GREEN="$(tput setaf 2)"

### Make completion case-insensitive ###
bind -s 'set completion-ignore-case on'

### Vi mode for shell
bind 'set show-mode-in-prompt on'
bind 'set editing-mode vi'
bind "set vi-cmd-mode-string \"${TEXT_GRAY}(CMD)\""
bind "set vi-ins-mode-string \"${TEXT_YELLOW}(INS)\""

### Aliases ###
alias ls='ls --color=auto'
alias ll='ls -laF'
alias grep='grep --colour=auto'
alias update="sudo pacman -Syu && yay -Sua"
alias lzg='lazygit'
alias vi='nvim'
alias rm='rmtrash'
alias rmdir='rmdirtrash'
alias add-ssh-keys='eval $(ssh-agent); ssh-add -t 10m'
alias latexdebuglive='latexmk -pdf -pvc'

PS1='$(if [[ $? == 0 ]]; then echo "\[${TEXT_GREEN}\]:)"; else echo "\[${TEXT_RED}\]:("; fi) \w\n\[\e[0m\][\u@\H]$ '
