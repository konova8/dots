#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#------------------------------------------------------------

### Make completion case-insensitive ###
bind -s 'set completion-ignore-case on'

### Aliases ###

alias ls='ls --color=auto'
alias ll='ls -laF'
alias grep='grep --colour=auto'
alias update="sudo pacman -Syu && yay -Sua"
alias lzg='lazygit'
alias vi='nvim'
alias add-ssh-keys='eval $(ssh-agent); ssh-add -t 10m'

PS1='$(if [[ $? == 0 ]]; then echo "\[\e[32m\]:)"; else echo "\[\e[31m\]:("; fi) \w\n\[\e[0m\][\u@\H]$ '
