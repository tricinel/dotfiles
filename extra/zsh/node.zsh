# Setup fnm
if [[ -z ${__FNM_ENV_LOADED:-} ]] && command -v fnm >/dev/null 2>&1; then
  export __FNM_ENV_LOADED=1
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

function fnm-install() {
  local NEW_VER=$1
  if [ -z "$NEW_VER" ]; then
    echo "Please specify a version (e.g., fnm-upgrade 22)"
    return 1
  fi

  echo "Installing Node $NEW_VER..."
  fnm install $NEW_VER
  fnm use $NEW_VER
  fnm default $NEW_VER

  echo "Installing latest pnpm via npm..."
  npm install -g pnpm@latest

  echo "Reinstalling global packages..."
  pnpm add -g --ignore-scripts @earendil-works/pi-coding-agent
  
  echo "Done! Switched to Node $NEW_VER with your global tools."
}
