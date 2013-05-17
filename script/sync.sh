#!/bin/bash
cd "$(dirname "$0")"
cd ".."
git pull
function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" --exclude "bootstrap.sh" --exclude "readme.md" --exclude ".gitignore" -av . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt
source ~/.zshrc