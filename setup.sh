#!/usr/bin/env zsh

BREW_APPS=(
    zsh
    git
    gpg
	  tig
    bat
    httpie
    rs/tap/curlie
    tree
    ncdu
    starship
    tldr
    fzf
    rust
    rustfmt
    stow
    git-delta
    difftastic
)

STOW_FOLDERS=(
    config
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

	brew cleanup
}

install_standalone_apps() {
    # nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    # install Node LTS and set it as default
    [ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"
    nvm alias default node

    # install pnpm
    corepack enable
    # https://pnpm.io/installation#using-corepac
    corepack prepare pnpm@latest --activate

    # instal lazyvim
    mv ~/.config/nvim{,.bak}
    git clone https://github.com/tricinel/lazyvim ~/.config/nvim
}

configure_apps() {
	echo "configuring apps..."
    # zsh
    mkdir -p $HOME/.config/zsh
    # starship
    ln -s zsh/starship.toml $HOME/.config/starship.toml
    # fzf
    $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish
}

stow_files() {
    echo "stowing things..."
    for folder in $STOW_FOLDERS
    do
        echo "stowing $folder"
        stow --restow --ignore='zsh' $folder
    done
}

echo ''
echo '==> Starting setup...'

install_homebrew
install_brew_apps
stow_files
install_standalone_apps
configure_apps

echo ''
echo '==> All done!'
echo '==> Close and reopen your terminal to start using everything.'
echo '==> Happy hacking!'
