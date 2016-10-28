export EDITOR="vim"
export DOTFILES=$(dirname `readlink ~/.zshrc`)
export MANPAGER="less -X"
ZSH=$DOTFILES/oh-my-zsh
ZSH_THEME="gnapse"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Update PATH with some useful dirs
typeset -U path
path=(~/bin $DOTFILES/bin ~/.rbenv/shims ~/.rbenv/bin /usr/local/bin $path)

# List of Oh-My-Zsh plugins to load
plugins=(
    git
    extract
    history
    vi-mode
    history-substring-search
    autojump
    # custom plugins
    completion
    aliases
    projects
    crypto
)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Load local settings, if any
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export NVM_DIR="/Users/ernesto/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
