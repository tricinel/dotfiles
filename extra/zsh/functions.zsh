# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@"
}

# get gzipped size
function gz() {
  echo "orig size    (bytes): "
  cat "$1" | wc -c
  echo "gzipped size (bytes): "
  gzip -c "$1" | wc -c
}

# Get the MD5 hash of a string directly in the terminal
function enc() {
  echo -n $1 | md5sum | pbcopy;
    echo "Copied to clipboard."
}

# Create a data URL from a file
# Stolen from @mathiasbynens
# https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
function dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Count code lines in some directory.
# $ loc py js css
# # => Lines of code for .py: 3781
# # => Lines of code for .js: 3354
# # => Lines of code for .css: 2970
# # => Total lines of code: 10105
function loc() {
  local total
  local firstletter
  local ext
  local lines
  total=0
  for ext in $@; do
    firstletter=$(echo $ext | cut -c1-1)
    if [[ firstletter != "." ]]; then
      ext=".$ext"
    fi
    lines=`find-exec "*$ext" cat | wc -l`
    lines=${lines// /}
    total=$(($total + $lines))
    echo "Lines of code for ${fg[blue]}$ext${reset_color}: ${fg[green]}$lines${reset_color}"
  done
  echo "${fg[blue]}Total${reset_color} lines of code: ${fg[green]}$total${reset_color}"
}

# List the contents of a directory in a tree-like format
# using tree from homebrew
# http://brewformulas.org/Tree
# This also passes some reasonable defaults
function lt() {
  if [ -z "$1" ]; then
    tree --dirsfirst -I 'bower_components|node_modules'
  else
    tree -L $1 --dirsfirst -I 'bower_components|node_modules'
  fi
}

# Copy files with progress
function rcp () {
  rsync -WavP --human-readable --progress $1 $2
}
