# Install Grunt plugins and add them as `devDependencies` to `package.json`
# Usage: `gi contrib-watch contrib-uglify zopfli`
# Stolen from @mathiasbynens
# https://github.com/mathiasbynens/dotfiles/blob/master/.aliases
function gi() {
  local IFS=,
  eval npm install --save-dev grunt-{"$*"}
}

# Gem install with --no-ri --no-rdoc
alias gin='gem install --no-ri --no-rdoc'