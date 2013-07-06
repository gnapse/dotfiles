ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_THEME="gnapse"

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

# Update PATH with some useful dirs
typeset -U path
path=(~/.rbenv/shims ~/.rbenv/bin ~/bin /usr/local/bin $path)

# Add RBENV support
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
    gnapse
    projects
)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

