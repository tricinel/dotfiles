# lazy-load zoxide on first j or ji use
j() {
  if command -v zoxide >/dev/null 2>&1; then
    unfunction j ji
    eval "$(zoxide init zsh --cmd j)"
    j "$@"
  else
    print -u2 -- "zoxide not found"
    return 127
  fi
}

ji() {
  if command -v zoxide >/dev/null 2>&1; then
    unfunction j ji
    eval "$(zoxide init zsh --cmd j)"
    ji "$@"
  else
    print -u2 -- "zoxide not found"
    return 127
  fi
}

# lazy-load carapace after first command
export CARAPACE_BRIDGES='zsh,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
autoload -Uz add-zsh-hook
__load_carapace_once() {
  add-zsh-hook -d preexec __load_carapace_once
  command -v carapace >/dev/null 2>&1 && source <(carapace _carapace)
}
add-zsh-hook preexec __load_carapace_once

# fix zsh-vi-mode plugin interfering with fzf keybindings
zvm_after_init_commands+=('source <(fzf --zsh)')

# lazy-load atuin at first prompt so keybindings (up arrow) work
__load_atuin_once() {
  add-zsh-hook -d precmd __load_atuin_once
  command -v atuin >/dev/null 2>&1 && eval "$(command atuin init zsh)"
}
add-zsh-hook precmd __load_atuin_once

# lazy-load worktrunk completions on first wt command
wt() {
  if command -v wt >/dev/null 2>&1; then
    eval "$(command wt config shell init zsh)"
    unfunction wt
    command wt "$@"
  else
    print -u2 -- "wt not found"
    return 127
  fi
}
