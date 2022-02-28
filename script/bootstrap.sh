# bootstrap installs things.
# inspired from the awesome and amazing @holman
# https://github.com/holman/dotfiles/blob/master/script/bootstrap

# install Vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd)
set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

link_files () {
  ln -s $1 $2
  success "linked $1 to $2"
}

install_brew_packages () {
  info 'installing brew packages'

  # ZSH
  brew install zsh

  # Git things
  brew install git-extras tig diff-so-fancy

  # Replacement for cat with git integration and syntax highlighting
  brew install bat

  # Replacement for cURL
  brew install httpie
  brew install rs/tap/curlie

  # List the current directory in a tree-like format
  brew install tree

  # Replacement for du
  brew install ncdu

  # Let's get PNPM
  brew install pnpm

  # Starship Prompt
  brew install starship

  # install nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
}

install_dotfiles () {
  info 'installing dotfiles'

  overwrite_all=false
  backup_all=false
  skip_all=false

  for source in `find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink`
  do
    dest="$HOME/.`basename \"${source%.*}\"`"

    if [ -f $dest ] || [ -d $dest ]
    then

      overwrite=false
      backup=false
      skip=false

      if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
      then
        user "File already exists: `basename $source`, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi

      if [ "$overwrite" == "true" ] || [ "$overwrite_all" == "true" ]
      then
        rm -rf $dest
        success "removed $dest"
      fi

      if [ "$backup" == "true" ] || [ "$backup_all" == "true" ]
      then
        mv $dest $dest\.backup
        success "moved $dest to $dest.backup"
      fi

      if [ "$skip" == "false" ] && [ "$skip_all" == "false" ]
      then
        link_files $source $dest
      else
        success "skipped $source"
      fi

    else
      link_files $source $dest
    fi

  done
}

install_additional() {
  info 'installing additional files'

  # Vim: copy the color scheme
  cp $DOTFILES_ROOT/vim/apprentice.vim $HOME/.vim/colors/

  # Starship config
  cp $DOTFILES_ROOT/configs/starship.toml $HOME/.config/

  # Warp themes
  cp $DOTFILES_ROOT/warp/* $HOME/.warp/themes/
}

configure() {
  # Configure git to use diff-so-fancy for all diff output
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
}

install_dotfiles

install_additional

install_brew_packages

configure

echo ''
echo '  All installed!'
