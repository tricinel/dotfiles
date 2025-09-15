# for profiling zsh
# zmodload zsh/zprof

export ZSHDOTDIR=$HOME/.config/zsh
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
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
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
config_files=($DOTFILES/extra/**/*.zsh)

# load everything
for file in ${(M)config_files}
do
  source $file
done

unset config_files

# fnm setup
eval "$(fnm env --use-on-cd --shell zsh)"

# starship setup
eval "$(starship init zsh)"

# fzf fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load zoxide
eval "$(zoxide init zsh --cmd j)"

export CARGO_PATH="/Users/tricinel/.cargo/bin"
export PNPM_HOME="/Users/tricinel/Library/pnpm"
export PATH="$PNPM_HOME:$CARGO_PATH:$PATH"
export SSH_AUTH_SOCK=$($HOMEBREW_BIN/gpgconf --list-dirs agent-ssh-socket)
export EDITOR="$HOMEBREW_BIN/nvim"

export CARAPACE_BRIDGES='zsh,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# fix zsh-vi-mode plugin interfering with fzf keybindings
zvm_after_init_commands+=('source <(fzf --zsh)')

# for profiling zsh
# zprof
