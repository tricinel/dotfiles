#!/usr/bin/env zsh

BREW_APPS=(
  zsh
  git
  gpg
  bat
  httpie
  curlie
  ncdu
  starship
  tealdeer
  fzf
  rust
  rustfmt
  rust-analyzer
  go
  stow
  git-delta
  difftastic
  neovim
  lazygit
  ripgrep
  fd
  eza
  zoxide
  carapace
  fnm
)

BREW_UTILS=(
  tree-sitter-cli
)

STOW_FOLDERS=(
  ghostty
  git
  nvim
  starship
  zsh
)

install_homebrew() {
	which -s brew
	if [[ $? != 0 ]]; then
		echo "Installing homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
	else
		echo "Updating brew..."
		brew upgrade
	fi

    brew analytics off
}

install_brew_apps() {
	echo "installing brew apps..."
	brew install ${BREW_APPS[@]}

  # install ghostty
  brew install --cask ghostty
}

install_brew_utils() {
  echo "installing brew utils..."
  brew install ${BREW_UTILS[@]}
}

install_standalone_apps() {
  # install pnpm
  corepack enable
  # https://pnpm.io/installation#using-corepac
  corepack prepare pnpm@latest --activate
}

backup () {
  # nvim
  mv ~/.config/nvim{,.bak} # nvim

  # zsh
  mv ~/.zshenv{.bak}
  mv ~/.zshrc{.bak}

  # git
  mv ~/.gitconfig{.bak}

  # Ghostty
  mv ~/.config/ghostty{.bak}
}

configure_apps() {
	echo "configuring apps..."
  # zsh
  mkdir -p $HOME/.config/zsh
  # fzf
  $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
}

stow_files() {
  echo "stowing things..."
  for folder in $STOW_FOLDERS
  do
    echo "stowing $folder"
    stow --restow $folder
  done
}

cleanup () {
  if [[ -d ~/.nvm ]]; then
    echo "Removing ~/.nvm..."
    rm -rf ~/.nvm
  else
    echo "~/.nvm does not exist, skipping."
  fi
}

echo ''
echo '==> Starting setup...'

install_homebrew
install_brew_apps
install_brew_utils
brew cleanup
backup
install_standalone_apps
stow_files
configure_apps
cleanup

echo ''
echo '==> All done!'
echo '==> Close and reopen your terminal to start using everything.'
echo '==> Happy hacking!'
