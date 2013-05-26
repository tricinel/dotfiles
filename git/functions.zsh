function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $*
  fi
}