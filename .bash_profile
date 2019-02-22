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

function zshme() {
  chsh -s /bin/zsh
}

# Sweet custom prompt
#export PS1="\`nonzero_return\` \e[32m\]\t\[\e[m\]\[\e[31m\][\[\e[m\]\[\e[31m\]\w\[\e[m\]\[\e[31m\]]\[\e[m\]\[\e[36m\]\`parse_git_branch\`\[\e[m\] \[\e[33m\]⚡\[\e[m\] "
