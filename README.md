# gnapse/dotfiles

These are config files to set up a system the way I like it.

After some time using clones of someone else's dotfiles, I decided to roll out
my own. This has allowed me to learn and tweak things better to my liking.
I have of course kept the ideas I've learned and liked from other dotfiles
collections.

## Installation

Run the following commands in your terminal.

```terminal
git clone git://github.com/gnapse/dotfiles ~/.dotfiles
~/.dotfiles/install
```

Note that the install location `~/.dotfiles` is arbitrary. You can install to any directory of your choice.

After installing, open a new terminal window to see the effects.

## Features

These dotfiles make use of [oh-my-zsh][] and are of course zsh-centric. Lots of
other features are being configured by loading some built-in plugins within
`oh-my-zsh`.  My own customizations are provided via a [custom plugin and
theme][].

There's also configuration files for git, ruby/rails development, [tmux][],
[TextMate][] and Vim.  On the Vim front, lots of different plugins are being
loaded using [pathogen][], linked from other public repos as git submodules.
Check out the [`vim/bundle`][vim-bundle] directory for details.

Additionally, these dotfiles are [mpd][]-oriented. If you use mpd to play your
music, try the `music help` command and enjoy.  Also notice that tmux's
powerline status bar shows the song currently playing on mpd.

## Credits

My only merit here is having assembled various pieces of configuration files
and plugins to make things work the way I like it.  The real merit goes to the
original authors of most of the tools and plugins I'm using, and to those from
which I got inspiration or code snippets that I found useful.

The following is a list of the most important sources that should be credited
for this repo:

* [Robby Russell](https://github.com/robbyrussell) for [Oh My Zsh][oh-my-zsh].
* [Tim Pope](https://github.com/tpope) for lots of wonderful Vim plugins.
* [Drew Neil](https://github.com/nelstrom) for [Vimcasts](http://vimcasts.org)
* [Vincent Driessen](https://github.com/nvie) for inspiring most of my `.vimrc`.

[oh-my-zsh]: http://github.com/robbyrussell/oh-my-zsh
[custom plugin and theme]: https://github.com/gnapse/dotfiles/tree/master/zsh
[tmux]: http://tmux.sourceforge.net
[TextMate]:  http://github.com/textmate/textmate
[pathogen]: http://github.com/tpope/vim-pathogen
[vim-bundle]: https://github.com/gnapse/dotfiles/tree/master/vim/bundle
[mpd]: http://www.musicpd.org/
