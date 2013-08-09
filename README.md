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

Note that the install location `~/.dotfiles` is arbitrary. You can install to
any directory of your choice.

After installing, open a new terminal window to see the effects.

## Features

They say a picture is worth a thousand words, so here it is.

![gnapse/dotfiles features screenshot](https://dl.dropboxusercontent.com/u/6173591/gnapse-dotfiles.png)

Also, don't be afraid of the code.  That's the best way to get to know all the
features, or learn how to do stuff in your own dotfiles or whatever.  However,
it won't hurt to give a quick overview right here, so keep reading.

### Shell

These dotfiles make use of [Oh-My-Zsh][] and are of course zsh-centric. Lots of
other features are being configured by loading some built-in plugins within
Oh-My-Zsh.  My own customizations are provided via [some custom plugins and
a theme][].

- The theme shows plenty of information in the prompt, namely username,
  hostname, current working directory, ruby version, git status info and number
  of background jobs active.
- Lots of [Oh-My-Zsh][] plugins are being loaded, with all the features they
  bring in, which is impossible to enumerate here, so feel free to dig into the
  code.  Most important ones are related to the use of git, ruby, tmux and vim.
- Zsh is configured to work in vi-mode, which makes a lot of sense when you're
  already working in a vim-centric environment.
- The shell is equipped right from the start with [rbenv][] for managing ruby
  versions.

### Tmux

What's a terminal without a multiplexer?  Exactly.  So these dotfiles would
make a lot less sense without [tmux][].

- `C-a` as the prefix key, because tmux's default is so awkward.
- `C-S-Left/Right` for rapidly switching tmux windows.  These do not require
  the prefix.
- `C-j/C-k` to move a window to the left or right, allowing to easily rearrange
  windows.
- `C-h/j/k/l` to switch panes to the left, down, up and right directions.
  These even works seamlessly accross vim splits and tmux panes, all thanks to
  [a very clever setup][].
- In copy mode, use `v` to start selecting, and `y` for yanking the selection,
  just like vim.
- Use the arrow keys after the prefix, to resize panes.
- Colors, mouse and utf8 support are enabled right from the start.
- [tmux-powerline](https://github.com/erikw/tmux-powerline) is used, so the
  status bar is as sexy as it gets.
- Includes a [fix](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard) so
  the OSX pasteboard can be accessed from tmux.

### Vim

Vim is undoubtedly the jewl of these dotfiles, having a leading role in many
aspects.  It would be very difficult to provide an extensive list of all the
features and customizations in place, but here's a list of the highlights.

- [pathogen][] for managing plugins.
- The space character is used as the `<leader>` key.
- A good deal of obvious stuff, like colors and syntax highlight support, smart
  case and search as you type, line numbers, auto-hide buffers, persistent
  undo, etc.
- Open files using fuzzy name matching (a la TextMate's Cmd+T) with
  [CtrlP](https://github.com/kien/ctrlp.vim).  Try typing `<leader>t` (project
  files), `<leader>r` (recent files), `<leader>b` (buffer list) or `<leader>g`
  (switch to tag).
- Browse the files in the current project by typing `<leader>f` to activate
  [Nerdtree](https://github.com/scrooloose/nerdtree).
- `C-h/j/k/l` to switch to splits in the left, down, up and right directions.
  These even works seamlessly accross vim splits and tmux panes, all thanks to
  [a very clever setup][].
- Type `<leader>a` to switch to alternate file (just like `C-^`).
- `S-j/S-k` for page-down/page-up, just like `C-d/C-u`.
- Type `<leader>` in front of a yank/put command to copy/paste to the OS
  clipboard.  Type it in front of a delete command to delete without adding
  deleted text to the yank history.
- Bubble single lines and selection blocks up and down by typing `C-up/down`.  Indent in and
  out with `Cmd+[/]` (this last one works in MacVim only).
- Easily surround selected text and single words by pressing `<leader>`
  followed by the surround character.  For instance, select some text, then
  type `<leader>(` to surround that text in parenthesis.  Works with quotes and
  all the common pairs of surround characters you know.
- Type `<leader>sf` or `<leader>sn` in Ruby/Rails projects to run tests/specs
  right from within Vim and see the output in a tmux panel (thanks to
  [vimux](https://github.com/benmills/vimux) and
  [vroom](https://github.com/skalnik/vim-vroom)).
- Access the [undo history tree](https://github.com/sjl/gundo.vim) by typing
  `<leader>u`.
- Show the [yank history](https://github.com/vim-scripts/YankRing.vim) by
  typing `<leader><leader>y`.

All Vim plugins are included in these dotfiles using [pathogen][].  Check out
the [`vim/bundle`](https://github.com/gnapse/dotfiles/tree/master/vim/bundle)
directory for a detailed list of each and every plugin available.  Read their
respective documentations if you're interested in what they do or how they're
used, and check out for any plugin customzations or custom key-bindings in the
[`vimrc`](https://github.com/gnapse/dotfiles/blob/master/vimrc) file.

### Ruby and Rails

Since Ruby and Rails both have a special place in these dotfiles,  here's a
quick highlight of the related features provided.

- As mentioned before, zsh is equipped right from the start with [rbenv][]
  support, and the command prompt shows the current ruby version at any single
  time.
- [Oh-My-Zsh][] is configured to load several of its ruby-related plugins: pow,
  bundler, gem, etc.
- Vim has the bulk of ruby-centered customizations and plugins.  There are
  plugins for invoking tests and specs, checking ruby code style, typing quick
  snippets of code, support for satellite languages like CoffeeScript and Haml,
  etc.  Again, check the vim configuration and bundles for these.
- A special mention has to be made to the main
  [ruby](https://github.com/vim-ruby/vim-ruby) and
  [rails](https://github.com/tpope/vim-rails) plugins.  Both deserve a deeper
  study of their features, so I encourage you to open vim and type `:help ruby`
  and `:help rails`.
- Support for satellite languages and frameworks, such as CoffeeScript, Haml,
  Markdown, Rdoc, Cucumber, Rspec, etc.

### Git

The most awesome kid on the block of code versioning, git has a strong presence
too.

- The shell prompt shows basic info about the current repository status, if
  any.
- [Oh-My-Zsh][] git plugin is loaded, with lots of aliases, etc.
- Check out `:help fugitive` to get to know more about the outstanding
  capabilities of Vim's leading git plugin,
  [fugitive](https://github.com/tpope/vim-fugitive).  Also check out a short
  series of screencasts on the subject in [Vimcasts][].

## Customization

Customizations can be provided in dotfiles appended with `.local`:

* `~/.aliases.local`
* `~/.gitconfig.local`
* `~/.tmux.conf.local`
* `~/.vimrc.local`
* `~/.zshrc.local`

In the case of Vim, it also loads any extra plugins located in the
`~/.vim/bundle.local` directory, which are not tracked by git.

As these files are not under version control in this repository, they are
suitable to provide your own customizations on a per-user or per-computer
basis.  Perhaps you need some settings in that server, but not in your laptop
;) right?

## Credits

My only merit here is having assembled various pieces of configuration files
and plugins to make things work the way I like it.  The real merit goes to the
original authors of most of the tools and plugins I'm using, and to those from
which I got inspiration or code snippets that I found useful.

The following is a list of the most important sources that should be credited
for this repo:

* [Robby Russell](https://github.com/robbyrussell) for [Oh My Zsh][oh-my-zsh].
* [Tim Pope][] for lots of wonderful Vim plugins.
* [Drew Neil](https://github.com/nelstrom) for [Vimcasts][].
* [Vincent Driessen](https://github.com/nvie) for inspiring most of my `.vimrc`.

[Oh-My-Zsh]: http://github.com/robbyrussell/oh-my-zsh
[some custom plugins and a theme]: https://github.com/gnapse/dotfiles/tree/master/zsh
[tmux]: http://tmux.sourceforge.net
[TextMate]:  http://github.com/textmate/textmate
[pathogen]: http://github.com/tpope/vim-pathogen
[vim-bundle]: https://github.com/gnapse/dotfiles/tree/master/vim/bundle
[mpd]: http://www.musicpd.org/
[rbenv]: https://github.com/sstephenson/rbenv
[Ruby]: http://www.ruby-lang.org/
[Rails]: http://rubyonrails.org/
[a very clever setup]: http://robots.thoughtbot.com/post/53022241323/seamlessly-navigate-vim-and-tmux-splits
[Tim Pope]: https://github.com/tpope
[Vimcasts]: http://vimcasts.org
