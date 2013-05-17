alias g="git"

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# Pretty 'git log'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %C(cyan)%an%Creset - %C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# List all the deleted files in the working tree
alias gdel="git ls-files --deleted"

# Display a summary of all deleted files including paths
alias gdelpath="git log --diff-filter=D --summary"

# List all the files for a commit
alias gcshow='git show --pretty="format:" --name-only'

# List branches with commits not merged into master
alias gbnm='git branch --no-merged master'

# These should be self-explanatory
alias gf='git flow'
alias g='git'
alias gp='git push'
alias gl='git pull'
alias gdiff='git diff'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gi='git init'
alias ga='git add'
alias gr='git rm'
alias gpr='git pull --rebase'
alias git-snapshot='!git stash save "snapshot: $(date)" && git stash apply "stash@{0}"'
alias git-undo='git reset --soft HEAD^' # Undo your last commit, but don't throw away your changes

# Use the last commit message and amend your stuff.
# Stolen from @holman
# https://github.com/holman/dotfiles/blob/master/bin/git-amend
alias git-ammend='git commit --amend -C HEAD'