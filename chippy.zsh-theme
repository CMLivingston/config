# PROMPT="[%*] %n:%c $(git_prompt_info)%(!.#.$) "

fast_git_prompt_info() {
  git branch | awk '/^\*/ { print $2 }'
}

# For multi-GB repos with slow git...
FAST_PROMPT='%{$fg[green]%}[%*]%{$reset_color%} %{$fg[cyan]%}%~%{$reset_color%} $fg[yellow]%}$(fast_git_prompt_info)%{$reset_color%} %{$fg[blue]%}%(!.#.⚡)%{$reset_color%} '

ORIG_PROMPT='%{$fg[green]%}[%*]%{$reset_color%} %{$fg[cyan]%}%~%{$reset_color%}$(git_prompt_info) %{$fg[blue]%}%(!.#.⚡)%{$reset_color%} '

PROMPT=$FAST_PROMPT

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
