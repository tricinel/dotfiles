function setup_pnpm() {
  which -s pnpm
	if [[ $? != 0 ]]; then
    echo "Installing pnpm..."
    corepack enable
    corepack prepare pnpm@latest --activate
    corepack prepare yarn@stable --activate
  else
    echo "pnpm already setup!"
  fi
}
