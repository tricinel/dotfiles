function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $*
  fi
}

# $ git log --no-merges --pretty=format:"%ae" | stats
# 514 a@example.com
# 200 b@example.com
# From @paulmillr
function gstats() {
  sort | uniq -c | sort -r
}

# List all files changed in a commit
function gchanged() {
  if [ -z "$1" ]; then
    echo "No commit hash provided."
  else
    git diff-tree --no-commit-id --name-only -r $1
  fi
}

# Find out which branches contain the commit hash
function gcontains() {
  if [ -z "$1" ]; then
    echo "No commit hash provided."
  else
    git branch -a --contains $1
  fi
}

# Stash the current, then update to the latest, then pop the stash
function gpr {
  git stash
  git pull --rebase
  git stash pop
}

# Safe merging strategy
# https://github.com/k88hudson/git-flight-rules#safe-merging-strategy
function gsafemerge() {
  if [ -z "$1" ]; then
    echo "No branch to merge provided."
  else
    git merge --no-ff --no-commit $1
  fi
}
