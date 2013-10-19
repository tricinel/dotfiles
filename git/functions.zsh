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