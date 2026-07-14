# Bogdan's dotfiles

These are my dotfiles. I use them with zsh and [ghostty](https://ghostty.org/) is my terminal of choice.

## How to install

Just run this

```shell
git clone git@github.com:tricinel/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```

This will do a couple of things:

- Install `zsh`, the `starship prompt` and a couple of other `brew` goodies. See the `setup.sh` file for all the packages that will be installed.
- Symlink the appropriate files in `.dotfiles` to your home directory. Everything is configured and tweaked within `~/.dotfiles`. We do this using [stow](https://www.gnu.org/software/stow/).
- Symlink the configs for nvim, ghostty and git

### Private config

If you have sensible private information particular to your system (DON'T commit your ssh keys and passwords dude), put them into a `.localrc` file in your `$HOME` folder and `.zshrc` will pick it up automatically.

**Git config**

`.gitconfig` will have some good defaults and a bunch of aliases already set up. You will need to create a file called `.gitconfig.local` in your home directory and put your git user in there. It should look like this:

```
[user]
 name = John Doe
 email = john@doe.com
```

Any other git config you want to keep private, you can put in there.

## Performance budgets

Use `scripts/perf-budget` to benchmark local startup time for shell and nvim config changes.

```shell
scripts/perf-budget --list
scripts/perf-budget shell-startup --update-baseline
scripts/perf-budget shell-startup
scripts/perf-budget shell-startup --show
scripts/perf-budget --show
scripts/perf-budget nvim-startup
scripts/perf-budget nvim-startup --save-snapshot mini-surround
scripts/perf-budget nvim-startup --history
```

Baselines live in `.benchmarks/baselines/local/` and are meant to be machine-specific. Results live in `.benchmarks/results/`. Snapshots live in `.benchmarks/snapshots/local/` and record named accepted changes over time. Normal runs warn when startup time drifts over budget, but they do not fail with a non-zero exit code.

## Comments

As always, these are most [welcome](https://github.com/tricinel/dotfiles/issues).
