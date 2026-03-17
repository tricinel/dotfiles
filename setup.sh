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
  atuin
  worktrunk
)

BREW_UTILS=(
  tree-sitter-cli
)

STOW_FOLDERS=(
  atuin
  ghostty
  git
  nvim
  starship
  zsh
  nvim12
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

setup_nvim12() {
  local DIR="$HOME/nvim-0.12"

  mkdir -p "$DIR"
  curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz -o "$DIR/nvim.tar.gz"
  tar -xzf "$DIR/nvim.tar.gz" -C "$DIR" --strip-components 1
  rm "$DIR/nvim.tar.gz"
}

run_all() {
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
}

if [ -n "$1" ]; then
  # Check if the argument is a defined function
  if declare -f "$1" > /dev/null; then
    "$@" # Run the specific function (and pass any extra args)
  else
    echo "Error: Function '$1' not found."
    exit 1
  fi
else
  # No arguments provided, run the full script
  run_all
fi
