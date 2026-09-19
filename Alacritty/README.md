Alacritty Config
=======================================================================

This is my [Alacritty](https://alacritty.org) configuration. It is a
short file: the zenbones color scheme, the DepartureMono Nerd Font at
12pt, a blinking block cursor, and one key binding.

Structure
-----------------------------------------------------------------------

```
.config/
|_alacritty/
  |_alacritty.toml
  |_colors/
    |_zenbones-dark.toml
    |_zenbones-light.toml
```

Color Scheme
-----------------------------------------------------------------------

[Zenbones](https://github.com/zenbones-theme/zenbones.nvim), which has
a light and a dark variant. `colors/` holds both, copied verbatim from
that repository's `extras/alacritty` directory. They are two
twenty-five line files, so they are vendored here rather than pulled
from a clone; regenerate them by copying the upstream files again.

`alacritty.toml` does not import either one. It imports
`~/.local/state/theme/alacritty.toml`, a generated copy of whichever
variant is current. Alacritty watches the files it imports, so copying
a palette onto that path repaints every open window without a restart,
and repaints Neovim and tmux at the same time. See the Theme section
of the top-level `README.md`.

The generated file is not part of this repository, so Alacritty will
report a missing import until it exists. On a new machine create it
once, after stowing `Alacritty`.

Keeping the generated file in `~/.local/state` rather than next to
`alacritty.toml` also sidesteps a Stow hazard. Stow folds directories
when it can: if `~/.config/alacritty` did not exist, Stow would
symlink the whole directory here rather than linking the files inside
it, and a write to a generated file in that directory would land in
this repository.

`~/.config/alacritty/themes`, the clone of the upstream
[alacritty-theme](https://github.com/alacritty/alacritty-theme)
collection, is no longer imported by anything and can be deleted.

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
