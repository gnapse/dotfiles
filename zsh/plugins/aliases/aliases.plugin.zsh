VIMRC_SENSIBLE=~/.vim/bundle/sensible/plugin/sensible.vim
alias vims='vim -u $VIMRC_SENSIBLE'
alias mvims='mvim -u $VIMRC_SENSIBLE'
alias gvims='gvim -u $VIMRC_SENSIBLE'

alias rv='rbenv'
alias tlog='tail -f log/development.log'
alias stree='open -a SourceTree'
alias gst='git status -sb'
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

# resumes partial scp downloads
alias rscp='rsync --partial --progress --rsh=ssh'

# recursively download a website
alias rwget='wget -r -k -p -np -E'

# Create and cd into a new directory in one step
mcd() {
    mkdir -p $1
    cd $1
}
