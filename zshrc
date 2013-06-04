ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_THEME="gnapse"

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git osx pow bundler brew gem rails3 rvm textmate extract mvn rsync tmux tmuxinator redis-cli history git-flow cp colored-man gnapse)

# Add RVM support
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Update PATH with some useful dirs
PATH=$HOME/bin:$PATH:$HOME/.rvm/bin

source $ZSH/oh-my-zsh.sh

