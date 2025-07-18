system_type=$(uname -s)

### Env Vars
export EDITOR=nvim
export VISUAL=nvim
export GOPATH=/home/sc/.go

### Aliases ###
if [ "$system_type" = "Linux" ]; then
    alias update="sudo pacman -Syu && yay -Sua"
elif [ "$system_type" = "Darwin" ]; then
    alias update="brew update && brew upgrade"
fi

if [ "$system_type" = "Linux" ]; then
    alias ls='ls --color=auto'
    alias ll='ls -laF'
elif [ "$system_type" = "Darwin" ]; then
    alias ls="ls -G"
    alias ll="ls -lah"
    alias sed='gsed'
fi

alias grep='grep --colour=auto'

alias lg='lazygit'
alias lgyadm='lazygit --use-config-file "$HOME/.config/yadm/lazygit.yml" --work-tree ~ --git-dir ~/.local/share/yadm/repo.git'

alias vi='nvim'
if [ "$system_type" = "Linux" ]; then
    alias vitmp='nvim $(mktemp -t "/tmp/nvim.tmp.XXXXXXXX")'
elif [ "$system_type" = "Darwin" ]; then
    alias vitmp='nvim $(mktemp "/tmp/nvim.tmp.XXXXXXXX")'
    alias viaws='nvim ~/.aws/credentials'
    alias get_aws_token='~/.aws/get-tokens.sh'
fi

if [ "$system_type" = "Linux" ]; then
    alias rm='rmtrash'
    alias rmdir='rmdirtrash'
    alias add-ssh-keys='eval $(ssh-agent); ssh-add -t 10m'
fi
alias cp='cp -i'
alias mv='mv -i'

if [ "$system_type" = "Linux" ]; then
    alias c='wl-copy'
elif [ "$system_type" = "Darwin" ]; then
    alias c='pbcopy'
    alias p='pbpaste'
fi

# Auto completion
autoload bashcompinit && bashcompinit
autoload -Uz +X compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# FZF shortcuts
if [ -x "$(command -v fzf)" ]; then
  source <(fzf --zsh)
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

# lfcd
LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
    alias lf="lfcd"
fi

# Prompt
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
TEXT_RED=$'%F{red}'
TEXT_GREEN=$'%F{green}'
setopt PROMPT_SUBST
export PROMPT='\
$(if [[ $? == 0 ]]; then echo "${TEXT_GREEN}:)"; else echo "${TEXT_RED}:("; fi) \
${COLOR_USR}%n \
${COLOR_DIR}%~ \
${COLOR_GIT}$(parse_git_branch) \
${COLOR_DEF}$ '

# MacOS Work stuff
if [ "$system_type" = "Darwin" ]; then
    # Add JBang to environment
    alias j!=jbang
    export PATH="$HOME/.jbang/bin:$PATH"

    # aws cli completion
    complete -C '/usr/local/bin/aws_completer' aws

    # Load Angular CLI autocompletion.
    source <(ng completion script)

    # NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

    # Add Java Home to PATH
    alias java_home="/usr/libexec/java_home"

    # Homebrew default options
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications" # Install applications in user space
    export JAVA_HOME=$(java_home -v 17)

    # THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
