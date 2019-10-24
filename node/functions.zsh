# Quickly install @types/..
# Usage: `ty react react-dom`
# Shamelessly stolen from https://github.com/jaredpalmer/dotfiles/blob/master/.functions#L234 by @jaredpalmer
function ty() {
    yarn add --dev ${*/#/@types\/}
}
