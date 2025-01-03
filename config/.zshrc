# for profiling zsh
# zmodload zsh/zprof

export ZDOTDIR=$HOME/.config/zsh
export STARSHIP_CONFIG=~/starship.toml

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES=$HOME/.dotfiles

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -e ~/.localrc ]]
then
  source ~/.localrc
fi

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/**/*.zsh)

# load everything
for file in ${(M)config_files}
do
  source $file
done

unset config_files

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  [[ -e .nvmrc ]] || return
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

eval "$(starship init zsh)"

# fzf fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export CARGO_PATH="/Users/tricinel/.cargo/bin"
export PNPM_HOME="/Users/tricinel/Library/pnpm"
export PATH="$PNPM_HOME:$CARGO_PATH:$PATH"
export SSH_AUTH_SOCK=$(/opt/homebrew/bin/gpgconf --list-dirs agent-ssh-socket)
