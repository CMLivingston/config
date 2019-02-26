# PROMPT="[%*] %n:%c $(git_prompt_info)%(!.#.$) "

parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  echo "${BRANCH}"
}

# For multi-GB repos with slow git...
FAST_PROMPT='%{$fg[green]%}[%*]%{$reset_color%} %{$fg[cyan]%}%~%{$reset_color%} $fg[yellow]%}$(parse_git_branch)%{$reset_color%} %{$fg[blue]%}%(!.#.⚡)%{$reset_color%}'

ORIG_PROMPT='%{$fg[green]%}[%*]%{$reset_color%} %{$fg[cyan]%}%~%{$reset_color%}$(git_prompt_info) %{$fg[blue]%}%(!.#.⚡)%{$reset_color%} '

PROMPT=$FAST_PROMPT

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
