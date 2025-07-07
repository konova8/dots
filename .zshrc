### Aliases ###
alias ls='ls --color=auto'
alias ll='ls -laF'
alias grep='grep --colour=auto'
# alias update="sudo pacman -Syu && yay -Sua"
alias lg='lazygit'
alias lgyadm='lazygit --use-config-file "$HOME/.config/yadm/lazygit.yml" --work-tree ~ --git-dir ~/.local/share/yadm/repo.git'
alias vi='nvim'
export EDITOR=nvim
export VISUAL=nvim
alias vitmp='nvim $(mktemp "/tmp/nvim.tmp.XXXXXXXX")' # MacOS specific
# alias rm='rmtrash'
# alias rmdir='rmdirtrash'
# alias add-ssh-keys='eval $(ssh-agent); ssh-add -t 10m'
alias cp='cp -i'
alias mv='mv -i'
# alias c='wl-copy'
# alias r='. ranger'
alias sed='gsed' # Use GNU sed


alias ls="ls -G" # MacOS specific
alias ll="ls -lah"
alias c='pbcopy' # MacOS specific
alias p='pbpaste' # MacOS specific
alias viaws='nvim ~/.aws/credentials'
alias get_aws_token='~/.aws/get-tokens.sh'

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

# Auto completion
autoload bashcompinit && bashcompinit
autoload -Uz +X compinit && compinit

# aws cli completion
complete -C '/usr/local/bin/aws_completer' aws


# Load Angular CLI autocompletion.
source <(ng completion script)

## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

### FZF shortcuts
# if [ -x "$(command -v fzf)"  ]
# then
#   source /usr/share/fzf/key-bindings.bash
# fi
source <(fzf --zsh)

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
    --exclude .zsh_sessions \
    --exclude Library \
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
    --exclude .zsh_sessions \
    --exclude Library \
    --exclude Zotero \
    --exclude venv \
    --exclude go"

# Preview file content using bat (https://github.com/sharkdp/bat) and bind ctrl-/ for switching layout
export FZF_CTRL_T_OPTS="
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Add Java Home to PATH
alias java_home="/usr/libexec/java_home"

# lfcd
LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
    alias lf="lfcd"
fi

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

# Homebrew default options
export HOMEBREW_CASK_OPTS="--appdir=~/Applications" # Install applications in user space
export JAVA_HOME=$(java_home -v 17)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

