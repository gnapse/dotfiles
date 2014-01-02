local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local bg_jobs='%(1j.%{$terminfo[bold]$fg[green]%}[%j] %{$reset_color%}.)'
local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

local ruby_version=''
if which rvm-prompt &> /dev/null; then
  ruby_version='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
fi
if which rbenv &> /dev/null; then
  ruby_version='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
fi

PROMPT="
${user_host} ${current_dir} ${ruby_version} ${git_branch}
${bg_jobs}%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="] %{$reset_color%}"
