system_type=$(uname -s)

if [ "$system_type" = "Darwin" ]; then
    # Kiro CLI pre block. Keep at the top of this file.
    [[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by Toolbox App
export PATH="$PATH:/Users/simone.canova/Library/Application Support/JetBrains/Toolbox/scripts"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


if [ "$system_type" = "Darwin" ]; then
    # Kiro CLI post block. Keep at the bottom of this file.
    [[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh"
fi
