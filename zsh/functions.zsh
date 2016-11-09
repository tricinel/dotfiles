# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# Send a fake UA string for sites that sniff it instead of using the Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
function httpcompression() {
  encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
}

# find shorthand
function f() {
  find . -name "$1"
}

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@"
}

# Find string in files of type
# Takes two parameters -> $1:the file type (eg. *.txt or readme.txt); $2: the string (eg. string)
function fgrep() {
  find . -name "$1" -exec grep -H "$2" {} \;
}

# Syntax-highlight JSON strings or files
function json() {
  if [ -p /dev/stdin ]; then
    # piping, e.g. `echo '{"foo":42}' | json`
    python -mjson.tool | pygmentize -l javascript
  else
    # e.g. `json '{"foo":42}'`
    python -mjson.tool <<< "$*" | pygmentize -l javascript
  fi
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

# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM.
# Stolen from @paulmillr
# https://github.com/paulmillr/dotfiles/blob/master/home/zshrc.sh
function ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
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