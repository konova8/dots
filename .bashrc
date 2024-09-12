#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#------------------------------------------------------------

### Environment Variables
# export GOPATH=/home/sc/go
export GOPATH=/home/sc/.go

### Gruvbox Colors
TEXT_RED="$(tput setaf 1)"
TEXT_GREEN="$(tput setaf 2)"
TEXT_YELLOW="$(tput setaf 3)"
TEXT_WHITE="$(tput setaf 15)"

### Make completion case-insensitive ###
bind -s 'set completion-ignore-case on'

### FZF shortcuts
if [ -x "$(command -v fzf)"  ]
then
  source /usr/share/fzf/key-bindings.bash
fi

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow \
    --exclude .cache \
    --exclude .docker \
    --exclude .gnupg \
    --exclude .go \
    --exclude .ipython \
    --exclude .keras \
    --exclude .kube \
    --exclude .local \
    --exclude .minikube \
    --exclude .mozilla \
    --exclude .npm \
    --exclude .nv \
    --exclude .parallel \
    --exclude .pki \
    --exclude .ssh \
    --exclude .thunderbird \
    --exclude .vscode \
    --exclude .zotero \
    --exclude Zotero \
    --exclude venv \
    --exclude go"
 
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow \
    --exclude .cache \
    --exclude .docker \
    --exclude .gnupg \
    --exclude .go \
    --exclude .ipython \
    --exclude .keras \
    --exclude .kube \
    --exclude .local \
    --exclude .minikube \
    --exclude .mozilla \
    --exclude .npm \
    --exclude .nv \
    --exclude .parallel \
    --exclude .pki \
    --exclude .ssh \
    --exclude .thunderbird \
    --exclude .vscode \
    --exclude .zotero \
    --exclude Zotero \
    --exclude venv \
    --exclude go"

# Preview file content using bat (https://github.com/sharkdp/bat) and bind ctrl-/ for switching layout
export FZF_CTRL_T_OPTS="
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

### Aliases ###
alias ls='ls --color=auto'
alias ll='ls -laF'
alias grep='grep --colour=auto'
alias update="sudo pacman -Syu && yay -Sua"
alias lg='lazygit'
alias lgyadm='lazygit --use-config-file "$HOME/.config/yadm/lazygit.yml" --work-tree ~ --git-dir ~/.local/share/yadm/repo.git'
alias vi='nvim'
alias vitmp='nvim $(mktemp -t "/tmp/nvim.tmp.XXXXXXXX")'
alias rm='rmtrash'
alias rmdir='rmdirtrash'
alias add-ssh-keys='eval $(ssh-agent); ssh-add -t 10m'
alias cp='cp -i'
alias mv='mv -i'
alias c='wl-copy'
alias r='. ranger'

git_current_branch() {
    git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
}

# Lf file manager terminal stuff
LFCD="/home/sc/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
alias lf='lfcd'

PS1='$(if [[ $? == 0 ]]; then echo "\[${TEXT_GREEN}\]:)"; else echo "\[${TEXT_RED}\]:("; fi) \w\n\[${TEXT_WHITE}\][\u@\H\[${TEXT_YELLOW}\]$(git_current_branch)\[${TEXT_WHITE}\]]$ '
