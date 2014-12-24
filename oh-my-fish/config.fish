# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
set fish_plugins brew bundler extract gi git jump localhost rails rbenv tmux vi-mode

# Custom configuration
set -U EDITOR vim
set dotfiles ~/.dotfiles
set PATH ~/bin $dotfiles/bin $PATH

# Load oh-my-fish configuration.
set fish_custom $dotfiles/oh-my-fish/custom
set fish_theme gnapse
. $fish_path/oh-my-fish.fish

# RBENV
set -gx RBENV_ROOT ~/.rbenv
. (rbenv init -|psub)

# Android SDK
# set -x JAVA_HOME (/usr/libexec/java_home -v 1.6)
# set -x ANDROID_SDK ~/Library/android-sdk
# set PATH $ANDROID_SDK/tools $ANDROID_SDK/platform-tools $PATH
