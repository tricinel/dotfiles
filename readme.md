# Bogdan's dotfiles

These are my dotfiles. I use them with zsh. I've pulled in what I needed from various amazing Github contributors like [@paulirish](https://github.com/paulirish/dotfiles), [@mathiasbynens](https://github.com/mathiasbynens/dotfiles/) or [@holman](https://github.com/holman/dotfiles). So 1 billion thanks to them. My own additions are minor. The basically come from various online resources and videos. Feel free to fork and contribute.

## How to install

Just run this

```shell
git clone https://github.com/tricinel/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap.sh
```

This will do a couple of things:

* Install `zsh`, the `starship prompt` and a couple of other `brew` goodies. See the `script/bootstrap.sh` file for all the packages that will be installed.
* Symlink the appropriate files in `.dotfiles` to your home directory. Everything is configured and tweaked within `~/.dotfiles`.

## Private config

If you have sensible private information particular to your system (DON'T commit your ssh keys and passwords dude), put them into a `.localrc` file in your `$HOME` folder and `.zshrc` will pick it up automatically.

## Comments

As always, these are most [welcome](https://github.com/tricinel/dotfiles/issues).
