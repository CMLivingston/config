# Ripped from minimal_improved -> https://github.com/gdsrosa/minimal_improved

LCHAR_WIDTH=%1G

LCHAR='$' # '⚡'

fast_parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  echo "${BRANCH}"
}

# For time, add %{$fg[green]%}%* anywhere.

#PROMPT='%{$fg[cyan]%}%c %{$fg_bold[green]%}➜ %{$reset_color%}'
PROMPT='%{$fg[cyan]%}%~ %{$fg[white]%}%{$LCHAR$LCHAR_WIDTH%} %{$reset_color%}'
#RPROMPT='$(git_prompt_info)'
RPROMPT='%{$fg[yellow]%}$(fast_parse_git_branch)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
