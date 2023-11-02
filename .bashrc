#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#------------------------------------------------------------

### Environment Variables
export GOPATH=/home/sc/go

### Gruvbox Colors
TEXT_RED="$(tput setaf 1)"
TEXT_GREEN="$(tput setaf 2)"

### Make completion case-insensitive ###
bind -s 'set completion-ignore-case on'

### FZF shortcuts
if [ -x "$(command -v fzf)"  ]
then
  source /usr/share/fzf/key-bindings.bash
fi

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

function cd() {
    if [ $# -eq 0 ] ; then               # no arguments specified
        builtin cd
    elif [[ -f "$1" && -L "$1" ]] ; then # file, which is a link
       cd "$(readlink $1)"               # recursive
    elif [ -f $1 ] ; then                # argument is a file
       builtin cd "$(dirname $1)"
    else                                 # argument is not a file
       builtin cd "$@"
    fi
}

