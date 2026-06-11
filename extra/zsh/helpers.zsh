# https://github.com/Mach-OS/Machfiles/blob/master/zsh/.config/zsh/zsh-functions

function zsh_add_file() {
  local zsh_dir="${ZSHDOTDIR:-$HOME/.dotfiles/zsh}"
  [ -f "$zsh_dir/$1" ] && source "$zsh_dir/$1"
}

function zsh_add_plugin() {
  local plugin_name="${1#*/}"
  local zsh_dir="${ZSHDOTDIR:-$HOME/.dotfiles/zsh}"

  if [ -d "$zsh_dir/plugins/$plugin_name" ]; then
    # For plugins
    zsh_add_file "plugins/$plugin_name/$plugin_name.plugin.zsh" || \
    zsh_add_file "plugins/$plugin_name/$plugin_name.zsh"
  else
    print -u2 -- "Missing zsh plugin: $1"
    print -u2 -- "Run: setup.sh zsh-plugin-install"
    return 1
  fi
}

function zsh_add_completion() {
  local plugin_name="${1#*/}"
  local completion_file_path
  local completion_file
  local zsh_dir="${ZSHDOTDIR:-$HOME/.dotfiles/zsh}"

  if [ -d "$zsh_dir/plugins/$plugin_name" ]; then
    # For completions
    completion_file_path=$(ls "$zsh_dir/plugins/$plugin_name"/_*)
    fpath+="$(dirname "${completion_file_path}")"
    zsh_add_file "plugins/$plugin_name/$plugin_name.plugin.zsh"
  else
    print -u2 -- "Missing zsh completion plugin: $1"
    print -u2 -- "Run: setup.sh zsh-plugin-install"
    return 1
  fi

  completion_file="$(basename "${completion_file_path}")"
  if [ "$2" = true ] && compinit "${completion_file:1}"; then
    return 0
  fi
}
