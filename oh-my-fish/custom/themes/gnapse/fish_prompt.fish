# Theme based on Bira theme from oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/bira.zsh-theme
# Some code stolen from oh-my-fish clearance theme: https://github.com/bpinto/oh-my-fish/blob/master/themes/clearance/

function __user_host
  set -l content
  if [ (id -u) = "0" ];
    echo -n (set_color --bold red)
  else
    echo -n (set_color --bold green)
  end
  echo -n $USER@(hostname|cut -d . -f 1) (set color normal)
end

function __current_path
  set -l cwd (pwd | sed "s:^$HOME:~:")
  echo -n (set_color --bold blue) $cwd (set_color normal)
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function __ruby_version
  set -l ruby_version (rbenv version | awk '{print  $1}')
  echo -n (set_color red)
  echo -n "‹$ruby_version›"
  echo -n (set_color normal)
end

function __git_status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info '['$git_branch"*"']'
    else
      set git_info '['$git_branch']'
    end

    echo -n (set_color yellow) $git_info (set_color normal)
  end
end

function fish_prompt
  echo -e ''
  __user_host
  __current_path
  __ruby_version
  __git_status
  echo -e ''
  echo (set_color --bold white)"\$ "(set_color normal)
end

function fish_right_prompt
  set -l st $status

  if [ $st != 0 ];
    echo (set_color red) ↵ $st(set_color normal)
  end
end
