c() { cd ~/code/projects/$1; }
_c() { _files -W ~/code/projects -/; }
compdef _c c

m() { mate ~/code/projects/$1; }
_m() { _files -W ~/code/projects -/; }
compdef _m m

v() { cd ~/code/projects/$1 && mvim && cd - > /dev/null }
_v() { _files -W ~/code/projects -/; }
compdef _v v

#export EDITOR='mate -w'
export EDITOR='vim'

# autocorrect is more annoying than helpful
unsetopt correct_all

# a few aliases I like
alias rv='rbenv'
alias tlog='tail -f log/development.log'
alias stree='open -a SourceTree'
alias gst='git status -sb'
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

# resumes partial scp downloads
rscp() { rsync --partial --progress --rsh=ssh "$@" }

# recursively download a website
alias rwget='wget -r -k -p -np -E'

