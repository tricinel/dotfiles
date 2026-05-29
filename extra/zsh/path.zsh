export PNPM_HOME="$HOME/.local/share/pnpm"
export CARGO_PATH="$HOME/.cargo/bin"

case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

export PATH="$CARGO_PATH:$PATH"

