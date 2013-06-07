# gnapse/dotfiles

These are config files to set up a system the way I like it.

After some time using clones of someone else's dotfiles, I decided to roll out my own. This has allowed me to learn and tweak things better to my liking. I have of course kept the ideas I've learned and liked from other dotfiles collections.

## Installation

Run the following commands in your terminal.

```terminal
git clone git://github.com/gnapse/dotfiles ~/.dotfiles
~/.dotfiles/install
```

After installing, open a new terminal window to see the effects.

## Features

These dotfiles make use of [oh-my-zsh](http://github.com/robbyrussell/oh-my-zsh) and are of course zsh-centric. Lots of other features are being configured by loading some built-in plugins within `oh-my-zsh`. My own customizations are provided via a custom [plugin and theme](https://github.com/gnapse/dotfiles/tree/master/zsh).

There's also configuration files for git, ruby/rails development, [tmux](http://tmux.sourceforge.net), [TextMate](http://github.com/textmate/textmate) and Vim. On the Vim front, lots of different plugins are being loaded using [pathogen](http://github.com/tpope/vim-pathogen), linked from other public repos as git submodules. Check out the [`vim/bundle`](https://github.com/gnapse/dotfiles/tree/master/vim/bundle) directory for details.
