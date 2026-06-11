# for profiling zsh
# zmodload zsh/zprof

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
if [[ -t 0 ]]; then
  stty stop undef  # Disable ctrl-s to freeze terminal.
fi
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist

typeset zcompdump_file="${ZDOTDIR:-$HOME}/.zcompdump"
typeset zcompmeta_file="${zcompdump_file}.plugins-hash"
typeset plugins_dir="${ZSHDOTDIR:-$HOME}/plugins"
typeset plugins_hash=""

if [[ -d "$plugins_dir" ]]; then
  plugins_hash="$(command find "$plugins_dir" -mindepth 1 -maxdepth 1 -type d -print 2>/dev/null | command sort | shasum | awk '{print $1}')"
fi

if [[ -f "$zcompdump_file" && -f "$zcompmeta_file" && "$(<"$zcompmeta_file")" == "$plugins_hash" ]]; then
  compinit -C
else
  compinit
  print -r -- "$plugins_hash" >| "$zcompmeta_file"
fi

unset zcompdump_file zcompmeta_file plugins_dir plugins_hash

_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -e ~/.localrc ]]
then
  source ~/.localrc
fi

# shortcut to this dotfiles path is $DOTFILES
export DOTFILES=$HOME/.dotfiles

# zsh config files (explicit order)
typeset -a zsh_sources=(
  "$DOTFILES/extra/zsh/path.zsh"
  "$DOTFILES/extra/zsh/exports.zsh"
  "$DOTFILES/extra/zsh/helpers.zsh"
  "$DOTFILES/extra/zsh/aliases.zsh"
  "$DOTFILES/extra/zsh/functions.zsh"
  "$DOTFILES/extra/zsh/node.zsh"
  "$DOTFILES/extra/zsh/plugins.zsh"
  "$DOTFILES/extra/zsh/lazy-init.zsh"
  "$DOTFILES/extra/git/aliases.zsh"
)

for file in $zsh_sources; do
  [[ -f "$file" ]] && source "$file"
done

unset zsh_sources

# starship setup
eval "$(starship init zsh)"

# for profiling zsh
# zprof
