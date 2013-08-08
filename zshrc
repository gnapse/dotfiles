export EDITOR="vim"
export DOTFILES=$(dirname `readlink ~/.zshrc`)
ZSH=$DOTFILES/oh-my-zsh
ZSH_THEME="gnapse"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Update PATH with some useful dirs
typeset -U path
path=(~/bin $DOTFILES/bin /usr/local/bin $path)

# Add RBENV support
path=(~/.rbenv/shims ~/.rbenv/bin $path)
eval "$(rbenv init -)"

# List of Oh-My-Zsh plugins to load
plugins=(
    git
    osx
    pow
    bundler
    brew
    gem
    rails3
    textmate
    extract
    mvn
    rsync
    tmux
    tmuxinator
    redis-cli
    history
    git-flow
    cp
    colored-man
    zsh-syntax-highlighting
    vi-mode
    history-substring-search
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
