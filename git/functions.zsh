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

# A better git clone
# clones a repository, cds into it, and opens it in my editor.
#
# Shamelessly stolen from https://github.com/jaredpalmer/dotfiles/blob/master/.functions#L63 by @jaredpalmer
#
# Note: c is already setup as a shortcut to VSCode. Replace with your own editor if different
#
# - arg 1 - url|username|repo remote endpoint, username on github, or name of
#           repository.
# - arg 2 - (optional) name of repo
#
# usage:
#   $ clone things
#     .. git clone git@github.com:addyosmani/things.git things
#     .. cd things
#     .. subl .
#
#   $ clone yeoman generator
#     .. git clone git@github.com:yeoman/generator.git generator
#     .. cd generator
#     .. subl .
#
#   $ clone git@github.com:addyosmani/dotfiles.git
#     .. git clone git@github.com:addyosmani/dotfiles.git dotfiles
#     .. cd dots
#     .. subl .

function clone {
  # customize username to your own
  local username="tricinel"

  local url=$1;
  local repo=$2;

  if [[ ${url:0:4} == 'http' || ${url:0:3} == 'git' ]]
  then
    # just clone this thing.
    repo=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//');
  elif [[ -z $repo ]]
  then
    # my own stuff.
    repo=$url;
    url="git@github.com:$username/$repo";
  else
    # not my own, but I know whose it is.
    url="git@github.com:$url/$repo.git";
  fi

  git clone $url $repo && cd $repo && c .;
}

# Get origin GitHub URL for current repo
# Thank you @jaredpalmer
function gurl() {
  local remotename="${@:-origin}"
  local remote="$(git remote -v | awk '/^'"$remotename"'.*\(push\)$/ {print $2}')"
  [[ "$remote" ]] || return
  local user_repo="$(echo "$remote" | perl -pe 's/.*://;s/\.git$//')"
  echo "https://github.com/$user_repo"
}
