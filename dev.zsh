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
