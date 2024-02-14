# Add untracked, remove deleted, and show status
alias gad='git add -A && git status -sb'

# Stash the current, then update to the latest, then pop the stash
alias gpr='git stash --all && git pull --rebase && git stash pop'
