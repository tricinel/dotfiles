# Stash the current, then update to the latest, then pop the stash
function gpr {
  git stash --all
  git pull --rebase
  git stash pop
}
