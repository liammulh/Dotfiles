Dotfiles
=======================================================================

This repository houses the configurations for the software I use.

Getting Started
-----------------------------------------------------------------------

- Install [GNU Stow](https://www.gnu.org/software/stow/).
- Install whatever software you're interested in, e.g. Vim.
- Use Stow to create symbolically linked files in the appropriate
  locations: `stow Vim`.

Theme
-----------------------------------------------------------------------

Alacritty, Neovim and tmux share one color scheme,
[zenbones](https://github.com/zenbones-theme/zenbones.nvim), and
switch between its light and dark variants together.

### Switching

Write both of the generated files described below. For dark:

```
mkdir -p ~/.local/state/theme
cp ~/.config/alacritty/colors/zenbones-dark.toml ~/.local/state/theme/alacritty.toml
echo dark > ~/.local/state/theme/mode
```

For light, the same three lines with `zenbones-light` and `light`.
Nothing has to be restarted. Alacritty repaints, every running Neovim
repaints, and tmux follows along.

Copy onto the two files rather than moving new ones over them, so that
anything holding a watch on those paths keeps pointing at the file it
started watching.

### How It Works

Everything that needs to know the current variant reads one of two
generated files under `~/.local/state/theme`:

- `alacritty.toml`, a copy of one of the two palettes in
  `Alacritty/.config/alacritty/colors`. Alacritty imports this path
  and watches the files it imports, so writing it is enough to repaint
  every open window.
- `mode`, the word `light` or `dark`. Neovim reads it at startup to
  set `background`, and watches it afterwards so that switching in one
  pane repaints the editor in every other pane. Changing `background`
  is all that is needed: Neovim reloads the colorscheme when it
  changes, and zenbones reads `background` rather than setting it.

tmux is not in that list, and is not told anything. Its colors are
palette slots rather than hex, so Alacritty reloading its palette is
what recolors tmux. See `Tmux/README.md`.

An unrecognized mode, or no mode at all, is treated as dark.

Both files are generated, so neither is in this repository. On a new
machine, after stowing `Alacritty`, run the three lines above once to
create them.

The three programs have no way to agree on a theme by themselves.
Alacritty cannot follow the system appearance, tmux has no theme of
its own, and Neovim only reads the terminal background once at
startup. Two files that all three derive from is the smallest thing
that keeps them in step, and it is the reason a switch needs no reload
anywhere.

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
