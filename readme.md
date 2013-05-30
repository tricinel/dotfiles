# Bogdan's dotfiles

These are my dotfiles. I use them with zsh. I've pulled in what I needed from various amazing Github contributors like [@paulirish](https://github.com/paulirish/dotfiles), [@mathiasbynens](https://github.com/mathiasbynens/dotfiles/) or [@holman](https://github.com/holman/dotfiles). So 1 billion thanks to them. My own additions are minor. The basically come from various online resources and videos. Feel free to fork and contribute.

## How to install

Just run this

```shell
git clone https://github.com/tricinel/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will do a couple of things:

* Install [z](https://github.com/rupa/z) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

* Symlink the appropriate files in ``.dotfiles`` to your home directory. Everything is configured and tweaked within ``~/.dotfiles``.

## Overview of files

* ``git/`` will give you some neat aliases and functions to use with git.
* ``script/bootstrap.sh`` will bootstrap your dotfiles. Run this in the beginning.
* ``zsh/`` will set up some aliases, functions and exports.
* ``zsh/zshrc.symlink`` is where you'll need to make your modifications, as some paths might differ on your system. The file also sets up the plugins and theme to work with oh-my-zsh.
* ``dev.zsh`` is just in its infancy. If you're working with the likes of Grunt or Node or NPM, this will (in the future) set up some functions and aliases.

## Private config

If you have sensible private information particular to your system (DON'T commit your ssh keys and passwords dude), put them into a ``.localrc`` file in your ``$HOME`` folder and ``.zshrc`` will pick it up automatically.

## Upcoming

* A new ``dev_bootstrap`` script that will install other dependencies like [rvm](https://rvm.io/) or [node](http://nodejs.org/).
* I live in [SublimeText](http://www.sublimetext.com/) and plan to share my settings as well. Perhaps a small ``st_bootstrap`` script to install some packages for you as well?

## Comments

As always, these are most [welcome](https://github.com/tricinel/dotfiles/issues).