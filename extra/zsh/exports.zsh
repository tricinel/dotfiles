# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"

# homebrew
export HOMEBREW_PREFIX=$(brew --prefix)
export HOMEBREW_BIN=$HOMEBREW_PREFIX/bin

export SSH_AUTH_SOCK=$($HOMEBREW_BIN/gpgconf --list-dirs agent-ssh-socket)
export EDITOR="$HOMEBREW_BIN/nvim"

export ZSHDOTDIR=$HOME/.config/zsh
export STARSHIP_CONFIG=$HOME/starship.toml
export LG_CONFIG_FILE=$HOME/.config/lazygit/config.yml

# Configure delta
export DELTA_FEATURES="diff-so-fancy"

