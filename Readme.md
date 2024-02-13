# Bogdan's dotfiles

These are my dotfiles. I use them with zsh and [warp](https://warp.dev) is my terminal of choice. I've pulled in what I needed from various amazing Github contributors like [@paulirish](https://github.com/paulirish/dotfiles), [@mathiasbynens](https://github.com/mathiasbynens/dotfiles/) or [@holman](https://github.com/holman/dotfiles) and [@chantastic](https://github.com/chantastic/dotfiles). So 1 billion thanks to them. My own additions are minor. The basically come from various online resources and videos. Feel free to fork and contribute.

## How to install

Just run this

```shell
git clone git@github.com:tricinel/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```

This will do a couple of things:

* Install `zsh`, the `starship prompt` and a couple of other `brew` goodies. See the `setup.sh` file for all the packages that will be installed.
* Symlink the appropriate files in `.dotfiles` to your home directory. Everything is configured and tweaked within `~/.dotfiles`. We do this using [stow](https://www.gnu.org/software/stow/).

## Private config

If you have sensible private information particular to your system (DON'T commit your ssh keys and passwords dude), put them into a `.localrc` file in your `$HOME` folder and `.zshrc` will pick it up automatically.

**Git config**

`.gitconfig` will have some good defaults and a bunch of aliases already set up. You will need to create a file called `.gitconfig.local` in your home directory and put your git user in there. It should look like this:

```
[user]
	name = John Doe
	email = john@doe.com
```

Any other git config you want to keep private, you can put in there.

## Comments

As always, these are most [welcome](https://github.com/tricinel/dotfiles/issues).
