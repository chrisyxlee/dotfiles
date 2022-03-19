# Git.
alias gs="git status"
function gitd() {
 git checkout main && git rebase && git checkout -b $1 && git push --set-upstream origin $1
}

# Use colors with ls.
export LSCOLORS=Hxfxcxdxbxegedabagacad
alias ls='ls -G'

# Make sure we're using python3.
alias python=python3

