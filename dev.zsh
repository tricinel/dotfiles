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

# Scaffold a new MEAN app using yeoman and generator-angular-fullstack
alias mean='yo angular-fullstack'

# Install an npm module from a git repo using a specific branch
# e.g. npm-git myrepo/myproject master -g or npm-git myrepo/myproject master
function npm-git {
  if [ "$3" != "-g" ]
    then
      npm install git+ssh://git@github.com:$1.git#$2
    else
      npm install -g git+ssh://git@github.com:$1.git#$2
    fi
}
