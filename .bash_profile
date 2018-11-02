export VISUAL='/usr/local/bin/nvim'
export EDITOR='$VISUAL'

source ~/.git-prompt.sh

# Shell commands
alias ll='ls -ltah'
alias s='subl'

# Alias vi and vim to nvim
alias vi=nvim
alias vim=nvim

# Scm commands
alias g=git
alias master='git co master'
alias branch_info="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%"


function squash() {
  git reset --soft HEAD~$1 && git commit --edit -n -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"
}
