_projects() { _files -W ~/code/projects -/; }

c() { cd ~/code/projects/$1; }
compdef _projects c

v() { cd ~/code/projects/$1 && vim && cd - > /dev/null }
compdef _projects v
