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