Dotfiles
=======================================================================

This repository houses the configurations for the software I use.

Getting Started
-----------------------------------------------------------------------

- Install [GNU Stow](https://www.gnu.org/software/stow/).
- Install whatever software you're interested in, e.g. Vim.
- Use Stow to create symbolically linked files in the appropriate
  locations: `stow Vim`.

Using This Repository
-----------------------------------------------------------------------

Each piece of software gets its own directory. Within that directory,
create the same directories and files that you would normally expect
in your home directory. For example, suppose you want to store your
Emacs configuration in `~/.config/emacs/init.el`, then in this
repository, create the following structure:

```
Emacs/
  |_.config/
    |_emacs/
      |_init.el
```

Then when you've installed Emacs, use `stow --target=$HOME Emacs` to
create a symlink file in `~/.config/emacs/init.el` that points to the
file in this repository.
