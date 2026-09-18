Alacritty Config
=======================================================================

This is my [Alacritty](https://alacritty.org) configuration. It is a
short file: the gruvbox dark color scheme, the DepartureMono Nerd Font
at 12pt, a blinking block cursor, and one key binding.

Structure
-----------------------------------------------------------------------

```
.config/
|_alacritty/
  |_alacritty.toml
```

Color Scheme
-----------------------------------------------------------------------

The colors are not in this repository. `alacritty.toml` imports them
from the upstream
[alacritty-theme](https://github.com/alacritty/alacritty-theme) repo,
which has to be cloned separately:

```
git clone https://github.com/alacritty/alacritty-theme \
  ~/.config/alacritty/themes
```

Without it, the import path does not resolve and Alacritty reports a
config error on startup.

Clone the themes before running `stow Alacritty`, not after. Stow
folds directories when it can: if `~/.config/alacritty` does not exist
yet, Stow symlinks the whole directory to this one rather than linking
the single file inside it, and a later clone would then write the
themes into this repository. Cloning first leaves
`~/.config/alacritty` as a real directory, so Stow links only
`alacritty.toml` and steps around `themes/`.

The theme is switched by editing the import path. The clone carries
every upstream theme under `themes/themes/`.

Cursor
-----------------------------------------------------------------------

The cursor is a block that blinks continuously: `blink_timeout = 0`
keeps it blinking instead of going solid after a few seconds, and
`blinking = "Always"` forces it on regardless of what the running
program requests, which is what makes it work inside tmux. This is a
deliberate pair with the tmux pane borders. The pane holding the
blinking cursor is the active one.

Key Bindings
-----------------------------------------------------------------------

Shift-Return sends `\u001B\r`, an escape followed by a carriage
return. Alacritty sends a plain carriage return for both Return and
Shift-Return by default, so the two are indistinguishable to programs
reading the terminal. The escape prefix makes Shift-Return its own
sequence, which lets programs bind it separately.
